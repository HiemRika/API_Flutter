import 'package:flutter/material.dart';
import 'package:flutter_project/multitask_module/api_service.dart';
import 'package:flutter_project/multitask_module/product_model.dart';

class MultitaskScreen extends StatefulWidget {
  const MultitaskScreen({super.key});

  @override
  State<MultitaskScreen> createState() => _MultitaskScreenState();
}

class _MultitaskScreenState extends State<MultitaskScreen> {

  late Future<List<ProductModel>> _futureProductList;

  @override
  void initState() {
    super.initState();
    _futureProductList = ApiService.read();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multitask Screen"),),
      body: _buildBody(),
    );
  }

  
  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _futureProductList = ApiService.read();
        });
      },
      child: Center(
      child: FutureBuilder<List<ProductModel>>(
        future: _futureProductList,
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
                _futureProductList = ApiService.read();
              });
            },
            icon: Icon(Icons.refresh),
            label: Text("Retry"),
          ),
        ],
      ),
    );
  }

Widget _buildListView(List<ProductModel> items){
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