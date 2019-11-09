class ICategories {
  final int id;
  final String name;
  final String imageUrl;

  ICategories({
    this.id,
    this.name,
    this.imageUrl
  });

  factory ICategories.fromMap(Map data) {
    return ICategories(
      id: data['id'] ?? 1,
      name: data["name"] ?? '',
      imageUrl: data["image"] ?? '',
    );
  }
}
