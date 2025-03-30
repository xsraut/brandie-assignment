import 'package:flutter/material.dart';

// the boost page (accessible from rocket button of the bottom nav bar)
class BoostPage extends StatefulWidget {
  const BoostPage({super.key});

  @override
  State<BoostPage> createState() => _BoostPageState();
}

class _BoostPageState extends State<BoostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(child: Icon(Icons.rocket)),
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
