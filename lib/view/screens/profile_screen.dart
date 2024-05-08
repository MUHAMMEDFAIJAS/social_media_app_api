// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insta_clone_test_1/model/authentication_model.dart';
import 'package:insta_clone_test_1/service/auth_functions.dart';
import 'package:insta_clone_test_1/view/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: AuthService().getLoggedUser(context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final UserModel? user = snapshot.data;
          if (user != null) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                  user.username ?? 'Profile',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((BuildContext context) {
                              return AlertDialog(
                                title: const Text('logout'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('cancel')),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: const Text('log out'),
                                  )
                                ],
                              );
                            }));
                      },
                      icon: const Icon(Icons.logout)),
                ],
              ),
              body: Container(
                height: 230,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            minRadius: 40,
                            backgroundColor: Colors.blueAccent,
                          ),
                          const Gap(20),
                          Column(
                            children: [
                              Text(
                                user.following!.length.toString(),
                              ),
                              const Text('Followers')
                            ],
                          ),
                          const SizedBox(width: 15),
                          Column(
                            children: [
                              Text(
                                user.followers!.length.toString(),
                              ),
                              const Text('following')
                            ],
                          ),
                        ],
                      ),
                      const Gap(40),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(140, 40)),
                            ),
                            child: const Text(
                              'Edit profile',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const Gap(10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(140, 40)),
                            ),
                            child: const Text(
                              'Share profile',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const Gap(20),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Icon(Icons.person_add))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text('');
          }
        }
      },
    );
  }
}
