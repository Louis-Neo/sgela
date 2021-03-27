import 'package:flutter/material.dart';
import 'package:schooler/constants/route_names.dart';
import 'package:schooler/services/authentication_service.dart';
import 'package:schooler/services/dialog_service.dart';
import 'package:schooler/services/navigation_service.dart';

import '../locator.dart';
import 'base_view_model.dart';

class SignUpViewModel extends BaseViewModel {

  AuthenticationService _authenticationService = locator<AuthenticationService>();
  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();

  Future signUp({@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.signUpWithEmail(email: email, password: password);
    setBusy(false);

    if(result is bool){
      if(result){
        _navigationService.navigateUntilNamed(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: "Sign Up Failure",
          description: "General Sign Up Failer. Please try again later."
        );
      }
    } else {
      await _dialogService.showDialog(
        title: "Sign Up Failure",
        description: result
      );
    }

  }

  Future googleSignUp() async {
    setBusy(true);
    await _dialogService.showConfirmationDialog(
      title: "Google Auth",
      description: "Google Authentication not implemented yet",
      confirmationTitle: "Got It"
    );
    setBusy(false);
  }

  Future appleSignUp() async {
    setBusy(true);
    await _dialogService.showConfirmationDialog(
        title: "Apple Auth",
        description: "Apple Authentication not implemented yet",
        confirmationTitle: "Got It"
    );
    setBusy(false);
  }

  Future linkedInSignUp() async {
    setBusy(true);
    await _dialogService.showConfirmationDialog(
        title: "LinkedIn Auth",
        description: "LinkedIn Authentication not implemented yet",
        confirmationTitle: "Got It"
    );
    setBusy(false);
  }

  void navigateToLogin(){
    _navigationService.pop();
  }

}