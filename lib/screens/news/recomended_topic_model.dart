import '../../util/constants.dart';

class RecomendedModel {
  String recomendImage;
  String recomendTitle;
  String recomendSource;
  String recomendTime;

  RecomendedModel(this.recomendImage, this.recomendTitle, this.recomendSource,
      this.recomendTime);
}

final List<RecomendedModel> recomendedItem = [
  RecomendedModel(
      AppImages.recomendImageOne,
      'US jobs growth disappoints as recovery falters',
      'Nature Channel',
      '4min ago'),
  RecomendedModel(AppImages.recomendImageTwo,
      'Food price rise fears amid staff shortages', 'BBC Sport', '5min ago'),


];
