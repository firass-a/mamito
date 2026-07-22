import '../../mock/mock_seed.dart';
import '../models/models.dart';

/// Thin repository interfaces — data lives in Riverpod notifiers.
/// These classes document the boundary for a future API swap.

class ProfileRepository {
  MotherProfile fetch() => MockSeed.mother;
  BabyProfile fetchBaby() => MockSeed.baby;
}

class AppointmentRepository {
  List<Appointment> fetchAll() => MockSeed.appointments();
}

class ArticleRepository {
  List<Article> fetchAll() => MockSeed.articles();
}

class CommunityRepository {
  List<CommunityPost> fetchAll() => MockSeed.posts();
}

class NotificationRepository {
  List<AppNotification> fetchAll() => MockSeed.notifications();
}

class MoodRepository {
  List<MoodEntry> fetchAll() => MockSeed.moods();
}

class SymptomRepository {
  List<SymptomEntry> fetchAll() => MockSeed.symptoms();
}

class WeightRepository {
  List<WeightEntry> fetchAll() => MockSeed.weights();
}

class MedicationRepository {
  List<Medication> fetchAll() => MockSeed.medications();
}

class PregnancyRepository {
  List<WeekContent> fetchWeeks() => MockSeed.weeks();
}
