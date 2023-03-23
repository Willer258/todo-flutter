// Importations de fichiers et packages nécessaires
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp/features/todos/data/models/todo_models.dart';
import '../data/repositories/todos_repository.dart';

part 'todos_event.dart'; // Importer le fichier d'événements
part 'todos_state.dart'; //Importer le fichier d'état

/**
 * Auteur : Houinlindjonon Alain Wilfried
 *  Le but est de récupérer la liste des tâches à effectuer.
 */

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoRepository todoRepository;
  // Création d'un bloc appelé TodosBloc qui étend la classe Bloc avec des types génériques TodosEvent et TodosState
  TodosBloc(this.todoRepository) : super(GetTodosInitialState()) {
    // Constructeur qui initialise l'état initial de l'application sur GetTodosInitialState()
    on<GetTodoEvent>((event, emit) async {
      // Ecoute les événements de type GetTodoEvent qui sont définis dans le fichier TodosEvent
      emit(GetTodosLoadingState());
      try {
        final List<TodosModel>? todos = await todoRepository
            .getTodos(); // Appel de la méthode getTodos du repository pour obtenir la liste des tâches
        emit(GetTodosSuccessState(
            todos:
                todos)); // Mettre à jour l'état sur GetTodosSuccessState avec la liste de tâches obtenue
      } catch (e) {
        emit(GetTodosErrorState(
            'erreur de requête')); // Si une erreur survient lors de l'appel, mettez à jour l'état sur GetTodosErrorState
      }
    });
  }
}
