import 'package:flutter/material.dart';
// import 'package:flutter_project/basic_module/basic_provider.dart';
// import 'package:flutter_project/multitask_module/multitask_app.dart';
// import 'package:flutter_project/multitask_module/multitask_provider.dart';
// import 'package:flutter_project/readgame_module/readgame_app.dart';
// import 'package:flutter_project/readgame_module/readgame_provider.dart';
// import 'package:flutter_project/state_module/state_app.dart';
// import 'package:flutter_project/state_module/state_provider.dart';
import 'package:flutter_project/student_module/student_app.dart';
import 'package:flutter_project/student_module/student_provider.dart';
import 'package:provider/provider.dart';
// import 'basic_module/basic_app.dart';
void main(){
  //runApp(Container(color: Colors.yellow));
  runApp(studentProvider());
}
