import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_logic.dart';
import 'state_detail_screen.dart';


class StateHomeScreen extends StatefulWidget {
  const StateHomeScreen({super.key});

  @override
  State<StateHomeScreen> createState() => _StateHomeScreenState();
}

class _StateHomeScreenState extends State<StateHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Home Screen"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context)=> StateDetailScreen(CounterLogic),
                  ),
              );
            },
            icon: Icon(Icons.settings),
             ),
        ],
      ),
      body: _buildBody(),
    );
  }
// int _counter = 0;

Widget _buildBody(){

  int counter = context.watch<CounterLogic>().counter;

  return SingleChildScrollView(
    child: Column(
      children: [
        IconButton(
          onPressed: () {
            // setState(() {
            //   _counter--;
            // });
            context.read<CounterLogic>().decrease();
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            // setState(() {
            //   _counter++;
            // });
            context.read<CounterLogic>().increase();
          },
          icon: Icon(Icons.add),
        ),
        Text("lorem aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 
        style: TextStyle(fontSize: 20)),

      ],
    ),
  );
}

}