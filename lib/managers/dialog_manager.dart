import 'package:flutter/material.dart';
import 'package:schooler/models/dialog_models.dart';
import 'package:schooler/services/dialog_service.dart';

import '../locator.dart';

class DialogManager extends StatefulWidget {

  final Widget child;

  DialogManager({Key key, this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {

  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    var isConfirmationDialog = request.cancelTitle != null;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(request.title),
        content: Text(request.description),
        actions: [
          if(isConfirmationDialog)
            FlatButton(
              onPressed: () => _dialogService.dialogComplete(DialogResponse(confirmed: false)),
              child: Text(request.cancelTitle)
            ),
          FlatButton(
            onPressed: () => _dialogService.dialogComplete((DialogResponse(confirmed: true))),
            child: Text(request.buttonTitle)
          )
        ],
      )
    );
  }
}
