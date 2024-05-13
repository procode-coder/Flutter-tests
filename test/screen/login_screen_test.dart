import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgettest/screen/login_screen.dart';

void main() {
  testWidgets('login screen initial', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    expect(find.text("Login"), findsExactly(2));
    expect(find.byType(TextFormField), findsExactly(2));
    expect(find.text("Enter Username"), findsOneWidget);
    expect(find.text("Enter Password"), findsOneWidget);
    expect(find.text("Forgot Password?"), findsOneWidget);
    expect(find.byKey(const ValueKey("Forgot_Button")), findsOneWidget);
    expect(find.byKey(const ValueKey("Login_Button")), findsOneWidget);
    expect(find.text('Please enter your username'), findsNothing);
    expect(find.text('Please enter your password'), findsNothing);
  });

  testWidgets('When submit without anything give error', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.enterText(find.byKey(const ValueKey("Username_key")), "");
    await tester.enterText(find.byKey(const ValueKey("Password_key")), "");
    await tester.tap(find.byKey(const ValueKey("Login_Button")));
    await tester.pump();
    expect(find.text("Please enter your username"), findsOne);
    expect(find.text("Please enter your password"), findsOne);
  });
  testWidgets('After getting error and entering value removes error',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.enterText(find.byKey(const ValueKey("Username_key")), "");
    await tester.enterText(find.byKey(const ValueKey("Password_key")), "");
    await tester.tap(find.byKey(const ValueKey("Login_Button")));
    await tester.pump();
    expect(find.text("Please enter your username"), findsOne);
    expect(find.text("Please enter your password"), findsOne);
    await tester.enterText(find.byKey(const ValueKey("Username_key")), "asas");
    await tester.enterText(find.byKey(const ValueKey("Password_key")), "");
    await tester.tap(find.byKey(const ValueKey("Login_Button")));
    await tester.pump();
    expect(find.text("Please enter your username"), findsNothing);
    expect(find.text("Please enter your password"), findsOne);
    await tester.enterText(find.byKey(const ValueKey("Username_key")), "");
    await tester.enterText(find.byKey(const ValueKey("Password_key")), "aas");
    await tester.tap(find.byKey(const ValueKey("Login_Button")));
    await tester.pump();
    expect(find.text("Please enter your username"), findsOne);
    expect(find.text("Please enter your password"), findsNothing);
    await tester.enterText(find.byKey(const ValueKey("Username_key")), "aas");
    await tester.enterText(find.byKey(const ValueKey("Password_key")), "aas");
    await tester.tap(find.byKey(const ValueKey("Login_Button")));
    await tester.pump();
    expect(find.text("Please enter your username"), findsNothing);
    expect(find.text("Please enter your password"), findsNothing);
  });
  testWidgets('After clicking on login navigate next page', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.enterText(find.byKey(const ValueKey("Username_key")), "as");
    await tester.enterText(find.byKey(const ValueKey("Password_key")), "as");
    await tester.tap(find.byKey(const ValueKey("Login_Button")));
    await tester.pump();
    expect(find.text("Welcome to the Home Page! as"), findsNothing);
  });
}
