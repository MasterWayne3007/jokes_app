import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/routes.dart';

import 'providers.dart';

void main() {
  loadProviders();
  runApp(JokesApp());
}

class JokesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppProvidersContainer(
      providersContext: providersContext,
      onBuild: (context, _) {
        providersContext().read(featureStatesProvider.featuresMap).load({
          'features': [
            {'name': 'jokes', 'state': 'ACTIVE'},
          ]
        });
      },
      child: MaterialApp.router(
        routeInformationParser: router.informationParser,
        routerDelegate: router.delegate,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}
