import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:code_test/bloc/user_bloc.dart';
import 'package:code_test/lang.dart';
import 'package:code_test/sl_initializer.dart';
import 'package:code_test/tests/first_test.dart';
import 'package:code_test/tests/fourth_test.dart';
import 'package:code_test/tests/second_test.dart';
import 'package:code_test/tests/third_test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SLInitializer.init(GetIt.instance);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter code test'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                currentLanguage.translate("buttonIntroduction"),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return FirstTest.provideRoute();
                      },
                    ),
                  );
                },
                child: Text(currentLanguage.translate("firstTest")),
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      maximumSize: MaterialStatePropertyAll(Size(150, 48)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SecondTest.provideRoute();
                          },
                        ),
                      );
                    },
                    child: Center(
                      child: Text(currentLanguage.translate("secondTest")),
                    ),
                  ),
                  Visibility(
                    visible: state.user.level < 3,
                      child: Opacity(opacity: (state.user.level < 3) ? 1 : 0, child: const RequirementPlate(level: 3)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ThirdTest.provideRoute();
                      },
                    ),
                  );
                },
                child: Text(currentLanguage.translate("thirdTest")),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return FourthTest.provideRoute();
                      },
                    ),
                  );
                },
                child: Text(currentLanguage.translate("fourthTest")),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        currentLanguage
                            .translate("floatingButtonDescription")
                            .replaceAll("\${level}", "${state.user.level}"),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentLanguage = SupportedLanguage.english;
                              });
                            },
                            child: Text(currentLanguage.translate("english")),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentLanguage = SupportedLanguage.bengali;
                              });
                            },
                            child: Text(currentLanguage.translate("Bengali")),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<UserBloc>().tryToLevelUp();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class RequirementPlate extends StatelessWidget {
  final int level;

  const RequirementPlate({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.red.shade100,
      ),
      alignment: Alignment.center,
      width: 150,
      height: 48,
      child: Text(currentLanguage.translate("availableOnDescription").replaceAll("\${level}", "$level")),
    );
  }
}
