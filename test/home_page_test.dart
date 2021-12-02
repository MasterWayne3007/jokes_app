import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/features/jokes_feature/presentation/jokes_ui.dart';
import 'package:jokes_app/home_page.dart';
import 'package:jokes_app/providers.dart';
import 'package:jokes_app/routes.dart';

void main() {
  tearDown(() {
    router.reset();
  });

  group('HomePage tests | ', () {
    testWidgets(
      'correct UI',
      (tester) async {
        await tester.pumpWidget(buildWidget(const HomePage()));

        final appBarFinder = find.byType(AppBar);
        expect(
          find.descendant(
            of: appBarFinder,
            matching: find.text('Jokes App'),
          ),
          findsOneWidget,
        );

        final listTileFinder = find.byType(ListTile);
        expect(listTileFinder, findsNWidgets(1));

        expect(
          find.descendant(
            of: listTileFinder.at(0),
            matching: find.text('Tell me a joke'),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'tap on joke tile should redirect to JokesUI',
      (tester) async {
        await tester.pumpWidget(buildWidget(const HomePage()));

        final jokesTileFinder = find.text('Tell me a joke');
        expect(jokesTileFinder, findsOneWidget);

        await tester.tap(jokesTileFinder);
        await tester.pump();

        expect(find.byType(JokesUI), findsOneWidget);
      },
    );
  });
}

Widget buildWidget(Widget widget) {
  return AppProvidersContainer(
    providersContext: providersContext,
    onBuild: (_, __) {},
    child: MaterialApp.router(
      routeInformationParser: router.informationParser,
      routerDelegate: router.delegate,
    ),
  );
}
