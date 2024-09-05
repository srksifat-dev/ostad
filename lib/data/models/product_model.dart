class ProductModel{
  final String productID;
  final String productImgUrl;
  final String productTitle;
  final List<String> availableColors;
  final List<String> availableSizes;
  final double price;

  const ProductModel({
    required this.productID,
    required this.productImgUrl,
    required this.productTitle,
    required this.availableColors,
    required this.availableSizes,
    required this.price,
  });
}