// import 'package:book_app/Features/home/Data/repos/home_repo_imp.dart';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';

// import 'api_service.dart';

// final getIt = GetIt.instance;

// void setupServiceLocator() {
//   getIt.registerSingleton<ApiService>(ApiService(Dio()));
//   getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
//     getIt.get<ApiService>(),
//   ));
// }