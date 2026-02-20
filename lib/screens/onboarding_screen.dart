import 'package:flutter/material.dart';
import 'auth/auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/welcome.PNG',
      'title': 'Welcome',
      'subtitle': 'Welcome to our Health App'
    },
    {
      'image': 'assets/images/trackhealth.png',
      'title': 'Track Health',
      'subtitle': 'Monitor your health easily'
    },
    {
      'image': 'assets/images/support.png',
      'title': 'Get Support',
      'subtitle': 'Get assistance anytime'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onboardingData[index]['image']!,
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onboardingData[index]['title']!,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      onboardingData[index]['subtitle']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                width: _currentPage == index ? 20 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == onboardingData.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const AuthScreen()),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              child: Text(
                _currentPage == onboardingData.length - 1
                    ? 'Get Started'
                    : 'Next',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
