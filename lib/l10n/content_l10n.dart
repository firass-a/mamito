part of 'app_strings.dart';

/// Seeded content translations (journey cards, fruit sizes, community, etc.).
/// English keys in mock data stay as stable IDs; UI picks ar/fr/en here.
extension AppStringsContent on AppStrings {
  String westernDigits(String input) {
    const eastern = '٠١٢٣٤٥٦٧٨٩';
    const persian = '۰۱۲۳۴۵۶۷۸۹';
    var out = input;
    for (var i = 0; i < 10; i++) {
      out = out.replaceAll(eastern[i], '$i');
      out = out.replaceAll(persian[i], '$i');
    }
    return out;
  }

  String fruitLabel(String key) {
    final k = key.trim();
    return switch (k.toLowerCase()) {
      'berry' => _t(ar: 'توتة', fr: 'baie', en: 'berry'),
      'raspberry' => _t(ar: 'توت العليق', fr: 'framboise', en: 'raspberry'),
      'lime' => _t(ar: 'ليمونة', fr: 'citron vert', en: 'lime'),
      'avocado' => _t(ar: 'أفوكادو', fr: 'avocat', en: 'avocado'),
      'banana' => _t(ar: 'موزة', fr: 'banane', en: 'banana'),
      'papaya' => _t(ar: 'بابايا', fr: 'papaye', en: 'papaya'),
      'corn' => _t(ar: 'ذرة', fr: 'épi de maïs', en: 'corn'),
      'eggplant' => _t(ar: 'باذنجانة', fr: 'aubergine', en: 'eggplant'),
      'squash' => _t(ar: 'قرع', fr: 'courge', en: 'squash'),
      'honeydew' => _t(ar: 'شمام عسلي', fr: 'melon miel', en: 'honeydew'),
      'watermelon' => _t(ar: 'بطيخة', fr: 'pastèque', en: 'watermelon'),
      _ => k,
    };
  }

  String weekBabyGrowth(int w) => _t(
        ar: 'في الأسبوع $w، تواصل الأعضاء نضجها وتصبح الحركات أوضح وأكثر انتظاماً.',
        fr: 'À la semaine $w, les organes continuent de mûrir et les mouvements deviennent plus intentionnels.',
        en: 'At week $w, organs keep maturing and movements feel more intentional.',
      );

  String weekMotherChanges(int w) => _t(
        ar: 'قد تلاحظين تغيّراً في الطاقة والشهية والنوم حول الأسبوع $w.',
        fr: 'Vous pouvez remarquer des changements d\'énergie, d\'appétit et de sommeil autour de la semaine $w.',
        en: 'You may notice shifting energy, appetite, and sleep patterns around week $w.',
      );

  String weekNutrition(int w) => _t(
        ar: 'ركّزي على الحديد والبروتين والخضار الملوّنة. الوجبات الصغيرة المتكررة تساعد (أسبوع $w).',
        fr: 'Priorisez fer, protéines et légumes colorés. De petits repas fréquents aident (semaine $w).',
        en: 'Prioritize iron, protein, and colorful vegetables. Small frequent meals help.',
      );

  String weekExercise(int w) => _t(
        ar: 'مشي هادئ، يوغا حمل، وحركة للحوض — توقّفي إن شعرتِ بدوخة أو ضيق تنفس.',
        fr: 'Marches douces, yoga prénatal et mobilité du bassin — arrêtez si vertige ou essoufflement.',
        en: 'Gentle walks, prenatal yoga, and pelvic mobility — stop if dizzy or breathless.',
      );

  String weekWarningSigns(int w) => _t(
        ar: 'راجعي الطبيبة فوراً عند ألم شديد، نزيف غزير، حمّى، أو تورّم مفاجئ.',
        fr: 'Consultez en cas de douleur sévère, saignement abondant, fièvre ou gonflement soudain.',
        en: 'Seek care for severe pain, heavy bleeding, fever, or sudden swelling.',
      );

  String weekMedicalTips(int w) => _t(
        ar: 'حافظي على مواعيد الحمل وتتبّعي حركات الجنين من منتصف الحمل.',
        fr: 'Gardez vos rendez-vous prénataux et suivez les mouvements fœtaux dès le milieu de grossesse.',
        en: 'Keep prenatal appointments and track kick patterns from mid-pregnancy.',
      );

  List<String> weekChecklist(int w) => [
        _t(
          ar: 'اشربي الماء بانتظام',
          fr: 'Boire de l\'eau régulièrement',
          en: 'Drink water regularly',
        ),
        _t(
          ar: 'سجّلي مزاجكِ مرة اليوم',
          fr: 'Noter son humeur une fois aujourd\'hui',
          en: 'Log mood once today',
        ),
        _t(
          ar: 'مدّدي الوركين بلطف',
          fr: 'Étirer doucement les hanches',
          en: 'Stretch hips gently',
        ),
        _t(
          ar: 'اقرئي نصيحة هذا الأسبوع',
          fr: 'Lire le conseil de la semaine',
          en: 'Read this week’s tip',
        ),
      ];

  String organLabel(String key) => switch (key) {
        'Taste buds forming' =>
          _t(ar: 'تشكّل براعم التذوق', fr: 'Bourgeons du goût', en: key),
        'Eyebrows visible' =>
          _t(ar: 'الحاجبان يظهران', fr: 'Sourcils visibles', en: key),
        'Pancreas developing' =>
          _t(ar: 'نمو البنكرياس', fr: 'Pancréas en développement', en: key),
        'Lungs branching' =>
          _t(ar: 'تفرّع الرئتين', fr: 'Poumons qui se ramifient', en: key),
        _ => key,
      };

  String milestoneLabel(String key) => switch (key) {
        'Responds to sounds' =>
          _t(ar: 'يستجيب للأصوات', fr: 'Réagit aux sons', en: key),
        'Regular sleep cycles' =>
          _t(ar: 'دورات نوم منتظمة', fr: 'Cycles de sommeil réguliers', en: key),
        'Stronger kicks' =>
          _t(ar: 'ركلات أقوى', fr: 'Coups plus forts', en: key),
        _ => key,
      };

  String communityPostContent(String id, String fallback) => switch (id) {
        'post-1' => _t(
            ar: 'هل غيري أيضاً تشتهي الزيتون مع عصير البرتقال في الساعة 2 صباحاً؟ أسأل لأجل صديقة 🍋',
            fr: 'Quelqu\'un d\'autre craque pour olives + jus d\'orange à 2h du matin ? Je demande pour une amie 🍋',
            en: fallback,
          ),
        'post-2' => _t(
            ar: 'أشعر بالإرهاق اليوم. ممتنة لوجود هذه المساحة.',
            fr: 'Je me sens dépassée aujourd\'hui. Reconnaissante que cet espace existe.',
            en: fallback,
          ),
        'post-3' => _t(
            ar: 'في الأسبوع 22 الركلات أقوى — أي نصائح لانزعاج الليل؟',
            fr: 'Semaine 22, les coups sont plus forts — des astuces pour l\'inconfort la nuit ?',
            en: fallback,
          ),
        'post-4' => _t(
            ar: 'شاركت وصفة شربة دافئة هدّأت حرقة المعدة ❤️',
            fr: 'J\'ai partagé une chorba douce qui a calmé mon reflux ❤️',
            en: fallback,
          ),
        _ => fallback,
      };

  String communityCommentText(String id, String fallback) => switch (id) {
        'c1' => _t(
            ar: 'نفس الشعور. لستِ وحدكِ!',
            fr: 'Même énergie. Tu n\'es pas seule !',
            en: fallback,
          ),
        'c2' => _t(
            ar: 'النوم على الجنب مع وسادة بين الركبتين ساعدني.',
            fr: 'Dormir sur le côté + oreiller entre les genoux m\'a aidée.',
            en: fallback,
          ),
        _ => fallback,
      };

  String notificationTitle(String title) => switch (title) {
        'Prenatal vitamin' =>
          _t(ar: 'فيتامين الحمل', fr: 'Vitamine prénatale', en: title),
        'Ultrasound in 3 days' =>
          _t(ar: 'سونار بعد 3 أيام', fr: 'Échographie dans 3 jours', en: title),
        'Week 22 update' =>
          _t(ar: 'تحديث الأسبوع 22', fr: 'Mise à jour semaine 22', en: title),
        'Hydration nudge' =>
          _t(ar: 'تذكير بالماء', fr: 'Rappel hydratation', en: title),
        'Weight check-in' =>
          _t(ar: 'تسجيل الوزن', fr: 'Suivi du poids', en: title),
        'Kick counter' =>
          _t(ar: 'عداد الركلات', fr: 'Compteur de coups', en: title),
        _ => title,
      };

  String notificationBody(String body) {
    final normalized = body.replaceAll('’', "'").replaceAll('‘', "'");
    return switch (normalized) {
      'Time for your evening tablet' => _t(
          ar: 'حان وقت قرصكِ المسائي',
          fr: 'C\'est l\'heure de votre comprimé du soir',
          en: body,
        ),
      'Anatomy scan with Dr. Leila' => _t(
          ar: 'سونار تشريحي مع د. ليلى',
          fr: 'Écho morphologique avec Dr Leila',
          en: body,
        ),
      'Your baby is about the size of a papaya' => _t(
          ar: 'طفلكِ بحجم بابايا تقريباً',
          fr: 'Bébé fait environ la taille d\'une papaye',
          en: body,
        ),
      '3 more glasses to hit today\'s goal' => _t(
          ar: '3 كؤوس إضافية للوصول لهدف اليوم',
          fr: 'Encore 3 verres pour atteindre l\'objectif du jour',
          en: body,
        ),
      'Log this week\'s weight when ready' => _t(
          ar: 'سجّلي وزن هذا الأسبوع عندما تكونين مستعدة',
          fr: 'Notez le poids de cette semaine quand vous voulez',
          en: body,
        ),
      'A calm 30-min count window is open' => _t(
          ar: 'نافذة هادئة لمدة 30 دقيقة لعدّ الركلات متاحة',
          fr: 'Une fenêtre calme de 30 min pour compter est ouverte',
          en: body,
        ),
      _ => body,
    };
  }

  String appointmentTitle(String title) => switch (title) {
        'Anatomy Ultrasound' =>
          _t(ar: 'سونار تشريحي', fr: 'Échographie morphologique', en: title),
        'Glucose Screening' =>
          _t(ar: 'فحص السكر', fr: 'Dépistage du glucose', en: title),
        'Prenatal Checkup' =>
          _t(ar: 'متابعة حمل', fr: 'Consultation prénatale', en: title),
        'Dental Check' =>
          _t(ar: 'فحص أسنان', fr: 'Contrôle dentaire', en: title),
        _ => title,
      };

  String appointmentSpecialty(String specialty) => switch (specialty) {
        'OB-GYN' => _t(ar: 'نساء وتوليد', fr: 'Gynécologie-obstétrique', en: specialty),
        'Lab' => _t(ar: 'مختبر', fr: 'Laboratoire', en: specialty),
        'Dental' => _t(ar: 'أسنان', fr: 'Dentaire', en: specialty),
        _ => specialty,
      };

  String medicationName(String name) {
    if (name.toLowerCase().contains('prenatal') ||
        name.toLowerCase().contains('vitamin')) {
      return _t(ar: 'فيتامينات الحمل', fr: 'Vitamines prénatales', en: name);
    }
    if (name.toLowerCase().contains('iron') || name.toLowerCase().contains('fer')) {
      return _t(ar: 'مكمل الحديد', fr: 'Complément de fer', en: name);
    }
    if (name.toLowerCase().contains('omega')) {
      return _t(ar: 'أوميغا 3', fr: 'Oméga-3', en: name);
    }
    return name;
  }

  String medicationSchedule(String schedule) => switch (schedule.toLowerCase()) {
        'evening' || 'soir' => _t(ar: 'مساءً', fr: 'Soir', en: 'Evening'),
        'morning' || 'matin' => _t(ar: 'صباحاً', fr: 'Matin', en: 'Morning'),
        'noon' || 'midi' => _t(ar: 'ظهراً', fr: 'Midi', en: 'Noon'),
        'morning with food' =>
          _t(ar: 'صباحاً مع الطعام', fr: 'Matin avec repas', en: schedule),
        'with lunch' => _t(ar: 'مع الغداء', fr: 'Au déjeuner', en: schedule),
        'with breakfast' =>
          _t(ar: 'مع الفطور', fr: 'Au petit-déjeuner', en: schedule),
        'with dinner' => _t(ar: 'مع العشاء', fr: 'Au dîner', en: schedule),
        _ => schedule,
      };

  String medicationDosage(String dosage) => switch (dosage.toLowerCase()) {
        '1 tablet' => _t(ar: 'قرص واحد', fr: '1 comprimé', en: dosage),
        '1 softgel' => _t(ar: 'كبسولة واحدة ناعمة', fr: '1 capsule molle', en: dosage),
        _ => dosage,
      };

  String relativeActivity(String key) => switch (key) {
        'now' => _t(ar: 'الآن', fr: 'maintenant', en: 'now'),
        '2m' => _t(ar: 'منذ دقيقتين', fr: 'il y a 2 min', en: '2m'),
        '5m' => _t(ar: 'منذ 5 دقائق', fr: 'il y a 5 min', en: '5m'),
        '15m' => _t(ar: 'منذ 15 دقيقة', fr: 'il y a 15 min', en: '15m'),
        '40m' => _t(ar: 'منذ 40 دقيقة', fr: 'il y a 40 min', en: '40m'),
        '1h' => _t(ar: 'منذ ساعة', fr: 'il y a 1 h', en: '1h'),
        '3h' => _t(ar: 'منذ 3 ساعات', fr: 'il y a 3 h', en: '3h'),
        '1d' => _t(ar: 'منذ يوم', fr: 'il y a 1 j', en: '1d'),
        _ => key,
      };

  String articleTitleKey(String title) {
    // Strip trailing " (n)" used in mock generator
    final base = title.replaceAll(RegExp(r'\s*\(\d+\)\s*$'), '');
    final translated = switch (base) {
      'Gentle mornings for nausea' =>
        _t(ar: 'صباحات لطيفة للغثيان', fr: 'Matins doux contre les nausées', en: base),
      'Safe second-trimester walks' =>
        _t(ar: 'مشي آمن في الثلث الثاني', fr: 'Marches sûres au 2e trimestre', en: base),
      'When anxiety feels loud' =>
        _t(ar: 'عندما يعلو صوت القلق', fr: 'Quand l\'anxiété est forte', en: base),
      'Week-by-week brain growth' =>
        _t(ar: 'نمو الدماغ أسبوعاً بأسبوع', fr: 'Cerveau semaine après semaine', en: base),
      'Packing your hospital bag' =>
        _t(ar: 'تحضير حقيبة المستشفى', fr: 'Préparer le sac de maternité', en: base),
      'Latch basics without pressure' =>
        _t(ar: 'أساسيات الإرضاع بلا ضغط', fr: 'Prise du sein sans pression', en: base),
      'Iron-rich Algerian plates' =>
        _t(ar: 'أطباق جزائرية غنية بالحديد', fr: 'Assiettes algériennes riches en fer', en: base),
      'Pelvic floor kindness' =>
        _t(ar: 'لطف مع قاع الحوض', fr: 'Douceur pour le plancher pelvien', en: base),
      'Sleep rituals that actually help' =>
        _t(ar: 'طقوس نوم تفيد فعلاً', fr: 'Rituels de sommeil qui aident', en: base),
      'Feeling kicks with confidence' =>
        _t(ar: 'الشعور بالركلات بثقة', fr: 'Sentir les coups avec confiance', en: base),
      'Birth preferences, softly' =>
        _t(ar: 'تفضيلات الولادة بلطف', fr: 'Préférences de naissance, en douceur', en: base),
      'Milk supply myths' =>
        _t(ar: 'خرافات عن إنتاج الحليب', fr: 'Mythes sur la lactation', en: base),
      'Hydration that sticks' =>
        _t(ar: 'ترطيب يستمر', fr: 'Hydratation qui dure', en: base),
      'Partner support scripts' =>
        _t(ar: 'عبارات دعم للشريك', fr: 'Phrases de soutien pour le partenaire', en: base),
      'Stretch marks with care' =>
        _t(ar: 'علامات التمدد بعناية', fr: 'Vergetures avec douceur', en: base),
      'Third-trimester nesting' =>
        _t(ar: 'تجهيز المنزل في الثلث الثالث', fr: 'Nidification au 3e trimestre', en: base),
      'Postpartum first 40 days' =>
        _t(ar: 'أول 40 يوماً بعد الولادة', fr: 'Les 40 premiers jours postpartum', en: base),
      'Introducing solids later' =>
        _t(ar: 'إدخال الأطعمة الصلبة لاحقاً', fr: 'Diversification plus tard', en: base),
      'Screen-free bonding' =>
        _t(ar: 'ترابط بلا شاشات', fr: 'Lien sans écrans', en: base),
      'Trusted supplements only' =>
        _t(ar: 'مكملات موثوقة فقط', fr: 'Compléments de confiance seulement', en: base),
      _ => base,
    };
    final match = RegExp(r'\((\d+)\)\s*$').firstMatch(title);
    if (match != null) {
      return '$translated (${match.group(1)})';
    }
    return translated;
  }

  String articleSummary(String category, String fallback) {
    final cat = articleCategoryLabel(category);
    return _t(
      ar: 'إرشاد دافئ ومراجع من أطباء حول $cat — مصمّم للأمهات.',
      fr: 'Conseils doux et revus par des médecins sur $cat — pour les mamans.',
      en: fallback,
    );
  }

  String articleBody(String category, int tipIndex) {
    final cat = articleCategoryLabel(category);
    return _t(
      ar: 'هذا محتوى نموذجي عن $cat. في التطبيق النهائي سيكون مقالاً أطول ومناسباً ثقافياً ومراجعاً طبياً.\n\nنصيحة $tipIndex: تنفّسي، اشربي الماء، ووثقي بوتيرتكِ.',
      fr: 'Contenu prototype sur $cat. En production, ce serait un long article culturellement adapté et revu par des cliniciens.\n\nAstuce $tipIndex : respirez, hydratez-vous, et faites confiance à votre rythme.',
      en:
          'This is prototype article content about $category. In a production app this would be long-form, culturally aware copy reviewed by clinicians.\n\nTip $tipIndex: breathe, hydrate, and trust your pace.',
    );
  }

  String articleCategoryLabel(String category) => switch (category) {
        'Nutrition' => nutrition,
        'Exercise' => exercise,
        'Mental Health' => mentalHealth,
        'Baby Development' => babyDevelopment,
        'Delivery' => delivery,
        'Breastfeeding' => breastfeeding,
        _ => category,
      };

  String babyNameMeaning(String meaning) => switch (meaning) {
        'Jasmine flower' => _t(ar: 'زهرة الياسمين', fr: 'Fleur de jasmin', en: meaning),
        'Earth' => _t(ar: 'الأرض', fr: 'Terre', en: meaning),
        'Tender' => _t(ar: 'رقيقة', fr: 'Tendre', en: meaning),
        'Gate of heaven' => _t(ar: 'باب الجنة', fr: 'Porte du paradis', en: meaning),
        'Pure' => _t(ar: 'نقية', fr: 'Pure', en: meaning),
        'Light' => _t(ar: 'نور', fr: 'Lumière', en: meaning),
        _ => meaning,
      };

  String babyNameOrigin(String origin) => switch (origin) {
        'Arabic' => _t(ar: 'عربي', fr: 'Arabe', en: origin),
        'Arabic/Berber' => _t(ar: 'عربي / أمازيغي', fr: 'Arabe / berbère', en: origin),
        _ => origin,
      };
}
