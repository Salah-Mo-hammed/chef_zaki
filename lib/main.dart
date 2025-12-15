import 'package:chef_zaki/core/splash_page.dart';
import 'package:chef_zaki/dependency_injection.dart';
import 'package:chef_zaki/features/modules/presintaion/bloc/recipe_bloc.dart';
import 'package:chef_zaki/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initialaizedDependencies();

  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RecipeBloc>(),
      child: MaterialApp(home: Scaffold(body: const SplashPage())),
    );
  }
}
