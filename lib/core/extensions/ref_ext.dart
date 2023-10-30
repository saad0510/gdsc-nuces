import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'context_ext.dart';

extension AsyncUiListener on WidgetRef {
  void listenUiChanges<T>(AsyncNotifierProvider provider) {
    listen(
      provider,
      (prev, next) {
        final prevIsLoading = prev?.isLoading ?? false;
        if (prevIsLoading && context.canPop()) context.pop();
        if (next.isLoading)
          context.showLoading();
        else if (next.hasError) //
          context.showError(next.error);
      },
    );
  }
}
