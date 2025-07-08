import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_sample/app_env.dart';
import 'package:riverpod_todo_sample/models/todo.dart';
import 'package:riverpod_todo_sample/repositories/in_memory_todo_repository.dart';

part 'todo_repository.g.dart';

abstract class TodoRepository {
  Future<List<Todo>> loadTodos();
  Future<void> addTodo(String title);
  Future<void> toggleTodo(String id);
  Future<void> updateTodo(Todo todo);
  Future<void> removeTodo(String id);
}

@riverpod
TodoRepository todoRepository(Ref ref) {
  final appEnv = ref.watch(appEnvProvider);
  switch (appEnv) {
    case AppEnv.demo:
      return InMemoryTodoRepository();
    case AppEnv.dev:
      return InMemoryTodoRepository();
  }
}
