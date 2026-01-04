import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const ShivBhajanApp());
}

class ShivBhajanApp extends StatelessWidget {
  const ShivBhajanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BhajanHome(),
    );
  }
}

class BhajanHome extends StatefulWidget {
  const BhajanHome({super.key});

  @override
  State<BhajanHome> createState() => _BhajanHomeState();
}

class _BhajanHomeState extends State<BhajanHome> {
  final AudioPlayer _player = AudioPlayer();
  String? _current;

  final List<Map<String, String>> bhajans = [
    {'title': 'Bam Bam Bhole', 'file': 'bam_bam_bhole.mp3'},
    {'title': 'Bhairav', 'file': 'bhairav.mp3'},
    {'title': 'Bhola Nache', 'file': 'bhola_nache.mp3'},
    {'title': 'Bholenath', 'file': 'bholenath.mp3'},
    {'title': 'Devon Ke Dev', 'file': 'devon_ke_dev.mp3'},
    {'title': 'Har Har Bhole', 'file': 'har_har_bhole.mp3'},
    {'title': 'Jai Ho', 'file': 'jai_ho.mp3'},
    {'title': 'Kabira', 'file': 'kabira.mp3'},
    {'title': 'Kedara', 'file': 'kedara.mp3'},
    {'title': 'Om Namah Shivaya', 'file': 'om_namaha_shivaya.mp3'},
    {'title': 'Om Namaste', 'file': 'om_namaste.mp3'},
    {'title': 'Parvati Bhole', 'file': 'parvati_bhole.mp3'},
    {'title': 'Parvati', 'file': 'parvati.mp3'},
    {'title': 'Rudra', 'file': 'rudra.mp3'},
    {'title': 'Shambhu', 'file': 'shambhu.mp3'},
  ];

  Future<void> play(String file) async {
    try {
      await _player.stop();
      await _player.play(AssetSource('audio/$file'));
      setState(() => _current = file);
    } catch (e) {
      debugPrint('AUDIO ERROR: $e');
    }
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
        title: const Text('Shiv Bhajans'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: bhajans.length,
        itemBuilder: (_, i) {
          final b = bhajans[i];
          final playing = _current == b['file'];
          return ListTile(
            leading: const Icon(Icons.music_note, color: Colors.orange),
            title: Text(
              b['title']!,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: IconButton(
              icon: Icon(
                playing ? Icons.stop : Icons.play_arrow,
                color: Colors.orange,
              ),
              onPressed: () => play(b['file']!),
            ),
          );
        },
      ),
    );
  }
}
