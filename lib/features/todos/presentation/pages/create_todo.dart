// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CreateTodo extends StatelessWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(20),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Créer une tache',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(hintText: 'Entrez une tache'),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                alignment: Alignment.bottomRight,
                child:
                    ElevatedButton(onPressed: () {}, child: Text('Ajouter ')))
          ],
        ),
      ),
    );
  }
}
