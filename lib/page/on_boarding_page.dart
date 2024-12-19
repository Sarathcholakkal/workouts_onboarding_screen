import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: isLastPage
          ? TextButton(onPressed: () {}, child: Text("last page"))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(2);
                      },
                      child: Text("skip")),
                  SmoothPageIndicator(
                      controller: _pageController, // PageController
                      count: 3,
                      effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.green,
                          dotHeight: 6,
                          dotWidth: 30), // your preferred effect
                      onDotClicked: (index) {
                        _pageController.animateToPage(index,
                            duration: Duration(microseconds: 300),
                            curve: Curves.bounceIn);
                      }),
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: Duration(microseconds: 400),
                          curve: Curves.bounceOut);
                    },
                    child: const Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              ),
            ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            Container(
              //! each container can turn in to full length page
              color: Colors.red,
              child: Column(
                children: [
                  Container(
                    child: LottieBuilder.network(
                        'https://lottie.host/c6bde638-b290-4801-a620-3372a1922244/DXxpdDdFnb.json'),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  "page 2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.orange,
              child: const Center(
                child: Text(
                  "page 3",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
