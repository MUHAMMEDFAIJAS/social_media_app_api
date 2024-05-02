import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone_test_1/model/user_model.dart';
import 'package:insta_clone_test_1/service/user_register.dart';
import 'package:insta_clone_test_1/view/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const Gap(20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const Gap(20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            FloatingActionButton(
              onPressed: () async {
                UserSignup sig = UserSignup();
                await sig
                    .signup(SignupModel(
                        username: usernameController.text,
                        email: emailController.text,
                        password: passwordController.text))
                    .then(
                        (value) => Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            )));
              },
              child: const Text('register'),
            )
          ],
        ),
      ),
    );
  }
}
