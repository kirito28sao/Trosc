import 'package:flutter/material.dart';

class WeatherIcon extends StatefulWidget {
  const WeatherIcon({super.key, required this.code});

  final int code;

  @override
  State<WeatherIcon> createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration for a complete cycle
    )..repeat(reverse: true); // Repeat the animation in reverse

    _animation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.code) {
      case >= 200 && < 300:
        return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value), // Moves image up and down
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/1.png',
              width: 300,
            ));
      case >= 300 && < 400:
        return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value), // Moves image up and down
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/2.png',
              width: 300,
            ));
      case >= 500 && < 600:
        return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value), // Moves image up and down
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/3.png',
              width: 300,
            ));
      case >= 600 && < 700:
        return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value), // Moves image up and down
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/4.png',
              width: 300,
            ));
      case >= 700 && < 800:
        return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value), // Moves image up and down
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/5.png',
              width: 300,
            ));
      case == 800:
        return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value), // Moves image up and down
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/6.png',
              width: 300,
            ));
      case > 800 && <= 804:
        return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value), // Moves image up and down
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/7.png',
              width: 300,
            ));
      default:
        return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value), // Moves image up and down
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/7.png',
              width: 300,
            ));
    }
  }
}
