import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mp_app/ui/components/waveform_controller.dart'; 

class NowPlayingController extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final WaveformController waveformController = WaveformController(); 

  bool isPlaying = false;

  Future<void> loadAudio(String path) async {
    try {
      await _audioPlayer.setAsset('assets/audios/sample.mp3');

      await _audioPlayer.play(); 

      isPlaying = true;

      _audioPlayer.playerStateStream.listen((state) {
        isPlaying = state.playing;
        notifyListeners();
      });

      _audioPlayer.positionStream.listen((position) {
        waveformController.updateProgress(position.inMilliseconds.toDouble());
      });

    } catch (e) {
      debugPrint('Audio load error: $e');
    }
  }

  void togglePlayPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    isPlaying = !isPlaying;
    notifyListeners();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
    waveformController.dispose();
    super.dispose();
  }
}
