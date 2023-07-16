import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labor_app/core/route/app_route.dart';
import 'package:labor_app/core/route/route_path.dart';
import 'package:labor_app/core/utils/bloc_observer.dart';
import 'package:labor_app/core/utils/cache_helper.dart';
import 'Features/select_local/business_logic/select_local_cubit/select_local_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  CacheHelper.saveData(key: 'onBoarding', value: true);
  runApp(
    EasyLocalization(
      saveLocale: true,
      useFallbackTranslations: true,
      fallbackLocale: const Locale('en', 'UK'),
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'UK'),
      ],
      path: 'assets/languages',
      child: Labor(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class Labor extends StatelessWidget {
  Labor({super.key, required this.appRouter});
  final AppRouter appRouter;
  SelectLocalCubit selectLocalCubit = SelectLocalCubit();
  Locale locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Labor',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            textTheme: GoogleFonts.quicksandTextTheme(),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: splashScreen,
        );
      },
    );
  }
}
