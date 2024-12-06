import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_with_cubit/main.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
  await tester.pumpAndSettle();
}
