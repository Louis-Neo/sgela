
import 'package:schooler/constants/route_names.dart';
import 'package:schooler/locator.dart';
import 'package:schooler/services/authentication_service.dart';
import 'package:schooler/services/navigation_service.dart';

import 'base_view_model.dart';

class HomeProfileAvatarViewModel extends BaseViewModel {

  AuthenticationService _authenticationService = locator<AuthenticationService>();
  NavigationService _navigationService = locator<NavigationService>();

  void signOut() async {
    await _authenticationService.signOut();
   _navigationService.navigateUntilNamed(StartUpViewRoute);
  }

}