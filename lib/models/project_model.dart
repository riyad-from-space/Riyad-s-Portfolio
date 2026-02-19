/// Data model for a portfolio project.
class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? githubLink;
  final String? webLink;

  /// Optional cover image asset path shown on the card.
  final String? coverImage;

  /// Optional list of screenshot asset paths (up to 5).
  /// When tapped the user can browse through them in a gallery overlay.
  final List<String> screenshots;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    this.playStoreLink,
    this.appStoreLink,
    this.githubLink,
    this.webLink,
    this.coverImage,
    this.screenshots = const [],
  });
}
