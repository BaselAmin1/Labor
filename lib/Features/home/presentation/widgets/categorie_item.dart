import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor_app/Features/home/Data/models/categories_model.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';

class CategorieItem extends StatelessWidget {
  CategorieItem({super.key, required this.model});
  late CategoriesModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 16,
            blurRadius: 16,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(model.image),
          SizedBox(
            height: context.height / 50,
          ),
          Text(
            model.title,
            style: Styles.textStyle18,
          )
        ],
      ),
    );
  }
}
