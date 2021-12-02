
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/home_page.dart';
import 'package:jokes_app/routes.dart';

import 'home_page_test.dart';

void main() {
  testWidgets(
    'shows error page when route is not found',
    (tester) async {
      await tester.pumpWidget(buildWidget(const HomePage()));

      router.open('/non-existent');
      await tester.pumpAndSettle();

      expect(find.byType(Page404), findsOneWidget);
    },
  );
}
