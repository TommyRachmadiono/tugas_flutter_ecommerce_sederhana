import 'package:flutter/material.dart';
import 'package:tugas_ecommerce/pages/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue,
                Colors.lightBlueAccent,
                Colors.purpleAccent,
                Colors.deepPurpleAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image(
                                  width: 300,
                                  height: 300,
                                  image: AssetImage(
                                      'images/onboarding_select_product.png'),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Online Shopping',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Shopping anywhere and anytime. So many products that you can find here.',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image(
                                  width: 300,
                                  height: 300,
                                  image: AssetImage(
                                      'images/onboarding_purchase_success.png'),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Easy Payment',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Shopping anywhere and anytime. So many products that you can find here.',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image(
                                  width: 300,
                                  height: 300,
                                  image: AssetImage(
                                      'images/onboarding_delivery.png'),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Free Delivery',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Shopping anywhere and anytime. So many products that you can find here.',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: _currentPage == _numPages - 1
            ? Container(
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get started",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
