// Ce fichier contient une classe TodoRemoteDataSource qui récupère les données depuis 
// une source distante HTTP en utilisant l'API http pour effectuer une requête get.
//
// L'URL de la source de données se trouve dans la constante AppConstant.urlEndPoint.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todoapp/core/utils/app_constant.dart';

class TodoRemoteDataSource {
  
  // Cette méthode effectue une requête HTTP avec l'url de l'API
  // Et traite la réponse pour renvoyer un objet JSON représentant les todos
  Future getTodos() async {
    try {
      final response = await http.get(Uri.parse('${AppConstant.urlEndPoint}/todos'));
      return json.decode(response.body);
    } catch (e) {
      return e;
    }
  }
}