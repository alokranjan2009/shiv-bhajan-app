import 'package:flutter/material.dart';
import '../data/bhajan_list.dart';
import 'player_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("🕉️ Shiv Bhajans"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: bhajans.length,
        itemBuilder: (context, index) {
          final bhajan = bhajans[index];

          return ListTile(
            leading: const Icon(Icons.music_note, color: Colors.orange),
            title: Text(
              bhajan.title,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              bhajan.duration,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing:
                const Icon(Icons.play_circle_fill, color: Colors.orange),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlayerScreen(bhajan: bhajan),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
