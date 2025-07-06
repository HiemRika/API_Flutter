import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_logic.dart';

class StateDetailScreen extends StatefulWidget {
  StateDetailScreen(counter);

  //const StateDetailScreen({super.key});

  // int number;

  // StateDetailScreen(this.number);

  @override
  State<StateDetailScreen> createState() => _StateDetailScreenState();
}

class _StateDetailScreenState extends State<StateDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Home Screen"),
        backgroundColor: Colors.amber,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: (){
              // setState(() {
              //   this.widget.number--;
              // });
              context.read<CounterLogic>().decrease();
            }, icon: Icon(Icons.remove)),
            IconButton(
            onPressed: (){
              // setState(() {
              //   this.widget.number++;
              // });
              context.read<CounterLogic>().increase();
            }, icon: Icon(Icons.add)),
            Text(
              "counter: ${context.watch<CounterLogic>().counter}",
            style: TextStyle(fontSize: 20 ),
            ),
        ],
    ),
    );
  }

}