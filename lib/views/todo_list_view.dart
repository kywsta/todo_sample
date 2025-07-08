import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_sample/models/todo.dart';

part 'todo_list_view.g.dart';

@riverpod
Todo _currentTodo(Ref ref) => throw UnimplementedError();

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodosProvider);

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        debugPrint("Building: ${todos[index].title}");

        return Dismissible(
          key: ValueKey(todos[index].id),
          onDismissed: (direction) {
            ref.read(todoListProvider.notifier).removeTodo(todos[index].id);
          },
          child: ProviderScope(
            overrides: [
              _currentTodoProvider.overrideWithValue(todos[index]),
            ],
            child: const TodoListTile(),
          ),
        );
      },
    );
  }
}

class TodoListTile extends ConsumerWidget {
  const TodoListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(_currentTodoProvider);

    debugPrint("Building List Tile: ${todo.title}");

    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
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
