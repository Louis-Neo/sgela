import 'package:schooler/models/create_post.dart';
import 'package:schooler/services/dialog_service.dart';
import 'package:schooler/services/firestore_service.dart';
import 'package:schooler/services/navigation_service.dart';

import '../locator.dart';
import 'base_view_model.dart';

class CreatePostViewModel extends BaseViewModel {

  FireStoreService _fireStoreService = locator<FireStoreService>();
  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();

  Post _editingPost;

  void setEditingPost(Post post) {
    _editingPost = post;
  }

  bool get _editing => _editingPost != null;

  Future createPost({String title}) async {

    try {
      setBusy(true);
      var result;

      if(!_editing){
        await _fireStoreService.addPost(Post(title: title, userID: currentUser.userID));
      } else {
        result = await _fireStoreService.updatePost(Post(
          title: _editingPost.title, // TODO check validity
          userID: _editingPost.userID,
          documentID: _editingPost.documentID
        ));
      }

      setBusy(false);

      if(result is String){
        await _dialogService.showDialog(
            title: "Could not add post",
            description: result
        );
      } else {
        await _dialogService.showDialog(
            title: "Post Created",
            description: "Your Post Has Been Created"
        );
      }

      _navigationService.pop();
      return true;
    } catch(e){
      setBusy(false);
      await _dialogService.showDialog(
          title: "Could not add post",
          description: e.toString()
      );
      _navigationService.pop();
      return false;
    }

  }

  bool navigationPop(){
    _navigationService.pop();
    return false;
  }

}