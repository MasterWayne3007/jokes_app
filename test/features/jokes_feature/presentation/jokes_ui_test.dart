import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_tests.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/features/jokes_feature/presentation/jokes_ui.dart';
import 'package:jokes_app/providers.dart';

import '../domain/jokes_use_case_test.dart';


void main() {
  final gateway = jokesGatewayProvider.getGateway(providersContext);

  gateway.transport = (request) async {
    return Right(
      RestSuccessResponse(
        data: const {"setup": setup , "delivery": delivery},
      ),
    );
  };

  group('JokesUI tests :: ', () {
    uiTest(
      'default joke with setup and delivery',
      context: providersContext,
      builder: () => JokesUI(),
      verify: (tester) async {
        final textFinder = find.byType(Text);
        final textFinder2 = find.byType(Text);
        final textFinder3 = find.byType(Text);

        expect(textFinder, findsOneWidget);
        expect(textFinder2, findsOneWidget);
        expect(textFinder3, findsOneWidget);

        final setupTextFinder = textFinder.first;
        final deliveryTextFinder = textFinder2.first;
        final anotherJokeTextFinder = textFinder3.first;

        expect(
          find.descendant(of: setupTextFinder, matching: find.text(setup)),
          findsOneWidget,
        );

        expect(
          find.descendant(of: deliveryTextFinder, matching: find.text(delivery)),
          findsOneWidget,
        );

        expect(
          find.descendant(of: anotherJokeTextFinder, matching: find.text("Tell me another joke")),
          findsOneWidget,
        );


      },
    );
  });
}