import 'package:flutter/material.dart';
import 'package:schooler/constants/route_names.dart';
import 'package:schooler/models/create_post.dart';

import 'views/feed_view.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/signup_view.dart';
import 'views/startup_view.dart';
import 'package:schooler/ui/widgets/home_view_widgets/post_widgets/creating_post/create_post_view.dart';

Route<dynamic> generateRoute(RouteSettings settings){

  switch(settings.name){
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView()
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView()
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView()
      );
    case StartUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartUpView()
      );
    case FeedViewRoute:
      return _getPageRoute(
          routeName: settings.name,
          viewToShow: FeedView()
      );
    case CreatePostViewRoute:
      var postToEdit = settings.arguments as Post;
      return _getPageRoute(
          routeName: settings.name,
          viewToShow: CreatePostView(
            editingPost: postToEdit
          )
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text("No route defined for ${settings.name}")
          ),
        )
      );
  }

}

PageRoute _getPageRoute({String routeName, Widget viewToShow}){
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName
    ),
    builder: (_) => viewToShow
  );
}