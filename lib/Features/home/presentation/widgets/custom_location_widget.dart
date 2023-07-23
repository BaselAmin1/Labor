import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';

class CustomLocationWidget extends StatelessWidget {
  const CustomLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff528674),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            SvgPicture.asset(Assets.imagesLocation),
            SizedBox(
              width: context.width / 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'yourlocation'.tr(),
                  style: Styles.textStyle12.copyWith(
                    color: Colors.grey[200],
                  ),
                ),
                SizedBox(
                  height: context.height / 200,
                ),
                Text(
                  'Jiddah Alexander Language School , ALS'.tr(),
                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
