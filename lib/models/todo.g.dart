// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTodosHash() => r'c7c787733cd7b9bba5bc6fe9b83c603d003d3305';

/// See also [filteredTodos].
@ProviderFor(filteredTodos)
final filteredTodosProvider = AutoDisposeProvider<List<Todo>>.internal(
  filteredTodos,
  name: r'filteredTodosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTodosRef = AutoDisposeProviderRef<List<Todo>>;
String _$uncompletedTodoCountHash() =>
    r'0bbc6d2ae337d1a2d8a9d985aa16dff219fe5033';

/// See also [uncompletedTodoCount].
@ProviderFor(uncompletedTodoCount)
final uncompletedTodoCountProvider = AutoDisposeProvider<int>.internal(
  uncompletedTodoCount,
  name: r'uncompletedTodoCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$uncompletedTodoCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UncompletedTodoCountRef = AutoDisposeProviderRef<int>;
String _$todoListHash() => r'8b09806b52c797a9b16f99a1529652a7bf202fc8';

/// See also [TodoList].
@ProviderFor(TodoList)
final todoListProvider =
    AutoDisposeAsyncNotifierProvider<TodoList, List<Todo>>.internal(
  TodoList.new,
  name: r'todoListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoList = AutoDisposeAsyncNotifier<List<Todo>>;
String _$todoFilterHash() => r'5f0cdc551bbe982c8b5beede77de3fa2dde4e9d9';

/// See also [TodoFilter].
@ProviderFor(TodoFilter)
final todoFilterProvider =
    AutoDisposeNotifierProvider<TodoFilter, TodoFilterType>.internal(
  TodoFilter.new,
  name: r'todoFilterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoFilter = AutoDisposeNotifier<TodoFilterType>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
