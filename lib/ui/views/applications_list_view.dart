import 'package:flutter/material.dart';
import 'package:schooler/viewmodels/applications_list_view_model.dart';

import 'base_view.dart';

class ApplicationsListView extends StatelessWidget {

  // Detailed Applications View for already applied varsities and other schools.

  @override
  Widget build(BuildContext context) {
    return BaseView<ApplicationsListViewModel>();
  }
}
