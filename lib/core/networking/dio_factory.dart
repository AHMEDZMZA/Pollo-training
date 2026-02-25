import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../helpers/app_functions.dart';
import '../shared_pref/shared_pref_helper.dart';
import 'api_endpoints.dart';

/// A singleton factory class for configuring and managing a [Dio] instance.
///
/// Usage:
/// ```dart
/// await DioFactory.initialize();
/// final dio = DioFactory.dio;
/// ```
class DioFactory {
  // ─── Private constructor to prevent direct instantiation ──────────────────
  DioFactory._();

  // ─── Constants ─────────────────────────────────────────────────────────────

  /// Default timeout duration for connect / receive / send operations.
  static const _defaultTimeout = Duration(seconds: 160);

  // ─── Private state ─────────────────────────────────────────────────────────

  /// The single Dio instance used across the app.
  static Dio? _dioInstance;

  /// Reference to the auth interceptor so we can replace it precisely
  /// without accidentally removing other [InterceptorsWrapper] instances.
  static InterceptorsWrapper? _authInterceptor;

  // ─── Public accessor ───────────────────────────────────────────────────────

  /// Returns the configured [Dio] instance.
  ///
  /// Throws a [StateError] if [initialize] has not been called yet.
  static Dio get dio {
    if (_dioInstance == null) {
      throw StateError(
        'DioFactory is not initialized. Call DioFactory.initialize() '
            'before accessing DioFactory.dio.',
      );
    }
    return _dioInstance!;
  }

  // ─── Initialization ────────────────────────────────────────────────────────

  /// Creates and configures the [Dio] instance.
  ///
  /// Safe to call multiple times — only the first call does real work.
  static Future<void> initialize() async {
    if (_dioInstance != null) return; // already initialized → no-op

    _dioInstance = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: _defaultTimeout,
        receiveTimeout: _defaultTimeout,
        sendTimeout: _defaultTimeout,

        // Treat any status < 500 as a successful response so that 4xx errors
        // are returned as Response objects instead of throwing a DioException.
        // This lets the repository / use-case layer decide how to handle them.
        validateStatus: (status) => status != null && status < 500,

        // Disable automatic redirect following — handle manually if needed.
        followRedirects: false,

        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Order matters: auth interceptor first → logger sees final headers.
    _addAuthInterceptor();
    _addLoggingInterceptor();
  }

  // ─── Interceptors ──────────────────────────────────────────────────────────

  /// Attaches the [Authorization] and [lang] headers to every outgoing request.
  ///
  /// If an auth interceptor was previously registered, it is removed first so
  /// only one instance ever exists in the interceptor stack.
  static void _addAuthInterceptor() {
    // Remove the old auth interceptor using the stored reference — safer than
    // removeWhere(type check) which would also kill unrelated wrappers.
    if (_authInterceptor != null) {
      _dioInstance?.interceptors.remove(_authInterceptor);
    }

    _authInterceptor = InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token =
        SharedPrefHelper.getString(key: SharedPrefKeys.token);

        final langCode =
        SharedPrefHelper.getString(key: SharedPrefKeys.langCode);

        // Attach token only when it exists AND has not expired yet.
        if (token.isNotEmpty && !AppFunctions.isTokenExpired(token)) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        // Attach language code when available.
        if (langCode.isNotEmpty) {
          options.headers['lang'] = langCode;
        }

        return handler.next(options); // continue the request pipeline
      },
    );

    // Insert at index 0 so the auth interceptor runs before the logger,
    // ensuring the logger captures the final headers (including the token).
    _dioInstance?.interceptors.insert(0, _authInterceptor!);
  }

  /// Adds [PrettyDioLogger] to print requests / responses in debug builds only.
  static void _addLoggingInterceptor() {
    if (kDebugMode) {
      _dioInstance?.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        ),
      );
    }
  }

  // ─── Public update helpers ─────────────────────────────────────────────────

  /// Persists [newToken] to shared preferences and refreshes the interceptor.
  static Future<void> updateAuthToken(String newToken) async {
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.token,
      value: newToken,
    );
    _addAuthInterceptor(); // refresh with the new token
  }

  /// Persists [newLangCode] to shared preferences and refreshes the interceptor.
  static Future<void> updateLang(String newLangCode) async {
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.langCode,
      value: newLangCode,
    );
    _addAuthInterceptor(); // refresh with the new language code
  }

  /// Removes the stored token from shared preferences and re-registers
  /// the auth interceptor so subsequent requests are sent without a token.
  static Future<void> clearAuthToken() async {
    await SharedPrefHelper.removeData(key: SharedPrefKeys.token);
    _addAuthInterceptor(); // re-add without token (token will be empty string)
  }
}
