import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';
import 'package:uber_ride_clone/gen/assets.gen.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';

final List<String> _adsImages = [
  Assets.images.ads.adsGetAlmostAllYouWant.path,
  Assets.images.ads.adsPlansAreBack.path,
  Assets.images.ads.adsPullOutYourMask.path,
  Assets.images.ads.adsStayingHome.path,
  Assets.images.ads.adsUberEat.path,
];

///Carousel Slider Ads Cards
class AdsCarouselSlider extends StatelessWidget {
  ///Default Constructor
  const AdsCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel.builder(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        height: AppSizes.h_120,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        viewportFraction: 1,
      ),
      itemCount: _adsImages.length,
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.h_8),
          child: Image.asset(
            _adsImages[index],
            fit: BoxFit.fitWidth,
            width: context.width,
          ),
        );
      },
    );
  }
}
