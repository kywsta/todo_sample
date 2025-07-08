import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_sample/models/todo.dart';

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
          Expanded(child: _buildTodoList()),
        ],
      ),
    );
  }

  Widget _buildTodoInput() {
    return TextFormField(
      controller: _textEditingController,
      onFieldSubmitted: (value) => _addTodo(),
      decoration: InputDecoration(
        hintText: "What needs to be done?",
      ),
    );
  }

  Widget _buildTodoList() {
    return TodoList();
  }

  void _addTodo() {
    final todoList = ref.read(todoListProvider.notifier);
    todoList.addTodo(_textEditingController.text);
    _textEditingController.clear();
  }
}

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return todoList.when(
      data: (todos) => ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          debugPrint("Building: ${todos[index].title}");
          return Text(todos[index].title);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          Center(child: Text("Oops! Something went wrong.")),
    );
  }
}
