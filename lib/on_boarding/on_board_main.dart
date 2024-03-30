import 'package:firebase_login/medico_home.dart';
import 'package:firebase_login/on_boarding/pages/onboard_one.dart';
import 'package:firebase_login/on_boarding/pages/onboard_three.dart';
import 'package:firebase_login/on_boarding/pages/onboard_two.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MedicoOnboardHome extends StatefulWidget {
  const MedicoOnboardHome({super.key});

  @override
  State<MedicoOnboardHome> createState() => _MedicoOnboardHomeState();
}

class _MedicoOnboardHomeState extends State<MedicoOnboardHome> {
  // page view controller
  PageController controller = PageController();

  // page state
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // page view
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                lastPage = (index == 2);
                // lastpage = (0==2)
                // lastpage = (1==2)
                // lastpage = (2==2)
                // lastpage = true
              });
            },
            children: const [
              OnboardOne(),
              OnboardTwo(),
              OnboardThree(),
            ],
          ),

          // dot indicator
          Container(
            alignment: const Alignment(0, 0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // skip button
                GestureDetector(
                  onTap: () {
                    controller.jumpToPage(2);
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),

                // smooth indicator
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 7,
                    dotWidth: 16,
                    type: WormType.underground,
                  ),
                ),

                // text
                lastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const MedicoHomeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Done",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 100,
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 15),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 3),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
