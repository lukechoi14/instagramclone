import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
          children: [
      Container(padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
          .copyWith(),
      child: Row(
        children: [
          CircleAvatar(radius: 16,
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1644773741827-d635af7357b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(
              left: 8
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('username',style: TextStyle(fontWeight: FontWeight.bold),)
              ],

            ),
          )),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ],
      ),
      )]
    )
    );
  }
}
