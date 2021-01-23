import 'package:flutter/material.dart';
import 'package:tele_health/Walkthrough/signupscreen.dart';
import 'package:tele_health/Walkthrough/sliderModel.dart';
import 'package:tele_health/components/walkThroughButtons.dart';

class IntroScreen extends StatefulWidget {
  // This class that displays initial walk throug screen when the app is
  // newly installed.
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _pageController =
      PageController(initialPage: 0, keepPage: false);
  List<SliderModel> slides = [
    SliderModel(
        logoUrl: "assets/knust-logo.png",
        appName: "TekCare",
        imageUrl: "assets/IMG-20200926-WA0006.jpg",
        title: "Virtual Consultation",
        description:
            "Find your doctor online for health \n consultation without going to the hospital."),
    SliderModel(
        logoUrl: "assets/knust-logo.png",
        appName: "TekCare",
        imageUrl: "assets/IMG-20200926-WA0005.jpg",
        title: "Easy access to Pharmacy",
        description:
            "Easy way of getting prescribed drugs by \n physicians from the pharmacy shop."),
    SliderModel(
        logoUrl: "assets/knust-logo.png",
        appName: "TekCare",
        imageUrl: "assets/IMG-20200926-WA0007.jpg",
        title: "Delivery Service",
        description:
            "Purchased drugs are being delivered to \npatients safely"),
  ];
  int currentIndex = 0;

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      height: 14.0,
      width: 14.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Theme.of(context).primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(3.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
              logoUrl: slides[index].logoUrl,
              appName: slides[index].appName,
              imageUrl: slides[index].imageUrl,
              title: slides[index].title,
              description: slides[index].description);
        },
        itemCount: slides.length,
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  buildButton(context, "Next", () {
                    currentIndex += 1;
                    _pageController.animateToPage(currentIndex,
                        duration: Duration(milliseconds: 900),
                        curve: Curves.linear);
                  }),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    buildButton(context, "Get Started", () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignUpScreen()));
                    }, 300),
                  ],
                ),
              ),
            ),
    );
  }

  RaisedButton buildButton(BuildContext context, String text, Function onPress,
      [double width = 100]) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: onPress,
      child: SizedBox(
        width: width,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String logoUrl;
  final String appName;
  final String imageUrl;
  final String title;
  final String description;

  SliderTile(
      {this.logoUrl,
      this.appName,
      this.imageUrl,
      this.title,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(logoUrl),
            )),
            // child: Image.asset(
            //   logoUrl,
            height: 80,
            // ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              appName,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa',
              ),
            ),
          ),
          SizedBox(height: 50.0),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(imageUrl),
            )),
            height: 200.0,
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
