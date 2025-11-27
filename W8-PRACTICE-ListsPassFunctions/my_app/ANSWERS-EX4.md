What type of data will store the jokes? What type of data will store the favorite joke?
Which widget should be in charge of storing the favorite joke?
Which widget should be stateful?
How will your widget interact?
Do you need to pass callback function between widgets?

the jokes live in a simple list of `jokes` objects so the data type is a `List<Jokes>`  
the favorite joke is just the bool flag on each `Jokes` item (`isFavorite`) so we store fav state on that model  
`favorite_cards_container` handles which joke is favorite since it owns the full list  
that container stays stateful because it toggles favorites, the individual cards can stay dumb  
cards just get data + callback, tell the parent when their heart gets tapped, parent flips state and rebuilds  
yes we pass a callback (`onFavoriteClick`) down so taps bubble back up
