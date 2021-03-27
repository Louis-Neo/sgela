import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schooler/ui/shared/shared_styles.dart';
import 'package:schooler/ui/shared/ui_helpers.dart';

import 'note_text.dart';

class InputField extends StatefulWidget {

  final TextEditingController controller;
  final String fieldName;
  final TextInputType textInputType;
  final String placeholder;
  final String validationMessage;
  final String additionalNote;
  final bool password;
  final bool isReadOnly;
  final Function enterPressed;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final TextInputFormatter formatter;
  final IconData prefixIcon;

  InputField({
    @required this.controller,
    @required this.placeholder,
    this.fieldName,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.validationMessage,
    this.textInputType = TextInputType.text,
    this.additionalNote,
    this.formatter,
    this.textInputAction = TextInputAction.next,
    this.password = false,
    this.enterPressed,
    this.isReadOnly = false,
    this.onChanged,
    this.smallVersion = false,
    this.prefixIcon
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  bool isPassword = true;
  double fieldHeight = 50.0;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.fieldName != null ? Text(widget.fieldName, style: headerOneStyle) : Container(),
        smallVerticalSpace,
        Container(
          alignment: Alignment.centerLeft,
          height: widget.smallVersion ? 30 : fieldHeight,
          padding: fieldPadding,
          decoration: widget.isReadOnly ? disabledFieldDecoration : fieldDecoration,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  focusNode: widget.fieldFocusNode,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white70,
                  inputFormatters: widget.formatter != null ? [widget.formatter] : null,
                  decoration: InputDecoration.collapsed(
                    hintText: widget.placeholder,
                    hintStyle: TextStyle(fontSize: widget.smallVersion ? 12 : 15, color: Colors.white70),
                    border: InputBorder.none
                  ),
                  onEditingComplete: (){
                    if(widget.enterPressed != null){
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.enterPressed();
                    }
                  },
                  onFieldSubmitted: (value){
                    if(widget.nextFocusNode != null){
                      widget.nextFocusNode.requestFocus();
                    }
                  },
                  obscureText: isPassword,
                  readOnly: widget.isReadOnly
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                    isPassword = !isPassword;
                }),
                child: widget.password ? Container(
                  height: fieldHeight,
                  width: fieldHeight,
                  child: Icon(isPassword ? Icons.visibility : Icons.visibility_off, color: Colors.white70),
                ) : Container(),
              )
            ],
          )
        ),
        if(widget.validationMessage != null) NoteText(widget.validationMessage, colour: Colors.red),
        if (widget.additionalNote != null) verticalSpace(5),
        if (widget.additionalNote != null) NoteText(widget.additionalNote),
        smallVerticalSpace
      ],
    );
  }

}
