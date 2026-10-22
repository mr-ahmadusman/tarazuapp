import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/app.dart';

void main() {
  testWidgets('TarazuApp splash screen test', (WidgetTester tester) async {
    // Build TarazuApp and trigger a frame.
    await tester.pumpWidget(const TarazuApp());

    // Verify that Tarazu app title is displayed on splash screen
    expect(find.text('Tarazu'), findsOneWidget);
    expect(find.text('ترازو'), findsOneWidget);

    // Advance time to allow splash timer & animations to finish cleanly
    await tester.pumpAndSettle(const Duration(milliseconds: 2500));
  });
}
