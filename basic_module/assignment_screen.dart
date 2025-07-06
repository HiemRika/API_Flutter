import 'package:flutter/material.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

final pic1 =
    "https://i.pinimg.com/736x/2d/72/fc/2d72fc24978ca55352880ce5d7413b4c.jpg";

class _AssignmentScreenState extends State<AssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 117, 117),
      body: Center(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 70, 70, 70),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImage(),
          _buildText(),
          _buildIcon(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: Image.network(
            pic1,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 205, 182),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'Get a Ticket',
              style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Crayon Shin-chan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'An animated television adaptation began airing on TV Asahi in 1992 and is still ongoing, with 1267 episodes. The show has been dubbed in 30 languages which aired in 45 countries.[7] As of 2023, both the Crayon Shin-Chan and New Crayon Shin-Chan series has over 148 million copies in circulation, making it among the best-selling manga series in history.',
            style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(137, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
  return const Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 16), 
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_cart_checkout_outlined),
              SizedBox(width: 20),
              Icon(Icons.favorite_border),
              SizedBox(width: 20),
              Icon(Icons.bookmark_add_outlined),
            ],
          ),
          Spacer(),
          Icon(Icons.info_outline),
        ],
      ),
    ),
  );
}
}