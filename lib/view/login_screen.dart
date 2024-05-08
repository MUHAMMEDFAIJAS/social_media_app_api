import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone_test_1/model/authentication_model.dart';
import 'package:insta_clone_test_1/service/auth_functions.dart';
import 'package:insta_clone_test_1/view/widgets/bottomnavbar.dart';
import 'package:insta_clone_test_1/view/widgets/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'enter email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter a email';
                  } else {
                    return null;
                  }
                },
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter a valid password';
                  } else {
                    return null;
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  },
                  child: const Text(
                    'signup',
                    style: TextStyle(color: Color(0xFF405DE6), fontSize: 18),
                  )),
              const Gap(20),
              TextButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    final status = await AuthService().login(
                        context,
                        AuthenticationModel(
                            email: emailController.text,
                            password: passwordController.text));

                    if (status == 'success') {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const BottomNav()));
                    } else {
                      return;
                    }
                  }
                },
                child: const Text('login'),

                //   final status = await UserSignup().login(AuthenticationModel(
                //       email: usernameController.text,
                //       password: passwordController.text));
                //   if (status == "success") {
                //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                //       builder: (context) => const BottomNav(),
                //     ));
                //   } else {
                //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                //       builder: (context) => LoginScreen(),
                //     ));
                //   }
                // },
                //   child: const Text(
                //     'LOGIN',
                //     style: TextStyle(color: Color(0xFF405DE6), fontSize: 18),
                //   ),
                // )
              )
            ],
          ),
        ),
      ),
    );
  }
}
