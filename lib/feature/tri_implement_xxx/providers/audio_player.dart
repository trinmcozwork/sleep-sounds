// ignore_for_file: file_names, prefer_final_fields

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerProvider extends ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isFastForwarding = false;
  bool _isSlowForwarding = false;
  bool _isRepeat = false;
  Duration _duration = const Duration();
  Duration _position = const Duration();

  bool get isPlaying => _isPlaying;
  bool get isFastForwarding => _isFastForwarding;
  bool get isSlowForwarding => _isSlowForwarding;
  bool get isRepeat => _isRepeat;
  Duration get duration => _duration;
  Duration get position => _position;

  void togglePlayPause() {
    if (_isPlaying == false) {
      _isPlaying = true;
      audioPlayer.play(AssetSource('sounds/Faded.mp3'));
    } else if (_isPlaying == true) {
      _isPlaying = false;
      audioPlayer.pause();
    }
    notifyListeners();
  }

  void toggleFastForward() {
    if (_isFastForwarding == false) {
      _isFastForwarding = true;
      audioPlayer.setPlaybackRate(1.5);
    } else if (_isFastForwarding == true) {
      _isFastForwarding = false;
      audioPlayer.setPlaybackRate(1);
    }
    notifyListeners();
  }

  void toggleSlowForward() {
    if (_isSlowForwarding == false) {
      _isSlowForwarding = true;
      audioPlayer.setPlaybackRate(0.5);
    } else if (_isSlowForwarding == true) {
      _isSlowForwarding = false;
      audioPlayer.setPlaybackRate(1);
    }
    notifyListeners();
  }

  void onPlayerComplete() {
    audioPlayer.onPlayerComplete.listen((event) {
      if (_isPlaying == true) {
        _isPlaying = true;
      } else {
        _isPlaying = false;
        _isRepeat = false;
      }
      notifyListeners();
    });
  }

  void toggleRepeat() {
    if (_isRepeat == false) {
      _isRepeat = true;
      audioPlayer.setReleaseMode(ReleaseMode.loop);
    } else if (_isRepeat == true) {
      _isRepeat = false;
      audioPlayer.setReleaseMode(ReleaseMode.release);
    }
    notifyListeners();
  }

  Duration getDuration() {
    audioPlayer.onDurationChanged.listen((event) {
      _duration = event;
      notifyListeners();
    });
    return _duration;
  }

  Duration getPosition() {
    audioPlayer.onPositionChanged.listen((event) {
      _position = event;
      notifyListeners();
    });

    return _position;
  }

  void changeToSecond(int seconds) {
    Duration newDuration = Duration(seconds: seconds);
    audioPlayer.seek(newDuration);
    notifyListeners();
  }
}
