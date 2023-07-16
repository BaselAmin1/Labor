import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor_app/Features/boarding/Data/models/boarding_model.dart';
import 'package:labor_app/core/utils/styles.dart';

class BoardingItem extends StatefulWidget {
   BoardingItem({super.key,required this.model});
    late BoardingModel model;

  @override
  State<BoardingItem> createState() => _BoardingItemState();
}  
var boardController = PageController();
  bool isLast = false;
class _BoardingItemState extends State<BoardingItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Center(child: SvgPicture.asset(widget.model.image))),
          SizedBox(
            height: 30.0.h,
          ),
          Center(
            child: Text(
              widget.model.title,
              style: Styles.textStyle34
            ),
          ),
          SizedBox(
            height: 15.0.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Center(
              child: Text(
                widget.model.body,
                textAlign: TextAlign.center,
                style: Styles.textStyle16.copyWith(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            height: 30.0.h,
          ),
          // 
        ],
      );
  }
}