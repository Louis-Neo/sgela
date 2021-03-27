
import 'package:schooler/constants/route_names.dart';
import 'package:schooler/services/navigation_service.dart';

import '../locator.dart';
import 'base_view_model.dart';

class MiddleClusterViewModel extends BaseViewModel {

  NavigationService _navigationService =  locator<NavigationService>();

  void navigateToFeed(){
    _navigationService.navigateTo(FeedViewRoute);
  }

}