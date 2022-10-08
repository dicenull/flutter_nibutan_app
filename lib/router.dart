import 'package:flutter_nibutan_app/models/nibutan_controller.dart';
import 'package:flutter_nibutan_app/models/nibutan_state.dart';
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
        redirect: (_, __) => '/setup',
      ),
      GoRoute(
        path: '/setup',
        builder: (context, state) => const SetUpScreen(),
      ),
      GoRoute(
        path: '/solve',
        builder: ((context, state) {
          final start = int.parse(state.queryParams['start']!);
          final end = int.parse(state.queryParams['end']!);

          Future(() {
            ref.read(nibutanProvider.notifier).initialize(
                  NibutanState(start: start, end: end),
                );
          });

          return NibutanScreen(start, end);
        }),
      ),
      GoRoute(
        path: '/result',
        builder: (context, state) => const ResultScreen(),
      ),
    ],
  ),
);
