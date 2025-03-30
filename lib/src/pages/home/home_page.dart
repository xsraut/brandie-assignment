import 'package:brandie_assignment/src/features/post/presentation/scrollable_post.dart';
import 'package:brandie_assignment/src/pages/home/tabs/smart_post_tab.dart';
import 'package:brandie_assignment/src/pages/home/widgets/brand_logo.dart';
import 'package:brandie_assignment/src/pages/home/widgets/camera_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// The initial screen of the application
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // The controller for tabs (smart post/library/...)
  late TabController _tabController;

  // The controller for scrolling posts
  late PageController _pageController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController(keepPage: true);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App bar (or) Header
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            // Brand logo at the top
            BrandLogo(),
            // Camera Button
            CameraButton(),
          ],
        ),

        // TabBar
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Smart Post'),
            Tab(text: 'Library'),
            Tab(text: 'Communities'),
            Tab(text: 'Share & Win'),
          ],
        ),

        // TabBarView
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              SmartPostTab(),

              // Other tabs (to be implemented...)
              Center(child: Text('Library')),
              Center(child: Text('Communities')),
              Center(child: Text('Share & Win')),
            ],
          ),
        ),
      ],
    );
  }
}
