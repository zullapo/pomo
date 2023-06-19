String formatDuration(Duration duration) {
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);

  String formattedMinutes = minutes.toString().padLeft(2, "0");
  String formattedSeconds = seconds.toString().padLeft(2, "0");

  return "$formattedMinutes:$formattedSeconds";
}