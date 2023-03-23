import 'package:todoapp/features/todos/data/datasources/todo_remote_datasource.dart'; // Importation de la classe TodoRemoteDataSource pour fournir des fonctionnalités d'accès aux données distantes.
import 'package:todoapp/features/todos/data/models/todo_models.dart'; // Importation du modèle Todos

class TodoRepository {
  Future<dynamic> getTodos() async {
    // Définition d'une méthode asynchrone appelée getTodos qui récupère les données de l'API.
    try {
      List<dynamic> response = await TodoRemoteDataSource()
          .getTodos(); // Récupération des données de l'API à partir de la source de données distante et stockage dans un objet liste dynamique.

      return response
          .map((e) => TodosModel.fromJson(e))
          .toList(); // Transformation de chaque élément de la réponse en objet TodosModel et stockage dans une liste que nous renvoyons.
    } catch (e) {
      return e; // Si une exception se produit, elle est renvoyée à l'appelant.
    }
  }
}
