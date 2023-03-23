part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

 class GetTodoEvent extends TodosEvent {
  const GetTodoEvent();

  @override
  List<Object> get props => [];
}
