import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/pic1.jpg',
            width: 300,
            //color: const Color.fromARGB(255, 255, 214, 64),
          ),
          const Text(
            'Learn Flutter the fun way!!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black87, backgroundColor: Colors.grey),
            icon: const Icon(Icons.arrow_circle_right_outlined),
            label: const Text(
              'Start',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
