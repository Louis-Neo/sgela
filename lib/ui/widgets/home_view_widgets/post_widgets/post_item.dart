import 'package:flutter/material.dart';
import 'package:schooler/models/create_post.dart';

class PostItem extends StatelessWidget {

  final Post post;
  final Function onDelete;

  const PostItem({Key key, this.post, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xff2f416e),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 3,
            blurRadius: 6
          )
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(post.title),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              if(onDelete != null){
                onDelete();
              }
            }
          )
        ]
      ),
    );
  }
}
