import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor_app/Features/boarding/Data/models/boarding_model.dart';
import 'package:labor_app/Features/boarding/presentation/widgets/boarding_item.dart';
import 'package:labor_app/core/route/route_path.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:labor_app/core/utils/cache_helper.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';
import 'package:labor_app/core/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreenBody extends StatefulWidget {
  const BoardingScreenBody({super.key});

  @override
  _BoardingScreenBodyState createState() => _BoardingScreenBodyState();
}

class _BoardingScreenBodyState extends State<BoardingScreenBody> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: Assets.imagesBoarding1,
      title: 'boardingTitle1'.tr(),
      body: 'boardingDescreption1'.tr(),
    ),
    BoardingModel(
      image: Assets.imagesBoarding2,
      title: 'boardingTitle2'.tr(),
      body: 'boardingDescreption2'.tr(),
    ),
    BoardingModel(
      image: Assets.imagesBoarding3,
      title: 'boardingTitle3'.tr(),
      body: 'boardingDescreption3'.tr(),
    ),
  ];

  void submit() async {
    await CacheHelper.init();
    CacheHelper.saveData(
      key: 'onBoarding',
      value: false,
    ).then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: context.height / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => submit(),
                    child: Text("Skip",
                        style: Styles.textStyle18
                            .copyWith(color: const Color(0xffF5DF99))),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    BoardingItem(model: boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    activeDotColor: const Color(0xffF5DF99),
                    dotColor: Colors.grey,
                    dotHeight: 10.h,
                    expansionFactor: 4.w,
                    dotWidth: 10.w,
                    spacing: 5.0.w,
                  ),
                  count: boarding.length,
                ),
              ],
            ),
            SizedBox(
              height: 20.0.h,
            ),
            SizedBox(
              width: 300.w,
              child: CustomButton(
                text: isLast ? 'Enter'.tr() : 'Next'.tr(),
                onPressed: () {
                  isLast
                      ? submit()
                      : boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                },
              ),
            ),
            SizedBox(
              height: 20.0.h,
            ),
          ],
        ),
      ),
    );
  }
}
