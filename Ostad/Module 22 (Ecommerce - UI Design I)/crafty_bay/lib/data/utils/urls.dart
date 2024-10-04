class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';
  static const String dummyUrl = '$_baseUrl/login';
  static const String sliderList = '$_baseUrl/ListProductSlider';
  static const String categoryList = '$_baseUrl/CategoryList';
  static const String specialCategory = '$_baseUrl/ListProductByRemark/special';
  static const String popularCategory = '$_baseUrl/ListProductByRemark/popular';
  static String productByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';
  static String productByCategory(int id) =>
      '$_baseUrl/ListProductByCategory/$id';
  static String productDetailsbyId(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
}
