import '../models/experience_model.dart';
import '../models/project_model.dart';

/// Single source of truth for all portfolio content.
class PortfolioData {
  PortfolioData._();

  // ── Personal ────────────────────────────────────────────────────
  static const String name = 'Riyad Ahmed Sagor';
  static const String role = 'Software Engineer (Flutter)';
  static const String summary =
      'I am a dedicated and detail-oriented professional with a strong background '
      'in mobile app development and a passion for building high-quality, user-focused '
      'digital solutions. With hands-on experience in designing, developing, and deploying '
      'scalable applications, I specialize in turning complex requirements into clean, '
      'efficient, and maintainable code. I thrive in collaborative environments, continuously '
      'seek to learn new technologies, and aim to deliver impactful results that align with '
      'user needs and business goals.';

  static const String email = 'ahmedriyad10186@gmail.com';
  static const String phone = '01799771074';
  static const String linkedIn =
      'https://www.linkedin.com/in/riyadfromspace/';
  static const String github = 'https://github.com/riyad-from-space';
  static const String location = 'Sylhet, Bangladesh';
  static const String resumeLink =
      'https://drive.google.com/drive/folders/1h_VemUqO-U3_lX3Zm-6jmpfww226fLSs?usp=sharing';

  // ── Navigation sections ─────────────────────────────────────────
  static const List<String> sectionLabels = [
    'About',
    'Skills',
    'Experience',
    'Languages',
    'Projects',
    'Education',
  ];

  // ── Technical Skills ────────────────────────────────────────────
  static const List<Map<String, String>> technicalSkills = [
    {
      'title': 'Mobile Development',
      'detail':
          'Flutter (iOS & Android), Dart, Material Design, Responsive UI, Custom Widgets',
    },
    {
      'title': 'State Management & Architecture',
      'detail':
          'Riverpod, Provider, Bloc/Cubit, Clean Architecture, MVVM, Repository Pattern',
    },
    {
      'title': 'Backend & Cloud Services',
      'detail':
          'Firebase (Auth, Firestore, Storage, Hosting), Supabase, REST API Integration, MySQL',
    },
    {
      'title': 'API & Integration',
      'detail':
          'RESTful APIs, HTTP, Third-party SDKs, Push Notifications, FastAPI',
    },
    {
      'title': 'Version Control & Collaboration',
      'detail':
          'Git, GitHub, Code Review, Agile Development, Team Collaboration',
    },
    {
      'title': 'Development & Deployment',
      'detail':
          'VS Code, Android Studio, Xcode, Google Play Store, Apple App Store, CI/CD',
    },
  ];

  // ── Programming Languages ───────────────────────────────────────
  static const List<Map<String, String>> programmingLanguages = [
    {'name': 'Dart', 'level': 'Expert – Primary Language'},
    {'name': 'Python', 'level': 'Proficient – Backend / AI'},
    {'name': 'Java', 'level': 'Intermediate – Android Native'},
    {'name': 'SQL', 'level': 'Proficient – Database'},
    {'name': 'C++', 'level': 'Familiar – DSA'},
  ];

  // ── Spoken Languages ────────────────────────────────────────────
  static const List<String> spokenLanguages = ['English', 'Bangla'];

  // ── Experience ──────────────────────────────────────────────────
  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      title: 'Junior Software Engineer',
      company: 'AppifyLab',
      period: 'May 2024 – Present',
      bullets: [
        'Architected and delivered production-ready features using Flutter and Bloc pattern, serving 150 000+ active users',
        'Integrated RESTful APIs with robust error handling and state management for seamless user experience',
        'Reduced app crashes by 40 % through systematic debugging and performance optimization',
        'Successfully deployed and maintained applications on Google Play Store and Apple App Store',
        'Collaborated with cross-functional teams using Agile methodologies to ship features on time',
      ],
    ),
    ExperienceModel(
      title: 'Software Engineering Intern',
      company: 'AppifyLab',
      period: 'Feb 2024 – Apr 2024',
      bullets: [
        'Built responsive UI components using Flutter widgets, achieving pixel-perfect designs across iOS and Android',
        'Mastered state management solutions (Provider, Riverpod) and implemented clean architecture principles',
        'Developed 3 complete mobile applications from ideation to production deployment',
        'Implemented Firebase Authentication, Firestore database, and Cloud Storage for real-time data synchronization',
        'Actively participated in code reviews, learning industry best practices and coding standards',
      ],
    ),
    ExperienceModel(
      title: 'Flutter Developer',
      company: 'Heapiphy',
      period: 'Part-Time (Remote)',
      bullets: [
        'Delivered mobile solutions integrating REST APIs and third-party SDKs for enhanced functionality',
        'Improved user retention by 25 % through iterative feature enhancements based on user feedback analysis',
        'Resolved critical UI/UX issues and optimized app performance, reducing load times by 30 %',
        'Collaborated remotely with development team following Agile practices and sprint-based delivery',
      ],
    ),
  ];

  // ── Projects ────────────────────────────────────────────────────
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'EzyCourse – SaaS Platform',
      description:
          'Enterprise SaaS platform powering 1 000+ course creators and their communities with real-time collaboration and content delivery.',
      technologies: ['Flutter', 'Bloc', 'REST API', 'Firebase', 'CI/CD'],
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.ezycourse.ezycourse&hl=en',
      appStoreLink: 'https://apps.apple.com/fi/app/ezycourse/id6443599486',
      // Add screenshots when ready:
      // coverImage: 'assets/images/profile.jpeg',
      // screenshots: [
      //   'assets/images/profile.jpeg',
      //   'assets/images/profile.jpeg',
      //   'assets/images/profile.jpeg',
      // ],
    ),
    ProjectModel(
      title: 'NewsSip – News in 60 Words',
      description:
          'Concise news aggregation app delivering bite-sized news updates with real-time synchronization and personalized content.',
      technologies: ['Flutter', 'BLoC', 'Firebase', 'WebSockets'],
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.heapiphy.newssip&hl=en',
      githubLink: 'https://github.com/Heapiphy/bulletins.git',
    ),
    ProjectModel(
      title: 'Community Platform',
      description:
          'Production-ready social learning platform enabling course creators to build and manage engaged student communities.',
      technologies: [
        'Flutter',
        'REST API',
        'Riverpod',
        'Clean Architecture',
      ],
      githubLink:
          'https://github.com/riyad-from-space/Ezycourse-Community.git',
    ),
    ProjectModel(
      title: 'Sheba AI – Medical Assistant',
      description:
          'AI-powered healthcare app providing instant medical consultation and diagnosis assistance.',
      technologies: [
        'Flutter',
        'REST API',
        'Riverpod',
        'Clean Architecture',
        'AI Integration',
      ],
      githubLink: 'https://github.com/Noctambulist007/Sheba_AI.git',
    ),
    ProjectModel(
      title: 'Fish Disease Detection',
      description:
          'ML-based mobile app for real-time fish disease identification using computer vision and FastAPI.',
      technologies: ['Flutter', 'AI Model', 'FastAPI', 'Python'],
      githubLink:
          'https://github.com/riyad-from-space/Fish-Disease-Detection-App.git',
    ),
    ProjectModel(
      title: 'Connect – Social Blogging',
      description:
          'Feature-rich blogging app with real-time updates, user profiles, and content discovery.',
      technologies: ['Flutter', 'Firebase', 'Riverpod', 'MVVM'],
      githubLink: 'https://github.com/riyad-from-space/Connect.git',
    ),
    ProjectModel(
      title: 'LU Insights – Campus Companion',
      description:
          'University student hub for academic resources, notices, and campus event management.',
      technologies: ['Flutter', 'Firebase', 'Riverpod', 'MVVM'],
      githubLink: 'https://github.com/riyad-from-space/LU-Insights.git',
    ),
    ProjectModel(
      title: 'Interactive Portfolio Website',
      description:
          'Responsive web portfolio built entirely with Flutter, showcasing dynamic theming and smooth UX.',
      technologies: ['Flutter Web', 'Firebase Hosting', 'Responsive Design'],
      githubLink:
          'https://github.com/riyad-from-space/Riyad-s-Portfolio.git',
    ),
  ];

  // ── Education ───────────────────────────────────────────────────
  static const List<Map<String, String>> education = [
    {
      'degree': 'B.Sc. in CSE',
      'institute': 'Leading University, Sylhet',
      'duration': 'Jan 2022 — Dec 2025',
      'cgpa': '3.1',
    },
  ];
}
