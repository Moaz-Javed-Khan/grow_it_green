import 'package:flutter/material.dart';

class ThankYouView extends StatefulWidget {
  const ThankYouView({
    super.key,
  });

  @override
  State<ThankYouView> createState() => _ThankYouViewState();
}

class _ThankYouViewState extends State<ThankYouView> {
  double initailHeight = 100.0;
  AlignmentGeometry alignment = Alignment.centerRight;

  @override
  void initState() {
    super.initState();
    sizeChange();
    alignmentChange();
  }

  Future<void> alignmentChange() async {
    await Future.delayed(const Duration(milliseconds: 2700));
    setState(() {
      alignment = Alignment.center;
    });
  }

  Future<void> sizeChange() async {
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      initailHeight = 250;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);

        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: Column(
              children: [
                const Spacer(),
                //AnimatedContainer
                //AnimatedAlign
                AnimatedAlign(
                  duration: const Duration(seconds: 2),
                  curve: Curves.bounceOut,
                  alignment: alignment,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.bounceOut,
                    height: initailHeight,
                    child: Image.asset(
                      "assets/images/ty.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);

                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomePage(),
                    //   ),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70.0,
                    alignment: Alignment.center,
                    color: Colors.lightGreen,
                    child: const Text(
                      "Back to Home",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
