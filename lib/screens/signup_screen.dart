import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //svg img
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        "https://picsum.photos/seed/picsum/536/354"),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo),
                      ))
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _usernameController,
                hintText: "Enter your username",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
              ),
              //text field input for email
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              //text field input for password
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: "Enter your bio",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 12,
              ),

              //button login
              Container(
                child: const Text("Sign Up"),
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  color: blueColor,
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //transitioning to signup page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  InkWell(
                    onTap: () async {
                      String res = await AuthMethod().signUpUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          username: _usernameController.text,
                          bio: _bioController.text);
                      print(res);
                    },
                    child: Container(
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
