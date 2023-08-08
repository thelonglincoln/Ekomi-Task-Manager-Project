import '../database.dart';

class TasksTable extends SupabaseTable<TasksRow> {
  @override
  String get tableName => 'tasks';

  @override
  TasksRow createRow(Map<String, dynamic> data) => TasksRow(data);
}

class TasksRow extends SupabaseDataRow {
  TasksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TasksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get users => getField<String>('users');
  set users(String? value) => setField<String>('users', value);

  String? get body => getField<String>('body');
  set body(String? value) => setField<String>('body', value);

  bool? get isComplete => getField<bool>('isComplete');
  set isComplete(bool? value) => setField<bool>('isComplete', value);

  bool? get isImportant => getField<bool>('isImportant');
  set isImportant(bool? value) => setField<bool>('isImportant', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);
}
