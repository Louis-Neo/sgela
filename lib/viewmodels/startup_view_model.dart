
import 'package:schooler/constants/route_names.dart';
import 'package:schooler/services/authentication_service.dart';
import 'package:schooler/services/navigation_service.dart';

import '../locator.dart';
import 'base_view_model.dart';

class StartUpViewModel extends BaseViewModel {

  AuthenticationService _authenticationService = locator<AuthenticationService>();
  NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasUserLoggedIn = await _authenticationService.isUserLoggedIn();
    if(hasUserLoggedIn){
      _navigationService.navigateUntilNamed(HomeViewRoute);
    } else {
      print(hasUserLoggedIn);
      _navigationService.navigateTo(LoginViewRoute);
    }
  }

}