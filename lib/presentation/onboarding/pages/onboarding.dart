// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/common/widgets/buttton/button_arrow.dart';
import 'package:myapp/core/configs/theme/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/vectors/slide_image2.svg',
      'text': 'assets/vectors/slide_text1.svg',
    },
    {
      'image': 'assets/vectors/slide_image3.svg',
      'text': 'assets/vectors/slide_text3.svg',
    },
    // {
    // 'image': 'assets/vectors/slide_image3.svg',
    // 'text': 'assets/vectors/slide_text3.svg',
    //},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) => setState(() => _currentPage = page),
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                final page = _pages[index];
                return _buildPageContent(page['image']!, page['text']!);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(String pathImage, String pathText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // Kolom tetap di tengah
      children: [
        SvgPicture.asset(pathImage),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment
                .centerLeft, // Tetap rata kiri, tetapi sejajar dalam kolom tengah
            child: SvgPicture.asset(pathText),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [_buildPageIndicator(), Spacer(), ButtonArrow()],
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _indicator(0),
        _indicator(1),
      ],
    );
  }

  Widget _indicator(int index) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          height: 8.0,
          width: _currentPage == index ? 24.0 : 8.0,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.pink : Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
