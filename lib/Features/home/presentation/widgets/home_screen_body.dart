import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor_app/Features/home/business_logic/main_layout_cubit/main_layout_cubit.dart';
import 'package:labor_app/Features/home/presentation/screens/categories_screen.dart';
import 'package:labor_app/Features/home/presentation/widgets/categorie_item.dart';
import 'package:labor_app/Features/home/presentation/widgets/custom_location_widget.dart';
import 'package:labor_app/Features/home/presentation/widgets/scrollable_banner_widget.dart';
import 'package:labor_app/constants.dart';
import 'package:labor_app/core/utils/assets.dart';
import 'package:labor_app/core/utils/extensions/media_query_extension.dart';
import 'package:labor_app/core/utils/styles.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({super.key});
  MainLayoutCubit mainLayoutCubit = MainLayoutCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainLayoutCubit>.value(
      value: mainLayoutCubit,
      child: BlocConsumer<MainLayoutCubit, MainLayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.height / 90,
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(Assets.imagesBell),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(Assets.imagesHome),
                                Text(
                                  'LABOR'.tr(),
                                  style: Styles.textStyle20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height / 50,
                    ),
                    Row(
                      children: [
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'GoodMorning'.tr(),
                              style: Styles.textStyle14
                                  .copyWith(color: Colors.black),
                              children: [
                                const TextSpan(text: '  '),
                                TextSpan(
                                  text: 'Basel',
                                  style: Styles.textStyle14
                                      .copyWith(color: const Color(0xffF5DF99)),
                                  onEnter: (event) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height / 90,
                    ),
                    Text(
                      'FindyourhomeserviceN'.tr(),
                      style: Styles.textStyle28,
                    ),
                    SizedBox(
                      height: context.height / 90,
                    ),
                    const CustomLocationWidget(),
                    SizedBox(
                      height: context.height / 50,
                    ),
                    SizedBox(
                      height: context.height / 5,
                      child: const ScrollableBanner(),
                    ),
                    Row(
                      children: [
                        Text(
                          'Ourservices'.tr(),
                          style: Styles.textStyle18,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoriesScreen()),
                          ),
                          child: Text(
                            'SeeAll'.tr(),
                            style: Styles.textStyle12.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const ClampingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: 6,
                                itemBuilder: (context, index) => CategorieItem(
                                  index: index,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
