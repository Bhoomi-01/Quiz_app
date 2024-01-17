import 'package:flutter/material.dart';

class AnswersButton extends StatelessWidget {
  const AnswersButton(
      {super.key, required this.answertext, required this.onTap});

  final String answertext;
  final void Function() onTap;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          backgroundColor: Colors.lightBlue.shade50,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          answertext,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
