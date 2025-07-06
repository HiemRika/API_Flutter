import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/basic_module/detail_screen.dart';
import '../basic_module/photo_constant.dart';

class FbScreen extends StatefulWidget {
  const FbScreen({super.key});

  @override
  State<FbScreen> createState() => _FbScreenState();
}

class _FbScreenState extends State<FbScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody()
    );
  }
  AppBar _buildAppBar(){
    return AppBar(
      centerTitle: true,
      title: Text("Movie 247 App"),
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
    );
  }
  
  Widget _buildBody(){
    return _buildMainListView();
  }

  Widget _buildMainListView(){
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _buildActorListView(),
        _buildImageListView(),
        _buildCircleActorListView(),
        _buildImageListView(),
      ],
    );
  }

  Widget _buildActorListView() {
    final double pad = 10;
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: actorList.length,
        
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = actorList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => DetailScreen(item),
                  //fullscreenDialog: true,
                ),
              
              );
            },
          child: Padding(
            padding: EdgeInsets.only(top: pad, bottom: pad, left: pad),
            child: SizedBox(
              width: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(pad),
                child: Image.network(item, fit: BoxFit.cover),
              ),
            ),
            ),
          );
          
          
        },
        
      ),
      );
  }

  Widget  _buildCircleActorListView(){
    final double pad = 5;
    final double size = 200;
    return SizedBox(
      height: size,
      child: ListView.builder(
        itemCount: actorList.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          final item = actorList[index];
          return Padding(
            padding: EdgeInsets.only(top: pad, bottom: pad, left: pad),
            child: SizedBox(
              width: size,
              child: CircleAvatar(backgroundImage: NetworkImage(item)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageListView(){
    final double pad = 10;
    return ListView.builder(
      // physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        final item = imageList[index];
        return InkWell(
        onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => DetailScreen(item),
                  //fullscreenDialog: true,
                ),
              
              );
            },
        child: Padding(
          padding: EdgeInsets.only(left: pad, right: pad, top: pad),
          child: SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(pad),
              child: Image.network(item, fit: BoxFit.cover)),
            ),
          ),
        );
      },
    
    );
  }

}