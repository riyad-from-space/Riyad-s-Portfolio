/// Data model for work experience.
class ExperienceModel {
  final String title;
  final String company;
  final String period;
  final List<String> bullets;

  const ExperienceModel({
    required this.title,
    required this.company,
    required this.period,
    required this.bullets,
  });
}
