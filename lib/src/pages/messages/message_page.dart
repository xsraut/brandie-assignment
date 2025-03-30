import 'package:flutter/material.dart';

// the message page (accessible from message button of the bottom nav bar)
class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(child: Icon(Icons.message)),
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
