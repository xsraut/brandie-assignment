import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData themeData = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Color.fromRGBO(115, 191, 152, 1),
      ),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      tabAlignment: TabAlignment.center,
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      labelColor: Color.fromRGBO(115, 191, 152, 1),
      labelPadding: EdgeInsets.symmetric(horizontal: 7),
      labelStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
  );
}
