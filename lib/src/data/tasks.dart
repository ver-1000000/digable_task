import 'package:drift/drift.dart';
import 'connection/connection.dart';
part 'tasks.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentId => integer().references(Tasks, #id).nullable()();
  TextColumn get value => text()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  IntColumn get order => integer().withDefault(const Constant(0))();
}

@DriftDatabase(tables: [Tasks])
class TaskDatabase extends _$TaskDatabase {
  TaskDatabase() : super(connect());

  @override
  int get schemaVersion => 1;

  Future<List<Task>> fetchTasks() {
    return (select(tasks)).get();
  }

  Future<int> addTask(String value) {
    return into(tasks).insert(TasksCompanion(value: Value(value)));
  }

  Future<void> deleteTask(int id) {
    return (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<Task>> fetchChildren(int id) {
    return (select(tasks)..where((tbl) => tbl.parentId.equals(id))).get();
  }
}
