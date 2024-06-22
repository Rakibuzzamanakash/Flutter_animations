// import 'package:flutter/material.dart';
// import 'package:flutter_animation/Example4/example4.dart';
//
// class Person2 extends StatelessWidget {
//   final Person person;
//   const Person2({super.key, required this.person});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: Hero(
//           flightShuttleBuilder: (
//             flightContext,
//             animation,
//             flightDirection,
//             fromHeroContext,
//             toHeroContext,
//           ) {
//             switch (flightDirection) {
//               case HeroFlightDirection.push:
//                 return Material(
//                   color: Colors.transparent,
//                   child: ScaleTransition(
//                     scale: animation.drive(
//                       Tween<double>(
//                         begin: 0.0,
//                         end: 1.0,
//                       ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
//                     ),
//                     child: toHeroContext.widget,
//                   ),
//                 );
//               case HeroFlightDirection.pop:
//                 return Material(
//                   color: Colors.transparent,
//                   child: fromHeroContext.widget,
//                 );
//             }
//           },
//           tag: person.emoji,
//           child: Text(
//             person.emoji,
//             style: const TextStyle(fontSize: 30),
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               person.name,
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               '${person.age} years old',
//               style: const TextStyle(fontSize: 20),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_animation/Example4/example4.dart';

class Person2 extends StatelessWidget {
  final Person person;
  const Person2({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Hero(
          flightShuttleBuilder: (
              flightContext,
              animation,
              flightDirection,
              fromHeroContext,
              toHeroContext,
              ) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: flightDirection == HeroFlightDirection.push ? 0.0 : 1.0,
                      end: flightDirection == HeroFlightDirection.push ? 1.0 : 0.0,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                    child: flightDirection == HeroFlightDirection.push
                        ? toHeroContext.widget
                        : fromHeroContext.widget,
                  ),
                );
              },
            );
          },
          tag: person.emoji,
          child: Text(
            person.emoji,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              person.name,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${person.age} years old',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
