import 'package:flutter/material.dart';

import 'package:dice_roller/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 255,156,124),
          Color.fromARGB(255, 255,124,122),
        ),
      ),
    ),
  );
}
