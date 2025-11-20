import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    // to hide the demo banner at the top right
    home: ImageWidget(),
  ),
);

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  int index = 0;
  void forward() {
    setState(() {
      index = images.length - 1 == index ? 0 : index + 1;
    });
  }

  void backward() {
    setState(() {
      index = index == 0 ? images.length - 1 : index - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: backward,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: forward,
            ),
          ),
        ],
      ),
      body: Image.asset(images[index]),
    );
  }
}
