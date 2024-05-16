import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class Tip3Screen extends StatefulWidget {
  const Tip3Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Tip3ScreenState createState() => _Tip3ScreenState();
}

class _Tip3ScreenState extends State<Tip3Screen> {
  late Future<DocumentSnapshot> _tipFuture;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _tipFuture = FirebaseFirestore.instance
        .collection('Tips')
        .doc('FJ8mlBkPAiVI6VCMsK1M')
        .get();
    _videoController = VideoPlayerController.asset('assets/videos/Tip3.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _videoController.setLooping(true);
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip 3'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _tipFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos.'));
          }

          var data = snapshot.data?.data() as Map<String, dynamic>;
          String titulo = data['Titulo'] ?? 'Sin título';
          String descripcion = data['Descripcion'] ?? 'Sin descripción';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text(
                    'Titulo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    titulo,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Descripción',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    descripcion,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  _videoController.value.isInitialized
                      ? Column(
                          children: [
                            AspectRatio(
                              aspectRatio: _videoController.value.aspectRatio,
                              child: VideoPlayer(_videoController),
                            ),
                            VideoProgressIndicator(
                              _videoController,
                              allowScrubbing: true,
                              colors: const VideoProgressColors(
                                playedColor: Colors.green,
                                bufferedColor: Colors.lightGreen,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(_videoController.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow),
                                  onPressed: () {
                                    setState(() {
                                      _videoController.value.isPlaying
                                          ? _videoController.pause()
                                          : _videoController.play();
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.replay),
                                  onPressed: () {
                                    _videoController.seekTo(Duration.zero);
                                  },
                                ),
                              ],
                            ),
                          ],
                        )
                      : const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
