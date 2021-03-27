import 'package:flutter/material.dart';
import 'package:schooler/models/create_post.dart';
import 'package:schooler/ui/shared/ui_helpers.dart';
import 'package:schooler/ui/views/base_view.dart';
import 'package:schooler/viewmodels/create_post_view_model.dart';

import '../../../input_field.dart';

class CreatePostView extends StatelessWidget {

  final titleController = TextEditingController();
  final Post editingPost;

  CreatePostView({this.editingPost, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return BaseView<CreatePostViewModel>(
      onModelReady: (model){
        titleController.text = editingPost?.title ?? '';
        model.setEditingPost(editingPost);
      },
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff2f416e),
          onPressed: (){
            if(!model.busy)
              model.createPost();
          },
          child: model.busy ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)) : Icon(Icons.add),
        ),
        body: Container(
          height: height,
          width: width,
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
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () => model.navigationPop(),
                  icon: Icon(Icons.clear)
                ),
                actions: [
                  IconButton(
                    onPressed: (){
                      if(!model.busy){
                        model.createPost();
                      }
                    },
                    icon: Icon(Icons.send)
                  ),
                  SizedBox(width: 20.0)
                ],
                floating: true,
                snap: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mediumVerticalSpace,
                        InputField(
                          controller: titleController,
                          placeholder: "Title",
                        ),
                        mediumVerticalSpace,
                        Text("Post Image", style: TextStyle(color: Colors.white, fontSize: 22.0)),
                        mediumVerticalSpace,
                        Container(
                          height: 250.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.add_photo_alternate, color: Colors.grey[400])
                        )
                      ]
                    ),
                  )
                ])
              )
            ],
          ),
        )
      )
    );
  }
}
