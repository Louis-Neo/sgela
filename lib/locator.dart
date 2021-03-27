import 'package:get_it/get_it.dart';

import 'services/authentication_service.dart';
import 'services/dialog_service.dart';
import 'services/firestore_service.dart';
import 'services/navigation_service.dart';
import 'viewmodels/create_post_view_model.dart';
import 'viewmodels/feed_view_model.dart';
import 'viewmodels/home_profile_avatar_view_model.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/login_view_model.dart';
import 'viewmodels/middle_cluster_view_model.dart';
import 'viewmodels/signup_view_model.dart';
import 'viewmodels/startup_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator(){

  // Registering Services
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  locator.registerLazySingleton<FireStoreService>(() => FireStoreService());
  locator.registerLazySingleton<DialogService>(() => DialogService());

  // Registering Factory View Models
  locator.registerFactory<StartUpViewModel>(() => StartUpViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<SignUpViewModel>(() => SignUpViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<HomeProfileAvatarViewModel>(() => HomeProfileAvatarViewModel());
  locator.registerFactory<MiddleClusterViewModel>(() => MiddleClusterViewModel());
  locator.registerFactory<FeedViewModel>(() => FeedViewModel());
  locator.registerFactory<CreatePostViewModel>(() => CreatePostViewModel());

}