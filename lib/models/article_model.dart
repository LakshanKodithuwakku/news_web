class Article {
  final String title;
  final String byline;
  final String url;
  final String imageUrl;
  final String publishedDate;
  final String summary;

  Article({required this.title, required this.byline, required this.url, required this.imageUrl, required this.publishedDate,
      required this.summary, });

  factory Article.fromMap(Map<String, dynamic> map){
    return Article(
        title: map['title'],
        byline: map['byline'],
        url: map['url'],
        imageUrl: map['multimedia'].length > 0
        ? map['multimedia'][2]['url']
        : 'https://static01.nyt.com/images/2023/02/23/multimedia/23dc-chips-01-cmth/23dc-chips-01-cmth-thumbLarge.jpg',
        publishedDate: map['published_date'],
        summary: map['abstract']
    );
  }
}
