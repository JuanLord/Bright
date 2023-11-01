import '../../util/constants.dart';

class NewsItem {
  String newsImage;
  String newsTitle;
  String newsSource;
  String newsTime;

  NewsItem(this.newsImage, this.newsTitle, this.newsSource, this.newsTime);
}

final List<NewsItem> newsItems = [
  NewsItem(
      AppImages.newsImageTwo,
      'Climate change: Arctic warming linked to colder winters',
      'Nature Channel',
      '4min ago'),
  NewsItem(
      AppImages.newsImageOne,
      'Tokyo Paralympics: Great Britain win three golds and pass 100-medal mark',
      'BBC Sport',
      '5min ago'),
];
