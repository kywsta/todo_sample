import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo_sample/repositories/todo_repository.dart';

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

    await future;
  }

  Future<void> toggleTodo(String id) async {
    final todoRepository = ref.watch(todoRepositoryProvider);
    await todoRepository.toggleTodo(id);

    ref.invalidateSelf();

    await future;
  }

  Future<void> updateTodo(Todo todo) async {
    final todoRepository = ref.watch(todoRepositoryProvider);
    await todoRepository.updateTodo(todo);

    ref.invalidateSelf();

    await future;
  }

  Future<void> removeTodo(String id) async {
    final todoRepository = ref.watch(todoRepositoryProvider);
    await todoRepository.removeTodo(id);

    ref.invalidateSelf();

    await future;
  }
}

enum TodoFilterType {
  all,
  active,
  completed,
}

@riverpod
class TodoFilter extends _$TodoFilter {
  @override
  TodoFilterType build() => TodoFilterType.all;

  void setFilter(TodoFilterType filter) {
    state = filter;
  }
}

@riverpod
List<Todo> filteredTodos(Ref ref) {
  final filter = ref.watch(todoFilterProvider);
  final todoList = ref.watch(todoListProvider);

  return todoList.when(
    data: (todos) {
      switch (filter) {
        case TodoFilterType.all:
          return todos;
        case TodoFilterType.active:
          return todos.where((todo) => !todo.isDone).toList();
        case TodoFilterType.completed:
          return todos.where((todo) => todo.isDone).toList();
      }
    },
    loading: () => todoList.valueOrNull ?? [],
    error: (error, stackTrace) {
      debugPrint("Error: $error");
      return [];
    },
  );
}

@riverpod
int uncompletedTodoCount(Ref ref) {
  try {
    final todoList = ref.watch(todoListProvider).requireValue;
    return todoList.where((todo) => !todo.isDone).length;
  } catch (e) {
    return 0;
  }
}
