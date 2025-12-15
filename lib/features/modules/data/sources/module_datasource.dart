import 'dart:developer';
import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

<<<<<<< HEAD
class RecipeAiDataSource {
  final GenerativeModel model;

=======
/// ModuleDatasource handles AI generation for recipes or any module-based content.
class RecipeAiDataSource {
  final GenerativeModel model;

  /// Constructor: pass your Google AI Studio API key here
>>>>>>> 5776bc29ec24112b12fdec027c8bd4880586e646
  RecipeAiDataSource()
    : model = GenerativeModel(
        model: 'gemini-2.5-flash-lite',
        apiKey: "AIzaSyD5geDzTXHpXqG3lKqaA-qz2zlbAMT6BSk",
      );

<<<<<<< HEAD
=======
  /// Generates a cooking recipe based on the provided details
>>>>>>> 5776bc29ec24112b12fdec027c8bd4880586e646
  Future<String> generateRecipe({
    required String recipeName,
    required String country,
    required List<String> ingredients,
  }) async {
<<<<<<< HEAD
    String prompt = """
                    Create a cooking recipe.
                    - Recipe Name: $recipeName
                    - Country style: $country
                    - Available ingredients: $ingredients

                    Return in Arabic:
                    - Recipe title
                    - Ingredients with quantities
                    - Step by step instructions
                    Format everything clearly.
                    """;

    try {
      final response = await model.generateContent([
        Content.text(prompt),
      ]);

      log("Full response: $response");
      log("candidates: ${response.candidates}");
      return response.text!;
    } on SocketException catch (_) {
      log("SocketException: Check your internet connection.");
      return ' Check your internet connection.';
=======
    // Build the AI prompt
    String promptCustom = """
Create a cooking recipe.
- Recipe Name: $recipeName
- Country style: $country
- Available ingredients: $ingredients

Return in Arabic:
- Recipe title
- Ingredients with quantities
- Step by step instructions
Format everything clearly.
""";

    try {
      // Call the AI model
      final response = await model.generateContent([
        Content.text(promptCustom),
      ]);

      log("Full response: $response");
      log("Text: ${response.text}");
      return response.text!;
    } on SocketException catch (_) {
      // Network errors
      log("SocketException: Check your internet connection.");
      return '⚠️ Check your internet connection.';
>>>>>>> 5776bc29ec24112b12fdec027c8bd4880586e646
    } catch (e) {
      // Handle quota exceeded and other errors
      log("Error: $e");
      if (e.toString().contains('quota')) {
<<<<<<< HEAD
        return ' AI quota exceeded. Try again later.';
      }
      return ' Something went wrong: $e';
    }
  }
=======
        return '⚠️ AI quota exceeded. Try again later.';
      }
      return '⚠️ Something went wrong: $e';
    }
  }

  /// Optional: You can add more module-based AI functions here
  /// For example, generating summaries, tips, or variations of recipes
>>>>>>> 5776bc29ec24112b12fdec027c8bd4880586e646
}

// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_ai/firebase_ai.dart';

// class RecipeAiDataSource {
//   Future<String?> generateRecipe({
//     required String recipeName,
//     required String country,
//     required List<String> ingredients,
//   }) async {
//     try {
//       final model = FirebaseAI.googleAI().generativeModel(
//         model: 'gemini-2.5-flash-lite',
//         systemInstruction: Content("System", [
//           TextPart("Your are a Middle Eastern professional chef"),
//         ]),
//       );

//       String promptCustom = """
//           create a cooking recipe.
//           - Recipe Name: $recipeName
//           - Country style: $country
//           - Available ingredients $ingredients

//           Return in arabic:
//           - Recipe title
//           - ingredients with quantities
//           - step by step instructions
//           Format evrything clearly
//           """;
//       final GenerateContentResponse response = await model
//           .generateContent([Content.text(promptCustom)]);
//       log("Full response : $response");
//       log("Text : ${response.text}");
//       log("can : ${response.candidates}");

//       return response.text;
//     } on SocketException catch (e) {
//       log(e.toString());
//       return null;
//       // 'Ops: Check your network connection!!!'
//     }
//   }
// }
// gemini api key:  AIzaSyD5geDzTXHpXqG3lKqaA-qz2zlbAMT6BSk
