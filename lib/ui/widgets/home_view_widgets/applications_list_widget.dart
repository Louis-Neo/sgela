import 'package:flutter/material.dart';
import 'package:schooler/ui/views/base_view.dart';
import 'package:schooler/viewmodels/applications_list_widget_view_model.dart';

class ApplicationsListWidget extends StatelessWidget {

  // Widget on the home view responsible for showing detailed applications tile.


  @override
  Widget build(BuildContext context) {
    return BaseView<ApplicationsListWidgetViewModel>();
  }
}
