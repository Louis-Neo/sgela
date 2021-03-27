import 'package:flutter/material.dart';
import 'package:schooler/ui/shared/shared_styles.dart';
import 'package:schooler/ui/shared/ui_helpers.dart';
import 'package:schooler/ui/widgets/busy_button.dart';
import 'package:schooler/ui/widgets/input_field.dart';
import 'package:schooler/ui/widgets/social_login_button.dart';
import 'package:schooler/ui/widgets/text_link.dart';
import 'package:schooler/viewmodels/signup_view_model.dart';

import 'base_view.dart';

class SignUpView extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO Optimize according to screen size
    return BaseView<SignUpViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                      )
                  )
              ),
              CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              largeVerticalSpace,
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child:  Text("Register", style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w700))
                              ),
                              largeVerticalSpace,
                              InputField(
                                fieldName: "Email",
                                placeholder: "Enter Email",
                                controller: emailController,
                                textInputType: TextInputType.emailAddress,
                              ),
                              smallVerticalSpace,
                              InputField(
                                fieldName: "Password",
                                placeholder: "Enter Password",
                                controller: passwordController,
                                textInputType: TextInputType.text,
                                password: true,
                              ),
                              tinyVerticalSpace,
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextLink("Note: 6+ Characters".toUpperCase(), onPressed: (){})
                                  ]
                              ),
                              verticalSpace(15.0),
                              Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                                  child: BusyButton(
                                    title: "Sign Up".toUpperCase(),
                                    busy: model.busy,
                                    onPressed: () => model.signUp(email: emailController.text, password: passwordController.text),
                                  )
                              ),
                              verticalSpace(15.0),
                              Column(
                                children: <Widget>[
                                  Text("- OR -", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                                  smallVerticalSpace,
                                  Text("REGISTER IN WITH", style: headerOneStyle.copyWith(fontSize: 16.0))
                                ],
                              ),
                              verticalSpace(15),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SocialLoginButton(
                                    image: 'assets/logos/applelogovector.png',
                                    onPressed: () => model.appleSignUp(),
                                  ),
                                  SocialLoginButton(
                                    image: 'assets/logos/google.png',
                                    onPressed: () => model.googleSignUp(),
                                  ),
                                  SocialLoginButton(
                                    image: 'assets/logos/linkedin.png',
                                    onPressed: () => model.linkedInSignUp(),
                                  )
                                ],
                              ),
                              verticalSpace(50),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextLink("Already have an account? Login".toUpperCase(), onPressed: () => model.navigateToLogin()),
                                  verticalSpace(30)
                                ],
                              )
                            ],
                          )
                      )
                    ]),
                  )
                ],
              )
            ]
        ),
      ),
    );
  }
}
