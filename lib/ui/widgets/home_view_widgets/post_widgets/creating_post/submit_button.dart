import 'package:flutter/material.dart';
import 'package:schooler/ui/shared/shared_styles.dart';

class SubmitButton extends StatefulWidget {

  final bool busy;
  final bool enabled;
  final title;
  final Function onPressed;

  const SubmitButton({
    @required this.title,
    this.busy = false,
    this.enabled = true,
    @required this.onPressed
  });

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: InkWell(
          child: AnimatedContainer(
            height: widget.busy ? 30.0 : 30.0,
            width: widget.busy ? 50.0 : MediaQuery.of(context).size.width/4,
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: widget.busy ? Color(0xff2f416e) : Color(0xff2f416e).withOpacity(0.6),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2.0),
                  blurRadius: 6.0
                )
              ]
            ),
            child: !widget.busy ? Center(
              child: Text(widget.title, style: buttonTitleTextStyle),
            ) : CircularProgressIndicator(
              strokeWidth: 1.8,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
            ),
          ),
        ),
      ),
    );
  }
}
