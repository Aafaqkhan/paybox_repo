import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

import '../routes/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  final int _numPages = 4;

  int _currentPage = 0;

  final List<String> _backgroundImages = [
    'assets/images/Login.png',
    'assets/images/Login-1.png',
    'assets/images/Login-2.png',
    'assets/images/Login-3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _buildPage(index);
            },
            itemCount: _numPages,
          ),
          Positioned.fill(
            child: Image.asset(
              _backgroundImages[_currentPage],
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 30.0,
            // left: 20.0,
            right: 20.0,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ElevatedButton(
                //   onPressed: _currentPage == 0
                //       ? null
                //       : () {
                //           _pageController.previousPage(
                //             duration: const Duration(milliseconds: 500),
                //             curve: Curves.ease,
                //           );
                //         },
                //   child: const Text("PREV"),
                // ),
                // Row(
                //   children: _buildPageIndicator(),
                // ),
                GestureDetector(
                  onTap: _currentPage == _numPages - 1
                      ? () async {
                          // Handle button click on the last page.
                          Get.toNamed(Routes.LOGIN);
                        }
                      : () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColors.maincolor,
                      decoration: TextDecoration.underline,
                      fontFamily: "Mukta",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text(
        //   _titles[index],
        //   style: const TextStyle(
        //       fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.red),
        // ),
        // const SizedBox(height: 20.0),
        // Text(
        //   _descriptions[index],
        //   textAlign: TextAlign.center,
        //   style: const TextStyle(fontSize: 16.0, color: Colors.red),
        // ),
      ],
    );
  }

  // List<Widget> _buildPageIndicator() {
  //   List<Widget> indicators = [];
  //   for (int i = 0; i < _numPages; i++) {
  //     indicators.add(
  //       i == _currentPage ? _indicator(true) : _indicator(false),
  //     );
  //   }
  //   return indicators;
  // }

  Widget _indicator(bool isActive) {
    return Container(
      height: 10.0,
      width: 10.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }
}
