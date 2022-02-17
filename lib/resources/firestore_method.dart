import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/resources/storage_method.dart';
import 'package:uuid/uuid.dart';


class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(String description, Uint8List file,
      String uid, String username,
       String profImage,) async {
    String res = "some error occured";
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage(
          'posts', file, true);
      String postId = Uuid().v1();
      Post post = Post(description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []);
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res= 'success';
    }
    catch (err) {
      res= err.toString();
    }
    return res;
  }
  Future<void> likePost(String postId, String uid, List likes) async{
     try {
       if(likes.contains(uid)){
         _firestore.collection('posts').doc(postId).update({'likes': FieldValue.arrayRemove([uid])});
       } else {
         _firestore.collection('posts').doc(postId).update({'likes': FieldValue.arrayUnion([uid])});
       }
     } catch(e) {
       print(e.toString());
     }
  }
  Future<void> postComment(String postId, String text, String uid, String username, String profilePic) async {
    try {
      if(text.isNotEmpty){
        String commentId = const Uuid().v1();
         await _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
          'profilePic': profilePic,
          'username' : username,
          'uid' : uid,
          'text' : text,
          'commentId' : commentId,
          'datePublished' : DateTime.now()

        });
      }else {
        print('text is empty');
      }
    } catch(e) {
      print(e.toString());
    }
  }
  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch(e){
      print(e.toString());
    }
  }
}