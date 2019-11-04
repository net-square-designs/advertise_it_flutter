class ICategories {
  final String title;
  final String mediaUrl;

  ICategories({
    this.title,
    this.mediaUrl,
  });

  factory ICategories.fromMap(Map data) {
    return ICategories(
      title: data['title'] ?? '',
      mediaUrl: data["mediaUrl"] ?? '',
    );
  }
}
