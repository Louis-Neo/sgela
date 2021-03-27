import 'package:flutter/material.dart';
import 'package:schooler/ui/shared/ui_helpers.dart';
import 'package:schooler/ui/views/base_view.dart';

import 'package:schooler/viewmodels/middle_cluster_view_model.dart';

class MiddleCluster extends StatelessWidget {

  final double height;
  final double width;

  MiddleCluster({this.height, this.width});

  @override
  Widget build(BuildContext context) {

    return BaseView<MiddleClusterViewModel>(
      builder: (context, model, child) => Container(
        height: height * 0.65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => model.navigateToFeed(),
              child: Container(
                height: (height * 0.65) / 3.1,
                color: Colors.yellowAccent,
              ),
            ),
            verticalSpace(5),
            Container(
              height: (height * 0.65) / 3.1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.purpleAccent,
                    ),
                  ),
                  tinyHorizontalSpace,
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(5),
            Container(
              height: (height * 0.65) / 3.1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.greenAccent,
                    ),
                  ),
                  tinyHorizontalSpace,
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.indigoAccent,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}