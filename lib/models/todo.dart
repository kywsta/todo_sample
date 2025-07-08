import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_sample/repositories/todo_repository.dart';

part 'todo.g.dart';

@immutable
class Todo {
  final String id;
  final String title;
  final bool isDone;

  const Todo({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  Todo copyWith({
    String? id,
    String? title,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, isDone: $isDone)';
  }
}

@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<Todo>> build() async {
    final todoRepository = ref.watch(todoRepositoryProvider);
    return await todoRepository.loadTodos();
  }

  Future<void> addTodo(String title) async {
    final todoRepository = ref.watch(todoRepositoryProvider);
    await todoRepository.addTodo(title);

    ref.invalidateSelf();
  }

  Future<void> toggleTodo(String id) async {
    final todoRepository = ref.watch(todoRepositoryProvider);
    await todoRepository.toggleTodo(id);

    ref.invalidateSelf();
  }

  Future<void> updateTodo(Todo todo) async {
    final todoRepository = ref.watch(todoRepositoryProvider);
    await todoRepository.updateTodo(todo);

    ref.invalidateSelf();
  }

  Future<void> removeTodo(String id) async {
    final todoRepository = ref.watch(todoRepositoryProvider);
    await todoRepository.removeTodo(id);

    ref.invalidateSelf();
  }
}