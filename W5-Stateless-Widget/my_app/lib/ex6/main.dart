import 'dart:math';
import 'package:flutter/material.dart';

const String diceImage1 = 'assets/images/dices/dice-1.png';
const String diceImage2 = 'assets/images/dices/dice-2.png';
const String diceImage3 = 'assets/images/dices/dice-3.png';
const String diceImage4 = 'assets/images/dices/dice-4.png';
const String diceImage5 = 'assets/images/dices/dice-5.png';
const String diceImage6 = 'assets/images/dices/dice-6.png';

const diceImages = [
  diceImage1,
  diceImage2,
  diceImage3,
  diceImage4,
  diceImage5,
  diceImage6,
];

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String dice = diceImage2;

  void rollDice() {
    setState(() {
      dice = diceImages[Random().nextInt(diceImages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(dice, width: 200),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: DiceRoller()),
    ),
  ),
);
