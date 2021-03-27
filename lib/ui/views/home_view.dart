import 'package:flutter/material.dart';
import 'package:schooler/ui/shared/ui_helpers.dart';
import 'package:schooler/ui/widgets/home_view_widgets/home_profile_avatar_button.dart';
import 'package:schooler/ui/widgets/home_view_widgets/middle_cluster.dart';
import 'package:schooler/viewmodels/home_view_model.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return BaseView<HomeViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Container(
          height: height,
          width: width,
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
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        largeVerticalSpace,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            HomeProfileAvatar(
                              height: MediaQuery.of(context).size.width,
                              width: MediaQuery.of(context).size.width
                            )
                          ],
                        ),
                        verticalSpace(50.0),
                        MiddleCluster(height: height, width: width)
                      ],
                    ),
                  )
                ])
              )
            ],
          ),
        )
      ),
    );
  }
}
