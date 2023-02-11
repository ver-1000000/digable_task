import 'package:digable_task/src/data/tasks.dart';
import 'package:digable_task/src/model/task_dto.dart';

class TaskRepository {
  const TaskRepository({required this.database});
  final TaskDatabase database;

  Future<List<TaskDto>> fetchTasks() async {
    final tasks = await database.fetchTasks();
    taskToDto(Task task) => TaskDto(
      id: task.id,
      parentId: task.parentId,
      value: task.value,
      completed: task.completed,
      order: task.order);
    return tasks.map(taskToDto).toList();
  }

  Future<void> addTaskByString(String text) {
    return database.addTask(text);
  }

  Future<void> deleteTask(int id) {
    return database.deleteTask(id);
  }
}
