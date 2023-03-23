// Pour analyser ces données JSON, utilisez le code suivant:
//
//     final todosModel = todosModelFromJson(jsonString);

// ignore_for_file: slash_for_doc_comments



/** 
 * Autheur : Houilindjonon Alain Wilfrred
 * Objectifs: La classe "TodosModel" a quatre attributs : userId, 
 * id, title et completed. Elle possède aussi une méthode de construction 
 * à partir d'une chaîne de caractères JSON (fromJson) 
 * et une méthode pour encoder en JSON (toJson).
 */
import 'dart:convert';
class TodosModel {
  TodosModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory TodosModel.fromRawJson(String str) =>
      TodosModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
