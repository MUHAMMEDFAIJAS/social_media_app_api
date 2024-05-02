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
                child: const Text('Register')),
            const Gap(20),
            FloatingActionButton(
              onPressed: () async {
                final status = await UserSignup().login(SignupModel(
                    email: usernameController.text,
                    password: passwordController.text));
                if (status == "success") {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>const BottomNav(),
                  ));
                } else {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                }
              },
              child: const Text('LOGIN'),
            )
          ],
        ),
      ),
    );
  }
}
