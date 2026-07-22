import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/widgets/bottom_nav.dart';
import '../features/appointments/presentation/screens/appointment_form_screen.dart';
import '../features/appointments/presentation/screens/appointments_screen.dart';
import '../features/articles/presentation/screens/article_detail_screen.dart';
import '../features/articles/presentation/screens/articles_screen.dart';
import '../features/auth/presentation/screens/auth_screen.dart';
import '../features/auth/presentation/screens/language_screen.dart';
import '../features/auth/presentation/screens/onboarding_screen.dart';
import '../features/auth/presentation/screens/profile_setup_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/baby/presentation/screens/baby_screen.dart';
import '../features/chat/presentation/screens/chat_rooms_screen.dart';
import '../features/chat/presentation/screens/chat_screen.dart';
import '../features/community/presentation/screens/community_screen.dart';
import '../features/dashboard/presentation/screens/home_screen.dart';
import '../features/health/presentation/screens/hydration_screen.dart';
import '../features/health/presentation/screens/medications_screen.dart';
import '../features/health/presentation/screens/mood_screen.dart';
import '../features/health/presentation/screens/symptoms_screen.dart';
import '../features/health/presentation/screens/weight_screen.dart';
import '../features/notifications/presentation/screens/notifications_screen.dart';
import '../features/pregnancy/presentation/screens/journey_screen.dart';
import '../features/profile/presentation/screens/baby_names_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/settings/presentation/screens/settings_screen.dart';
import '../features/store/presentation/screens/cart_screen.dart';
import '../features/store/presentation/screens/checkout_screen.dart';
import '../features/store/presentation/screens/order_thanks_screen.dart';
import '../features/store/presentation/screens/product_detail_screen.dart';
import '../features/store/presentation/screens/store_screen.dart';
import '../shared/providers/app_providers.dart';

final _rootKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final done = ref.watch(onboardingDoneProvider);

  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/splash',
    redirect: (context, state) {
      final loc = state.matchedLocation;
      final authFlow = loc == '/splash' ||
          loc == '/language' ||
          loc == '/onboarding' ||
          loc == '/auth' ||
          loc == '/setup';
      if (!done && !authFlow) return '/splash';
      // Don't kick users out of setup/auth mid-flow even if flags flip oddly
      if (done && (loc == '/splash' || loc == '/language' || loc == '/onboarding' || loc == '/auth')) {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/language', builder: (_, __) => const LanguageScreen()),
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: '/auth', builder: (_, __) => const AuthScreen()),
      GoRoute(path: '/setup', builder: (_, __) => const ProfileSetupScreen()),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
          GoRoute(path: '/journey', builder: (_, __) => const JourneyScreen()),
          GoRoute(path: '/community', builder: (_, __) => const CommunityScreen()),
          GoRoute(path: '/store', builder: (_, __) => const StoreScreen()),
          GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
        ],
      ),
      GoRoute(path: '/resources', builder: (_, __) => const ArticlesScreen()),
      GoRoute(path: '/chats', builder: (_, __) => const ChatRoomsScreen()),
      GoRoute(
        path: '/chat/:id',
        builder: (_, state) => ChatScreen(roomId: state.pathParameters['id']!),
      ),
      GoRoute(path: '/appointments', builder: (_, __) => const AppointmentsScreen()),
      GoRoute(path: '/appointments/form', builder: (_, __) => const AppointmentFormScreen()),
      GoRoute(
        path: '/appointments/form/:id',
        builder: (_, state) => AppointmentFormScreen(id: state.pathParameters['id']),
      ),
      GoRoute(path: '/baby', builder: (_, __) => const BabyScreen()),
      GoRoute(path: '/mood', builder: (_, __) => const MoodScreen()),
      GoRoute(path: '/symptoms', builder: (_, __) => const SymptomsScreen()),
      GoRoute(path: '/weight', builder: (_, __) => const WeightScreen()),
      GoRoute(path: '/hydration', builder: (_, __) => const HydrationScreen()),
      GoRoute(path: '/medications', builder: (_, __) => const MedicationsScreen()),
      GoRoute(path: '/notifications', builder: (_, __) => const NotificationsScreen()),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
      GoRoute(path: '/baby-names', builder: (_, __) => const BabyNamesScreen()),
      GoRoute(
        path: '/article/:id',
        builder: (_, state) => ArticleDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/product/:id',
        builder: (_, state) => ProductDetailScreen(productId: state.pathParameters['id']!),
      ),
      GoRoute(path: '/cart', builder: (_, __) => const CartScreen()),
      GoRoute(path: '/checkout', builder: (_, __) => const CheckoutScreen()),
      GoRoute(path: '/order-thanks', builder: (_, __) => const OrderThanksScreen()),
    ],
  );
});

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});
  final Widget child;

  static const tabs = ['/home', '/journey', '/community', '/store', '/profile'];

  @override
  Widget build(BuildContext context) {
    final loc = GoRouterState.of(context).matchedLocation;
    final index = tabs.indexWhere((t) => loc.startsWith(t));
    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: MamytoBottomNav(
        currentIndex: index < 0 ? 0 : index,
        onTap: (i) => context.go(tabs[i]),
      ),
    );
  }
}
