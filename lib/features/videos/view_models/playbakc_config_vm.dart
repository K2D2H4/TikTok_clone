import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/video_playback_config_repo.dart';

class PlayBackConfigViewModel extends Notifier<PlayBackConfigModel> {
  VideoPlayBackConfigRepository _repository;

  PlayBackConfigViewModel(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    state = PlayBackConfigModel(
      muted: value,
      autoPlay: state.autoPlay,
    );
  }

  void setAutoplay(bool value) {
    _repository.setAutoPlay(value);
    state = PlayBackConfigModel(
      muted: state.muted,
      autoPlay: value,
    );
  }

  @override
  PlayBackConfigModel build() {
    return PlayBackConfigModel(
      muted: _repository.isMuted(),
      autoPlay: _repository.isAutoPlay(),
    );
  }
}

final playBackConfigProvider =
    NotifierProvider<PlayBackConfigViewModel, PlayBackConfigModel>(
  () => throw UnimplementedError(),
);
