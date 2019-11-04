class IProducts {
  final String title;
  final String mediaUrl;
  final String views;
  final String likes;
  final String price;
  final Map  productOwner;

  IProducts({
    this.title,
    this.mediaUrl,
    this.views,
    this.likes,
    this.price,
    this.productOwner
  });

  factory IProducts.fromMap(Map data) {
    return IProducts(
      title: data['title'] ?? '',
      mediaUrl: data["mediaUrl"] ?? '',
      views: data['views'] ?? '',
      likes: data['likes'] ?? '',
      price: data['price'] ?? '',
      productOwner: data['productOwner'] ?? '',
    );
  }
}
