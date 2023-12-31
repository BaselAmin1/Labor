import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labor_app/constants.dart';
import 'package:labor_app/core/route/app_route.dart';
import 'package:labor_app/core/route/route_path.dart';
import 'package:labor_app/core/utils/bloc_observer.dart';
import 'package:labor_app/core/utils/cache_helper.dart';

import 'Features/select_local/business_logic/select_local_cubit/select_local_cubit.dart';
import 'firebase_options.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = loginScreen;
    } else {
      initialRoute = mainLayoutScreen;
    }
  });
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor, // Set your desired status bar color here
      statusBarBrightness:
          Brightness.light, // Use Brightness.light for light status bar
      statusBarIconBrightness:
          Brightness.dark, // Use Brightness.dark for dark status bar icons
    ));
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
            scaffoldBackgroundColor: const Color(0xfffafff6),
            useMaterial3: true,
          ),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: splashScreen,
        );
      },
    );
  }
}
