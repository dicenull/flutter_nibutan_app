import 'package:flutter_nibutan_app/screens/nibutan_screen.dart';
import 'package:flutter_nibutan_app/screens/result_screen.dart';
import 'package:flutter_nibutan_app/screens/set_up_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final goRouterProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (_) => '/setup',
      ),
      GoRoute(
        path: '/setup',
        builder: (context, state) => const SetUpScreen(),
      ),
      GoRoute(
        path: '/solve',
        builder: ((context, state) => const NibutanScreen()),
      ),
      GoRoute(
        path: '/result',
        builder: (context, state) => const ResultScreen(),
      ),
    ],
  ),
);
