import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgettest/screen/home_screen.dart';

void main() {
  testWidgets('home screen initial', (tester) async {
    List datas = [
      {"color": "red", "phone": "mi"},
      {"color": "blue", "phone": "samsung"},
      {"color": "black", "phone": "vivo"},
      {"color": "yellow", "phone": "iphone"},
    ];
    await tester.pumpWidget(MaterialApp(
        home: HomePage(
      username: 'parth',
      data: datas,
    )));
    expect(find.text("Welcome to the Home Page! parth"), findsOne);
    expect(find.byType(Card), findsExactly(datas.length));
  });

  testWidgets('home screen Display List check', (tester) async {
    List datas = [
      {"color": "red", "phone": "mi"},
      {"color": "blue", "phone": "samsung"},
      {"color": "black", "phone": "vivo"},
      {"color": "yellow", "phone": "iphone"},
    ];
    await tester.pumpWidget(MaterialApp(
        home: HomePage(
      username: 'parth',
      data: datas,
    )));
    for (var i = 0; i < datas.length; i++) {
      expect(find.text(datas[i]["phone"]), findsOne);
    }
  });
}
