
import 'package:flutter/foundation.dart';
import 'package:schooler/models/user.dart';
import 'package:schooler/services/authentication_service.dart';

import '../locator.dart';

class BaseViewModel extends ChangeNotifier {

  AuthenticationService _authenticationService = locator<AuthenticationService>();

  UserModel get currentUser => _authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool stateValue){
    _busy = stateValue;
    notifyListeners();
  }

}