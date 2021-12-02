
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'features/jokes_feature/presentation/jokes_ui.dart';
import 'home_page.dart';

enum Routes {
  home,
  jokes,
}

final router = AppRouter<Routes>(
  routes: [
    AppRoute(
      name: Routes.home,
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        AppRoute(
          name: Routes.jokes,
          path: 'bored',
          builder: (context, state) => JokesUI(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Page404(error: state.error),
);

class Page404 extends StatelessWidget {
  const Page404({Key? key, required this.error}) : super(key: key);

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error.toString()),
      ),
    );
  }
}
