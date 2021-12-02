import 'package:clean_framework/clean_framework_defaults.dart'
    hide FeatureState;
import 'package:flutter_test/flutter_test.dart';

import 'package:jokes_app/features.dart';
import 'package:jokes_app/main.dart';
import 'package:jokes_app/providers.dart';

void main() {
  test('main', () {
    expect(() => main(), throwsAssertionError);
  });
  test('Load providers', () {
    loadProviders();
    final re = restExternalInterface.getExternalInterface(providersContext);
    expect(re, isA<RestExternalInterface>());
  });
  testWidgets('Jokes App', (tester) async {
    await tester.pumpWidget(
      JokesApp(),
    );
    await tester.pump();
    await tester.pumpAndSettle();
    expect(find.byType(JokesApp), findsOneWidget);

    final featuresMap =
        providersContext().read(featureStatesProvider.featuresMap);

    expect(featuresMap.defaultState, isA<FeatureState>());
    expect(featuresMap.getStateFor(jokesFeature), FeatureState.active);
  });
}
