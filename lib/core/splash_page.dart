// ignore_for_file: use_build_context_synchronously
import 'package:animate_do/animate_do.dart';
import 'package:chef_zaki/features/modules/presintaion/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 0.0;

  @override
  void initState() {

    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _opacity = 0.0;
        });

        Future.delayed(const Duration(seconds: 1), () {
          _moveOn();
        });
      });
    });
  }

  void _moveOn() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RecipeFormPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FadeIn(
        duration: Duration(milliseconds: 1200),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 238, 41, 41),
          ),
          child: SafeArea(
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _opacity,
                child: SizedBox(
                  width: 300,
                  height: 300,
                  // vector
                  child: Image.asset(
                    'assets/images/chef_ai_splash_robot.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
