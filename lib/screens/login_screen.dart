import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
              //svg img
              SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor, height: 64,),
              const SizedBox(height: 64,),
              //text field input for email
              TextFieldInput(textEditingController: _emailController, hintText: "Enter your email", textInputType: TextInputType.emailAddress),
              const SizedBox(height: 24,),
              //text field input for password
              TextFieldInput(textEditingController: _passwordController, hintText: "Enter your password", textInputType: TextInputType.text,isPass: true,),
              const SizedBox(height: 12,),
              //button login
              Container(
                child: const Text("Login"),
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  ),
                  color: blueColor,
                ),
              ),
              Flexible(child: Container(),flex: 2,),
              //transitioning to signup page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold),),
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
