import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'data/tasks.dart';
import 'model/task_dto.dart';
import 'repository/task_repository.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
TaskDatabase taskDatabase(TaskDatabaseRef ref) {
  return TaskDatabase();
}

@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
  return TaskRepository(database: ref.read(taskDatabaseProvider));
}

@riverpod
Future<List<TaskDto>> taskList(TaskListRef ref) {
  return ref.read(taskRepositoryProvider).fetchTasks();
}
