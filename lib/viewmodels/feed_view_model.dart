

import 'package:schooler/constants/route_names.dart';
import 'package:schooler/models/create_post.dart';
import 'package:schooler/services/dialog_service.dart';
import 'package:schooler/services/firestore_service.dart';
import 'package:schooler/services/navigation_service.dart';

import '../locator.dart';
import 'base_view_model.dart';

class FeedViewModel extends BaseViewModel {

  List<Post> _posts;
  List<Post> get posts => _posts;

  NavigationService _navigationService = locator<NavigationService>();
  FireStoreService _fireStoreService = locator<FireStoreService>();
  DialogService _dialogService = locator<DialogService>();

  Future navigateToCreatePost() async {
   bool update = await _navigationService.navigateTo(CreatePostViewRoute);
   if(update){
     await fetchPosts();
   }
  }

  // Fetching posts once off
  Future fetchPosts() async {
    setBusy(true);
    var results = await _fireStoreService.getPostsOnceOff();
    setBusy(false);

    if(results is List<Post>){
      _posts = results;
      print("Made Database Connection");
      notifyListeners();
    } else {
      await _dialogService.showDialog(
        title: "Posts Update Failed",
        description: results
      );
    }
  }

  // Stream of Post objects
  void listenToPosts() {
    setBusy(true);
    _fireStoreService.realtimePostUpdates().listen((postData) {
      List<Post> updatedPosts = postData;
      if(updatedPosts != null && updatedPosts.length > 0){
        _posts = updatedPosts;
        notifyListeners();
      }
      setBusy(false);
    });
  }

  // Deleting a post
  Future deletePost(int index) async {
    var response = await _dialogService.showConfirmationDialog(
      title: "Are you sure?",
      description: "Dp ypu really want to delete post?",
      confirmationTitle: "Yes",
      cancelTitle: "No"
    );

    if(response.confirmed){
      _fireStoreService.deletePost(_posts[index].documentID);
    }

  }

  Future editPost(int index) async {
    _navigationService.navigateTo(CreatePostViewRoute, arguments: _posts[index]);
  }

}