import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('[CHANGE] ${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('[TRANSITION] ${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('[ERROR] ${bloc.runtimeType} $error');
    print(stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('[CLOSE] ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('[CREATE] ${bloc.runtimeType}');
  }
} 