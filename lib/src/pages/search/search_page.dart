import 'package:flutter/material.dart';

// the search page (accessible from search button of the bottom nav bar)
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(child: Icon(Icons.search)),
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
