import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Column(children: [MyHomePage()]),
    );
  }
}

// class MyHomePageForLoop extends StatelessWidget {
//   const MyHomePageForLoop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Column(
//         children: [
//           Text("Start"),
//           for (var i = 0; i < 10; i++) Text('Item $i'), // error
//           Text("End"),
//         ],
//       ),
//     );
//   }
// }

// class MyHomePageMap extends StatelessWidget {
//   MyHomePageMap({super.key});
//   List<String> days = [
//     'Monday',
//     'Tuesday',
//     'Wednesday',
//     'Thursday',
//     'Friday',
//     'Saturday',
//     'Sunday',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Text("Start"),
//           ...days.map((day) => Text(day)).toList(),
//           Text("End"),
//         ],
//       ),
//     );
//   }
// }

// class MyHomePageWithFunctions extends StatelessWidget {
//   List<String> days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
//   Widget getLabels() {
//     return Column(children: days.map((day) => Text(day)).toList());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [Text("Start"), getLabels(), Text("End")]),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  List<String> colors = ["red", "green", "blue", "yellow", "purple"];

  List<Widget> getColorsFunction() {
    return colors.map((color) => Text(color)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Method 1 : Loop in array"),
          for (var i = 0; i < 10; i++) Text('Item $i'), // error
          Text("Method 2 : Map "),
          ...colors.map((color) => Text(color)),
          Text("Method 2 : Map "),
          ...getColorsFunction(),
          Text("End"),
        ],
      ),
    );
  }
}
