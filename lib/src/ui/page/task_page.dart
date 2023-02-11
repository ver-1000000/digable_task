import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:digable_task/src/constants/constants.dart';
import 'package:digable_task/src/model/task_dto.dart';
import 'package:digable_task/src/ui/dialog/input_dialog.dart';
import 'package:digable_task/src/providers.dart';
import 'task_item.dart';
import 'my_app_bar.dart';

class TaskPage extends HookConsumerWidget {
  const TaskPage({super.key});
  /// ListViewのインスタンス
  _tasks2listView(BuildContext context, List<TaskDto> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) => TaskItem(
        key: ValueKey(tasks[index].id),
        taskDto: tasks[index],
      )
    );
  }
  /// FABのインスタンス
  _floatingActionButton(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const InputDialog()
        );
        return ref.refresh(taskListProvider);
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListAsync = ref.watch(taskListProvider);

    return Scaffold(
      appBar: MyAppBar(context: context, ref: ref),
      body: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(Constants.taskPagePadding),
          child: taskListAsync.when(
            error: (e, st) => Text(e.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (tasks) => _tasks2listView(context, tasks)
          ),
        )
      ),
      floatingActionButton: _floatingActionButton(context, ref)
    );
  }
}
