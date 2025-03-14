import 'package:flutter/material.dart';
import 'package:apps_coin/screen/authentication/signup_page/sign_up_page.dart';
import 'package:apps_coin/screen/data/onboardingitem.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage01 extends StatefulWidget {
  const OnboardingPage01({super.key});

  @override
  State<OnboardingPage01> createState() => _OnboardingPage01State();
}

class _OnboardingPage01State extends State<OnboardingPage01> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final Onboardingitem onboardingitem = Onboardingitem();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 100),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingitem.item.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final onboardingInfo = onboardingitem.item[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(onboardingInfo.image, width: 180),
                          SizedBox(height: 70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onboardingitem.item.length,
                              (indexDot) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                height: _currentPage == indexDot ? 8 : 8,
                                width: _currentPage == indexDot ? 20 : 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                  color: _currentPage == indexDot
                                      ? const Color.fromARGB(255, 0, 93, 207)
                                      : const Color.fromARGB(
                                          255, 214, 213, 213),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            onboardingInfo.description,
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 100),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage < onboardingitem.item.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: const Color.fromARGB(255, 0, 93, 207),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
