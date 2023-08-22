import 'package:flutter_test/flutter_test.dart';

import 'package:d1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Twitter());

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);

    // Verify that our counter has incremented.
    expect(find.text('TWITTER'), findsOneWidget);
  });
}
