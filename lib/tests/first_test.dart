import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:code_test/bloc/first_test_bloc.dart';
import 'package:code_test/bloc/user_bloc.dart';
import 'package:code_test/lang.dart';
import 'package:code_test/models/first_test_model.dart';


class FirstTest extends StatefulWidget {
  const FirstTest._();

  static Widget provideRoute() {
    return BlocProvider(
      create: (_) => GetIt.instance<FirstTestBloc>(),
      child: const FirstTest._(),
    );
  }

  @override
  State<FirstTest> createState() => _FirstTestState();
}

class _FirstTestState extends State<FirstTest> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState userState) {
        final userLevel = userState.user.level;
        return Scaffold(
          appBar: AppBar(
            title: Text(currentLanguage
                .translate("yourLevel")
                .replaceAll("\${level}", "$userLevel")),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<UserBloc>().tryToLevelUp();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: BlocSelector<FirstTestBloc, FirstTestState, List<FirstTestModel>>(
            selector: (state) => state.activeData,
            builder: (BuildContext context, List<FirstTestModel> activeData) {
              if (activeData.isEmpty && context.read<FirstTestBloc>().state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (activeData.isEmpty) {
                return Center(child: Text(currentLanguage.translate("noDataAvailable")));
              }
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.green.withOpacity(0.5),
                    padding: const EdgeInsets.all(16),
                    child: Text(currentLanguage.translate("firstTestIntroduction")),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: activeData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = activeData[index];
                        return ListItemWidget(
                          key: ValueKey(data.level),
                          index: index,
                          name: data.name,
                          itemLevel: data.level,
                          userLevel: userLevel,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}


class ListItemWidget extends StatelessWidget {
  final String name;
  final int index;
  final int itemLevel;
  final int userLevel;

  const ListItemWidget({
    super.key,
    required this.name,
    required this.index,
    required this.itemLevel,
    required this.userLevel,
  });

  @override
  Widget build(BuildContext context) {
    final bool isItemLevelHigher = itemLevel > userLevel;
    final TextStyle textStyle = isItemLevelHigher
        ? const TextStyle(fontSize: 14, color: Colors.red)
        : const TextStyle(fontSize: 14);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index != 0)
          const Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: Colors.grey,
          ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "$name [Level $itemLevel]",
            style: textStyle,
          ),
        ),
      ],
    );
  }
}


extension FirstTestStateExt on FirstTestState {
  List<FirstTestModel> get activeData {
    if (data == null) return <FirstTestModel>[];
    return data!.where((element) => element.isActive).toList();
  }
}