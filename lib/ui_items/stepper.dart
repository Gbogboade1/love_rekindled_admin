import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ImagesStepper extends StatefulWidget {
  @override
  _ImagesStepperState createState() => _ImagesStepperState();
}

class _ImagesStepperState extends State<ImagesStepper> {
  bool isLoading = false;
  bool isFetched = false;

  List path = [
    "images/img1.png",
    "images/img1.jpg",
    "images/img1.png",
    "images/img1.jpg",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Swiper(
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.red,
            activeSize: 20.0,
          ),
        ),
        loop: false,
        autoplay: false,
        autoplayDelay: 5500,
        indicatorLayout: PageIndicatorLayout.COLOR,
        itemCount: path.length,
        itemBuilder: (b, index) {
          return Image.asset(
            path[index],
            fit: BoxFit.fill,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
