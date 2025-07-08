import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/todo.dart';

class TodoFilterBar extends ConsumerWidget {
  const TodoFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uncompletedTodoCount = ref.watch(uncompletedTodoCountProvider);

    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildUncompletedTodoCount(uncompletedTodoCount),
            ),
            _buildFilterButtons(ref),
          ],
        ),
      ),
    );
  }

  Widget _buildUncompletedTodoCount(int count) {
    return Text(
      "$count ${count == 1 ? "item" : "items"} left",
    );
  }

  Widget _buildFilterButtons(WidgetRef ref) {
    final filter = ref.watch(todoFilterProvider);

    return ToggleButtons(
      onPressed: (int index) {
        ref.read(todoFilterProvider.notifier).setFilter(
              TodoFilterType.values[index],
            );
      },
      isSelected: [
        filter == TodoFilterType.all,
        filter == TodoFilterType.active,
        filter == TodoFilterType.completed,
      ],
      children:
          TodoFilterType.values.map((e) => _buildFilterButton(ref, e)).toList(),
    );
  }

  Widget _buildFilterButton(WidgetRef ref, TodoFilterType filter) {
    return TextButton(
      onPressed: () => ref.read(todoFilterProvider.notifier).setFilter(filter),
      child: Text(filter.name),
    );
  }
}
