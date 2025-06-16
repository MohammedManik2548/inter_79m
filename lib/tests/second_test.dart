import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:code_test/lang.dart';
import 'package:code_test/bloc/second_test_bloc.dart';
import 'package:code_test/bloc/second_test_event.dart';
import 'package:code_test/bloc/second_test_state.dart';

class SecondTest extends StatefulWidget {
  const SecondTest._();

  static Widget provideRoute() {
    return const SecondTest._();
  }

  @override
  State<SecondTest> createState() => _SecondTestState();
}

class _SecondTestState extends State<SecondTest> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<SecondTestBloc>().add(const LoadSecondTestData());
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<SecondTestBloc>().add(const LoadSecondTestData(isInitialLoad: false));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 200);
  }

  Future<void> _onRefresh() async {
    context.read<SecondTestBloc>().add(const LoadSecondTestData(isRefresh: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentLanguage.translate("secondTest")),
      ),
      body: BlocBuilder<SecondTestBloc, SecondTestState>(
        builder: (context, state) {
          if (state.status == SecondTestStatus.loading && state.items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == SecondTestStatus.failure) {
            return Center(
              child: Text(
                'Error: ${state.errorMessage ?? 'Unknown error'}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final items = state.activeDisplayData;

          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.separated(
              controller: _scrollController,
              itemCount: items.length + (state.hasReachedMax ? 0 : 1),
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                if (index >= items.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final item = items[index];
                return ListTile(
                  leading: CircleAvatar(
                      child: Text('${index + 1}'),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.id),
                  trailing: Icon(
                    item.isActive ? Icons.check_circle : Icons.cancel,
                    color: item.isActive ? Colors.green : Colors.red,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
