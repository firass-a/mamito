import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String dmy([String? locale]) =>
      DateFormat('dd MMM yyyy', locale).format(this);
  String hm([String? locale]) => DateFormat('HH:mm', locale).format(this);
  String weekdayShort([String? locale]) =>
      DateFormat('EEE', locale).format(this);
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}

extension StringX on String {
  String get initials {
    final parts = trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.characters.first.toUpperCase();
    return (parts.first.characters.first + parts.last.characters.first)
        .toUpperCase();
  }
}

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  MediaQueryData get mq => MediaQuery.of(this);

  void showSnack(String message, {bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? const Color(0xFFE57373) : null,
      ),
    );
  }

  Future<bool> confirmDelete({
    String? title,
    String? message,
    String? cancelLabel,
    String? deleteLabel,
  }) async {
    final result = await showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text(title ?? 'Delete?'),
        content: Text(
          message ?? 'This action cannot be undone in this session.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(cancelLabel ?? 'Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(deleteLabel ?? 'Delete'),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
