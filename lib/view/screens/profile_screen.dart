import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 230,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    Gap(20),
                    Column(
                      children: [
                        Text('name'),
                        Gap(5),
                        Text('caption'),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('0', style: TextStyle(fontSize: 18)),
                    Text(
                      'followers',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('0', style: TextStyle(fontSize: 18)),
                    Text('following', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    minimumSize: MaterialStateProperty.all(const Size(140, 40)),
                  ),
                  child: const Text(
                    'Edit profile',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Gap(20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    minimumSize: MaterialStateProperty.all(const Size(140, 40)),
                  ),
                  child: const Text(
                    'Share profile',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Gap(20),
                ElevatedButton(
                    onPressed: () {}, child: const Icon(Icons.person_add))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
