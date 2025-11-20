import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ScoreBar(title: 'Dart Score'),
                const SizedBox(height: 20),
                ScoreBar(title: 'Flutter Score'),
                const SizedBox(height: 20),
                ScoreBar(title: 'TypeScript Score'),
                const SizedBox(height: 20),
                ScoreBar(title: 'React Score'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreBar extends StatefulWidget {
  final String title;
  const ScoreBar({super.key, required this.title});

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  double score = 0.0;
  Color color = Colors.deepPurpleAccent[100]!;
  void increase() {
    setState(() {
      score = score == 1 ? 1 : score + 0.25;
      updateColor();
    });
  }

  void decrease() {
    setState(() {
      score = score == 0 ? 0 : score - 0.25;
      updateColor();
    });
  }

  void updateColor() {
    if (score <= 0.25) {
      color = Colors.deepPurpleAccent[400]!;
    } else if (score <= 0.5) {
      color = Colors.deepPurpleAccent[600]!;
    } else if (score <= 0.75) {
      color = Colors.deepPurpleAccent[800]!;
    } else {
      color = Colors.deepPurpleAccent[900]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.minimize, color: Colors.black),
                onPressed: decrease,
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: increase,
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 40,
            child: LinearProgressIndicator(
              value: score,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
          ),
        ],
      ),
    );
  }
}
