import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000B49),
        title: const Text('Members Page'),
      ),
      body: Container(
        color: const Color(0xFF000B49),
        child: Center(
          child: Container(
            height: 500,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nomes do Integrantes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 22),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/86202893?v=4'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'João Luiz Mineiro Alves',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/43295714?v=4'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Richelle Kim Mota Bahia',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/70456452?v=4'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Celenny Cristhyne do Nascimento Sousa',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}