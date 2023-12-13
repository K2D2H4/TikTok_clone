import 'package:go_router/go_router.dart';

import 'features/videos/Video_recording_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const VideoRecordingScreen(),
  )
]);
