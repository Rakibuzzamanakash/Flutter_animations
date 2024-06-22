// import 'package:flutter/material.dart';
// import 'package:flutter_animation/Example4/person2.dart';
//
// @immutable
// class Person {
//   final String name;
//   final int age;
//   final String emoji;
//
//   const Person({
//     required this.name,
//     required this.age,
//     required this.emoji,
//   });
// }
//
// const people = [
//   Person(name: 'Rakib', age: 20, emoji: '🤵‍'),
//   Person(name: 'Akash', age: 22, emoji: '🧑🏻‍🚀'),
//   Person(name: 'Dev', age: 24, emoji: '🦹🏼‍'),
// ];
//
// class Example4 extends StatefulWidget {
//   const Example4({super.key});
//
//   @override
//   State<Example4> createState() => _Example4State();
// }
//
// class _Example4State extends State<Example4> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: const Text(
//           'Persons',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: ListView.builder(
//           itemCount: people.length,
//           itemBuilder: (context, index) {
//             final person = people[index];
//             return ListTile(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => Person2(person: person)));
//               },
//               leading: Hero(
//                   tag: person.emoji,
//                   child: Text(
//                     person.emoji,
//                     style: const TextStyle(fontSize: 30),
//                   )),
//               title: Text(
//                 person.name,
//                 style: const TextStyle(fontSize: 20),
//               ),
//               subtitle: Text(
//                 '${person.age} years old',
//                 style: const TextStyle(fontSize: 20),
//               ),
//               trailing: const Icon(Icons.arrow_back_ios),
//             );
//           }),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_animation/Example4/person2.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

const people = [
  Person(name: 'Rakib', age: 20, emoji: '🤵‍'),
  Person(name: 'Akash', age: 22, emoji: '🧑🏻‍🚀'),
  Person(name: 'Dev', age: 24, emoji: '🦹🏼‍'),
];

class Example4 extends StatefulWidget {
  const Example4({super.key});

  @override
  State<Example4> createState() => _Example4State();
}

class _Example4State extends State<Example4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Persons',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 800), // Set your duration here
                  pageBuilder: (context, animation, secondaryAnimation) => Person2(person: person),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            leading: Hero(
              tag: person.emoji,
              child: Text(
                person.emoji,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            title: Text(
              person.name,
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              '${person.age} years old',
              style: const TextStyle(fontSize: 20),
            ),
            trailing: const Icon(Icons.arrow_back_ios),
          );
        },
      ),
    );
  }
}
