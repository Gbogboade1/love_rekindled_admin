
class ChurchItem {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String date;
  final String videoUrl;
  final String audioUrl;
  final String summaryText;
  final bool isDownloaded;

  ChurchItem({
      this.imageUrl = "",
      this.title = "",
      this.subTitle = "",
      this.date = "",
      this.isDownloaded = true,
      this.videoUrl = "",
      this.audioUrl = "",
      this.summaryText = "",
  });
}
