import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/bhajan.dart';

class PlayerScreen extends StatefulWidget {
  final Bhajan bhajan;

  const PlayerScreen({super.key, required this.bhajan});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _player.setAsset(widget.bhajan.file);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.bhajan.title),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.self_improvement,
              size: 120, color: Colors.orange),
          const SizedBox(height: 20),
          Text(
            widget.bhajan.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 30),
          StreamBuilder<PlayerState>(
            stream: _player.playerStateStream,
            builder: (context, snapshot) {
              final playing = snapshot.data?.playing ?? false;

              return IconButton(
                iconSize: 64,
                color: Colors.orange,
                icon: Icon(
                    playing ? Icons.pause_circle : Icons.play_circle),
                onPressed: () {
                  playing ? _player.pause() : _player.play();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
