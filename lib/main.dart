import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'services/dialog_service.dart';
import 'services/navigation_service.dart';
import 'ui/router.dart';
import 'ui/views/startup_view.dart';

void main() async {
  // These two are needed to account for the new FireBase package firebase_core
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // TODO run this in material app to account for more options.
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff435480),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_){
    setupLocator();
    runApp(Root());
  });
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SGELA",
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(child: child)
        )
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: StartUpView(),
      theme: ThemeData(
        primaryColor: Color(0xff2f416e),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
