import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/presentation/home/view/home_view.dart';
import 'package:quizapp/presentation/quiz/page/quiz_page.dart';

class MyRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/game/:id',
        builder: (context, GoRouterState state) =>
            QuizPage(
                key: UniqueKey(),
                id: state.pathParameters['id'] ?? "",
            ),
      ),
    ],
    debugLogDiagnostics: true,
  );
}
