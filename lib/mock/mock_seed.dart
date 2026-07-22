import 'package:uuid/uuid.dart';

import '../shared/models/models.dart';

const _uuid = Uuid();

/// Seed data for in-memory repositories. Resets on hot restart.
abstract final class MockSeed {
  static MotherProfile get mother => MotherProfile(
        id: 'mom-1',
        firstName: '',
        lastName: 'Ahmed',
        age: 28,
        currentWeek: 22,
        dueDate: DateTime(2025, 9, 14),
        weightKg: 67,
        heightCm: 165,
        bloodType: 'A+',
        partnerName: 'Karim Ahmed',
        role: 'pregnant',
      );

  static BabyProfile get baby => BabyProfile(
        id: 'baby-1',
        name: '',
        week: 22,
        weightGrams: 430,
        lengthCm: 27.8,
        fruitComparison: 'Papaya',
        heartbeatBpm: 148,
        organsDeveloping: const [
          'Taste buds forming',
          'Eyebrows visible',
          'Pancreas developing',
          'Lungs branching',
        ],
        milestones: const [
          'Responds to sounds',
          'Regular sleep cycles',
          'Stronger kicks',
        ],
      );

  static List<Appointment> appointments() {
    final now = DateTime.now();
    return [
      Appointment(
        id: _uuid.v4(),
        title: 'Anatomy Ultrasound',
        doctor: 'Dr. Leila Mansouri',
        hospital: 'Clinique El Djazair',
        dateTime: now.add(const Duration(days: 3, hours: 2)),
        status: AppointmentStatus.upcoming,
        notes: 'Bring previous scan results',
        location: 'Algiers Centre',
        specialty: 'OB-GYN',
      ),
      Appointment(
        id: _uuid.v4(),
        title: 'Glucose Screening',
        doctor: 'Dr. Amine Boudiaf',
        hospital: 'Mustapha Pacha',
        dateTime: now.add(const Duration(days: 10)),
        status: AppointmentStatus.upcoming,
        location: 'Algiers',
        specialty: 'Lab',
      ),
      Appointment(
        id: _uuid.v4(),
        title: 'Prenatal Checkup',
        doctor: 'Dr. Leila Mansouri',
        hospital: 'Clinique El Djazair',
        dateTime: now.subtract(const Duration(days: 14)),
        status: AppointmentStatus.completed,
        notes: 'All vitals normal',
        specialty: 'OB-GYN',
      ),
      Appointment(
        id: _uuid.v4(),
        title: 'Dental Check',
        doctor: 'Dr. Nora Said',
        hospital: 'Smile Care',
        dateTime: now.subtract(const Duration(days: 40)),
        status: AppointmentStatus.cancelled,
        specialty: 'Dental',
      ),
    ];
  }

  static List<Article>? _articlesCache;

  static List<Article> articles() {
    if (_articlesCache != null) return _articlesCache!;
    const categories = [
      'Nutrition',
      'Exercise',
      'Mental Health',
      'Baby Development',
      'Delivery',
      'Breastfeeding',
    ];
    const titles = [
      'Gentle mornings for nausea',
      'Safe second-trimester walks',
      'When anxiety feels loud',
      'Week-by-week brain growth',
      'Packing your hospital bag',
      'Latch basics without pressure',
      'Iron-rich Algerian plates',
      'Pelvic floor kindness',
      'Sleep rituals that actually help',
      'Feeling kicks with confidence',
      'Birth preferences, softly',
      'Milk supply myths',
      'Hydration that sticks',
      'Partner support scripts',
      'Stretch marks with care',
      'Third-trimester nesting',
      'Postpartum first 40 days',
      'Introducing solids later',
      'Screen-free bonding',
      'Trusted supplements only',
    ];
    final now = DateTime.now();
    final list = <Article>[];
    for (var i = 0; i < 36; i++) {
      final cat = categories[i % categories.length];
      final title = '${titles[i % titles.length]} (${i + 1})';
      list.add(
        Article(
          id: 'art-$i',
          title: title,
          summary: 'Warm, doctor-reviewed guidance for $cat — made for Arabic moms.',
          body:
              'This is prototype article content about $cat. In a production app this would be long-form, culturally aware copy reviewed by clinicians.\n\nTip ${i + 1}: breathe, hydrate, and trust your pace.',
          category: cat,
          author: i.isEven ? 'Dr. Amira Benali' : 'Dr. Karim Haddad',
          publishedAt: now.subtract(Duration(days: i)),
          likes: 12 + (i % 40),
          trending: i % 7 == 0,
          reviewedBy: 'Dr. Panel MAMYTO',
          bookmarked: i % 11 == 0,
          liked: i % 13 == 0,
        ),
      );
    }
    return _articlesCache = list;
  }

  static List<CommunityPost> posts() {
    final now = DateTime.now();
    return [
      CommunityPost(
        id: 'post-1',
        author: 'Nora B.',
        content: 'Anyone else craving olives with orange juice at 2am? Asking for a friend 🍋',
        createdAt: now.subtract(const Duration(hours: 2)),
        likes: 48,
        pinned: true,
        topic: 'cravings',
        comments: [
          CommunityComment(
            id: 'c1',
            author: 'Hana',
            text: 'Same energy. You are not alone!',
            createdAt: now.subtract(const Duration(hours: 1)),
          ),
        ],
      ),
      CommunityPost(
        id: 'post-2',
        author: 'Anonymous',
        content: 'Feeling overwhelmed today. Grateful this space exists.',
        createdAt: now.subtract(const Duration(hours: 5)),
        likes: 92,
        topic: 'support',
        comments: const [],
      ),
      CommunityPost(
        id: 'post-3',
        author: 'Sarah A.',
        content: 'Week 22 kicks are getting stronger — any tips for night-time discomfort?',
        createdAt: now.subtract(const Duration(days: 1)),
        likes: 31,
        likedByMe: true,
        topic: 'symptoms',
        comments: [
          CommunityComment(
            id: 'c2',
            author: 'Meryem',
            text: 'Side sleeping + pillow between knees helped me.',
            createdAt: now.subtract(const Duration(hours: 20)),
          ),
        ],
      ),
      CommunityPost(
        id: 'post-4',
        author: 'Ines K.',
        content: 'Shared a warm chorba recipe that settled my heartburn ❤️',
        createdAt: now.subtract(const Duration(days: 2)),
        likes: 64,
        topic: 'nutrition',
        comments: const [],
      ),
    ];
  }

  static List<AppNotification> notifications() {
    final now = DateTime.now();
    return [
      AppNotification(
        id: _uuid.v4(),
        title: 'Prenatal vitamin',
        body: 'Time for your evening tablet',
        createdAt: now.subtract(const Duration(minutes: 20)),
        type: NotificationType.medication,
      ),
      AppNotification(
        id: _uuid.v4(),
        title: 'Ultrasound in 3 days',
        body: 'Anatomy scan with Dr. Leila',
        createdAt: now.subtract(const Duration(hours: 3)),
        type: NotificationType.appointment,
      ),
      AppNotification(
        id: _uuid.v4(),
        title: 'Week 22 update',
        body: 'Your baby is about the size of a papaya',
        createdAt: now.subtract(const Duration(hours: 8)),
        type: NotificationType.weekly,
        read: true,
      ),
      AppNotification(
        id: _uuid.v4(),
        title: 'Hydration nudge',
        body: '3 more glasses to hit today’s goal',
        createdAt: now.subtract(const Duration(hours: 1)),
        type: NotificationType.water,
      ),
      AppNotification(
        id: _uuid.v4(),
        title: 'Weight check-in',
        body: 'Log this week’s weight when ready',
        createdAt: now.subtract(const Duration(days: 1)),
        type: NotificationType.weight,
      ),
      AppNotification(
        id: _uuid.v4(),
        title: 'Kick counter',
        body: 'A calm 30-min count window is open',
        createdAt: now.subtract(const Duration(days: 1, hours: 4)),
        type: NotificationType.kicks,
      ),
    ];
  }

  static List<MoodEntry> moods() {
    final now = DateTime.now();
    return [
      MoodEntry(id: _uuid.v4(), mood: 'Calm', date: now, note: 'Good walk', intensity: 4),
      MoodEntry(
        id: _uuid.v4(),
        mood: 'Tired',
        date: now.subtract(const Duration(days: 1)),
        intensity: 2,
      ),
      MoodEntry(
        id: _uuid.v4(),
        mood: 'Happy',
        date: now.subtract(const Duration(days: 2)),
        intensity: 5,
      ),
    ];
  }

  static List<SymptomEntry> symptoms() {
    final now = DateTime.now();
    const names = [
      'Morning sickness',
      'Back pain',
      'Fatigue',
      'Headache',
      'Mood swings',
      'Leg cramps',
      'Heartburn',
    ];
    return [
      for (var i = 0; i < names.length; i++)
        SymptomEntry(
          id: 'sym-$i',
          name: names[i],
          date: now.subtract(Duration(days: i % 3)),
          severity: i.isEven ? 'mild' : 'moderate',
        ),
    ];
  }

  static List<WeightEntry> weights() {
    final now = DateTime.now();
    return [
      for (var i = 0; i < 8; i++)
        WeightEntry(
          id: 'w-$i',
          kg: 64.5 + i * 0.35,
          date: now.subtract(Duration(days: (7 - i) * 7)),
        ),
    ];
  }

  static List<Medication> medications() => [
        Medication(
          id: _uuid.v4(),
          name: 'Prenatal multivitamin',
          dosage: '1 tablet',
          schedule: 'Evening',
          takenToday: true,
        ),
        Medication(
          id: _uuid.v4(),
          name: 'Iron supplement',
          dosage: '1 tablet',
          schedule: 'Morning with food',
        ),
        Medication(
          id: _uuid.v4(),
          name: 'Omega-3',
          dosage: '1 softgel',
          schedule: 'With lunch',
        ),
      ];

  static HydrationDay hydration() => HydrationDay(date: DateTime.now(), glasses: 5, goal: 8);

  static List<BabyName> babyNames() => const [
        BabyName(id: 'n1', name: 'Yasmine', meaning: 'Jasmine flower', origin: 'Arabic', gender: 'girl'),
        BabyName(id: 'n2', name: 'Adam', meaning: 'Earth', origin: 'Arabic', gender: 'boy', favorite: true),
        BabyName(id: 'n3', name: 'Lina', meaning: 'Tender', origin: 'Arabic', gender: 'girl'),
        BabyName(id: 'n4', name: 'Rayan', meaning: 'Gate of heaven', origin: 'Arabic', gender: 'boy'),
        BabyName(id: 'n5', name: 'Ines', meaning: 'Pure', origin: 'Arabic/Berber', gender: 'girl'),
        BabyName(id: 'n6', name: 'Nour', meaning: 'Light', origin: 'Arabic', gender: 'unisex', favorite: true),
      ];

  static List<WeekContent>? _weeksCache;

  static List<WeekContent> weeks() {
    return _weeksCache ??= List.generate(40, (i) {
      final w = i + 1;
      return WeekContent(
        week: w,
        babyGrowth: 'At week $w, organs keep maturing and movements feel more intentional.',
        motherChanges: 'You may notice shifting energy, appetite, and sleep patterns around week $w.',
        nutrition: 'Prioritize iron, protein, and colorful vegetables. Small frequent meals help.',
        exercise: 'Gentle walks, prenatal yoga, and pelvic mobility — stop if dizzy or breathless.',
        warningSigns: 'Seek care for severe pain, heavy bleeding, fever, or sudden swelling.',
        medicalTips: 'Keep prenatal appointments and track kick patterns from mid-pregnancy.',
        checklist: [
          'Drink water regularly',
          'Log mood once today',
          'Stretch hips gently',
          'Read this week’s tip',
        ],
        fruitComparison: _fruitFor(w),
      );
    });
  }

  static String fruitForWeek(int w) => _fruitFor(w.clamp(1, 40));

  static String _fruitFor(int w) {
    const map = {
      8: 'Raspberry',
      12: 'Lime',
      16: 'Avocado',
      20: 'Banana',
      22: 'Papaya',
      24: 'Corn',
      28: 'Eggplant',
      32: 'Squash',
      36: 'Honeydew',
      40: 'Watermelon',
    };
    var best = 'Berry';
    for (final e in map.entries) {
      if (w >= e.key) best = e.value;
    }
    return best;
  }

  static List<StoreProduct> products() => const [
        StoreProduct(
          id: 'p1',
          nameAr: 'وسادة حمل مريحة',
          nameFr: 'Coussin de grossesse',
          nameEn: 'Pregnancy pillow',
          price: 4500,
          category: 'mom',
          iconCode: 0,
          colorValue: 0xFFEDE4FF,
          descriptionEn: 'Soft support for restful nights.',
        ),
        StoreProduct(
          id: 'p2',
          nameAr: 'زيت تدليك البطن',
          nameFr: 'Huile de massage',
          nameEn: 'Belly massage oil',
          price: 1800,
          category: 'mom',
          iconCode: 1,
          colorValue: 0xFFFFE8EC,
          descriptionEn: 'Gentle oil for stretch comfort.',
        ),
        StoreProduct(
          id: 'p3',
          nameAr: 'بطانية قطنية ناعمة',
          nameFr: 'Couverture coton',
          nameEn: 'Soft cotton blanket',
          price: 3200,
          category: 'baby',
          iconCode: 2,
          colorValue: 0xFFE8E0F5,
          descriptionEn: 'Breathable blanket for little ones.',
        ),
        StoreProduct(
          id: 'p4',
          nameAr: 'زجاجة رضاعة',
          nameFr: 'Biberon',
          nameEn: 'Feeding bottle',
          price: 2100,
          category: 'baby',
          iconCode: 3,
          colorValue: 0xFFE0F5F1,
        ),
        StoreProduct(
          id: 'p5',
          nameAr: 'فيتامينات ما قبل الولادة',
          nameFr: 'Vitamines prénatales',
          nameEn: 'Prenatal vitamins',
          price: 2900,
          category: 'mom',
          iconCode: 4,
          colorValue: 0xFFE0F5F1,
        ),
        StoreProduct(
          id: 'p6',
          nameAr: 'عضّاضة سيليكون',
          nameFr: 'Anneau de dentition',
          nameEn: 'Silicone teether',
          price: 900,
          category: 'baby',
          iconCode: 5,
          colorValue: 0xFFFFE8EC,
        ),
      ];

  static List<ChatRoom> chatRooms() => const [
        ChatRoom(
          id: 'r1',
          nameAr: 'حوامل الثلث الثاني',
          nameFr: '2e trimestre',
          nameEn: '2nd trimester moms',
          memberCount: 1284,
          lastActivity: '2m',
          iconCode: 0,
        ),
        ChatRoom(
          id: 'r2',
          nameAr: 'نصائح تغذية',
          nameFr: 'Astuces nutrition',
          nameEn: 'Nutrition tips',
          memberCount: 892,
          lastActivity: '15m',
          iconCode: 1,
        ),
        ChatRoom(
          id: 'r3',
          nameAr: 'دعم ما بعد الولادة',
          nameFr: 'Soutien post-partum',
          nameEn: 'Postpartum support',
          memberCount: 2103,
          lastActivity: 'now',
          iconCode: 2,
          gentle: true,
        ),
        ChatRoom(
          id: 'r4',
          nameAr: 'أمهات الجزائر',
          nameFr: 'Mamans d\'Algérie',
          nameEn: 'Algeria moms',
          memberCount: 3450,
          lastActivity: '1h',
          iconCode: 3,
        ),
        ChatRoom(
          id: 'r5',
          nameAr: 'نوم الطفل',
          nameFr: 'Sommeil de bébé',
          nameEn: 'Baby sleep',
          memberCount: 1560,
          lastActivity: '40m',
          iconCode: 4,
        ),
      ];

  static List<ChatMessage> messagesFor(String roomId) {
    if (roomId == 'r3') {
      return const [
        ChatMessage(
          id: 'm1',
          author: 'مجهولة',
          text: 'اليوم كان صعباً... شكراً لكل من يستمع.',
          time: '10:12',
        ),
        ChatMessage(
          id: 'm2',
          author: 'Amine',
          text: 'Nous sommes avec toi. Respire doucement 🤍',
          time: '10:14',
        ),
        ChatMessage(
          id: 'm3',
          author: 'Anonymous',
          text: 'You are not alone. Tomorrow can feel lighter.',
          time: '10:20',
        ),
      ];
    }
    return const [
      ChatMessage(id: 'm1', author: 'Nour', text: 'صباح الخير يا جميلات 💕', time: '09:01'),
      ChatMessage(
        id: 'm2',
        author: 'Huda',
        text: 'Has anyone tried ginger tea for nausea?',
        time: '09:15',
      ),
      ChatMessage(
        id: 'm3',
        author: 'Rim',
        text: 'Oui ! Avec un peu de miel, ça aide beaucoup.',
        time: '09:18',
      ),
      ChatMessage(
        id: 'm4',
        author: 'Sarah',
        text: 'Thank you! Trying it today 🌿',
        time: '09:22',
        isMe: true,
      ),
    ];
  }
}
