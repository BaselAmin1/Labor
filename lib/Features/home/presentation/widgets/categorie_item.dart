import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor_app/Features/home/Data/models/categories_model.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';

class CategorieItem extends StatelessWidget {
  CategorieItem({super.key, required this.index});
  late int index;
    List<CategoriesModel> categorie = [
    CategoriesModel(
      image: Assets.imagesHourlyCleaning,
      title: 'hourlyCleaning'.tr(),
    ),
    CategoriesModel(
      image: Assets.imagesContractCleaning,
      title: 'contractCleaning'.tr(),
    ),
    CategoriesModel(
      image: Assets.imagesElectrical,
      title: 'electrical'.tr(),
    ),
    CategoriesModel(
      image: Assets.imagesCarWash,
      title: 'carWach'.tr(),
    ),
    CategoriesModel(
      image: Assets.imagesConditioning,
      title: 'conditioning'.tr(),
    ),
    CategoriesModel(
      image: Assets.imagesPlumbing,
      title: 'plumbing'.tr(),
    ),
  ];

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
          SvgPicture.asset(categorie[index].image),
          SizedBox(
            height: context.height / 50,
          ),
          Text(
          categorie[index].title,
            style: Styles.textStyle18,
          )
        ],
      ),
    );
  }
}
