import 'package:chef_zaki/features/modules/data/repos_impl/recipe_repo_impl.dart';
import 'package:chef_zaki/features/modules/data/sources/module_datasource.dart';
import 'package:chef_zaki/features/modules/domain/repositories/recipe_repo.dart';
import 'package:chef_zaki/features/modules/domain/usecases/generate_recipe_usecase.dart';
import 'package:chef_zaki/features/modules/presintaion/bloc/recipe_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;
Future<void> initialaizedDependencies() async {
  //! data-dataSource
  sl.registerSingleton<RecipeAiDataSource>(RecipeAiDataSource());

  //! domain-repo but inside it repo impl
  sl.registerSingleton<RecipeRepo>(
    RecipeRepoImpl(recipeAiDataSource: sl<RecipeAiDataSource>()),
  );
  //! domain-usecases

  sl.registerSingleton<GenerateRecipeUsecase>(
    GenerateRecipeUsecase(recipeRepo: sl<RecipeRepo>()),
  );
  //! blocs
  sl.registerFactory<RecipeBloc>(
    () => RecipeBloc(
      generateRecipeUsecase: sl<GenerateRecipeUsecase>(),
    ),
  );
}
