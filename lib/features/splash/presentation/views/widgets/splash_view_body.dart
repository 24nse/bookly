import 'package:bookly/conastans.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override 
  void initState() {
       super.initState();
    initSlidingAnimation();
    navigateToHome();

  }




  @override
  void dispose() {
animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4),
        SlidingText(slidingAnimation: slidingAnimation),
        
      ],
    );
  }
    void initSlidingAnimation() {
       animationController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    );
    slidingAnimation=  Tween<Offset>(begin:const Offset(0, 1  ),end: Offset.zero).animate(animationController);
    animationController.forward();
  }
  
  void navigateToHome() {
       Future.delayed(const Duration(seconds: 3),(){
        GoRouter.of(context).push(AppRouter.kHomeView);
      // Get.to(()=>const HomeView(),transition: Transition.fade, duration: kTranstionDuration);
    });
  }
}
