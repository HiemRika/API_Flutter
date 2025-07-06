
import 'package:flutter/material.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscriptions"),
        actions: const [
          Icon(Icons.cast),
          SizedBox(width: 10),
          Icon(Icons.notifications),
          SizedBox(width: 10),
          Icon(Icons.search),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage("https://yt3.ggpht.com/ytc/AMLnZu_lgZ${index}"),
                    ),
                    const SizedBox(height: 5),
                    Text("Channel ${index+1}", style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: const [
              Chip(label: Text("All")),
              Chip(label: Text("Today")),
              Chip(label: Text("Videos")),
              Chip(label: Text("Shorts")),
              Chip(label: Text("Live")),
              Chip(label: Text("Podcasts")),
            ],
          ),
          const SizedBox(height: 20),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network("https://i.ytimg.com/vi/dQw4w9WgXcQ/maxresdefault.jpg"),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "GRAND FINAL EXCITEMENT BEGINS! | PMSL EU SPRING GRAND FINAL",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage("https://yt3.ggpht.com/ytc/AMLnZu_pubg")),
                  title: Text("PUBG MOBILE Esports"),
                  subtitle: Text("36 watching"),
                  trailing: Icon(Icons.more_vert),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
