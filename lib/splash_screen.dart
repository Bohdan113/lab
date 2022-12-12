import 'package:boichuk_lab/my_home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000)
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );
    _animationController.forward();
    Future.delayed(const Duration(seconds: 5,milliseconds: 100)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
          fullscreenDialog: true,
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizeTransition(
          sizeFactor: _animation,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_animation),
            child: const Center(
              child: Icon(
                Icons.star,
                color: Colors.black,
                size: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
