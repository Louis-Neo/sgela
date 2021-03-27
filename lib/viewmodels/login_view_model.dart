import 'package:flutter/material.dart';
import 'package:schooler/constants/route_names.dart';
import 'package:schooler/services/authentication_service.dart';
import 'package:schooler/services/dialog_service.dart';
import 'package:schooler/services/navigation_service.dart';

import '../locator.dart';
import 'base_view_model.dart';

class LoginViewModel extends BaseViewModel {

  NavigationService _navigationService = locator<NavigationService>();
  AuthenticationService _authenticationService = locator<AuthenticationService>();
  DialogService _dialogService = locator<DialogService>();

  Future login({@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.loginWithEmail(email, password);
    setBusy(false);
    if(result is bool){
      if(result){
        _navigationService.navigateUntilNamed(HomeViewRoute);
      } else {
        _dialogService.showDialog(
          title: "Login Failed",
          description: "Failed To log you in. Please try again later"
        );
      }
    } else {
      _dialogService.showDialog(
        title: "Login Failed",
        description: result
      );
    }
  }

  Future appleSignIn() async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 5));
    setBusy(false);
  }

  Future googleSignIn() async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 5));
    setBusy(false);
  }

  Future linkedInSignIn() async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 5));
    setBusy(false);
  }

  void navigateToSignUp(){
    _navigationService.navigateTo(SignUpViewRoute);
  }

}