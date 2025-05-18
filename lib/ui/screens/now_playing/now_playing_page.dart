import 'package:flutter/material.dart';
import 'now_playing_controller.dart';
import '../../components/waveform_controller.dart';
import '../../components/audio_waveform_view.dart';
import 'package:mp_app/ui/components/audio_waveform_view.dart';

class NowPlayingPage extends StatefulWidget {
  final String title;
  final String artist;
  final String coverImagePath;

  const NowPlayingPage({
    Key? key,
    required this.title,
    required this.artist,
    required this.coverImagePath,
  }) : super(key: key);

  @override
  _NowPlayingPageState createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  final NowPlayingController _controller = NowPlayingController();
  final String _audioAssetPath = 'assets/audios/sample.mp3';

  @override
  void initState() {
    super.initState();
    _controller.loadAudio(_audioAssetPath);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.replay_10, color: Colors.white),
          onPressed: () => _controller.seek(Duration.zero),
        ),
        IconButton(
          icon: Icon(
            _controller.isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
          ),
          onPressed: _controller.togglePlayPause,
        ),
        IconButton(
          icon: const Icon(Icons.forward_10, color: Colors.white),
          onPressed: () => _controller.seek(const Duration(seconds: 10)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12111A),
      appBar: AppBar(
        title: const Text('Now Playing'),
        backgroundColor: const Color(0xFF12111A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.coverImagePath,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.artist,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 24),
            AudioWaveformView(controller: _controller.waveformController),
            const SizedBox(height: 24),
            _buildControls(),
          ],
        ),
      ),
    );
  }
}
