import 'package:chef_zaki/core/common/common_widgets.dart';
import 'package:chef_zaki/features/modules/domain/entities/recipe_request.dart';
import 'package:chef_zaki/features/modules/presintaion/bloc/recipe_bloc.dart';
import 'package:chef_zaki/features/modules/presintaion/bloc/recipe_event.dart';
import 'package:chef_zaki/features/modules/presintaion/bloc/recipe_state.dart';
import 'package:chef_zaki/features/modules/presintaion/pages/result_page.dart';
import 'package:chef_zaki/features/modules/presintaion/widgets/dynamic_list_Input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeFormPage extends StatefulWidget {
  const RecipeFormPage({super.key});

  @override
  State<RecipeFormPage> createState() => _RecipeFormPageState();
}

class _RecipeFormPageState extends State<RecipeFormPage> {
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final List<String> _ingredients = [];

  void _addTo(String value) {
    if (value.isEmpty || _ingredients.contains(value)) return;
    setState(() => _ingredients.add(value));
  }

  void _removeFrom(String value) {
    setState(() => _ingredients.remove(value));
  }

  @override
  void dispose() {
    _foodController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Recipe')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppText(
              text: "What are we gonna make today",
              size: 15,
              color: Colors.black,
              weight: FontWeight.bold,
            ),
            const SizedBox(height: 20),

            CommonAppIconTextField(
              icon: Icons.restaurant_menu,
              label: "Food name",
              controller: _foodController,
            ),

            const SizedBox(height: 20),
            CommonAppText(
              text: "Based on which country?",
              size: 15,
              color: Colors.black,
              weight: FontWeight.bold,
            ),
            const SizedBox(height: 20),

            CommonAppIconTextField(
              icon: Icons.flag,
              label: "Country",
              controller: _countryController,
            ),

            const SizedBox(height: 20),
            DynamicListInput(
              title: 'Ingredients',
              hint: 'Enter ingredient',
              items: _ingredients,
              onAdd: _addTo,
              onRemove: _removeFrom,
            ),

            const SizedBox(height: 30),

            /// ⬇ هنا الربط مع BLoC
            BlocConsumer<RecipeBloc, RecipeState>(
              listener: (context, state) {
                if (state is RecipeStateSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          RecipeResultPage(recipeText: state.recipe),
                    ),
                  );
                } else if (state is RecipeStateError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state is RecipeStateLoading
                      ? null
                      : () {
                        RecipeRequest  recipeRequest=RecipeRequest(recipeType: _foodController.text, country: _countryController.text, availableIngredients: _ingredients);
                          context.read<RecipeBloc>().add(
                                generateRecipeEvent(
                         recipeRequest: recipeRequest
                                ),
                              );
                        },
                  child: state is RecipeStateLoading
                      ? const CircularProgressIndicator()
                      : const Text('Continue'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:chef_zaki/core/common/common_widgets.dart';
// import 'package:chef_zaki/features/modules/presintaion/widgets/dynamic_list_Input_widget.dart';
// import 'package:flutter/material.dart';

// // *****************************
// // *****************************
// class RecipeFormPage extends StatefulWidget {
//   const RecipeFormPage({super.key});

//   @override
//   State<RecipeFormPage> createState() => _RecipeFormPageState();
// }

// class _RecipeFormPageState extends State<RecipeFormPage> {
//   final List<String> _ingredients = [];

//   void _addTo(List<String> list, String value) {
//     if (value.isEmpty || list.contains(value)) return;
//     setState(() => list.add(value));
//   }

//   void _removeFrom(List<String> list, String value) {
//     setState(() => list.remove(value));
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _foodController = TextEditingController();
//     TextEditingController _countryController =
//         TextEditingController();

//     return Scaffold(
//       appBar: AppBar(title: const Text('Create Recipe')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CommonAppText(
//               text: "What are we gonna make today",
//               size: 15,
//               color: Colors.black,
//               weight: FontWeight.bold,
//             ),
//             SizedBox(height: 20),
//             CommonAppIconTextField(
//               icon: Icons.cookie,
//               label: "food Name",
//               controller: _foodController,
//               iconColor: Colors.black,
//               labelColor: Colors.black,
//             ),

//             SizedBox(height: 20),
//             CommonAppText(
//               text: "based on what contry",
//               size: 15,
//               color: Colors.black,
//               weight: FontWeight.bold,
//             ),
//             SizedBox(height: 20),
//             CommonAppIconTextField(
//               icon: Icons.cookie,
//               label: "Country",
//               controller: _countryController,
//               iconColor: Colors.black,
//               labelColor: Colors.black,
//             ),
//             DynamicListInput(
//               title: 'Ingredients',
//               hint: 'Enter ingredient',
//               items: _ingredients,
//               onAdd: (value) => _addTo(_ingredients, value),
//               onRemove: (value) => _removeFrom(_ingredients, value),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {
//                 debugPrint('food name: ${_foodController.text}');
//                 debugPrint('Country: ${_countryController.text}');

//                 debugPrint('Ingredients: $_ingredients');
//               },
//               child: const Text('Continue'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
