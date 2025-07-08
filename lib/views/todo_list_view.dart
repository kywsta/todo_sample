import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sample/models/todo.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return todoList.when(
      data: (todos) => ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          debugPrint("Building: ${todos[index].title}");

          return Dismissible(
            key: ValueKey(todos[index].id),
            child: TodoListTile(todo: todos[index]),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          Center(child: Text("Oops! Something went wrong.")),
    );
  }
}

class TodoListTile extends ConsumerWidget {
  final Todo todo;

  const TodoListTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Building List Tile: ${todo.title}");

    return Material(
      child: ListTile(
        title: Text(todo.title),
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (value) =>
              ref.read(todoListProvider.notifier).toggleTodo(todo.id),
        ),
      ),
    );
  }
}
