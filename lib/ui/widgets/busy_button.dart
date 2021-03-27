import 'package:flutter/material.dart';
import 'package:schooler/ui/shared/shared_styles.dart';

class BusyButton extends StatefulWidget {

  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;

  const BusyButton({
    @required this.title,
    this.busy = false,
    @required this.onPressed,
    this.enabled = true
  });

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        child: AnimatedContainer(
          height: widget.busy ? 50.0 : 50.0,
          width: widget.busy ? 50.0 : MediaQuery.of(context).size.width/2,
          duration: Duration(milliseconds: 200),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: widget.busy ? 10.0 : 15.0, vertical: widget.busy ? 10.0 : 15.0),
          decoration: BoxDecoration(
            color: widget.enabled ? Color(0xff2f416e) : Color(0xff2f416e).withOpacity(0.6),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2.0),
                blurRadius: 6.0
              )
            ]
          ),
          child: !widget.busy ? Text(widget.title, style: buttonTitleTextStyle) : CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
          )
        ),
      ),
    );
  }
}
