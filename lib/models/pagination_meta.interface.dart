class IPaginationMeta {
  final int count;
  final int totalPages;
  final int currentPage;
  final int pageSize;

  IPaginationMeta({
    this.count,
    this.totalPages,
    this.currentPage,
    this.pageSize
  });

  factory IPaginationMeta.fromMap(Map data) {
    return IPaginationMeta(
      count: data['count'] ?? 0,
      totalPages: data["totalPages"] ?? 0,
      currentPage: data["page"] ?? 1,
      pageSize: data["pageSize"] ?? 5,
    );
  }
}