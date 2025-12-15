import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chef_zaki/features/modules/domain/usecases/generate_recipe_usecase.dart';
import 'package:chef_zaki/features/modules/presintaion/bloc/recipe_event.dart';
import 'package:chef_zaki/features/modules/presintaion/bloc/recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final GenerateRecipeUsecase generateRecipeUsecase;
  RecipeBloc({required this.generateRecipeUsecase})
    : super(RecipeStateInitial()) {
    on<generateRecipeEvent>(_onGenerateRecipe);
  }

  FutureOr<void> _onGenerateRecipe(
    generateRecipeEvent event,
    Emitter<RecipeState> emit,
  ) async {
    emit(RecipeStateLoading());
    try {
      final result = await generateRecipeUsecase.call(
        event.recipeRequest,
      );
      emit(RecipeStateSuccess(recipe: result ?? "it success , but no result"));
    } catch (e) {
      emit(RecipeStateError(errorMessage: "failed ${e.toString()}"));
    }
  }
}
