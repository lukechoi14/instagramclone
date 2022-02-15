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
      res= "succes";
    }
    catch (err) {
      res= err.toString();
    }
    return res;
  }
}