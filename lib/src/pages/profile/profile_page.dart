import 'package:flutter/material.dart';

// the profile page (accessible from profile button of the bottom nav bar)
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(child: Icon(Icons.person)),
            ),
          ),
          Container(
            color: Colors.black26,
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
