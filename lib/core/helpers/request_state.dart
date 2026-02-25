import 'package:flutter/material.dart';

/// A type-safe state management solution for handling API requests in Flutter.
///
/// This sealed class hierarchy provides an elegant way to represent the lifecycle
/// of API requests, including regular requests and paginated data loading.
///
/// ## State Types:
///
/// **Regular States:**
/// - `InitialState` - Before any request is made
/// - `LoadingState` - Initial request in progress
/// - `SuccessState` - Request completed with data
/// - `FailureState` - Request failed with error
///
/// **Pagination States:**
/// - `PaginationLoadingState` - Loading next page (preserves current data)
/// - `PaginationSuccessState` - Next page loaded successfully
/// - `PaginationFailureState` - Next page failed (preserves current data)
///
/// ## Basic Usage:
///
/// ```dart
/// // In your Cubit/Bloc state
/// @freezed
/// class ProductsState with _$ProductsState {
///   const factory ProductsState({
///     @Default(InitialState()) RequestState<List<Product>> productsState,
///   }) = _ProductsState;
/// }
///
/// // In your Cubit
/// class ProductsCubit extends Cubit<ProductsState> {
///   Future<void> loadProducts() async {
///     emit(state.copyWith(productsState: const LoadingState()));
///
///     try {
///       final products = await repository.getProducts();
///       emit(state.copyWith(productsState: SuccessState(products)));
///     } catch (e) {
///       emit(state.copyWith(productsState: FailureState(e.toString())));
///     }
///   }
/// }
///
/// // In your UI
/// BlocBuilder<ProductsCubit, ProductsState>(
///   buildWhen: RequestStateWhen.changed((s) => s.productsState),
///   builder: (context, state) {
///     return state.productsState.when(
///       onInitial: () => Text('Ready to load'),
///       onLoading: () => CircularProgressIndicator(),
///       onSuccess: (products) => ProductList(products),
///       onFailure: (error) => ErrorWidget(error),
///     );
///   },
/// )
/// ```
///
/// ## Pagination Example:
///
/// ```dart
/// Future<void> loadMoreProducts() async {
///   // Preserves current data while loading next page
///   emit(state.copyWith(
///     productsState: state.productsState.toPaginationLoading(),
///   ));
///
///   try {
///     final newProducts = await repository.getProducts(page: nextPage);
///     final allProducts = [...state.productsState.data!, ...newProducts];
///     emit(state.copyWith(
///       productsState: PaginationSuccessState(allProducts),
///     ));
///   } catch (e) {
///     emit(state.copyWith(
///       productsState: state.productsState.toPaginationFailure(e.toString()),
///     ));
///   }
/// }
/// ```
sealed class RequestState<T> {
  const RequestState();

  @override
  String toString() {
    return switch (this) {
      InitialState() => 'InitialState<$T>',
      LoadingState() => 'LoadingState<$T>',
      SuccessState(:final data) => 'SuccessState<$T>(data: $data)',
      FailureState(:final error) => 'FailureState<$T>(error: $error)',
      PaginationLoadingState(:final currentData) => 'PaginationLoadingState<$T>(currentData: $currentData)',
      PaginationSuccessState(:final data) => 'PaginationSuccessState<$T>(data: $data)',
      PaginationFailureState(:final error, :final currentData) => 'PaginationFailureState<$T>(error: $error, currentData: $currentData)',
    };
  }
}

// ============================================================================
// Core State Classes
// ============================================================================

/// Represents the initial state before any request has been made.
///
/// Use this as the default state in your Cubit/Bloc.
///
/// Example:
/// ```dart
/// @freezed
/// class MyState with _$MyState {
///   const factory MyState({
///     @Default(InitialState()) RequestState<User> userState,
///   }) = _MyState;
/// }
/// ```
final class InitialState<T> extends RequestState<T> {
  const InitialState();

  @override
  bool operator ==(Object other) => identical(this, other) || other is InitialState<T>;

  @override
  int get hashCode => (InitialState).hashCode;
}

/// Represents an ongoing initial request.
///
/// Typically used to show a full-screen loading indicator.
///
/// Example:
/// ```dart
/// Future<void> loadUser() async {
///   emit(state.copyWith(userState: const LoadingState()));
///   // ... fetch data
/// }
/// ```
final class LoadingState<T> extends RequestState<T> {
  const LoadingState();

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoadingState<T>;

  @override
  int get hashCode => (LoadingState).hashCode;
}

/// Represents a successful request with data.
///
/// Example:
/// ```dart
/// try {
///   final user = await repository.getUser();
///   emit(state.copyWith(userState: SuccessState(user)));
/// } catch (e) { ... }
/// ```
final class SuccessState<T> extends RequestState<T> {
  final T data;

  const SuccessState(this.data);

  @override
  bool operator ==(Object other) => identical(this, other) || other is SuccessState<T> && data == other.data;

  @override
  int get hashCode => data.hashCode;
}

/// Represents a failed request with an error message.
///
/// Example:
/// ```dart
/// try {
///   final user = await repository.getUser();
///   emit(state.copyWith(userState: SuccessState(user)));
/// } catch (e) {
///   emit(state.copyWith(userState: FailureState(e.toString())));
/// }
/// ```
final class FailureState<T> extends RequestState<T> {
  final String error;

  const FailureState(this.error);

  @override
  bool operator ==(Object other) => identical(this, other) || other is FailureState<T> && error == other.error;

  @override
  int get hashCode => error.hashCode;
}

/// Represents loading the next page in a paginated list.
///
/// Preserves the current data so the UI can show existing items
/// with a loading indicator at the bottom.
///
/// Example:
/// ```dart
/// Future<void> loadMore() async {
///   emit(state.copyWith(
///     productsState: state.productsState.toPaginationLoading(),
///   ));
///   // ... fetch next page
/// }
/// ```
final class PaginationLoadingState<T> extends RequestState<T> {
  final T? currentData;

  const PaginationLoadingState([this.currentData]);

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginationLoadingState<T> && currentData == other.currentData;

  @override
  int get hashCode => currentData.hashCode;
}

/// Represents successfully loading the next page.
///
/// Contains the merged data (current + new items).
///
/// Example:
/// ```dart
/// try {
///   final newItems = await repository.getProducts(page: nextPage);
///   final allItems = [...state.productsState.data!, ...newItems];
///   emit(state.copyWith(
///     productsState: PaginationSuccessState(allItems),
///   ));
/// } catch (e) { ... }
/// ```
final class PaginationSuccessState<T> extends RequestState<T> {
  final T data;

  const PaginationSuccessState(this.data);

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginationSuccessState<T> && data == other.data;

  @override
  int get hashCode => data.hashCode;
}

/// Represents a failed pagination request.
///
/// Preserves the current data so the UI can show existing items
/// with an error message.
///
/// Example:
/// ```dart
/// try {
///   final newItems = await repository.getProducts(page: nextPage);
///   // ... merge items
/// } catch (e) {
///   emit(state.copyWith(
///     productsState: state.productsState.toPaginationFailure(e.toString()),
///   ));
/// }
/// ```
final class PaginationFailureState<T> extends RequestState<T> {
  final String error;
  final T? currentData;

  const PaginationFailureState(this.error, [this.currentData]);

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginationFailureState<T> && error == other.error && currentData == other.currentData;

  @override
  int get hashCode => Object.hash(error, currentData);
}

// ============================================================================
// UI Building Extensions
// ============================================================================

/// Provides methods for building UI based on request state.
extension RequestStateBuilder<T> on RequestState<T> {
  /// Exhaustively handles all request states and returns a Widget.
  ///
  /// This is the primary method for building UI. All core states (loading,
  /// success, failure) must be handled. Pagination states are optional and
  /// fall back to core handlers if not provided.
  ///
  /// Example:
  /// ```dart
  /// state.productsState.when(
  ///   onLoading: () => Center(child: CircularProgressIndicator()),
  ///   onSuccess: (products) => ProductList(products),
  ///   onFailure: (error) => ErrorMessage(error),
  /// )
  /// ```
  ///
  /// With pagination handling:
  /// ```dart
  /// state.productsState.when(
  ///   onLoading: () => Center(child: CircularProgressIndicator()),
  ///   onSuccess: (products) => ProductList(products),
  ///   onFailure: (error) => ErrorMessage(error),
  ///   onPaginationLoading: (currentProducts) => ProductList(
  ///     products: currentProducts!,
  ///     showBottomLoader: true,
  ///   ),
  ///   onPaginationFailure: (error, currentProducts) => ProductList(
  ///     products: currentProducts!,
  ///     bottomError: error,
  ///   ),
  /// )
  /// ```
  Widget when({
    required Widget Function() onLoading,
    required Widget Function(T data) onSuccess,
    required Widget Function(String error) onFailure,
    Widget Function()? onInitial,
    Widget Function(T? currentData)? onPaginationLoading,
    Widget Function(T data)? onPaginationSuccess,
    Widget Function(String error, T? currentData)? onPaginationFailure,
  }) {
    return switch (this) {
      InitialState() => onInitial?.call() ?? const SizedBox.shrink(),
      LoadingState() => onLoading(),
      SuccessState(:final data) => onSuccess(data),
      FailureState(:final error) => onFailure(error),
      PaginationLoadingState(:final currentData) => onPaginationLoading?.call(currentData) ?? (currentData != null ? onSuccess(currentData) : onLoading()),
      PaginationSuccessState(:final data) => onPaginationSuccess?.call(data) ?? onSuccess(data),
      PaginationFailureState(:final error, :final currentData) =>
        onPaginationFailure?.call(error, currentData) ?? (currentData != null ? onSuccess(currentData) : onFailure(error)),
    };
  }

  /// Selectively handles states with a fallback for unhandled cases.
  ///
  /// Useful when you only care about certain states.
  ///
  /// Example:
  /// ```dart
  /// // Only show error, use default widget for everything else
  /// state.userState.maybeWhen(
  ///   onFailure: (error) => ErrorBanner(error),
  ///   orElse: () => SizedBox.shrink(),
  /// )
  /// ```
  ///
  /// ```dart
  /// // Handle success and loading, ignore others
  /// state.dataState.maybeWhen(
  ///   onSuccess: (data) => DataView(data),
  ///   onLoading: () => LoadingShimmer(),
  ///   orElse: () => EmptyState(),
  /// )
  /// ```
  Widget maybeWhen({
    Widget Function()? onInitial,
    Widget Function()? onLoading,
    Widget Function(T data)? onSuccess,
    Widget Function(String error)? onFailure,
    Widget Function(T? currentData)? onPaginationLoading,
    Widget Function(T data)? onPaginationSuccess,
    Widget Function(String error, T? currentData)? onPaginationFailure,
    required Widget Function() orElse,
  }) {
    return switch (this) {
      InitialState() => onInitial?.call() ?? orElse(),
      LoadingState() => onLoading?.call() ?? orElse(),
      SuccessState(:final data) => onSuccess?.call(data) ?? orElse(),
      FailureState(:final error) => onFailure?.call(error) ?? orElse(),
      PaginationLoadingState(:final currentData) => onPaginationLoading?.call(currentData) ?? orElse(),
      PaginationSuccessState(:final data) => onPaginationSuccess?.call(data) ?? orElse(),
      PaginationFailureState(:final error, :final currentData) => onPaginationFailure?.call(error, currentData) ?? orElse(),
    };
  }

  /// Returns null if no handler matches the current state.
  ///
  /// Ideal for conditional rendering where you only want to show
  /// something in specific states.
  ///
  /// Example:
  /// ```dart
  /// Column(
  ///   children: [
  ///     // Only show error banner if there's an error
  ///     state.userState.whenOrNull(
  ///       onFailure: (error) => ErrorBanner(error),
  ///     ) ?? SizedBox.shrink(),
  ///
  ///     // Main content
  ///     MainContent(),
  ///   ],
  /// )
  /// ```
  ///
  /// ```dart
  /// // Conditional bottom loader
  /// bottomNavigationBar: state.itemsState.whenOrNull(
  ///   onPaginationLoading: (_) => LinearProgressIndicator(),
  /// ),
  /// ```
  Widget? whenOrNull({
    Widget Function()? onInitial,
    Widget Function()? onLoading,
    Widget Function(T data)? onSuccess,
    Widget Function(String error)? onFailure,
    Widget Function(T? currentData)? onPaginationLoading,
    Widget Function(T data)? onPaginationSuccess,
    Widget Function(String error, T? currentData)? onPaginationFailure,
  }) {
    return switch (this) {
      InitialState() => onInitial?.call(),
      LoadingState() => onLoading?.call(),
      SuccessState(:final data) => onSuccess?.call(data),
      FailureState(:final error) => onFailure?.call(error),
      PaginationLoadingState(:final currentData) => onPaginationLoading?.call(currentData),
      PaginationSuccessState(:final data) => onPaginationSuccess?.call(data),
      PaginationFailureState(:final error, :final currentData) => onPaginationFailure?.call(error, currentData),
    };
  }

  /// Like `when` but returns a value instead of a Widget.
  ///
  /// Useful for deriving values from state in non-UI contexts.
  ///
  /// Example:
  /// ```dart
  /// final statusMessage = state.userState.fold(
  ///   onLoading: () => "Loading user...",
  ///   onSuccess: (user) => "Welcome, ${user.name}!",
  ///   onFailure: (error) => "Failed to load user: $error",
  /// );
  ///
  /// logger.info(statusMessage);
  /// ```
  ///
  /// ```dart
  /// // Get item count
  /// final count = state.productsState.fold(
  ///   onLoading: () => 0,
  ///   onSuccess: (products) => products.length,
  ///   onFailure: (_) => 0,
  ///   onPaginationLoading: (current) => current?.length ?? 0,
  /// );
  /// ```
  R fold<R>({
    required R Function() onLoading,
    required R Function(T data) onSuccess,
    required R Function(String error) onFailure,
    R Function()? onInitial,
    R Function(T? currentData)? onPaginationLoading,
    R Function(T data)? onPaginationSuccess,
    R Function(String error, T? currentData)? onPaginationFailure,
  }) {
    return switch (this) {
      InitialState() => onInitial?.call() ?? onLoading(),
      LoadingState() => onLoading(),
      SuccessState(:final data) => onSuccess(data),
      FailureState(:final error) => onFailure(error),
      PaginationLoadingState(:final currentData) => onPaginationLoading?.call(currentData) ?? (currentData != null ? onSuccess(currentData) : onLoading()),
      PaginationSuccessState(:final data) => onPaginationSuccess?.call(data) ?? onSuccess(data),
      PaginationFailureState(:final error, :final currentData) =>
        onPaginationFailure?.call(error, currentData) ?? (currentData != null ? onSuccess(currentData) : onFailure(error)),
    };
  }

  /// Like `fold` but returns null for unhandled states.
  ///
  /// Example:
  /// ```dart
  /// // Log only errors
  /// final errorMessage = state.apiState.foldOrNull<String>(
  ///   onFailure: (error) => "API Error: $error",
  ///   onPaginationFailure: (error, _) => "Pagination Error: $error",
  /// );
  ///
  /// if (errorMessage != null) {
  ///   logger.error(errorMessage);
  ///   analytics.logError(errorMessage);
  /// }
  /// ```
  R? foldOrNull<R>({
    R Function()? onInitial,
    R Function()? onLoading,
    R Function(T data)? onSuccess,
    R Function(String error)? onFailure,
    R Function(T? currentData)? onPaginationLoading,
    R Function(T data)? onPaginationSuccess,
    R Function(String error, T? currentData)? onPaginationFailure,
  }) {
    return switch (this) {
      InitialState() => onInitial?.call(),
      LoadingState() => onLoading?.call(),
      SuccessState(:final data) => onSuccess?.call(data),
      FailureState(:final error) => onFailure?.call(error),
      PaginationLoadingState(:final currentData) => onPaginationLoading?.call(currentData),
      PaginationSuccessState(:final data) => onPaginationSuccess?.call(data),
      PaginationFailureState(:final error, :final currentData) => onPaginationFailure?.call(error, currentData),
    };
  }

  // ============================================================================
  // State Checks
  // ============================================================================

  /// Check if this is a LoadingState
  bool get isLoading => this is LoadingState<T>;

  /// Check if this is a SuccessState
  bool get isSuccess => this is SuccessState<T>;

  /// Check if this is a FailureState
  bool get isFailure => this is FailureState<T>;

  /// Check if this is an InitialState
  bool get isInitial => this is InitialState<T>;

  /// Check if this is a PaginationLoadingState
  bool get isPaginationLoading => this is PaginationLoadingState<T>;

  /// Check if this is a PaginationSuccessState
  bool get isPaginationSuccess => this is PaginationSuccessState<T>;

  /// Check if this is a PaginationFailureState
  bool get isPaginationFailure => this is PaginationFailureState<T>;

  /// Check if this is any loading state (loading or pagination loading)
  bool get isAnyLoading => isLoading || isPaginationLoading;

  /// Check if this is any success state (success or pagination success)
  bool get isAnySuccess => isSuccess || isPaginationSuccess;

  /// Check if this is any failure state (failure or pagination failure)
  bool get isAnyFailure => isFailure || isPaginationFailure;

  /// Check if this is any pagination state
  bool get isPaginating => isPaginationLoading || isPaginationSuccess || isPaginationFailure;

  /// Check if data is available (success or pagination states with data)
  bool get hasData => data != null;

  /// Check if an error exists (failure or pagination failure)
  bool get hasError => error != null;

  // ============================================================================
  // Data Accessors
  // ============================================================================

  /// Get the data if available, otherwise null.
  ///
  /// Available in: SuccessState, PaginationSuccessState, PaginationLoadingState, PaginationFailureState
  ///
  /// Example:
  /// ```dart
  /// final products = state.productsState.data;
  /// if (products != null) {
  ///   print('We have ${products.length} products');
  /// }
  /// ```
  T? get data => switch (this) {
        SuccessState(:final data) => data,
        PaginationSuccessState(:final data) => data,
        PaginationLoadingState(:final currentData) => currentData,
        PaginationFailureState(:final currentData) => currentData,
        _ => null,
      };

  /// Get the error message if available, otherwise null.
  ///
  /// Available in: FailureState, PaginationFailureState
  ///
  /// Example:
  /// ```dart
  /// final error = state.loginState.error;
  /// if (error != null) {
  ///   showSnackBar(error);
  /// }
  /// ```
  String? get error => switch (this) {
        FailureState(:final error) => error,
        PaginationFailureState(:final error) => error,
        _ => null,
      };

  /// Get data or throw an exception if not available.
  ///
  /// Example:
  /// ```dart
  /// // Use when you're certain data exists
  /// final user = state.userState.dataOrThrow;
  /// print('User ID: ${user.id}');
  /// ```
  T get dataOrThrow => data ?? (throw StateError('No data available in $runtimeType'));

  /// Get data or return a default value.
  ///
  /// Example:
  /// ```dart
  /// // Safe way to get data with a fallback
  /// final products = state.productsState.dataOr([]);
  /// print('Found ${products.length} products');
  /// ```
  T dataOr(T defaultValue) => data ?? defaultValue;
}

// ============================================================================
// Side Effects Extension
// ============================================================================

/// Provides methods for executing side effects based on state.
extension RequestStateListener<T> on RequestState<T> {
  /// Execute callbacks based on the current state without returning a value.
  ///
  /// Ideal for side effects like navigation, showing dialogs, logging, etc.
  ///
  /// Example - Navigation:
  /// ```dart
  /// state.loginState.listen(
  ///   onSuccess: (user) {
  ///     Navigator.pushReplacement(context, HomeRoute());
  ///   },
  ///   onFailure: (error) {
  ///     showDialog(
  ///       context: context,
  ///       builder: (_) => ErrorDialog(error),
  ///     );
  ///   },
  /// );
  /// ```
  ///
  /// Example - Analytics:
  /// ```dart
  /// state.checkoutState.listen(
  ///   onSuccess: (order) => analytics.logPurchase(order),
  ///   onFailure: (error) => analytics.logError('checkout_failed', error),
  /// );
  /// ```
  ///
  /// Example - Logging:
  /// ```dart
  /// state.apiState.listen(
  ///   onLoading: () => logger.debug('API request started'),
  ///   onSuccess: (data) => logger.info('API request succeeded'),
  ///   onFailure: (error) => logger.error('API request failed: $error'),
  /// );
  /// ```
  void listen({
    VoidCallback? onInitial,
    VoidCallback? onLoading,
    void Function(T data)? onSuccess,
    void Function(String error)? onFailure,
    void Function(T? currentData)? onPaginationLoading,
    void Function(T data)? onPaginationSuccess,
    void Function(String error, T? currentData)? onPaginationFailure,
  }) {
    switch (this) {
      case InitialState():
        onInitial?.call();
      case LoadingState():
        onLoading?.call();
      case SuccessState(:final data):
        onSuccess?.call(data);
      case FailureState(:final error):
        onFailure?.call(error);
      case PaginationLoadingState(:final currentData):
        onPaginationLoading?.call(currentData);
      case PaginationSuccessState(:final data):
        onPaginationSuccess?.call(data);
      case PaginationFailureState(:final error, :final currentData):
        onPaginationFailure?.call(error, currentData);
    }
  }
}

// ============================================================================
// Data Transformation Extensions
// ============================================================================

/// Provides methods for transforming data inside RequestState.
extension RequestStateMap<T> on RequestState<T> {
  /// Transform data while preserving the state type.
  ///
  /// The transformation is applied to all states that contain data.
  ///
  /// Example - Extract field:
  /// ```dart
  /// RequestState<User> userState = SuccessState(user);
  /// RequestState<String> nameState = userState.map((user) => user.name);
  /// // Result: SuccessState("John Doe")
  /// ```
  ///
  /// Example - Calculate length:
  /// ```dart
  /// RequestState<List<Product>> productsState = SuccessState([p1, p2, p3]);
  /// RequestState<int> countState = productsState.map((products) => products.length);
  /// // Result: SuccessState(3)
  /// ```
  ///
  /// Example - Pagination:
  /// ```dart
  /// RequestState<List<Item>> itemsState = PaginationLoadingState([item1, item2]);
  /// RequestState<List<String>> idsState = itemsState.map(
  ///   (items) => items.map((item) => item.id).toList(),
  /// );
  /// // Result: PaginationLoadingState(["id1", "id2"])
  /// ```
  RequestState<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      InitialState() => InitialState<R>(),
      LoadingState() => LoadingState<R>(),
      SuccessState(:final data) => SuccessState(transform(data)),
      FailureState(:final error) => FailureState<R>(error),
      PaginationLoadingState(:final currentData) => PaginationLoadingState<R>(currentData != null ? transform(currentData) : null),
      PaginationSuccessState(:final data) => PaginationSuccessState(transform(data)),
      PaginationFailureState(:final error, :final currentData) => PaginationFailureState<R>(
          error,
          currentData != null ? transform(currentData) : null,
        ),
    };
  }

  /// Transform data only in success states, preserve errors.
  ///
  /// Example:
  /// ```dart
  /// RequestState<String> textState = SuccessState("hello");
  /// RequestState<int> lengthState = textState.mapSuccess((s) => s.length);
  /// // Result: SuccessState(5)
  ///
  /// RequestState<String> errorState = FailureState("Network error");
  /// RequestState<int> stillErrorState = errorState.mapSuccess((s) => s.length);
  /// // Result: FailureState<int>("Network error")
  /// ```
  RequestState<R> mapSuccess<R>(R Function(T data) transform) {
    return switch (this) {
      SuccessState(:final data) => SuccessState(transform(data)),
      PaginationSuccessState(:final data) => PaginationSuccessState(transform(data)),
      InitialState() => InitialState<R>(),
      LoadingState() => LoadingState<R>(),
      FailureState(:final error) => FailureState<R>(error),
      PaginationLoadingState() => PaginationLoadingState<R>(),
      PaginationFailureState(:final error) => PaginationFailureState<R>(error),
    };
  }

  /// Transform data asynchronously while preserving state type.
  ///
  /// Example - Fetch related data:
  /// ```dart
  /// RequestState<int> userIdState = SuccessState(123);
  /// RequestState<User> userState = await userIdState.asyncMap(
  ///   (userId) async => await api.fetchUser(userId),
  /// );
  /// ```
  ///
  /// Example - Process data:
  /// ```dart
  /// RequestState<File> fileState = SuccessState(imageFile);
  /// RequestState<String> base64State = await fileState.asyncMap(
  ///   (file) async => await file.readAsString(),
  /// );
  /// ```
  Future<RequestState<R>> asyncMap<R>(Future<R> Function(T data) transform) async {
    return switch (this) {
      InitialState() => InitialState<R>(),
      LoadingState() => LoadingState<R>(),
      SuccessState(:final data) => SuccessState(await transform(data)),
      FailureState(:final error) => FailureState<R>(error),
      PaginationLoadingState(:final currentData) => PaginationLoadingState<R>(currentData != null ? await transform(currentData) : null),
      PaginationSuccessState(:final data) => PaginationSuccessState(await transform(data)),
      PaginationFailureState(:final error, :final currentData) => PaginationFailureState<R>(
          error,
          currentData != null ? await transform(currentData) : null,
        ),
    };
  }

  /// Transform data asynchronously only in success states.
  ///
  /// Example:
  /// ```dart
  /// RequestState<int> userIdState = SuccessState(123);
  /// RequestState<User> userState = await userIdState.asyncMapSuccess(
  ///   (id) async => await repository.fetchUser(id),
  /// );
  /// // Result: SuccessState(user)
  ///
  /// RequestState<int> errorState = FailureState("Not found");
  /// RequestState<User> stillErrorState = await errorState.asyncMapSuccess(
  ///   (id) async => await repository.fetchUser(id),
  /// );
  /// // Result: FailureState<User>("Not found") - transformation not applied
  /// ```
  Future<RequestState<R>> asyncMapSuccess<R>(Future<R> Function(T data) transform) async {
    return switch (this) {
      SuccessState(:final data) => SuccessState(await transform(data)),
      PaginationSuccessState(:final data) => PaginationSuccessState(await transform(data)),
      InitialState() => InitialState<R>(),
      LoadingState() => LoadingState<R>(),
      FailureState(:final error) => FailureState<R>(error),
      PaginationLoadingState() => PaginationLoadingState<R>(),
      PaginationFailureState(:final error) => PaginationFailureState<R>(error),
    };
  }

  /// Chain state transformations (monadic bind/flatMap).
  ///
  /// Use when your transformation returns a RequestState instead of raw data.
  /// This prevents nesting like RequestState.
  ///
  /// Example - Chaining API calls:
  /// ```dart
  /// // Get user, then get their posts
  /// RequestState<User> userState = SuccessState(user);
  /// RequestState<List<Post>> postsState = userState.flatMap((user) {
  ///   return fetchUserPosts(user.id); // Returns RequestState<List<Post>>
  /// });
  /// ```
  ///
  /// Example - Multi-step workflow:
  /// ```dart
  /// RequestState<String> tokenState = await loginUser();
  /// RequestState<User> profileState = tokenState.flatMap((token) {
  ///   return fetchProfile(token); // Returns RequestState<User>
  /// });
  /// ```
  RequestState<R> flatMap<R>(RequestState<R> Function(T data) transform) {
    return switch (this) {
      SuccessState(:final data) => transform(data),
      PaginationSuccessState(:final data) => transform(data),
      InitialState() => InitialState<R>(),
      LoadingState() => LoadingState<R>(),
      FailureState(:final error) => FailureState<R>(error),
      PaginationLoadingState() => PaginationLoadingState<R>(),
      PaginationFailureState(:final error) => PaginationFailureState<R>(error),
    };
  }

  /// Async version of flatMap for chaining async state transformations.
  ///
  /// Example - Sequential API calls:
  /// ```dart
  /// Future<RequestState<Order>> placeOrder() async {
  ///   final cartState = await fetchCart();
  ///
  ///   final orderState = await cartState.asyncFlatMap((cart) async {
  ///     return await processPayment(cart); // Returns Future<RequestState<Order>>
  ///   });
  ///
  ///   return orderState;
  /// }
  /// ```
  Future<RequestState<R>> asyncFlatMap<R>(Future<RequestState<R>> Function(T data) transform) async {
    return switch (this) {
      SuccessState(:final data) => await transform(data),
      PaginationSuccessState(:final data) => await transform(data),
      InitialState() => InitialState<R>(),
      LoadingState() => LoadingState<R>(),
      FailureState(:final error) => FailureState<R>(error),
      PaginationLoadingState() => PaginationLoadingState<R>(),
      PaginationFailureState(:final error) => PaginationFailureState<R>(error),
    };
  }
}

// ============================================================================
// State Transition Extensions
// ============================================================================

/// Provides convenient methods for transitioning between states.
extension RequestStateTransitions<T> on RequestState<T> {
  /// Transition to loading state.
  ///
  /// Example:
  /// ```dart
  /// emit(state.copyWith(dataState: state.dataState.toLoading()));
  /// ```
  RequestState<T> toLoading() => const LoadingState();

  /// Transition to success state with data.
  ///
  /// Example:
  /// ```dart
  /// final data = await repository.fetchData();
  /// emit(state.copyWith(dataState: state.dataState.toSuccess(data)));
  /// ```
  RequestState<T> toSuccess(T data) => SuccessState(data);

  /// Transition to failure state with error.
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   final data = await repository.fetchData();
  ///   emit(state.copyWith(dataState: state.dataState.toSuccess(data)));
  /// } catch (e) {
  ///   emit(state.copyWith(dataState: state.dataState.toFailure(e.toString())));
  /// }
  /// ```
  RequestState<T> toFailure(String error) => FailureState(error);

  /// Transition to pagination loading, preserving current data.
  ///
  /// Example:
  /// ```dart
  /// Future<void> loadMore() async {
  ///   emit(state.copyWith(
  ///     itemsState: state.itemsState.toPaginationLoading(),
  ///   ));
  ///   // Fetch next page...
  /// }
  /// ```
  RequestState<T> toPaginationLoading() {
    final currentData = data;
    return PaginationLoadingState(currentData);
  }

  /// Transition to pagination success with new data.
  ///
  /// Example:
  /// ```dart
  /// final newItems = await repository.getNextPage();
  /// final allItems = [...state.itemsState.data!, ...newItems];
  /// emit(state.copyWith(
  ///   itemsState: state.itemsState.toPaginationSuccess(allItems),
  /// ));
  /// ```
  RequestState<T> toPaginationSuccess(T data) => PaginationSuccessState(data);

  /// Transition to pagination failure, preserving current data.
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   final newItems = await repository.getNextPage();
  ///   // ... merge items
  /// } catch (e) {
  ///   emit(state.copyWith(
  ///     itemsState: state.itemsState.toPaginationFailure(e.toString()),
  ///   ));
  /// }
  /// ```
  RequestState<T> toPaginationFailure(String error) {
    final currentData = data;
    return PaginationFailureState(error, currentData);
  }

  /// Reset to initial state.
  ///
  /// Example:
  /// ```dart
  /// void reset() {
  ///   emit(state.copyWith(dataState: state.dataState.toInitial()));
  /// }
  /// ```
  RequestState<T> toInitial() => const InitialState();
}

// ============================================================================
// BLoC Integration Extensions
// ============================================================================

/// Provides helpers for BLoC integration (buildWhen/listenWhen).
///
/// These methods eliminate manual state comparison in BlocBuilder/BlocListener.
extension RequestStateBlocHelpers<T> on RequestState<T> {
  /// Check if the state has changed from the previous state.
  ///
  /// Uses the overridden == operator for accurate comparison.
  ///
  /// Example:
  /// ```dart
  /// BlocBuilder<UserCubit, UserState>(
  ///   buildWhen: (prev, curr) => curr.userState.hasChanged(prev.userState),
  ///   builder: (context, state) => UserProfile(state.userState.data!),
  /// )
  /// ```
  bool hasChanged(RequestState<T> other) => this != other;

  /// Check if the state type has changed (ignoring data changes).
  ///
  /// Useful when you only care about transitions like loading → success.
  ///
  /// Example:
  /// ```dart
  /// BlocBuilder<DataCubit, DataState>(
  ///   // Rebuild only when state type changes
  ///   buildWhen: (prev, curr) => curr.dataState.hasTypeChanged(prev.dataState),
  ///   builder: (context, state) => DataView(),
  /// )
  /// ```
  bool hasTypeChanged(RequestState<T> other) => runtimeType != other.runtimeType;

  /// Check if state transitioned to success from any other state.
  ///
  /// Example:
  /// ```dart
  /// BlocListener<LoginCubit, LoginState>(
  ///   listenWhen: (prev, curr) => curr.loginState.becameSuccess(prev.loginState),
  ///   listener: (context, state) {
  ///     Navigator.pushReplacement(context, HomeRoute());
  ///   },
  /// )
  /// ```
  bool becameSuccess(RequestState<T> other) => other is! SuccessState<T> && this is SuccessState<T>;

  /// Check if state transitioned to failure from any other state.
  ///
  /// Example:
  /// ```dart
  /// BlocListener<SignUpCubit, SignUpState>(
  ///   listenWhen: (prev, curr) => curr.signUpState.becameFailure(prev.signUpState),
  ///   listener: (context, state) {
  ///     showSnackBar(context, state.signUpState.error!);
  ///   },
  /// )
  /// ```
  bool becameFailure(RequestState<T> other) => other is! FailureState<T> && this is FailureState<T>;

  /// Check if state transitioned to loading from any other state.
  ///
  /// Example:
  /// ```dart
  /// BlocListener<DataCubit, DataState>(
  ///   listenWhen: (prev, curr) => curr.dataState.becameLoading(prev.dataState),
  ///   listener: (context, state) {
  ///     showDialog(context: context, builder: (_) => LoadingDialog());
  ///   },
  /// )
  /// ```
  bool becameLoading(RequestState<T> other) => other is! LoadingState<T> && this is LoadingState<T>;

  /// Check if state transitioned to any success state (including pagination).
  ///
  /// Example:
  /// ```dart
  /// BlocListener<ProductsCubit, ProductsState>(
  ///   listenWhen: (prev, curr) => curr.productsState.becameAnySuccess(prev.productsState),
  ///   listener: (context, state) {
  ///     analytics.logEvent('products_loaded');
  ///   },
  /// )
  /// ```
  bool becameAnySuccess(RequestState<T> other) => !other.isAnySuccess && isAnySuccess;

  /// Check if state transitioned to any failure state (including pagination).
  ///
  /// Example:
  /// ```dart
  /// BlocListener<ProductsCubit, ProductsState>(
  ///   listenWhen: (prev, curr) => curr.productsState.becameAnyFailure(prev.productsState),
  ///   listener: (context, state) {
  ///     showErrorSnackbar(context, state.productsState.error!);
  ///   },
  /// )
  /// ```
  bool becameAnyFailure(RequestState<T> other) => !other.isAnyFailure && isAnyFailure;

  /// Check if state transitioned from loading to success.
  ///
  /// Example:
  /// ```dart
  /// BlocListener<CheckoutCubit, CheckoutState>(
  ///   listenWhen: (prev, curr) => curr.paymentState.loadingToSuccess(prev.paymentState),
  ///   listener: (context, state) {
  ///     analytics.logPurchase(state.paymentState.data!);
  ///     Navigator.pushReplacement(context, OrderConfirmationRoute());
  ///   },
  /// )
  /// ```
  bool loadingToSuccess(RequestState<T> other) => other.isLoading && isSuccess;

  /// Check if state transitioned from loading to failure.
  ///
  /// Example:
  /// ```dart
  /// BlocListener<PaymentCubit, PaymentState>(
  ///   listenWhen: (prev, curr) => curr.paymentState.loadingToFailure(prev.paymentState),
  ///   listener: (context, state) {
  ///     showDialog(
  ///       context: context,
  ///       builder: (_) => RetryPaymentDialog(error: state.paymentState.error!),
  ///     );
  ///   },
  /// )
  /// ```
  bool loadingToFailure(RequestState<T> other) => other.isLoading && isFailure;

  /// Check if request completed (loading → success OR loading → failure).
  ///
  /// Example:
  /// ```dart
  /// BlocListener<DataCubit, DataState>(
  ///   listenWhen: (prev, curr) => curr.dataState.completed(prev.dataState),
  ///   listener: (context, state) {
  ///     // Hide loading dialog when request completes
  ///     Navigator.of(context).pop();
  ///   },
  /// )
  /// ```
  bool completed(RequestState<T> other) => other.isLoading && (isSuccess || isFailure);
}

// ============================================================================
// Global BLoC Helper Functions
// ============================================================================

/// Global helper functions for creating reusable buildWhen/listenWhen predicates.
///
/// These make BLoC code cleaner and more maintainable.
class RequestStateWhen {
  RequestStateWhen._();

  /// Create a predicate that triggers when state changes.
  ///
  /// Example:
  /// ```dart
  /// BlocBuilder<UserCubit, UserState>(
  ///   buildWhen: RequestStateWhen.changed((state) => state.userState),
  ///   builder: (context, state) => UserProfile(state.userState),
  /// )
  /// ```
  static bool Function(S prev, S curr) changed<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) => selector(curr).hasChanged(selector(prev));
  }

  /// Create a predicate that triggers when state type changes.
  ///
  /// Example:
  /// ```dart
  /// BlocBuilder<DataCubit, DataState>(
  ///   buildWhen: RequestStateWhen.typeChanged((state) => state.dataState),
  ///   builder: (context, state) => DataView(),
  /// )
  /// ```
  static bool Function(S prev, S curr) typeChanged<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) => selector(curr).hasTypeChanged(selector(prev));
  }

  /// Create a predicate that triggers when state becomes successful.
  ///
  /// Example:
  /// ```dart
  /// BlocListener<LoginCubit, LoginState>(
  ///   listenWhen: RequestStateWhen.success((state) => state.loginState),
  ///   listener: (context, state) {
  ///     Navigator.pushReplacement(context, HomeRoute());
  ///   },
  /// )
  /// ```
  static bool Function(S prev, S curr) success<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) => selector(curr).becameSuccess(selector(prev));
  }

  /// Create a predicate that triggers when state becomes failure.
  ///
  /// Example:
  /// ```dart
  /// BlocListener<SignUpCubit, SignUpState>(
  ///   listenWhen: RequestStateWhen.failure((state) => state.signUpState),
  ///   listener: (context, state) {
  ///     showErrorDialog(context, state.signUpState.error!);
  ///   },
  /// )
  /// ```
  static bool Function(S prev, S curr) failure<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) => selector(curr).becameFailure(selector(prev));
  }

  /// Create a predicate that triggers when request completes (success or failure).
  ///
  /// Example:
  /// ```dart
  /// BlocListener<AuthCubit, AuthState>(
  ///   listenWhen: RequestStateWhen.completed((state) => state.loginState),
  ///   listener: (context, state) {
  ///     // Hide loading indicator when login completes
  ///     hideLoadingOverlay();
  ///   },
  /// )
  /// ```
  static bool Function(S prev, S curr) completed<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) {
      final current = selector(curr);
      final previous = selector(prev);
      return current.becameSuccess(previous) || current.becameFailure(previous);
    };
  }

  /// Create a predicate that triggers when state becomes any success (including pagination).
  ///
  /// Example:
  /// ```dart
  /// BlocListener<ProductsCubit, ProductsState>(
  ///   listenWhen: RequestStateWhen.anySuccess((state) => state.productsState),
  ///   listener: (context, state) {
  ///     analytics.logProductsLoaded(state.productsState.data!.length);
  ///   },
  /// )
  /// ```
  static bool Function(S prev, S curr) anySuccess<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) => selector(curr).becameAnySuccess(selector(prev));
  }

  /// Create a predicate that triggers when state becomes any failure (including pagination).
  ///
  /// Example:
  /// ```dart
  /// BlocListener<ProductsCubit, ProductsState>(
  ///   listenWhen: RequestStateWhen.anyFailure((state) => state.productsState),
  ///   listener: (context, state) {
  ///     showErrorSnackbar(context, state.productsState.error!);
  ///   },
  /// )
  /// ```
  static bool Function(S prev, S curr) anyFailure<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) => selector(curr).becameAnyFailure(selector(prev));
  }

  /// Create a predicate that triggers when loading completes (success or failure).
  ///
  /// Example:
  /// ```dart
  /// BlocListener<DataCubit, DataState>(
  ///   listenWhen: RequestStateWhen.loadingCompleted((state) => state.dataState),
  ///   listener: (context, state) {
  ///     Navigator.of(context).pop(); // Close loading dialog
  ///   },
  /// )
  /// ```
  static bool Function(S prev, S curr) loadingCompleted<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) => selector(curr).completed(selector(prev));
  }

  /// Create a predicate that triggers when loading → success specifically.
  ///
  /// Example:
  /// ```dart
  /// BlocListener<PaymentCubit, PaymentState>(
  ///   listenWhen: RequestStateWhen.loadingToSuccess((state) => state.paymentState),
  ///   listener: (context, state) {
  ///     showSuccessDialog(context, 'Payment successful!');
  ///   },
  /// )
  /// ```
  static bool Function(S prev, S curr) loadingToSuccess<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) => selector(curr).loadingToSuccess(selector(prev));
  }

  /// Create a predicate that triggers when loading → failure specifically.
  ///
  /// Example:
  /// ```dart
  /// BlocListener<PaymentCubit, PaymentState>(
  ///   listenWhen: RequestStateWhen.loadingToFailure((state) => state.paymentState),
  ///   listener: (context, state) {
  ///     showRetryDialog(context, state.paymentState.error!);
  ///   },
  /// )
  /// ```
  static bool Function(S prev, S curr) loadingToFailure<S, T>(
    RequestState<T> Function(S state) selector,
  ) {
    return (prev, curr) => selector(curr).loadingToFailure(selector(prev));
  }
}
