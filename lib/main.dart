import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAs83ympLpPAwbsvEmBNJkdif_96uJJEe8",
            appId: "1:911995632425:web:9de5e125ff3bf6a8f59538",
            messagingSenderId: "911995632425",
            projectId: "instagram-clone-4f681",
            storageBucket: "instagram-clone-4f681.appspot.com"),

    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram clone',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor
        ),
        // home: ResponsiveLayout(webScreenLayout: WebScreenLayout(),
        //   mobileScreenLayout: MobileScreenLayout(),)
      home: LoginScreen(),
    );
  }
}
