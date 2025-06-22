import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView='/homeview';
  static final router=GoRouter(
       routes: [
        GoRoute(path: 
        '/',
        builder: (context,state)=> const SplashView()
        ),
          GoRoute(path: 
        kHomeView,
        builder: (context,state)=> const SplashView()  
        ),
       ]
    );

}
