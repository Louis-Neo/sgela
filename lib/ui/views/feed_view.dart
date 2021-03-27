import 'package:flutter/material.dart';
import 'package:schooler/ui/shared/ui_helpers.dart';
import 'package:schooler/ui/widgets/home_view_widgets/post_widgets/post_item.dart';
import 'package:schooler/viewmodels/feed_view_model.dart';

import 'base_view.dart';

class FeedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BaseView<FeedViewModel>(
      onModelReady: (model) => model.fetchPosts(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: model.busy ? CircularProgressIndicator(strokeWidth: 2.0, valueColor: AlwaysStoppedAnimation(Colors.white)) : Icon(Icons.add),
          backgroundColor: model.busy ? Color(0xff2f416e).withOpacity(0.8) : Color(0xff2f416e),
          onPressed: () => model.navigateToCreatePost(),
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
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        largeVerticalSpace,
                        model.busy ? Container(
                          height: 50.0,
                          width: 50.0,
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white)
                          ),
                        ) : model.posts != null ? ListView.builder(
                          itemCount: model.posts.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => model.editPost(index),
                            child: PostItem(
                              post: model.posts[index],
                              onDelete: () => model.deletePost(index),
                            ),
                          ),
                        ) : Container(
                            height: MediaQuery.of(context).size.height - 100.0,
                            width: MediaQuery.of(context).size.width - 50.0,
                            alignment: Alignment.center,
                            child: Text("No Posts Found", style: TextStyle(color: Colors.white, fontSize: 25.0)),
                        )
                      ]
                    ),
                  )
                ]),
              )
            ],
          ),
        )
      )
    );
  }

}
