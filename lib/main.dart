import 'package:flutter/material.dart';
import 'package:ralestate/glitchtext.dart';
import 'package:ralestate/homepage.dart';

void main() {
  runApp(const Splash());
}

class Bgcoloranimation extends StatefulWidget {
  @override
  _BgcoloranimationState createState() => _BgcoloranimationState();
}

class _BgcoloranimationState extends State<Bgcoloranimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {});
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Bgcolormove(animation: _animation);
  }
}

class Bgcolormove extends StatelessWidget {
  const Bgcolormove({
    Key? key,
    required Animation<double> animation,
  })  : _animation = animation,
        super(key: key);

  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: const Color.fromARGB(255, 74, 0, 233),
      value: _animation.value,
      minHeight: double.infinity,
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: [
            Bgcoloranimation(),
            Image.asset(
              'imgs/bg_splash.png',
              fit: BoxFit.cover,
              gaplessPlayback: true,
              filterQuality: FilterQuality.low,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: GlithEffect(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: const Text(
                    'Quick',
                    style:
                        TextStyle(fontSize: 60, color: Colors.white, shadows: [
                      BoxShadow(
                          color: Colors.cyanAccent,
                          offset: Offset(1, 1),
                          blurRadius: 7),
                    ]),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 100, right: 100),
                child: const Text(
                  'Chat',
                  style: TextStyle(fontSize: 35, color: Colors.white, shadows: [
                    BoxShadow(
                        color: Color.fromARGB(234, 255, 64, 0),
                        offset: Offset(1, 1),
                        blurRadius: 3),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
