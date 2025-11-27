import 'package:flutter/material.dart';
import 'package:my_app/ex4/data/jokes.dart';

Color appColor = const Color.fromARGB(255, 85, 41, 245) as Color;

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: FavoriteCardsContainer(),
    ),
  ),
);

class FavoriteCardsContainer extends StatefulWidget {
  const FavoriteCardsContainer({super.key});
  @override
  State<FavoriteCardsContainer> createState() => _FavoriteCardsContainerState();
}

class _FavoriteCardsContainerState extends State<FavoriteCardsContainer> {
  void handleFavoriteClick(int id) {
    // only one card should be favorite at a time
    setState(() {
      for (var joke in jokes) {
        joke.isFavorite = false;
      }
      var joke = jokes.firstWhere((joke) => joke.id == id);
      joke.isFavorite = !joke.isFavorite!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...jokes.map(
          (joke) => FavoriteCard(
            id: joke.id,
            title: joke.title,
            description: joke.description,
            // can just use joke object id without passing the id but just wanna try
            onFavoriteClick: (id) => handleFavoriteClick(id),
            isFavorite: joke.isFavorite!,
          ),
        ),
      ],
    );
  }
}

class FavoriteCard extends StatefulWidget {
  // added  more arguments to the constructor
  const FavoriteCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.onFavoriteClick,
    required this.isFavorite,
  });
  final int id;
  final String title;
  final String description;
  // can just use joke object id without passing the id but just wanna try
  final Function(int) onFavoriteClick;
  final bool isFavorite;
  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(widget.description),
              ],
            ),
          ),
          IconButton(
            onPressed: () => widget.onFavoriteClick(widget.id),
            icon: Icon(
              widget.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
