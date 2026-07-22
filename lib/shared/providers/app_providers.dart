import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../mock/mock_seed.dart';
import '../models/models.dart';

const _uuid = Uuid();

final profileProvider = NotifierProvider<ProfileNotifier, MotherProfile>(ProfileNotifier.new);
final babyProvider = NotifierProvider<BabyNotifier, BabyProfile>(BabyNotifier.new);
final localeCodeProvider = StateProvider<String>((ref) => 'ar');
final onboardingDoneProvider = StateProvider<bool>((ref) => false);

class ProfileNotifier extends Notifier<MotherProfile> {
  @override
  MotherProfile build() => MockSeed.mother;

  void update(MotherProfile profile) => state = profile;

  void setWeek(int week) => state = state.copyWith(currentWeek: week);

  void setDueDate(DateTime date) => state = state.copyWith(dueDate: date);
}

class BabyNotifier extends Notifier<BabyProfile> {
  @override
  BabyProfile build() => MockSeed.baby;

  void update(BabyProfile baby) => state = baby;

  void setName(String name) => state = state.copyWith(name: name.trim());

  void syncWeek(int week) {
    final w = week.clamp(1, 40);
    state = state.copyWith(
      week: w,
      fruitComparison: MockSeed.fruitForWeek(w),
      weightGrams: 100 + w * 15.0,
      lengthCm: 5 + w * 1.05,
    );
  }
}
final appointmentsProvider =
    NotifierProvider<AppointmentsNotifier, List<Appointment>>(AppointmentsNotifier.new);

class AppointmentsNotifier extends Notifier<List<Appointment>> {
  @override
  List<Appointment> build() => MockSeed.appointments();

  void add(Appointment a) => state = [a, ...state];

  void update(Appointment a) =>
      state = [for (final e in state) e.id == a.id ? a : e];

  void delete(String id) => state = state.where((e) => e.id != id).toList();

  void setStatus(String id, AppointmentStatus status) => state = [
        for (final e in state) e.id == id ? e.copyWith(status: status) : e,
      ];
}

final articlesProvider = NotifierProvider<ArticlesNotifier, List<Article>>(ArticlesNotifier.new);

class ArticlesNotifier extends Notifier<List<Article>> {
  @override
  List<Article> build() => MockSeed.articles();

  void toggleBookmark(String id) => state = [
        for (final a in state)
          a.id == id ? a.copyWith(bookmarked: !a.bookmarked) : a,
      ];

  void toggleLike(String id) => state = [
        for (final a in state)
          if (a.id == id)
            a.copyWith(
              liked: !a.liked,
              likes: a.liked ? a.likes - 1 : a.likes + 1,
            )
          else
            a,
      ];
}

final communityProvider =
    NotifierProvider<CommunityNotifier, List<CommunityPost>>(CommunityNotifier.new);

class CommunityNotifier extends Notifier<List<CommunityPost>> {
  @override
  List<CommunityPost> build() => MockSeed.posts();

  void createPost(String content, {String topic = 'general'}) {
    state = [
      CommunityPost(
        id: _uuid.v4(),
        author: 'Sarah A.',
        content: content,
        createdAt: DateTime.now(),
        topic: topic,
      ),
      ...state,
    ];
  }

  void toggleLike(String id) => state = [
        for (final p in state)
          if (p.id == id)
            p.copyWith(
              likedByMe: !p.likedByMe,
              likes: p.likedByMe ? p.likes - 1 : p.likes + 1,
            )
          else
            p,
      ];

  void toggleBookmark(String id) => state = [
        for (final p in state)
          p.id == id ? p.copyWith(bookmarked: !p.bookmarked) : p,
      ];

  void addComment(String postId, String text) => state = [
        for (final p in state)
          if (p.id == postId)
            p.copyWith(
              comments: [
                ...p.comments,
                CommunityComment(
                  id: _uuid.v4(),
                  author: 'You',
                  text: text,
                  createdAt: DateTime.now(),
                  isMine: true,
                ),
              ],
            )
          else
            p,
      ];

  void deleteComment(String postId, String commentId) => state = [
        for (final p in state)
          if (p.id == postId)
            p.copyWith(
              comments: p.comments.where((c) => c.id != commentId).toList(),
            )
          else
            p,
      ];

  void deletePost(String id) => state = state.where((p) => p.id != id).toList();
}

final notificationsProvider =
    NotifierProvider<NotificationsNotifier, List<AppNotification>>(NotificationsNotifier.new);

class NotificationsNotifier extends Notifier<List<AppNotification>> {
  @override
  List<AppNotification> build() => MockSeed.notifications();

  void markRead(String id) => state = [
        for (final n in state) n.id == id ? n.copyWith(read: true) : n,
      ];

  void markAllRead() => state = [for (final n in state) n.copyWith(read: true)];

  void delete(String id) => state = state.where((n) => n.id != id).toList();

  void clearAll() => state = [];
}

final moodsProvider = NotifierProvider<MoodsNotifier, List<MoodEntry>>(MoodsNotifier.new);

class MoodsNotifier extends Notifier<List<MoodEntry>> {
  @override
  List<MoodEntry> build() => MockSeed.moods();

  void add(MoodEntry e) => state = [e, ...state];
  void update(MoodEntry e) => state = [for (final x in state) x.id == e.id ? e : x];
  void delete(String id) => state = state.where((e) => e.id != id).toList();
}

final symptomsProvider =
    NotifierProvider<SymptomsNotifier, List<SymptomEntry>>(SymptomsNotifier.new);

class SymptomsNotifier extends Notifier<List<SymptomEntry>> {
  @override
  List<SymptomEntry> build() => MockSeed.symptoms();

  void add(SymptomEntry e) => state = [e, ...state];
  void update(SymptomEntry e) => state = [for (final x in state) x.id == e.id ? e : x];
  void delete(String id) => state = state.where((e) => e.id != id).toList();
}

final weightsProvider =
    NotifierProvider<WeightsNotifier, List<WeightEntry>>(WeightsNotifier.new);

class WeightsNotifier extends Notifier<List<WeightEntry>> {
  @override
  List<WeightEntry> build() => MockSeed.weights();

  void add(WeightEntry e) => state = [...state, e]..sort((a, b) => a.date.compareTo(b.date));
  void update(WeightEntry e) => state = [for (final x in state) x.id == e.id ? e : x];
  void delete(String id) => state = state.where((e) => e.id != id).toList();
}

final medicationsProvider =
    NotifierProvider<MedicationsNotifier, List<Medication>>(MedicationsNotifier.new);

class MedicationsNotifier extends Notifier<List<Medication>> {
  @override
  List<Medication> build() => MockSeed.medications();

  void add(Medication m) => state = [m, ...state];
  void update(Medication m) => state = [for (final x in state) x.id == m.id ? m : x];
  void delete(String id) => state = state.where((e) => e.id != id).toList();
  void toggleTaken(String id) => state = [
        for (final m in state)
          m.id == id ? m.copyWith(takenToday: !m.takenToday) : m,
      ];
}

final hydrationProvider =
    NotifierProvider<HydrationNotifier, HydrationDay>(HydrationNotifier.new);

class HydrationNotifier extends Notifier<HydrationDay> {
  @override
  HydrationDay build() => MockSeed.hydration();

  void addGlass() => state = state.copyWith(glasses: state.glasses + 1);
  void removeGlass() =>
      state = state.copyWith(glasses: state.glasses > 0 ? state.glasses - 1 : 0);
}

final babyNamesProvider =
    NotifierProvider<BabyNamesNotifier, List<BabyName>>(BabyNamesNotifier.new);

class BabyNamesNotifier extends Notifier<List<BabyName>> {
  @override
  List<BabyName> build() => MockSeed.babyNames();

  void toggleFavorite(String id) => state = [
        for (final n in state) n.id == id ? n.copyWith(favorite: !n.favorite) : n,
      ];
}

final weekContentsProvider = Provider<List<WeekContent>>((ref) => MockSeed.weeks());

final selectedWeekProvider = StateProvider<int>((ref) => MockSeed.mother.currentWeek);

final articleFilterProvider = StateProvider<String>((ref) => 'All');
final articleQueryProvider = StateProvider<String>((ref) => '');

final filteredArticlesProvider = Provider<List<Article>>((ref) {
  final all = ref.watch(articlesProvider);
  final filter = ref.watch(articleFilterProvider);
  final q = ref.watch(articleQueryProvider).toLowerCase();
  return all.where((a) {
    final catOk = filter == 'All' || a.category == filter;
    final qOk = q.isEmpty || a.title.toLowerCase().contains(q) || a.summary.toLowerCase().contains(q);
    return catOk && qOk;
  }).toList();
});

final upcomingAppointmentsProvider = Provider<List<Appointment>>((ref) {
  return ref
      .watch(appointmentsProvider)
      .where((a) => a.status == AppointmentStatus.upcoming)
      .toList()
    ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
});

final unreadNotificationsProvider = Provider<int>((ref) {
  return ref.watch(notificationsProvider).where((n) => !n.read).length;
});

final storeProductsProvider = Provider<List<StoreProduct>>((ref) => MockSeed.products());

final cartProvider = NotifierProvider<CartNotifier, List<CartItem>>(CartNotifier.new);

class CartNotifier extends Notifier<List<CartItem>> {
  @override
  List<CartItem> build() => [];

  void add(StoreProduct p) {
    final i = state.indexWhere((e) => e.product.id == p.id);
    if (i >= 0) {
      final item = state[i];
      state = [for (var j = 0; j < state.length; j++) j == i ? item.copyWith(qty: item.qty + 1) : state[j]];
    } else {
      state = [...state, CartItem(product: p)];
    }
  }

  void remove(String id) => state = state.where((e) => e.product.id != id).toList();

  void clear() => state = [];

  double get total => state.fold(0, (s, e) => s + e.product.price * e.qty);
}

final chatRoomsProvider = Provider<List<ChatRoom>>((ref) => MockSeed.chatRooms());

final chatMessagesProvider =
    NotifierProvider.family<ChatMessagesNotifier, List<ChatMessage>, String>(
  ChatMessagesNotifier.new,
);

class ChatMessagesNotifier extends FamilyNotifier<List<ChatMessage>, String> {
  @override
  List<ChatMessage> build(String roomId) => MockSeed.messagesFor(roomId);

  void send(String text) {
    if (text.trim().isEmpty) return;
    final now = DateTime.now();
    state = [
      ...state,
      ChatMessage(
        id: _uuid.v4(),
        author: 'You',
        text: text.trim(),
        time: '${now.hour}:${now.minute.toString().padLeft(2, '0')}',
        isMe: true,
      ),
    ];
  }
}

final premiumProvider = StateProvider<bool>((ref) => false);
