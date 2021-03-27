import 'package:flutter/material.dart';

class NavigationService {

  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop(){
    _navigationKey.currentState.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}){
    return _navigationKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigatePushReplacementNamed(String routeName, {dynamic arguments}){
    return _navigationKey.currentState.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateUntilNamed(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

}