import 'package:flutter/cupertino.dart';

class DefaultPageRouter extends PageRouteBuilder {
  final Widget widget;

  DefaultPageRouter({required this.widget})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
}
