import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor_app/Features/home/Data/models/banner_model.dart';
import 'package:labor_app/Features/home/presentation/widgets/banner_item.dart';
import 'package:labor_app/constants.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScrollableBanner extends StatefulWidget {
  const ScrollableBanner({super.key});

  @override
  State<ScrollableBanner> createState() => _ScrollableBannerState();
}

class _ScrollableBannerState extends State<ScrollableBanner> {
  List<BannerModel> banner = [
    BannerModel(
      image: Assets.imagesBanner1,
      body: 'Banner1'.tr(),
      backgroundImage: Assets.imagesBannerBackground1,
    ),
    BannerModel(
      image: Assets.imagesBanner1,
      body: 'Banner1'.tr(),
      backgroundImage: Assets.imagesBannerBackground1,
    ),
    BannerModel(
      image: Assets.imagesBanner1,
      body: 'Banner1'.tr(),
      backgroundImage: Assets.imagesBannerBackground1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: bannerController,
                onPageChanged: (int index) {},
                itemBuilder: (context, index) =>
                    BannerItem(model: banner[index]),
                itemCount: banner.length,
              ),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: bannerController,
                  effect: ExpandingDotsEffect(
                    activeDotColor: kPrimaryColor,
                    dotColor: Colors.grey,
                    dotHeight: 10.h,
                    expansionFactor: 4.w,
                    dotWidth: 10.w,
                    spacing: 5.0.w,
                  ),
                  count: banner.length,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
