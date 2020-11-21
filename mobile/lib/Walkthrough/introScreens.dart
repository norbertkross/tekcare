import 'package:flutter/material.dart';
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
        logoUrl: "",
        appName: "TekCare",
        imageUrl: "",
        title: "Easy access to Pharmacy",
        description:
            "Easy way of getting prescribed drugs by \n physicians from the pharmacy shop."),
    SliderModel(
        logoUrl: "",
        appName: "TekCare",
        imageUrl: "",
        title: "Delivery Service",
        description:
            "Purchased drugs are being delivered to \npatients safely"),
    SliderModel(
        logoUrl: "",
        appName: "TekCare",
        imageUrl: "",
        title: "Virtual Consultation",
        description:
            "Find your doctor online for health \n consultation without going to the hospital.")
  ];
  int currentIndex = 0;

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.brown : Colors.grey,
          borderRadius: BorderRadius.circular(12.0)),
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
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(slides.length - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            )
          : Container(
            margin: EdgeInsets.only(left: 35.0),
            child: WalkThroughButton(label: "Getting Started", onTap: (){},))
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
        children: [
          Image.asset(
            logoUrl,
            height: 15,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            appName,
            style: TextStyle(fontSize: 26.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Image.asset(
            imageUrl,
            height: 60.0,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 22.0),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
