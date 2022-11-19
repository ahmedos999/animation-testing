import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Animetest(),
    );
  }
}

class Animetest extends StatefulWidget {
  const Animetest({super.key});

  @override
  State<Animetest> createState() => _AnimetestState();
}

class _AnimetestState extends State<Animetest> {
  double _size = 50;
  double _sliderValue = 0.0;
  double _endValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: _endValue),
                duration: const Duration(milliseconds: 500),
                builder: (_, double angle, __) {
                  return Transform.rotate(
                    angle: angle,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: _size,
                      height: _size,
                      color: Colors.red,
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Slider.adaptive(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                  _endValue = value * 3.14;
                  print(value);
                });
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        setState(() {
          _size = _size * 2;
        });
      })),
    );
  }
}
