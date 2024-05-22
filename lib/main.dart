import 'package:caranga/features/fipe/presentation/cubit/brands_cubit.dart';
import 'package:caranga/features/fipe/presentation/pages/home_page.dart';
import 'package:caranga/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:caranga/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<BrandsCubit>(
      lazy: false,
      create: (_) => sl<BrandsCubit>(),
    ),
  ], child: const FipeApp()));
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
      ],
    ),
  ],
);

class FipeApp extends StatelessWidget {
  const FipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
