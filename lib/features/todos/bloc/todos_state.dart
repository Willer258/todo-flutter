// ignore_for_file: prefer_const_constructors_in_immutables

part of 'todos_bloc.dart';

/**
 * Autheur : Houinlindjonon Alain Wilfried
 * Desciption de la classe: Concevoir les state pour le todo
 */
abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class GetTodosInitialState extends TodosState {}

class GetTodosLoadingState extends TodosState {}

class GetTodosErrorState extends TodosState {
  late final String message;
  GetTodosErrorState(this.message);
}

class GetTodosSuccessState extends TodosState {
  late final List<TodosModel>? todos;

  GetTodosSuccessState({required this.todos});

  GetTodosSuccessState copyWith({List<TodosModel>? todos}) {
    return GetTodosSuccessState(
      todos: todos ?? this.todos,
    );
  }
}
