import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_colors.dart';
import 'core/theme/app_theme.dart';
import 'router/app_router.dart';
import 'shared/providers/app_providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint('FlutterError: ${details.exceptionAsString()}');
  };

  ErrorWidget.builder = (details) {
    return Material(
      color: AppColors.background,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            kDebugMode
                ? 'UI error:\n${details.exceptionAsString()}'
                : 'Something went wrong. Please restart.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.textPrimary),
          ),
        ),
      ),
    );
  };

  runApp(const ProviderScope(child: MamytoApp()));
}

class MamytoApp extends ConsumerWidget {
  const MamytoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(localeCodeProvider);
    final locale = Locale(code);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'MAMYTO',
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: const [Locale('ar'), Locale('fr'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.light(locale: locale),
      routerConfig: router,
      builder: (context, child) => Directionality(
        textDirection: code == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
