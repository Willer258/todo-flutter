// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/todos/bloc/todos_bloc.dart';

import 'create_todo.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {

  // Mettre à jour l'état lors de l'initialisation du widget
  @override
  void initState() {
    BlocProvider.of<TodosBloc>(context).add(const GetTodoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Créer un Scaffold qui contient des boutons flottants, une barre d'applications et un corp
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await showModalBottomSheet<String>(
            context: context,
            builder: (context) => CreateTodo(),
          );
        },
        label: const Text('Ajouter une tache'),
        icon: const Icon(Icons.task),
      ),
      appBar: AppBar(
        title: const Text('TodoList'),
      ),

      // Utiliser BlocBuilder pour récupérer les états et construire l'affichage en fonction
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is GetTodosLoadingState) { // Afficher un widget de chargement lors du chargement des données
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetTodosErrorState) { // Afficher un message d'erreur en cas d'erreur de chargement des données
            return Center(
              child: Text(state.message),
            );
          } else if (state is GetTodosSuccessState) { // Afficher les tâches si le chargement des données est réussi
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.todos!.length,
              itemBuilder: (context, index) => ListTile(
                  trailing: PopupButton(),
                  title: Text(state.todos![index].title),
                  leading: Checkbox(
                    onChanged: (value) => true,
                    value: state.todos![index].completed,
                  )),
            );
          }
          // Si il n'y a aucun état correspondant retourner un Container vide
          return Container();
        },
      ),
    );
  }
}

// Widget de menu contextuel affiché lorsqu'on appui longuement sur un élément de la liste
class PopupButton extends StatelessWidget {
  const PopupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Retourne un PopupMenuButton avec deux options de menu contextuel (modifier ou supprimer)
    return PopupMenuButton(
        itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                onTap: null,
                child: Row(
                  children: const [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Modifier'),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: null,
                child: Row(
                  children: const [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Supprimer'),
                  ],
                ),
              ),
            ]);
  }
}