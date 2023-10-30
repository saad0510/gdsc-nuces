import 'dart:developer' show log;

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLogger implements ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final title = provider.name?.toUpperCase() ?? provider.runtimeType;
    log('$title initialized with ${formatValue(value)}');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    final title = provider.name?.toUpperCase() ?? provider.runtimeType;
    log('$title disposed');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final title = provider.name?.toUpperCase() ?? provider.runtimeType;
    log('$title updated with ${formatValue(newValue)}');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final title = provider.name?.toUpperCase() ?? provider.runtimeType;
    log('$title failed');
  }

  Object? formatValue(Object? value) {
    if (value is! AsyncValue) return value;
    if (value.isLoading) return const AsyncLoading();
    final hasError = value.asError?.hasError ?? false;
    if (hasError) return value;
    return value.asData?.value;
  }
}
