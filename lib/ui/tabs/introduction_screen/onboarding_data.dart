import 'package:evently/utils/app_assets.dart';
class OnboardingData {
  final String titleKey;
  final String bodyKey;
  final String image;

  const OnboardingData({
    required this.titleKey,
    required this.bodyKey,
    required this.image,
  });

  static const List<OnboardingData> screens = [
    OnboardingData(
      titleKey: 'title1',
      bodyKey: 'body1',
      image: AppAssets.intro1,
    ),
    OnboardingData(
      titleKey: 'title2',
      bodyKey: 'body2',
      image: AppAssets.intro2,
    ),
    OnboardingData(
      titleKey: 'title3',
      bodyKey: 'body3',
      image: AppAssets.intro3,
    ),
    OnboardingData(
      titleKey: 'title4',
      bodyKey: 'body4',
      image: AppAssets.intro4,
    ),
  ];
}

