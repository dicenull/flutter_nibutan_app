import 'package:flutter_nibutan_app/screens/nibutan_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final goRouterProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: ((context, state) => const NibutanScreen()),
      ),
    ],
  ),
);
