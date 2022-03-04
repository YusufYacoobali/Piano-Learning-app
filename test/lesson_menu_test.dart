import 'package:flutter_test/flutter_test.dart';
import 'package:sight_reading_app/main.dart';
// import 'package:sight_reading_app/screens/menu_screen.dart';
// import 'package:sight_reading_app/screens/lesson_screen.dart';
// import 'package:sight_reading_app/screens/settings_screen.dart';
// import 'package:sight_reading_app/components/app_bar_with_settings_icon.dart';

void main() {
  testWidgets('check that all lesson buttons are displayed',
          (WidgetTester tester) async {
        await tester.pumpWidget(const SightReadingApp());
        await tester.tap(find.text('Lessons'));
        await tester.pumpAndSettle();
        expect(find.text('Lesson 1'), findsOneWidget );
      });

}