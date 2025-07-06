import 'package:flutter/material.dart';
import 'package:flutter_project/readgame_module/api_service.dart';
import 'package:flutter_project/readgame_module/read_game.dart';

class ReadgameScreen extends StatefulWidget {
  const ReadgameScreen({super.key});

  @override
  State<ReadgameScreen> createState() => _ReadgameScreenState();
}

class _ReadgameScreenState extends State<ReadgameScreen> {

  late Future<List<Readgame>> _futureReadgameList;

  @override
  void initState() {
    super.initState();
    _futureReadgameList = ApiService.read();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ReadGame Screen"),),
      body: _buildBody(),
    );
  }

  
  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _futureReadgameList = ApiService.read();
        });
      },
      child: Center(
      child: FutureBuilder<List<Readgame>>(
        future: _futureReadgameList,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return _buildError(snapshot.error);
          }

          if(snapshot.connectionState == ConnectionState.done){
            return _buildListView(snapshot.data ?? []);
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
      ),
    );
  }

  Widget _buildError(Object? error) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error),
          Text(error.toString()),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _futureReadgameList = ApiService.read();
              });
            },
            icon: Icon(Icons.refresh),
            label: Text("Retry"),
          ),
        ],
      ),
    );
  }

Widget _buildListView(List<Readgame> items){
  return ListView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: items.length,
    itemBuilder: (context, index){
      final item = items[index];
      return Card(
        child: ListTile(
          title: Text(item.title),
          subtitle: Image.network(item.image),
        ),
      );
    },
  );
}

}