import 'package:flutter/material.dart';

import 'multitask_screen.dart';

class MultitaskApp extends StatelessWidget {
  const MultitaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultitaskScreen(),
    );
  }
}