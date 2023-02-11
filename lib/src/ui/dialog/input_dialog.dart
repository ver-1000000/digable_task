import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:digable_task/src/constants/constants.dart';
import 'package:digable_task/src/providers.dart';

class InputDialog extends HookConsumerWidget {
  const InputDialog({super.key});
  _cancelButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('キャンセル'),
    );
  }
  _submitButton(BuildContext context, WidgetRef ref, TextEditingController controller) {
    return TextButton(
      onPressed: () async {
        await ref.read(taskRepositoryProvider).addTaskByString(controller.text);
        if (context.mounted) Navigator.of(context).pop();
      },
      child: const Text('追加'),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return AlertDialog(
      title: const Text('タスク追加'),
      content: TextField(
        decoration: const InputDecoration(hintText: 'タスクを入力してください'),
        maxLength: Constants.maxLengthOfTask,
        inputFormatters: [LengthLimitingTextInputFormatter(Constants.maxLengthOfTask)],
        controller: controller,
      ),
      actions: [
        _cancelButton(context),
        _submitButton(context, ref, controller),
      ],
    );
  }
}
