import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'src/ui/page/task_page.dart';
import 'src/data/tasks.dart';
import 'src/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = TaskDatabase();

  runApp(
    ProviderScope(
      overrides: [taskDatabaseProvider.overrideWithValue(database)],
      child: const DigableTask(),
    ),
  );
}

class DigableTask extends StatelessWidget {
  const DigableTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digable Task',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
        fontFamily: 'MPLUS1'
      ),
      home: const TaskPage(),
    );
  }
}
