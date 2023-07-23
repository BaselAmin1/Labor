import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor_app/Features/home/Data/models/banner_model.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';

class BannerItem extends StatefulWidget {
  BannerItem({super.key, required this.model});
  late BannerModel model;

  @override
  State<BannerItem> createState() => _BannerItemState();
}

var bannerController = PageController();
bool isLast = false;

class _BannerItemState extends State<BannerItem> {
  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          widget.model.backgroundImage,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.imagesHome,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: context.width / 100,
                        ),
                        Text(
                          'LABOR'.tr(),
                          style: Styles.textStyle20.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height / 200,
                    ),
                    Text(
                      widget.model.body,
                      style: Styles.textStyle20.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: context.height / 8.5,
                      width: context.width / 5,
                      child: Image.asset(
                        widget.model.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
