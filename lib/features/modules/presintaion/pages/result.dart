import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class RecipeResultPage extends StatelessWidget {
  final String recipeText;

  const RecipeResultPage({
    super.key,
    required this.recipeText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Recipe'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Markdown(
          data: recipeText,
          styleSheet: MarkdownStyleSheet(
            h1: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            h2: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            p: const TextStyle(
              fontSize: 14,
              height: 1.6,
            ),
            listBullet: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}