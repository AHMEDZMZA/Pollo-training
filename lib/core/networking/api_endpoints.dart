class ApiEndpoints {
  /// BaseUrl
  static const String baseUrl = 'https://pollostore.com/api/v1/';

  /// <---------------------------------------------------------------------------->
  /// Auth ---> Done
  static const String login = '/login';
  static const String register = '/register';

  /// <---------------------------------------------------------------------------->
  /// Merchants ---> Waiting
  static const String merchantsInfo = '/merchant/info';
  static const String merchantsList = '/merchant/reviews/list';
  static const String merchantsUpdate = '/merchant/update';
  static const String merchantsChangePassword = '/merchant/change-password';
  static const String merchantsReview = '/merchant/review';
  static const String merchantsDelete = '/merchant/destroy';

  /// <---------------------------------------------------------------------------->
  /// Categories
  static const String categoriesList = '/categories';
  static const String categoriesCreate = '/categories/average-prices';

  static String categoriesSubCategories(int id) =>
      '/categories/$id/sub-categories';
  static const String categoriesTopLevel = '/categories/top-level';

  /// <---------------------------------------------------------------------------->
  /// Products
  static const String productsList = '/products';
  static const String productsCreate = '/products/latest';
  static const String productsInfo = '/product/info';
  static const String productsReviewsList = '/product/reviews/list';
  static const String productsStore = '/product/store';
  static const String productsVisit = '/product/visit';
  static const String productsReview = '/product/review';

  static String productsLike(int id) => '/products/$id/like';
  static const String productsUpdate = '/products/update/266';
/// <---------------------------------------------------------------------------->
/// Wishlists
  static const String wishlistList = '/wishlists/list';
  static const String wishlistCreate = '/wishlists/store';
  static wishlistsDestroy(int id) => '/wishlists/destroy/$id';
}
