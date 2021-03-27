import 'package:flutter/material.dart';
import 'package:schooler/ui/shared/ui_helpers.dart';
import 'package:schooler/viewmodels/startup_view_model.dart';

import 'base_view.dart';

class StartUpView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseView<StartUpViewModel>(
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff6a7eb0),
                  Color(0xff6276a8),
                  Color(0xff4d6194),
                  Color(0xff435480)
                ],
                stops: [0.1, 0.4, 0.7, 0.9]
            )
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3125,
                  width: halfWidth(context),
                  decoration: BoxDecoration(
                    color: Color(0xff2f416e),
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/two.jpg'),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                verticalSpace(50.0),
                CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
