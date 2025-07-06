import 'package:flutter/material.dart';
import 'package:flutter_project/basic_module/photo_constant.dart';

class TiktokScreen extends StatefulWidget {
  const TiktokScreen({super.key});

  @override
  State<TiktokScreen> createState() => _TiktokScreenState();
}

class _TiktokScreenState extends State<TiktokScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
      bottomNavigationBar: _buildAppBar(),
    );
  }


  Widget _buildAppBar(){
    return BottomAppBar(
      color:Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.home, color: Colors.white70),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search, color: Colors.white70),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.bookmark, color: Colors.white70),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_horiz, color: Colors.white70),
          ),
        ],
      ),
    );
  }


  Widget _buildBody(){
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildMainPageView(),
    Positioned(top: 20,child: _buildTopMenu()),
      ],
    );
  }

  Widget _buildTopMenu(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildFollowingButton(), _buildForYouButton()],
    );
  }

  Widget _buildFollowingButton(){
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: (){},
      child: Text("Following"),
    );
  }

  Widget _buildForYouButton(){
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      ),
      onPressed: (){},
      child: Text("For You"),
    );
  }

  Widget  _buildMainPageView(){
    return PageView(
      children: [
        _buildFollowing(),
        _buildForYou(),
      ],
    );
  }

  Widget _buildFollowing() {
  return PageView.builder(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: actorList.length,
    itemBuilder: (context, index) {
      final item = actorList[index];
      return _buildCaption(item);
    },
  );
}

Widget _buildForYou() {
  return PageView.builder(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: imageList.length,
    itemBuilder: (context, index) {
      final item = imageList[index];
      return _buildCaption(item);
    },
  );
}

Widget _buildCaption(String imageUrl) {
  return Stack(
    children: [
      Positioned.fill(
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
      // Bottom-left user info
      Positioned(
        bottom: 20,
        left: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'RIKA SMOS SNEA',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              'Flutter Content 🌌 #coding #IT\n#webdevelopment #computerscience',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
      // Bottom-right vertical icons
      Positioned(
        bottom: 20,
        right: 16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.thefashionisto.com/wp-content/uploads/2023/09/Brad-Pitt-Blonde-Hair-1.jpg'), // Replace with actual profile pic
              radius: 24,
            ),
            SizedBox(height: 16),
            _buildicon(Icons.favorite_outlined, '100K' ),
            SizedBox(height: 16),
            _buildicon(Icons.insert_comment, '50K'),
            SizedBox(height: 16),
            _buildicon(Icons.bookmark_rounded, '25K'),
            SizedBox(height: 16),
            _buildicon(Icons.switch_access_shortcut_add_rounded, '5K'),
          ],
        ),
      ),
    ],
  );
}

Widget _buildicon(IconData icon, String count) {
  return Column(
    children: [
      Icon(icon, color: Colors.white, size: 32),
      SizedBox(height: 4),
      Text(count, style: TextStyle(color: Colors.white)),
    ],
  );
}
}