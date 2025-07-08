import 'package:todo_sample/models/todo.dart';
import 'package:todo_sample/repositories/todo_repository.dart';
import 'package:uuid/uuid.dart';

class InMemoryTodoRepository extends TodoRepository {
  final List<Todo> _todos = [];

  InMemoryTodoRepository() {
    _todos.add(Todo(id: "1", title: "Todo 1"));
    _todos.add(Todo(id: "2", title: "Todo 2"));
    _todos.add(Todo(id: "3", title: "Todo 3"));
  }

  @override
  Future<List<Todo>> loadTodos() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _todos;
  }

  @override
  Future<void> addTodo(String title) async {
    final id = Uuid().v4();

    await Future.delayed(const Duration(milliseconds: 500));
    _todos.add(Todo(id: id, title: title));
  }

  @override
  Future<void> toggleTodo(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _todos.indexWhere((element) => element.id == id);
    if (index != -1) {
      final todo = _todos[index].copyWith(isDone: !_todos[index].isDone);
      _todos[index] = todo;
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _todos.indexWhere((element) => element.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
    }
  }

  @override
  Future<void> removeTodo(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _todos.removeWhere((element) => element.id == id);
  }
}
