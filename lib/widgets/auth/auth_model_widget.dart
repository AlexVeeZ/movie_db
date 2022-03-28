import 'package:flutter/cupertino.dart';

class AuthModel extends ChangeNotifier{
  
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static AuthProvider of(BuildContext context) {
    final AuthProvider? result = context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    assert(result != null, 'No AuthProvider found in context');
    return result!;
  }
}