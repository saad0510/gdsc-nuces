import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../app/sizer.dart';
import '../utils/error_screen.dart';
import '../utils/errors.dart';
import '../utils/loading_widget.dart';

extension NavExtOnContext on BuildContext {
  void pushTo(Widget screen) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  void push(AppRoutes appRoute) {
    Navigator.of(this).pushNamed(appRoute.name);
  }

  void replace(AppRoutes appRoute) {
    Navigator.of(this).pushReplacementNamed(appRoute.name);
  }

  void replaceAll(AppRoutes appRoute) {
    final navigator = Navigator.of(this);
    while (navigator.canPop()) navigator.pop();
    navigator.pushReplacementNamed(appRoute.name);
  }

  bool canPop() {
    return Navigator.of(this).canPop();
  }

  void pop([dynamic result]) {
    Navigator.of(this).pop(result);
  }

  void popTillFirst() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }
}

extension WidgetsExtOnContext on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.grey,
    Color foregroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(color: foregroundColor)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
        ),
      );
  }

  dynamic showError(dynamic error) {
    if (error == AppErrors.ignore) return;
    showModalBottomSheet(
      context: this,
      constraints: BoxConstraints(maxHeight: 400.h),
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: ErrorScreen(error: error),
      ),
    );
  }

  void showLoading() {
    showDialog(
      context: this,
      builder: (context) {
        return const Center(
          child: LoadingWidget(),
        );
      },
    );
  }

  void showLoadingUntil<T>(Future<T> future, {Function(T)? then}) {
    bool dismissed = false;

    var hook = Future.value(future);
    hook = hook.whenComplete(() => dismissed ? null : pop());
    if (then != null) hook = hook.then((x) => then(x));
    hook = hook.catchError(showError);

    showDialog(
      context: this,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            dismissed = true;
            return true;
          },
          child: const Center(
            child: LoadingWidget(),
          ),
        );
      },
    );
  }
}
