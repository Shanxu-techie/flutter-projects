class NewsItem {
  final String title;
  final String detail;
  final String image;
  final String publishDate;
  final String link;

  NewsItem({
    required this.title,
    required this.detail,
    required this.image,
    required this.publishDate,
    required this.link,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json){
    return NewsItem(
      title: json['title'],
      detail: json['detail'],
      image: json['image'],
      publishDate: json['publishDate'],
      link: json['link'],
    );
  }
}
