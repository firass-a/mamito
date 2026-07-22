import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mamyto/main.dart';

void main() {
  testWidgets('Mamyto app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MamytoApp()));
    await tester.pump();
    expect(find.text('MAMYTO'), findsOneWidget);
    // Allow splash navigation timer to complete so the test binding stays clean.
    await tester.pump(const Duration(milliseconds: 1700));
  });
}
