import 'package:flutter_test/flutter_test.dart';
import 'package:task/main.dart';

void main() {
  testWidgets('App renders welcome screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PremiumCoffeeApp());

    // Verify that the welcome screen renders correctly by looking for the title text.
    expect(find.text('أروما كافيه'), findsOneWidget);
    expect(find.text('القهوة المختصة، في متناول يدك'), findsOneWidget);
  });
}
