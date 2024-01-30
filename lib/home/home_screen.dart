import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  'Bem vindo ao aplicativo de gerenciamento de cursos e estudantes!',
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.all(12),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('1. como adicionar estudantes a um estudante',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                          'Para adicionar estudantes a um curso, vá para a página de cursos e clique no curso desejado. Em seguida, clique em algum estudante na parte inferior de pesquisa que deseja adicionar.'),
                      SizedBox(height: 30),
                      Text('2. como remover estudantes e/ou cursos',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                          'Para remover estudantes e/ou cursos, em qualquer lista nesse app, basta segurar o clique no item que deseja remover'),
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
