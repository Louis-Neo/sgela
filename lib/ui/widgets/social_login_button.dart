import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {

  final String image;
  final Function onPressed;

  const SocialLoginButton({
    this.onPressed,
    this.image
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        width: 50.0,
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(image)
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2.0),
              blurRadius: 6.0
            )
          ]
        ),
      ),
    );
  }
}
