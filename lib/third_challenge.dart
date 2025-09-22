import 'package:flutter/material.dart';

class ThirdChallenge extends StatefulWidget {
  const ThirdChallenge({super.key});

  @override
  State<ThirdChallenge> createState() => _ThirdChallengeState();
}

class _ThirdChallengeState extends State<ThirdChallenge>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimationFirst;
    late Animation<double> sizeAnimationSecond;
    late Animation<double> sizeAnimationThrid;

late Animation<Color?> colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds:2),
    );

    sizeAnimationFirst = Tween<double>(
      begin: 15,
      end:30,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.3, curve: Curves.easeOutBack)
    )
    );
    

    sizeAnimationSecond = Tween<double>(
      begin: 15,
      end:30,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.3, 0.6, curve: Curves.easeOutBack)));
    
    

    sizeAnimationThrid = Tween<double>(
      begin: 15,
      end:30,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.6, 0.9, curve: Curves.easeOutBack)));
    



      colorAnimation = ColorTween(
    begin: Colors.blue.withValues(alpha: 0.4),
    end: Colors.blue,
  ).animate(controller);
    
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            circleAnimatedBuilder(sizeAnimationFirst),
                        circleAnimatedBuilder(sizeAnimationSecond),

            circleAnimatedBuilder(sizeAnimationThrid),

          ],
        ),
      ),
    );
  }

  Widget circleAnimatedBuilder(Animation<double>  sizeAnimation){
    return AnimatedBuilder(
          animation: sizeAnimation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:colorAnimation.value,
              ),
              width: sizeAnimation.value,
              height: sizeAnimation.value,
            );
          },
        );
  }



}

class ThirdChallengeSimpleWay extends StatefulWidget {
  const ThirdChallengeSimpleWay({super.key});

  @override
  State<ThirdChallengeSimpleWay> createState() =>
      _ThirdChallengeSimpleWayState();
}

class _ThirdChallengeSimpleWayState extends State<ThirdChallengeSimpleWay> {
  bool first = true;
  bool second = true;
  bool third = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 200), () {
          setState(() {
            first = false;
          });
        })
        .then((x) {
          Future.delayed(Duration(milliseconds: 300), () {
            setState(() {
              second = false;
            });
          });
        })
        .then((v) {
          Future.delayed(Duration(milliseconds: 400), () {
            setState(() {
              third = false;
            });
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              curve: Curves.elasticOut,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: first ? Colors.blue.withValues(alpha: 0.4) : Colors.blue,
              ),
              duration: Duration(seconds: 1),

              width: first ? 20.0 : 50.0,
              height: first ? 20.0 : 50.0,
            ),

            AnimatedContainer(
              curve: Curves.elasticOut,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: second
                    ? Colors.blue.withValues(alpha: 0.4)
                    : Colors.blue,
              ),
              duration: Duration(seconds: 1),

              width: second ? 20.0 : 50.0,
              height: second ? 20.0 : 50.0,
            ),

            AnimatedContainer(
              curve: Curves.elasticOut,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: third ? Colors.blue.withValues(alpha: 0.4) : Colors.blue,
              ),
              duration: Duration(seconds: 1),

              width: third ? 25.0 : 50.0,
              height: third ? 25.0 : 50.0,
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text('Loading animation')),
    );
  }
}
