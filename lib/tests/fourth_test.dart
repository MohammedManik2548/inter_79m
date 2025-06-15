import 'package:flutter/material.dart';
import 'package:code_test/lang.dart';

class FourthTest extends StatefulWidget {
  const FourthTest._();

  static Widget provideRoute() {
    return const FourthTest._();
  }

  @override
  State<FourthTest> createState() => _FourthTestState();
}

class _FourthTestState extends State<FourthTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentLanguage.translate("fourthTest")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            currentLanguage.translate("fourthTestIntroduction"),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
