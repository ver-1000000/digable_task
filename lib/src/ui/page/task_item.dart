import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:digable_task/src/constants/constants.dart';
import 'package:digable_task/src/model/task_dto.dart';
import 'package:digable_task/src/providers.dart';

class TaskItem extends HookConsumerWidget {
  const TaskItem({super.key, required this.taskDto});
  final TaskDto taskDto;
  /// チェックボックスのインスタンス
  _checkbox(WidgetRef ref, ValueNotifier<bool> isChecked) {
    return Checkbox(
      value: isChecked.value,
      onChanged: (bool? value) async {
        isChecked.value = value!;
        await _deleteTask(ref);
      },
    );
  }
  /// タスクの削除
  _deleteTask(WidgetRef ref) async {
    await Future<void>.delayed(const Duration(milliseconds: Constants.durationForDelete));
    await ref.read(taskRepositoryProvider).deleteTask(taskDto.id);
    return ref.refresh(taskListProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = useState(false);

    return GestureDetector(
      onTap: () async {
        isChecked.value = !isChecked.value;
        await _deleteTask(ref);
      },
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.taskItemPadding),
            child: Row(
              children: [
                _checkbox(ref, isChecked),
                const SizedBox(width: Constants.taskSpacing),
                Text(taskDto.value),
                const Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
