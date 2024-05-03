import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone_test_1/model/user_model.dart';
import 'package:insta_clone_test_1/service/user_register.dart';
import 'package:insta_clone_test_1/sign_up_screen.dart';
import 'package:insta_clone_test_1/view/widgets/bottomnavbar.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'instagram',
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
              Colors.blue,
              Colors.white10,
              Colors.redAccent,
            ])),
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
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: const Text(
                  'signup',
                  style: TextStyle(color: Color(0xFF405DE6), fontSize: 18),
                )),
            const Gap(20),
            TextButton(
              onPressed: () async {
                final status = await UserSignup().login(SignupModel(
                    email: usernameController.text,
                    password: passwordController.text));
                if (status == "success") {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const BottomNav(),
                  ));
                } else {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                }
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(color: Color(0xFF405DE6), fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
