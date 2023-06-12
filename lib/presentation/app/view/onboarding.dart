import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/app/provider/app_provider.dart';
import 'package:grow_it_green/presentation/app/view/onboardingContent.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const Onboarding(),
      );

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 300.0,
                      ),
                      Text(
                        contents[i].title,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, currentIndex, context),
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            margin: const EdgeInsets.all(40),
            child: SizedBox(
              // height: 5,
              child: TextButton(
                style: TextButton.styleFrom(
                  // fixedSize: const Size(300, 100),
                  // fixedSize: const Size.fromHeight(10),
                  backgroundColor: Colors.lightGreen,
                ),
                child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    context.read<AppProvider>().onboardingCompleted();
                    // Navigator.push(
                    //   context,
                    //   // MaterialPageRoute(builder: (_) => const HomeScreen()),
                    //   MaterialPageRoute(builder: (_) => const SignUpView()),
                    // );
                  }
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 120),
                    curve: Curves.linear,
                  );
                },
              ),
            ),
            // FlatButton(
            //   // ignore: sort_child_properties_last
            //   child: Text(
            //       currentIndex == contents.length - 1 ? "Continue" : "Next"),
            //   onPressed: () {},
            //   color: ,
            //   textColor: Colors.white,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

Container buildDot(int index, int currentIndex, BuildContext context) {
  return Container(
    height: 10,
    width: currentIndex == index ? 25 : 10,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.lightGreen,
    ),
  );
}




















// class buildDot extends StatelessWidget {
//   const buildDot({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 10,
//       width: 10,
//       margin: EdgeInsets.only(right: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.lightGreen,
//       ),
//     );
//   }
// }
