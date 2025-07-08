import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_sample/models/todo.dart';
import 'package:riverpod_todo_sample/views/todo_filter_bar.dart';
import 'package:riverpod_todo_sample/views/todo_list_view.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Column(
        children: [
          _buildTodoInput(),
          _buildTodoFilterBar(),
          Expanded(child: _buildTodoList()),
        ],
      ),
    );
  }

  Widget _buildTodoInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: _textEditingController,
        onFieldSubmitted: (value) => _addTodo(),
        decoration: InputDecoration(
          hintText: "What needs to be done?",
        ),
      ),
    );
  }

  Widget _buildTodoFilterBar() {
    return const TodoFilterBar();
  }

  Widget _buildTodoList() {
    return const TodoListView();
  }

  void _addTodo() {
    final todoList = ref.read(todoListProvider.notifier);
    todoList.addTodo(_textEditingController.text);
    _textEditingController.clear();
  }
}
