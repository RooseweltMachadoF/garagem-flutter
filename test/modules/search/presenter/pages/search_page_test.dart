import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/historico/presenter/widgets/historico_item.dart';
import 'package:flutter_application_1/modules/search/presenter/controllers/search_controller.dart';
import 'package:flutter_application_1/modules/search/presenter/pages/search_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SearchController controller;
  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // controller = SearchController();
  });
  testWidgets('search page ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SearchPage(),
    ));
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
  });
}
