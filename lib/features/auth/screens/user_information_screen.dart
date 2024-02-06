import 'package:flutter/material.dart';

class UserInformationScreen extends StatefulWidget {
  static const routeName = '/user-information';
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_a_photo),
              )
            ],
          )
        ],
      ),
    )));
  }
}
