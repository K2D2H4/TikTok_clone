import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/video_playback_config_repo.dart';

class PlayBackConfigViewModel extends ChangeNotifier {
  VideoPlayBackConfigRepository _repository;

  late final PlayBackConfigModel _model = PlayBackConfigModel(
    muted: _repository.isMuted(),
    autoPlay: _repository.isAutoPlay(),
  );

  PlayBackConfigViewModel(this._repository);

  bool get muted => _model.muted;
  bool get autoPlay => _model.autoPlay;

  void setMuted(bool value) {
    _repository.setMuted(value);
    _model.muted = value;
    notifyListeners();
  }

  void setAutoplay(bool value) {
    _repository.setAutoPlay(value);
    _model.autoPlay = value;
    notifyListeners();
  }
}
