// Importation des packages et des fichiers nécessaires pour le projet
import 'package:flutter/material.dart'; // Importation du package Flutter Material 
import 'package:flutter_bloc/flutter_bloc.dart'; // Importation du package Flutter Bloc 
import 'features/todos/bloc/todos_bloc.dart'; // Importation du fichier TodosBloc 
import 'features/todos/data/repositories/todos_repository.dart'; // Importation du fichier TodoRepository 
import 'features/todos/presentation/pages/todos_screen.dart'; // Importation du fichier TodosScreen 

void main() {
  runApp(const MyApp()); // Exécution de l'application avec le widget MyApp comme racine
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Ce widget est la racine de votre application.
  @override
  Widget build(BuildContext context) {
    // Construction du widget MaterialApp avec un titre et un écran d'accueil
    return MaterialApp(
      title: 'Flutter Demo',
      home: MultiBlocProvider(
        // Fourniture de TodosBloc en tant que fournisseur (provider) au widget enfant
        providers: [
          BlocProvider(create: (_) => TodosBloc(TodoRepository()))],
        child: const TodosScreen()), 
    );
  }
}