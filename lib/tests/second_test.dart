import 'package:flutter/material.dart';
import 'package:code_test/lang.dart';

class SecondTest extends StatefulWidget {
  const SecondTest._();

  static Widget provideRoute() {
    return const SecondTest._();
  }

  @override
  State<SecondTest> createState() => _SecondTestState();
}

class _SecondTestState extends State<SecondTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentLanguage.translate("secondTest")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            currentLanguage.translate("secondTestIntroduction"),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
