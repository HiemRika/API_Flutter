import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_logic.dart';
import 'state_app.dart';


Widget stateProvider() {
  return MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => CounterLogic())],
    child: StateApp(),
  );
}
