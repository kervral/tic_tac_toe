import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/main.dart';

void main() {
  testWidgets('Home page test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Play'), findsOneWidget);
    await tester.tap(find.text('Play'));
  });
}
