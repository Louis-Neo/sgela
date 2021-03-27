import 'package:schooler/constants/route_names.dart';
import 'package:schooler/services/authentication_service.dart';
import 'package:schooler/services/navigation_service.dart';

import '../locator.dart';
import 'base_view_model.dart';

class HomeViewModel extends BaseViewModel {

  AuthenticationService _authenticationService = locator<AuthenticationService>();
  NavigationService _navigationService = locator<NavigationService>();

  Future<void> signOut() async {
    await _authenticationService.signOut();
    _navigationService.navigateTo(StartUpViewRoute);
  }

}