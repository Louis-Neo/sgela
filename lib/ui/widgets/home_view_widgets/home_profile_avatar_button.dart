import 'package:flutter/material.dart';

import 'package:schooler/ui/views/base_view.dart';
import 'package:schooler/viewmodels/home_profile_avatar_view_model.dart';

class HomeProfileAvatar extends StatelessWidget {

  final double height;
  final double width;

  const HomeProfileAvatar({
    @required this.height,
    @required this.width
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeProfileAvatarViewModel>(
      builder: (context, model, child) => GestureDetector(
        onTap: () => model.signOut(),
        child: Container(
          height: height * 0.15,
          width: width * 0.15,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 2),
                    blurRadius: 5.0
                )
              ]
          ),
          child: CircleAvatar(
            backgroundColor: Color(0xff2f416e),
            child: Text("N", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      )
    );
  }
}
