import 'package:brandie_assignment/src/features/post/domain/post_model.dart';
import 'package:brandie_assignment/src/features/post/presentation/edit_caption_page.dart';
import 'package:brandie_assignment/src/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage(child: MainPage());
      },
    ),
    GoRoute(
      name: 'editCaption',
      path: '/editCaption',
      pageBuilder: (context, state) {
        final post = state.extra as Post;
        return MaterialPage(
            child: EditCaptionPage(
          post: post,
        ));
      },
    ),
  ]);
}
