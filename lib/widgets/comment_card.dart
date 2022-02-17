import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({Key? key, required this.snap}) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                widget.snap['profilePic']),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text:  TextSpan(children:[
                    TextSpan(
                        text: widget.snap['username'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: " ${widget.snap['text']}",
                    )
                  ])),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      DateFormat.yMMMd().format(
                          widget.snap['datePublished'].toDate()
                      ),
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.favorite,size: 16,),
          )
        ],
      ),
    );
  }
}
