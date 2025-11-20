import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          Favorite(title: 'First Card', description: 'This is the first card'),
          Favorite(
            title: 'Second Card',
            description: 'This is the second card',
          ),
          Favorite(title: 'Third Card', description: 'This is the third card'),
        ],
      ),
    ),
  ),
);

class Favorite extends StatefulWidget {
  final String title;
  final String description;

  const Favorite({super.key, required this.title, required this.description});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isFav = false;
  late String title;
  late String description;
  @override
  void initState() {
    super.initState();
    title = widget.title;
    description = widget.description;
  }

  void toggleFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
            onPressed: () => toggleFav(),
            icon: isFav
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
