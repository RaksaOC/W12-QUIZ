import 'package:flutter/material.dart';
import 'package:quiz_app/ui/quiz_app.dart';
import 'package:quiz_app/ui/widgets/menu_button.dart';

class WelcomeScreen extends StatelessWidget {
  final List<Pages> pages;
  final Function(String) onItemSelected;

  const WelcomeScreen({
    super.key,
    required this.onItemSelected,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            spacing: 10,
            children: pages
                .map(
                  (page) => MenuButton(
                    page: page,
                    onPressed: (pageId) => onItemSelected(pageId),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
