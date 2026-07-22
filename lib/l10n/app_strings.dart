import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../shared/providers/app_providers.dart';

part 'content_l10n.dart';

class AppStrings {
  AppStrings(this.lang);
  final String lang;

  String get localeTag => switch (lang) {
        'fr' => 'fr',
        'en' => 'en',
        _ => 'ar',
      };

  String formatDate(DateTime d) => westernDigits(
        DateFormat('dd MMM yyyy', localeTag).format(d),
      );
  String formatTime(DateTime d) => westernDigits(
        DateFormat('HH:mm', localeTag).format(d),
      );
  String formatWeekday(DateTime d) => westernDigits(
        DateFormat('EEE', localeTag).format(d),
      );

  String get appName => 'MAMYTO';
  String get tagline => _t(
        ar: 'رفيقتك في كل لحظة',
        fr: 'Votre compagne à chaque instant',
        en: 'Your companion every moment',
      );

  String get navHome => _t(ar: 'الرئيسية', fr: 'Accueil', en: 'Home');
  String get navJourney => _t(ar: 'الرحلة', fr: 'Parcours', en: 'Journey');
  String get navCommunity => _t(ar: 'المجتمع', fr: 'Communauté', en: 'Community');
  String get navStore => _t(ar: 'المتجر', fr: 'Boutique', en: 'Store');
  String get navProfile => _t(ar: 'حسابي', fr: 'Profil', en: 'Profile');
  String get navResources => _t(ar: 'الموارد', fr: 'Ressources', en: 'Resources');

  String greeting(String name) {
    final h = DateTime.now().hour;
    if (lang == 'ar') {
      final part = h < 12 ? 'صباح الخير' : h < 17 ? 'مساء الخير' : 'مساء النور';
      return '$part، $name';
    }
    if (lang == 'fr') {
      final part = h < 12 ? 'Bonjour' : h < 17 ? 'Bon après-midi' : 'Bonsoir';
      return '$part, $name';
    }
    final part = h < 12 ? 'Good morning' : h < 17 ? 'Good afternoon' : 'Good evening';
    return '$part, $name';
  }

  String weekOf(int week, int total) => _t(
        ar: 'الأسبوع $week من $total',
        fr: 'Semaine $week sur $total',
        en: 'Week $week of $total',
      );

  String weeksPregnant(int week) => _t(
        ar: '$week أسابيع حاملاً',
        fr: '$week semaines enceinte',
        en: '$week Weeks Pregnant',
      );

  String babySizeOf(String fruit) => _t(
        ar: 'طفلكِ بحجم $fruit تقريباً',
        fr: 'Bébé fait environ la taille d\'un $fruit',
        en: 'Baby is the size of a $fruit',
      );

  String weeksLeft(int n) => _t(
        ar: '$n أسابيع متبقية',
        fr: '$n semaines restantes',
        en: '$n weeks to go',
      );

  String get quickActions =>
      _t(ar: 'اختصارات', fr: 'Actions rapides', en: 'Quick actions');
  String get todayGlance =>
      _t(ar: 'اليوم باختصار', fr: 'Aujourd\'hui', en: 'Today at a glance');
  String get seeAll => _t(ar: 'عرض الكل', fr: 'Tout voir', en: 'See all');
  String get continueBtn => _t(ar: 'متابعة', fr: 'Continuer', en: 'Continue');
  String get skip => _t(ar: 'تخطي', fr: 'Passer', en: 'Skip');
  String get getStarted => _t(ar: 'ابدئي', fr: 'Commencer', en: 'Get started');
  String get chooseLanguage =>
      _t(ar: 'اختاري لغتكِ', fr: 'Choisissez votre langue', en: 'Choose your language');
  String get welcomeBack => _t(ar: 'مرحباً بعودتكِ', fr: 'Bon retour', en: 'Welcome back');
  String get welcomeBackSubtitle => _t(
        ar: 'مساحة هادئة ورعاية ثابتة',
        fr: 'Un espace doux, des soins constants',
        en: 'Welcome back — soft space, steady care',
      );
  String get createAccount =>
      _t(ar: 'إنشاء حساب', fr: 'Créer un compte', en: 'Create account');
  String get createAccountSubtitle => _t(
        ar: 'أنشئي مساحتكِ الهادئة للحمل',
        fr: 'Créez votre espace grossesse apaisant',
        en: 'Create your calm pregnancy space',
      );
  String get login => _t(ar: 'تسجيل الدخول', fr: 'Connexion', en: 'Log in');
  String get signup => _t(ar: 'اشتراك', fr: 'S\'inscrire', en: 'Sign up');
  String get email => _t(ar: 'البريد الإلكتروني', fr: 'E-mail', en: 'Email');
  String get password => _t(ar: 'كلمة المرور', fr: 'Mot de passe', en: 'Password');
  String get firstName => _t(ar: 'الاسم الأول', fr: 'Prénom', en: 'First name');
  String get lastName => _t(ar: 'اسم العائلة', fr: 'Nom', en: 'Last name');
  String get forgotPassword =>
      _t(ar: 'نسيتِ كلمة المرور؟', fr: 'Mot de passe oublié ?', en: 'Forgot password?');
  String get termsNotice => _t(
        ar: 'بالمتابعة توافقين على شروط رعاية ماميتو اللطيفة.',
        fr: 'En continuant, vous acceptez les conditions bienveillantes de MAMYTO.',
        en: 'By continuing you agree to MAMYTO’s gentle care terms.',
      );
  String get errNameRequired => _t(
        ar: 'الرجاء إدخال اسمكِ',
        fr: 'Veuillez entrer votre prénom',
        en: 'Please enter your name',
      );
  String get errEmailPasswordRequired => _t(
        ar: 'الرجاء إدخال البريد وكلمة المرور',
        fr: 'Veuillez remplir e-mail et mot de passe',
        en: 'Please fill in email and password',
      );

  String get babyName => _t(ar: 'اسم الطفل', fr: 'Prénom du bébé', en: 'Baby\'s name');
  String get babyNameHint => _t(
        ar: 'اختاري اسماً أو اتركيه فارغاً الآن',
        fr: 'Choisissez un prénom ou laissez vide pour plus tard',
        en: 'Pick a name, or leave blank for now',
      );
  String get yourBaby => _t(ar: 'طفلكِ', fr: 'Votre bébé', en: 'Your baby');
  String get editBaby => _t(ar: 'تعديل بيانات الطفل', fr: 'Modifier bébé', en: 'Edit baby');
  String get whoAreYou =>
      _t(ar: 'أخبرينا عنكِ', fr: 'Parlez-nous de vous', en: 'Tell us about you');
  String get pregnant => _t(ar: 'حامل', fr: 'Enceinte', en: 'Pregnant');
  String get newMom => _t(ar: 'أم جديدة', fr: 'Nouvelle maman', en: 'New mom');
  String get planning => _t(ar: 'أخطط للحمل', fr: 'Je planifie', en: 'Planning');
  String get momOfChild =>
      _t(ar: 'أم لطفل تحت 7 سنوات', fr: 'Maman d\'un enfant < 7 ans', en: 'Mom of child under 7');
  String get dueDate => _t(ar: 'موعد الولادة المتوقع', fr: 'Date prévue', en: 'Due date');
  String get birthDate =>
      _t(ar: 'تاريخ ميلاد الطفل', fr: 'Date de naissance', en: 'Child birth date');
  String get childAge =>
      _t(ar: 'عمر الطفل (بالأشهر)', fr: 'Âge de l\'enfant (mois)', en: 'Child age (months)');
  String get save => _t(ar: 'حفظ', fr: 'Enregistrer', en: 'Save');
  String get saveProfile =>
      _t(ar: 'حفظ الملف', fr: 'Enregistrer le profil', en: 'Save profile');
  String get saved => _t(ar: 'تم الحفظ', fr: 'Enregistré', en: 'Saved');
  String get update => _t(ar: 'تحديث', fr: 'Mettre à jour', en: 'Update');
  String get cancel => _t(ar: 'إلغاء', fr: 'Annuler', en: 'Cancel');
  String get delete => _t(ar: 'حذف', fr: 'Supprimer', en: 'Delete');
  String get deleteConfirmTitle => _t(ar: 'حذف؟', fr: 'Supprimer ?', en: 'Delete?');
  String get deleteConfirmMessage => _t(
        ar: 'لا يمكن التراجع عن هذا الإجراء في هذه الجلسة.',
        fr: 'Cette action ne peut pas être annulée dans cette session.',
        en: 'This action cannot be undone in this session.',
      );
  String get close => _t(ar: 'إغلاق', fr: 'Fermer', en: 'Close');
  String get gotIt => _t(ar: 'حسناً', fr: 'Compris', en: 'Got it');
  String get searchHint => _t(ar: 'بحث…', fr: 'Rechercher…', en: 'Search…');
  String get optionalNote =>
      _t(ar: 'ملاحظة اختيارية', fr: 'Note facultative', en: 'Optional note');
  String get language => _t(ar: 'اللغة', fr: 'Langue', en: 'Language');
  String get premium => _t(ar: 'ماميتو بريميوم', fr: 'Mamyto Premium', en: 'Mamyto Premium');
  String get premiumDesc => _t(
        ar: 'محتوى حصري، استشارات أولوية، ومتجر بخصم',
        fr: 'Contenu exclusif, consultations prioritaires, boutique à prix réduit',
        en: 'Exclusive content, priority consults & store discounts',
      );
  String get upgrade => _t(ar: 'الترقية', fr: 'Passer Premium', en: 'Upgrade');
  String get premiumActive =>
      _t(ar: 'أنتِ مشتركة بريميوم', fr: 'Premium actif', en: 'Premium active');
  String get storeTitle => _t(ar: 'متجر ماميتو', fr: 'Boutique Mamyto', en: 'Mamyto Store');
  String get addToCart => _t(ar: 'أضيفي للسلة', fr: 'Ajouter au panier', en: 'Add to cart');
  String get cart => _t(ar: 'السلة', fr: 'Panier', en: 'Cart');
  String get checkout => _t(ar: 'الدفع', fr: 'Paiement', en: 'Checkout');
  String get placeOrder => _t(ar: 'تأكيد الطلب', fr: 'Confirmer', en: 'Place order');
  String get thankYou => _t(ar: 'شكراً لكِ!', fr: 'Merci !', en: 'Thank you!');
  String get orderPlaced => _t(
        ar: 'تم استلام طلبكِ. سنعتني بكل شيء.',
        fr: 'Commande reçue. On s\'occupe de tout.',
        en: "Order received. We've got you.",
      );
  String get total => _t(ar: 'المجموع', fr: 'Total', en: 'Total');
  String get emptyCart =>
      _t(ar: 'سلتكِ فارغة', fr: 'Votre panier est vide', en: 'Your cart is empty');
  String get continueShopping =>
      _t(ar: 'تابعي التسوق', fr: 'Continuer', en: 'Continue shopping');
  String get phone => _t(ar: 'الهاتف', fr: 'Téléphone', en: 'Phone');
  String get address => _t(ar: 'العنوان', fr: 'Adresse', en: 'Address');
  String get city => _t(ar: 'المدينة', fr: 'Ville', en: 'City');

  String get chats => _t(ar: 'غرف الدردشة', fr: 'Salons', en: 'Chat rooms');
  String get feed => _t(ar: 'المنشورات', fr: 'Fil', en: 'Feed');
  String get typeMessage =>
      _t(ar: 'اكتبي رسالتكِ...', fr: 'Écrivez votre message...', en: 'Type a message...');
  String get members => _t(ar: 'عضوة', fr: 'membres', en: 'members');
  String get anonymousSafe =>
      _t(ar: 'مساحة آمنة ومجهولة', fr: 'Espace sûr et anonyme', en: 'Safe & anonymous space');
  String get pregnancyMonitor =>
      _t(ar: 'متابعة الحمل', fr: 'Suivi de grossesse', en: 'Pregnancy Monitor');
  String get myPregnancy => _t(ar: 'حملي', fr: 'Ma grossesse', en: 'My pregnancy');
  String get appointments => _t(ar: 'المواعيد', fr: 'Rendez-vous', en: 'Appointments');
  String get symptoms => _t(ar: 'الأعراض', fr: 'Symptômes', en: 'Symptoms');
  String get mood => _t(ar: 'المزاج', fr: 'Humeur', en: 'Mood');
  String get moodJournal =>
      _t(ar: 'يوميات المزاج', fr: 'Journal d\'humeur', en: 'Mood journal');
  String get articles => _t(ar: 'مقالات', fr: 'Articles', en: 'Articles');
  String get hydration => _t(ar: 'الماء', fr: 'Hydratation', en: 'Hydration');
  String get weight => _t(ar: 'الوزن', fr: 'Poids', en: 'Weight');
  String get medications => _t(ar: 'الأدوية', fr: 'Médicaments', en: 'Medications');
  String get medsShort => _t(ar: 'أدوية', fr: 'Médic.', en: 'Meds');
  String get logout => _t(ar: 'تسجيل الخروج', fr: 'Déconnexion', en: 'Log out');
  String get settings => _t(ar: 'الإعدادات', fr: 'Paramètres', en: 'Settings');
  String get notifications => _t(ar: 'الإشعارات', fr: 'Notifications', en: 'Notifications');
  String get weekSummary =>
      _t(ar: 'ملخص الأسبوع', fr: 'Résumé de la semaine', en: 'Week summary');
  String get community => _t(ar: 'المجتمع', fr: 'Communauté', en: 'Community');
  String get done => _t(ar: 'تم', fr: 'Terminé', en: 'Done');
  String get profile => _t(ar: 'الملف الشخصي', fr: 'Profil', en: 'Profile');
  String get edit => _t(ar: 'تعديل', fr: 'Modifier', en: 'Edit');
  String get age => _t(ar: 'العمر', fr: 'Âge', en: 'Age');
  String get height => _t(ar: 'الطول', fr: 'Taille', en: 'Height');
  String get heightCm => _t(ar: 'الطول (سم)', fr: 'Taille (cm)', en: 'Height (cm)');
  String get weightKg => _t(ar: 'الوزن (كغ)', fr: 'Poids (kg)', en: 'Weight (kg)');
  String get bloodType => _t(ar: 'فصيلة الدم', fr: 'Groupe sanguin', en: 'Blood type');
  String get blood => _t(ar: 'الدم', fr: 'Sang', en: 'Blood');
  String get partner => _t(ar: 'الشريك', fr: 'Partenaire', en: 'Partner');
  String get achievements => _t(ar: 'الإنجازات', fr: 'Réalisements', en: 'Achievements');
  String get shortcuts => _t(ar: 'اختصارات', fr: 'Raccourcis', en: 'Shortcuts');

  // Onboarding — match marketing copy
  String get onboarding1Title => _t(
        ar: 'رفيقة لطيفة للأمهات',
        fr: 'Une compagne douce pour les mamans',
        en: 'A gentle companion for Arabic moms',
      );
  String get onboarding1Body => _t(
        ar: 'ماميتو ترافقكِ في كل أسبوع — إرشاد هادئ، ومتابعة ناعمة، ورعاية تشبه البيت.',
        fr: 'MAMYTO vous accompagne chaque semaine — conseils calmes et soins doux.',
        en:
            'MAMYTO walks with you through every week — calm guidance, soft check-ins, and care that feels like home.',
      );
  String get onboarding2Title => _t(
        ar: 'تعرّفي على طفلكِ أسبوعاً بأسبوع',
        fr: 'Découvrez bébé, semaine après semaine',
        en: 'Know your baby, week by week',
      );
  String get onboarding2Body => _t(
        ar: 'شاهدي النمو ومقارنات الحجم ونصائح مخصّصة لثلثكِ — بلغة دافئة.',
        fr: 'Croissance, taille fruit et conseils adaptés à votre trimestre.',
        en:
            'See growth, fruit-size milestones, and tips tailored to your trimester — in a language of warmth.',
      );
  String get onboarding3Title => _t(
        ar: 'صحة ومجتمع وراحة بال',
        fr: 'Santé, communauté et sérénité',
        en: 'Health, community & peace of mind',
      );
  String get onboarding3Body => _t(
        ar: 'تتبّعي المواعيد والمزاج والماء، وتواصلي مع أمهات يفهمن رحلتكِ.',
        fr: 'Suivez rendez-vous, humeur et hydratation, et échangez avec d\'autres mamans.',
        en:
            'Track appointments, mood, hydration, and connect with moms who understand your journey.',
      );

  // Journey
  String get journeyTitle =>
      _t(ar: 'رحلة الحمل', fr: 'Parcours de grossesse', en: 'Pregnancy journey');
  String get modeWeeks => _t(ar: 'أسابيع', fr: 'Semaines', en: 'Weeks');
  String get modeMonths => _t(ar: 'أشهر', fr: 'Mois', en: 'Months');
  String get modeTrimesters => _t(ar: 'أثلاث', fr: 'Trimestres', en: 'Trimesters');
  String get babyGrowth => _t(ar: 'نمو الطفل', fr: 'Croissance bébé', en: 'Baby growth');
  String get motherChanges =>
      _t(ar: 'تغيّرات الأم', fr: 'Changements maman', en: 'Mother changes');
  String get nutrition => _t(ar: 'التغذية', fr: 'Nutrition', en: 'Nutrition');
  String get exercise => _t(ar: 'الرياضة', fr: 'Exercice', en: 'Exercise');
  String get warningSigns =>
      _t(ar: 'علامات تحذيرية', fr: 'Signes d\'alerte', en: 'Warning signs');
  String get medicalTips =>
      _t(ar: 'نصائح طبية', fr: 'Conseils médicaux', en: 'Medical tips');
  String get checklist => _t(ar: 'قائمة المهام', fr: 'Liste', en: 'Checklist');
  String get viewBabyDetails =>
      _t(ar: 'عرض تفاصيل الطفل', fr: 'Voir bébé', en: 'View baby details');

  // Community
  String get newPost => _t(ar: 'منشور جديد', fr: 'Nouveau post', en: 'New post');
  String get shareHint => _t(
        ar: 'شاركي مع المجتمع…',
        fr: 'Partagez avec la communauté…',
        en: 'Share with the community…',
      );
  String get emptyPosts =>
      _t(ar: 'لا منشورات بعد', fr: 'Pas encore de posts', en: 'No posts yet');
  String get emptyPostsHint => _t(
        ar: 'شاركي شيئاً لطيفاً مع الأمهات الأخريات.',
        fr: 'Partagez quelque chose de doux avec d\'autres mamans.',
        en: 'Share something kind with other moms.',
      );
  String get postBtn => _t(ar: 'نشر', fr: 'Publier', en: 'Post');
  String get addComment =>
      _t(ar: 'أضيفي تعليقاً…', fr: 'Ajouter un commentaire…', en: 'Add a comment…');
  String get deleteComment =>
      _t(ar: 'حذف التعليق؟', fr: 'Supprimer le commentaire ?', en: 'Delete comment?');

  // Settings
  String get support => _t(ar: 'الدعم', fr: 'Assistance', en: 'Support');
  String get pushNotifications =>
      _t(ar: 'إشعارات فورية', fr: 'Notifications push', en: 'Push notifications');
  String get medReminders =>
      _t(ar: 'تذكير الأدوية', fr: 'Rappels médicaments', en: 'Medication reminders');
  String get apptReminders =>
      _t(ar: 'تذكير المواعيد', fr: 'Rappels rendez-vous', en: 'Appointment reminders');
  String get weeklyTips =>
      _t(ar: 'نصائح أسبوعية', fr: 'Conseils hebdo', en: 'Weekly tips');
  String get hydrationNudges =>
      _t(ar: 'تذكير شرب الماء', fr: 'Rappels hydratation', en: 'Hydration nudges');
  String get helpFaq => _t(ar: 'المساعدة والأسئلة', fr: 'Aide & FAQ', en: 'Help & FAQ');
  String get helpFaqBody => _t(
        ar: 'تصفّحي رحلة أسبوعكِ، سجّلي صحتكِ، واضبطي التذكيرات من الملف. تحتاجين دعماً أكثر؟ تواصلي مع عيادتكِ أو المجتمع داخل التطبيق.',
        fr: 'Parcourez votre semaine, suivez votre santé et réglez les rappels depuis le profil. Besoin d\'aide ? Contactez votre clinique ou la communauté.',
        en:
            'Browse your week journey, log health check-ins, and set reminders from Profile. Need more support? Reach out via your clinic or the in-app community.',
      );
  String get aboutMamito => _t(ar: 'عن ماميتو', fr: 'À propos de MAMYTO', en: 'About MAMYTO');
  String get aboutTitle => _t(ar: 'حول', fr: 'À propos', en: 'About');
  String get aboutBody => _t(
        ar: 'رفيقة ناعمة للحمل والأمومة المبكرة — إرشاد أسبوعي، وتتبع صحة، ورعاية مجتمعية.',
        fr: 'Une compagne douce pour la grossesse et la petite enfance — conseils, suivi santé et communauté.',
        en:
            'A soft companion for pregnancy and early motherhood — week guidance, health tracking, and community care.',
      );

  // Notifications
  String get today => _t(ar: 'اليوم', fr: 'Aujourd\'hui', en: 'Today');
  String get yesterday => _t(ar: 'أمس', fr: 'Hier', en: 'Yesterday');
  String get earlier => _t(ar: 'سابقاً', fr: 'Plus tôt', en: 'Earlier');
  String get allCaughtUp =>
      _t(ar: 'كل شيء محدّث', fr: 'Tout est à jour', en: 'All caught up');
  String get noNotifications => _t(
        ar: 'ليس لديكِ إشعارات حالياً.',
        fr: 'Vous n\'avez aucune notification pour le moment.',
        en: 'You have no notifications right now.',
      );
  String get clearAll => _t(ar: 'مسح الكل؟', fr: 'Tout effacer ?', en: 'Clear all?');
  String get deleteNotification =>
      _t(ar: 'حذف الإشعار؟', fr: 'Supprimer la notification ?', en: 'Delete notification?');
  String get notificationDeleted =>
      _t(ar: 'تم حذف الإشعار', fr: 'Notification supprimée', en: 'Notification deleted');

  // Appointments
  String get upcoming => _t(ar: 'القادمة', fr: 'À venir', en: 'Upcoming');
  String get completed => _t(ar: 'مكتملة', fr: 'Terminés', en: 'Completed');
  String get cancelled => _t(ar: 'ملغاة', fr: 'Annulés', en: 'Cancelled');
  String get newAppointment =>
      _t(ar: 'موعد جديد', fr: 'Nouveau rendez-vous', en: 'New appointment');
  String get editAppointment =>
      _t(ar: 'تعديل الموعد', fr: 'Modifier le rendez-vous', en: 'Edit appointment');
  String get noAppointments =>
      _t(ar: 'لا مواعيد', fr: 'Aucun rendez-vous', en: 'No appointments');
  String get noAppointmentsHint => _t(
        ar: 'أضيفي زيارة أو امسحي الفلاتر.',
        fr: 'Ajoutez une visite ou réinitialisez les filtres.',
        en: 'Add a visit or clear filters.',
      );
  String get deleteAppointment =>
      _t(ar: 'حذف الموعد؟', fr: 'Supprimer le rendez-vous ?', en: 'Delete appointment?');
  String get appointmentDeleted =>
      _t(ar: 'تم حذف الموعد', fr: 'Rendez-vous supprimé', en: 'Appointment deleted');
  String get doctorName => _t(ar: 'الطبيبة / العيادة', fr: 'Médecin / clinique', en: 'Doctor / clinic');
  String get specialty => _t(ar: 'التخصص', fr: 'Spécialité', en: 'Specialty');
  String get location => _t(ar: 'المكان', fr: 'Lieu', en: 'Location');
  String get notes => _t(ar: 'ملاحظات', fr: 'Notes', en: 'Notes');
  String get date => _t(ar: 'التاريخ', fr: 'Date', en: 'Date');
  String get time => _t(ar: 'الوقت', fr: 'Heure', en: 'Time');
  String get status => _t(ar: 'الحالة', fr: 'Statut', en: 'Status');

  // Health
  String get latest => _t(ar: 'الأحدث', fr: 'Dernier', en: 'Latest');
  String get change => _t(ar: 'التغيّر', fr: 'Variation', en: 'Change');
  String get progress => _t(ar: 'التقدّم', fr: 'Progression', en: 'Progress');
  String get history => _t(ar: 'السجل', fr: 'Historique', en: 'History');
  String get deleteEntry =>
      _t(ar: 'حذف السجل؟', fr: 'Supprimer l\'entrée ?', en: 'Delete entry?');
  String get noSymptoms =>
      _t(ar: 'لا أعراض مسجّلة', fr: 'Aucun symptôme', en: 'No symptoms logged');
  String get noSymptomsHint => _t(
        ar: 'تتبّعي كيف يشعر جسدكِ يوماً بيوم.',
        fr: 'Suivez comment votre corps se sent au fil des jours.',
        en: 'Track how your body feels day to day.',
      );
  String get deleteSymptom =>
      _t(ar: 'حذف العرض؟', fr: 'Supprimer le symptôme ?', en: 'Delete symptom?');
  String get symptom => _t(ar: 'العرض', fr: 'Symptôme', en: 'Symptom');
  String get severity => _t(ar: 'الشدة', fr: 'Intensité', en: 'Severity');
  String get noMoods => _t(ar: 'لا مزاج بعد', fr: 'Pas encore d\'humeur', en: 'No moods yet');
  String get noMoodsHint => _t(
        ar: 'سجّلي كيف تشعرين اليوم.',
        fr: 'Notez comment vous vous sentez aujourd\'hui.',
        en: 'Log how you feel today.',
      );
  String get deleteMood =>
      _t(ar: 'حذف المزاج؟', fr: 'Supprimer l\'humeur ?', en: 'Delete mood?');
  String get noMedications =>
      _t(ar: 'لا أدوية', fr: 'Aucun médicament', en: 'No medications');
  String get noMedicationsHint => _t(
        ar: 'أضيفي الفيتامينات والوصفات للمتابعة.',
        fr: 'Ajoutez vitamines et ordonnances à suivre.',
        en: 'Add vitamins and prescriptions to track.',
      );
  String get deleteMedication =>
      _t(ar: 'حذف الدواء؟', fr: 'Supprimer le médicament ?', en: 'Delete medication?');
  String takenOfCount(int taken, int total) => _t(
        ar: '$taken من $total تم تناولها',
        fr: '$taken sur $total prises',
        en: '$taken of $total taken',
      );
  String get medName => _t(ar: 'الاسم', fr: 'Nom', en: 'Name');
  String get dosage =>
      _t(ar: 'الجرعة (مثال: قرص واحد)', fr: 'Dosage (ex. 1 comprimé)', en: 'Dosage (e.g. 1 tablet)');
  String get schedule =>
      _t(ar: 'الجدول (مثال: مساءً)', fr: 'Horaire (ex. Soir)', en: 'Schedule (e.g. Evening)');
  String get remove => _t(ar: 'إزالة', fr: 'Retirer', en: 'Remove');
  String get addGlass => _t(ar: 'أضيفي كأساً', fr: 'Ajouter un verre', en: 'Add glass');
  String get dailyGoal => _t(ar: 'الهدف اليومي', fr: 'Objectif du jour', en: 'Daily goal');
  String glassesProgress(int glasses, int goal) => _t(
        ar: '$glasses / $goal كؤوس',
        fr: '$glasses / $goal verres',
        en: '$glasses / $goal glasses',
      );
  String get logWeight => _t(ar: 'تسجيل الوزن', fr: 'Enregistrer le poids', en: 'Log weight');

  // Baby
  String get organsDeveloping =>
      _t(ar: 'الأعضاء النامية', fr: 'Organes en développement', en: 'Organs developing');
  String get milestones => _t(ar: 'المعالم', fr: 'Étapes', en: 'Milestones');
  String get length => _t(ar: 'الطول', fr: 'Longueur', en: 'Length');
  String get heartbeat => _t(ar: 'نبض القلب', fr: 'Battements', en: 'Heartbeat');
  String get babyNames => _t(ar: 'أسماء الأطفال', fr: 'Prénoms', en: 'Baby names');
  String get noNamesHere =>
      _t(ar: 'لا أسماء هنا', fr: 'Aucun prénom ici', en: 'No names here');
  String get girl => _t(ar: 'بنت', fr: 'Fille', en: 'Girl');
  String get boy => _t(ar: 'ولد', fr: 'Garçon', en: 'Boy');
  String get all => _t(ar: 'الكل', fr: 'Tous', en: 'All');
  String get favorites => _t(ar: 'المفضلة', fr: 'Favoris', en: 'Favorites');
  String get weekLabel => _t(ar: 'الأسبوع', fr: 'Semaine', en: 'Week');
  String aboutSizeOf(String fruit) => _t(
        ar: 'بحجم تقريباً $fruit',
        fr: 'Environ la taille d\'un $fruit',
        en: 'About the size of a $fruit',
      );

  // Articles
  String get searchArticles =>
      _t(ar: 'ابحثي في المقالات…', fr: 'Rechercher des articles…', en: 'Search articles…');
  String get recommended => _t(ar: 'موصى به', fr: 'Recommandés', en: 'Recommended');
  String get noArticles =>
      _t(ar: 'لا مقالات', fr: 'Aucun article', en: 'No articles');
  String get noArticlesHint => _t(
        ar: 'جرّبي تصنيفاً آخر أو امسحي البحث.',
        fr: 'Essayez une autre catégorie ou effacez la recherche.',
        en: 'Try another category or clear your search.',
      );
  String get article => _t(ar: 'مقالة', fr: 'Article', en: 'Article');
  String get articleNotFound =>
      _t(ar: 'المقالة غير موجودة', fr: 'Article introuvable', en: 'Article not found');
  String get articleNotFoundHint => _t(
        ar: 'قد تكون أُزيلت من هذه الجلسة.',
        fr: 'Il a peut-être été retiré de cette session.',
        en: 'It may have been removed from this session.',
      );
  String get like => _t(ar: 'إعجاب', fr: 'J\'aime', en: 'Like');
  String likesCount(int n) => _t(
        ar: '$n إعجاب',
        fr: '$n j\'aime',
        en: '$n likes',
      );

  // Profile shortcuts
  String get shortcutStore => _t(ar: 'المتجر', fr: 'Boutique', en: 'Store');
  String get shortcutStoreSub => _t(
        ar: 'أساسيات الأم والطفل',
        fr: 'Essentiels maman & bébé',
        en: 'Mother & baby essentials',
      );
  String get shortcutChats => _t(ar: 'غرف الدردشة', fr: 'Salons', en: 'Chat rooms');
  String get shortcutChatsSub => _t(
        ar: 'دوائر أمهات داعمة',
        fr: 'Cercles de mamans bienveillants',
        en: 'Supportive mom circles',
      );
  String get shortcutBaby => _t(ar: 'الطفل', fr: 'Bébé', en: 'Baby');
  String get shortcutBabySub =>
      _t(ar: 'النمو والمعالم', fr: 'Croissance & étapes', en: 'Growth & milestones');
  String get shortcutNames => _t(ar: 'أسماء الأطفال', fr: 'Prénoms', en: 'Baby names');
  String get shortcutNamesSub =>
      _t(ar: 'مفضلة وإلهام', fr: 'Favoris & inspiration', en: 'Favorites & inspiration');
  String get shortcutAppts => _t(ar: 'المواعيد', fr: 'Rendez-vous', en: 'Appointments');
  String get shortcutApptsSub =>
      _t(ar: 'زيارات وتذكيرات', fr: 'Visites & rappels', en: 'Visits & reminders');
  String get shortcutMeds => _t(ar: 'الأدوية', fr: 'Médicaments', en: 'Medications');
  String get shortcutMedsSub =>
      _t(ar: 'فيتامينات وجدول', fr: 'Vitamines & planning', en: 'Vitamins & schedule');
  String get shortcutSettings => _t(ar: 'الإعدادات', fr: 'Paramètres', en: 'Settings');
  String get shortcutSettingsSub =>
      _t(ar: 'اللغة والتنبيهات', fr: 'Langue & alertes', en: 'Language & alerts');
  String get shortcutNotifs => _t(ar: 'الإشعارات', fr: 'Notifications', en: 'Notifications');
  String get shortcutNotifsSub =>
      _t(ar: 'الوارد والتذكيرات', fr: 'Boîte & rappels', en: 'Inbox & reminders');

  // Journey extras
  String get journeySubtitle => _t(
        ar: 'إرشاد أسبوع بأسبوع لكِ وطفلكِ',
        fr: 'Conseils semaine par semaine pour vous et bébé',
        en: 'Week-by-week guidance for you and baby',
      );

  // Community extras
  String get createPost => _t(ar: 'إنشاء منشور', fr: 'Créer un post', en: 'Create post');
  String get writeSomethingFirst =>
      _t(ar: 'اكتبي شيئاً أولاً', fr: 'Écrivez quelque chose d\'abord', en: 'Write something first');
  String get postShared => _t(ar: 'تم نشر المنشور', fr: 'Post publié', en: 'Post shared');

  // Baby names extras
  String get unisex => _t(ar: 'مشترك', fr: 'Unisexe', en: 'Unisex');
  String get tapHeartToSave => _t(
        ar: 'اضغطي على القلب لحفظ الاسم.',
        fr: 'Appuyez sur le cœur pour enregistrer un prénom.',
        en: 'Tap the heart on a name to save it.',
      );
  String get tryAnotherFilter => _t(
        ar: 'جرّبي فلتراً آخر لاستكشاف الأسماء.',
        fr: 'Essayez un autre filtre pour explorer les prénoms.',
        en: 'Try another filter to explore names.',
      );
  String get favorite => _t(ar: 'مفضلة', fr: 'Favori', en: 'Favorite');
  String get unfavorite => _t(ar: 'إزالة من المفضلة', fr: 'Retirer des favoris', en: 'Unfavorite');

  // Notifications extras
  String get markAllRead =>
      _t(ar: 'تحديد الكل كمقروء', fr: 'Tout marquer comme lu', en: 'Mark all read');
  String get allMarkedRead =>
      _t(ar: 'تم تحديد الكل كمقروء', fr: 'Tout a été marqué comme lu', en: 'All marked as read');
  String get clearAllMessage => _t(
        ar: 'إزالة كل الإشعارات من هذه القائمة؟',
        fr: 'Supprimer toutes les notifications de cette liste ?',
        en: 'Remove every notification from this list?',
      );
  String get notificationsCleared =>
      _t(ar: 'تم حذف الإشعارات', fr: 'Notifications supprimées', en: 'Notifications cleared');

  // Weight extras
  String get addTwoEntriesChart => _t(
        ar: 'أضيفي سجلّين على الأقل لرؤية الرسم البياني',
        fr: 'Ajoutez au moins deux entrées pour voir le graphique',
        en: 'Add at least two entries to see the chart',
      );
  String get noWeightEntries =>
      _t(ar: 'لا سجلات وزن بعد', fr: 'Aucune entrée de poids', en: 'No weight entries yet');
  String get weightDeleted => _t(ar: 'تم حذف الوزن', fr: 'Poids supprimé', en: 'Weight deleted');
  String get editWeight => _t(ar: 'تعديل الوزن', fr: 'Modifier le poids', en: 'Edit weight');
  String get enterValidWeight =>
      _t(ar: 'أدخلي وزناً صحيحاً', fr: 'Entrez un poids valide', en: 'Enter a valid weight');
  String get weightSaved => _t(ar: 'تم حفظ الوزن', fr: 'Poids enregistré', en: 'Weight saved');
  String get weightUpdated => _t(ar: 'تم تحديث الوزن', fr: 'Poids mis à jour', en: 'Weight updated');

  // Symptoms extras
  String get addSymptom => _t(ar: 'إضافة عرض', fr: 'Ajouter un symptôme', en: 'Add symptom');
  String get symptomDeleted =>
      _t(ar: 'تم حذف العرض', fr: 'Symptôme supprimé', en: 'Symptom deleted');
  String get logSymptom => _t(ar: 'تسجيل عرض', fr: 'Enregistrer un symptôme', en: 'Log symptom');
  String get editSymptom => _t(ar: 'تعديل العرض', fr: 'Modifier le symptôme', en: 'Edit symptom');
  String get symptomSaved =>
      _t(ar: 'تم حفظ العرض', fr: 'Symptôme enregistré', en: 'Symptom saved');
  String get symptomUpdated =>
      _t(ar: 'تم تحديث العرض', fr: 'Symptôme mis à jour', en: 'Symptom updated');

  // Mood extras
  String get addMood => _t(ar: 'إضافة مزاج', fr: 'Ajouter une humeur', en: 'Add mood');
  String get moodDeleted => _t(ar: 'تم حذف المزاج', fr: 'Humeur supprimée', en: 'Mood deleted');
  String get howAreYouFeeling =>
      _t(ar: 'كيف تشعرين؟', fr: 'Comment vous sentez-vous ?', en: 'How are you feeling?');
  String get editMood => _t(ar: 'تعديل المزاج', fr: 'Modifier l\'humeur', en: 'Edit mood');
  String get saveMood => _t(ar: 'حفظ المزاج', fr: 'Enregistrer l\'humeur', en: 'Save mood');
  String get moodSaved => _t(ar: 'تم حفظ المزاج', fr: 'Humeur enregistrée', en: 'Mood saved');
  String get moodUpdated =>
      _t(ar: 'تم تحديث المزاج', fr: 'Humeur mise à jour', en: 'Mood updated');

  // Medications extras
  String get addMedication =>
      _t(ar: 'إضافة دواء', fr: 'Ajouter un médicament', en: 'Add medication');
  String get markedNotTaken =>
      _t(ar: 'تم التحديد كغير مأخوذ', fr: 'Marqué comme non pris', en: 'Marked as not taken');
  String get markedTaken =>
      _t(ar: 'تم التحديد كمأخوذ', fr: 'Marqué comme pris', en: 'Marked as taken');
  String get editMedication =>
      _t(ar: 'تعديل الدواء', fr: 'Modifier le médicament', en: 'Edit medication');
  String get enterAName => _t(ar: 'أدخلي اسماً', fr: 'Entrez un nom', en: 'Enter a name');
  String get oneDose => _t(ar: 'جرعة واحدة', fr: '1 dose', en: '1 dose');
  String get defaultDaily => _t(ar: 'يومياً', fr: 'Quotidien', en: 'Daily');
  String get medicationDeleted =>
      _t(ar: 'تم حذف الدواء', fr: 'Médicament supprimé', en: 'Medication deleted');
  String get medicationSaved =>
      _t(ar: 'تم حفظ الدواء', fr: 'Médicament enregistré', en: 'Medication saved');
  String get medicationUpdated =>
      _t(ar: 'تم تحديث الدواء', fr: 'Médicament mis à jour', en: 'Medication updated');

  // Hydration extras
  String ofGoalGlasses(int goal) => _t(
        ar: 'من $goal كأس',
        fr: 'sur $goal verres',
        en: 'of $goal glasses',
      );
  String get goalReached => _t(
        ar: 'تم الوصول للهدف — عمل رائع',
        fr: 'Objectif atteint — beau travail',
        en: 'Goal reached — beautiful work',
      );
  String moreToGo(int n) => _t(
        ar: '$n متبقية للوصول للهدف',
        fr: '$n de plus pour atteindre l\'objectif',
        en: '$n more to go',
      );
  String get glassRemoved => _t(ar: 'تمت إزالة الكأس', fr: 'Verre retiré', en: 'Glass removed');
  String get glassAdded => _t(ar: 'تمت إضافة الكأس', fr: 'Verre ajouté', en: 'Glass added');
  String get hydrationTip => _t(
        ar: 'اشربي الماء بانتظام خلال اليوم — الكؤوس الصغيرة مهمة أيضاً.',
        fr: 'Buvez régulièrement dans la journée — chaque petit verre compte.',
        en: 'Sip steadily through the day — small glasses count.',
      );

  // Appointments extras
  String get searchApptHint => _t(
        ar: 'بحث بالعنوان أو الطبيبة…',
        fr: 'Rechercher un titre ou un médecin…',
        en: 'Search title or doctor…',
      );
  String get requiredFieldsAppt => _t(
        ar: 'العنوان والطبيبة والمستشفى مطلوبة',
        fr: 'Titre, médecin et hôpital sont requis',
        en: 'Title, doctor and hospital are required',
      );
  String get appointmentSaved =>
      _t(ar: 'تم حفظ الموعد', fr: 'Rendez-vous enregistré', en: 'Appointment saved');
  String get appointmentUpdated =>
      _t(ar: 'تم تحديث الموعد', fr: 'Rendez-vous mis à jour', en: 'Appointment updated');
  String get apptTitleLabel => _t(ar: 'العنوان', fr: 'Titre', en: 'Title');
  String get doctorLabel => _t(ar: 'الطبيبة', fr: 'Médecin', en: 'Doctor');
  String get hospitalLabel => _t(ar: 'المستشفى / العيادة', fr: 'Hôpital / clinique', en: 'Hospital');

  // Articles extras
  String get mentalHealth => _t(ar: 'الصحة النفسية', fr: 'Santé mentale', en: 'Mental Health');
  String get babyDevelopment =>
      _t(ar: 'نمو الطفل', fr: 'Développement du bébé', en: 'Baby Development');
  String get delivery => _t(ar: 'الولادة', fr: 'Accouchement', en: 'Delivery');
  String get breastfeeding =>
      _t(ar: 'الرضاعة الطبيعية', fr: 'Allaitement', en: 'Breastfeeding');
  String get trending => _t(ar: 'الأكثر تداولاً', fr: 'Tendances', en: 'Trending');
  String get newest => _t(ar: 'الأحدث', fr: 'Plus récents', en: 'Newest');
  String get bookmarks => _t(ar: 'المحفوظات', fr: 'Favoris', en: 'Bookmarks');
  String byAuthor(String name) => _t(ar: 'بقلم $name', fr: 'Par $name', en: 'By $name');
  String reviewedByLabel(String name) =>
      _t(ar: 'راجعته $name', fr: 'Révisé par $name', en: 'Reviewed by $name');
  String get liked => _t(ar: 'تم الإعجاب', fr: 'Aimé', en: 'Liked');

  // Settings extras
  String get premiumUnlockBody => _t(
        ar: 'افتحي رؤى أعمق، قوائم أسماء غير محدودة، وصوتاً هادئاً.',
        fr: 'Débloquez des insights approfondis, des listes de prénoms illimitées et des sons apaisants.',
        en: 'Unlock deeper insights, unlimited name lists, and calm audio.',
      );

  // Profile extras
  String get yearsUnit => _t(ar: 'سنة', fr: 'ans', en: 'years');
  String get active => _t(ar: 'نشط', fr: 'Actif', en: 'Active');

  /// Localize catalog mood keys stored in English in mock data.
  String moodLabel(String key) => switch (key.toLowerCase()) {
        'happy' => _t(ar: 'سعيدة', fr: 'Heureuse', en: 'Happy'),
        'calm' => _t(ar: 'هادئة', fr: 'Calme', en: 'Calm'),
        'tired' => _t(ar: 'متعبة', fr: 'Fatiguée', en: 'Tired'),
        'anxious' => _t(ar: 'قلقة', fr: 'Anxieuse', en: 'Anxious'),
        'excited' => _t(ar: 'متحمّسة', fr: 'Enthousiaste', en: 'Excited'),
        'sad' => _t(ar: 'حزينة', fr: 'Triste', en: 'Sad'),
        _ => key,
      };

  String symptomLabel(String key) => switch (key.toLowerCase()) {
        'morning sickness' =>
          _t(ar: 'غثيان الصباح', fr: 'Nausées matinales', en: 'Morning sickness'),
        'back pain' => _t(ar: 'ألم الظهر', fr: 'Mal de dos', en: 'Back pain'),
        'fatigue' => _t(ar: 'إرهاق', fr: 'Fatigue', en: 'Fatigue'),
        'headache' => _t(ar: 'صداع', fr: 'Mal de tête', en: 'Headache'),
        'mood swings' =>
          _t(ar: 'تقلبات مزاج', fr: 'Sautes d\'humeur', en: 'Mood swings'),
        'leg cramps' =>
          _t(ar: 'تشنجات الساق', fr: 'Crampes aux jambes', en: 'Leg cramps'),
        'heartburn' => _t(ar: 'حرقة المعدة', fr: 'Brûlures d\'estomac', en: 'Heartburn'),
        _ => key,
      };

  String severityLabel(String key) => switch (key.toLowerCase()) {
        'mild' => _t(ar: 'خفيف', fr: 'Léger', en: 'Mild'),
        'moderate' => _t(ar: 'متوسط', fr: 'Modéré', en: 'Moderate'),
        'severe' => _t(ar: 'شديد', fr: 'Sévère', en: 'Severe'),
        _ => key,
      };

  String topicLabel(String key) => switch (key.toLowerCase()) {
        'all' => all,
        'cravings' => _t(ar: 'الرغبات', fr: 'Envies', en: 'Cravings'),
        'support' => _t(ar: 'دعم', fr: 'Soutien', en: 'Support'),
        'symptoms' => symptoms,
        'nutrition' => nutrition,
        'general' => _t(ar: 'عام', fr: 'Général', en: 'General'),
        _ => key,
      };

  String achievementLabel(String key) => switch (key) {
        'Week 20' => _t(ar: 'الأسبوع 20', fr: 'Semaine 20', en: 'Week 20'),
        'First kick' => _t(ar: 'أول ركلة', fr: 'Premier coup', en: 'First kick'),
        'Ultrasound day' =>
          _t(ar: 'يوم السونار', fr: 'Jour d\'échographie', en: 'Ultrasound day'),
        'Hydration streak' =>
          _t(ar: 'سلسلة شرب الماء', fr: 'Série hydratation', en: 'Hydration streak'),
        'Mood logger' =>
          _t(ar: 'تسجيل المزاج', fr: 'Journal d\'humeur', en: 'Mood logger'),
        _ => key,
      };

  List<String> get moodCatalog =>
      const ['Happy', 'Calm', 'Tired', 'Anxious', 'Excited', 'Sad'];

  List<String> get symptomCatalog => const [
        'Morning sickness',
        'Back pain',
        'Fatigue',
        'Headache',
        'Mood swings',
        'Leg cramps',
        'Heartburn',
      ];

  List<String> get severityCatalog => const ['mild', 'moderate', 'severe'];

  String productDescription(String descriptionEn) => switch (descriptionEn) {
        'Soft support for restful nights.' => _t(
            ar: 'دعم ناعم لليالي مريحة.',
            fr: 'Soutien doux pour des nuits reposantes.',
            en: descriptionEn,
          ),
        'Gentle oil for stretch comfort.' => _t(
            ar: 'زيت لطيف لراحة الجلد أثناء التمدّد.',
            fr: 'Huile douce pour le confort des vergetures.',
            en: descriptionEn,
          ),
        'Breathable blanket for little ones.' => _t(
            ar: 'بطانية قابلة للتنفس للصغير.',
            fr: 'Couverture respirante pour bébé.',
            en: descriptionEn,
          ),
        _ => descriptionEn.isEmpty
            ? ''
            : _t(
                ar: descriptionEn,
                fr: descriptionEn,
                en: descriptionEn,
              ),
      };

  String roomName({required String ar, required String fr, required String en}) =>
      switch (lang) {
        'fr' => fr,
        'en' => en,
        _ => ar,
      };

  String productName({required String ar, required String fr, required String en}) =>
      switch (lang) {
        'fr' => fr,
        'en' => en,
        _ => ar,
      };

  String localized({required String ar, required String fr, required String en}) =>
      switch (lang) {
        'fr' => fr,
        'en' => en,
        _ => ar,
      };

  String _t({required String ar, required String fr, required String en}) {
    switch (lang) {
      case 'fr':
        return fr;
      case 'en':
        return en;
      default:
        return ar;
    }
  }
}

final stringsProvider = Provider<AppStrings>((ref) {
  final code = ref.watch(localeCodeProvider);
  return AppStrings(code);
});
