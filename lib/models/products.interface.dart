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
      mediaUrl: data["mediaUrl"] ?? data["ProductImages"][0]['image'] ?? '',
      views: data['views'] ?? '0',
      likes: data['likes'] ?? '0',
      price: data['price'] ?? '0',
      productOwner: data['productOwner'] ?? data['Owner'] ?? '',
    );
  }
}
