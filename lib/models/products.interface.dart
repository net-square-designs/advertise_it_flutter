class IProducts {
  final int id;
  final String title;
  final String mediaUrl;
  final int views;
  final int likes;
  final String price;
  final Map productOwner;
  List productImages = [];

  IProducts({
    this.id,
    this.title,
    this.mediaUrl,
    this.views,
    this.likes,
    this.price,
    this.productOwner,
    this.productImages,
  });

  factory IProducts.fromMap(Map data) {
    return IProducts(
      id: data['id'] ?? 0,
      title: data['title'] ?? '',
      views: data['views'] ?? 0,
      likes: data['likes'] ?? 0,
      price: data['price'] ?? '0',
      productOwner: data['productOwner'] ?? data['Owner'] ?? {},
      productImages: data["ProductImages"] ?? [],
      mediaUrl: data["ProductImages"][0]['image'] ?? '',
    );
  }
}
