import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CarouselSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoplay: true,
      autoplayDelay: 3000,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
            child: Image(
          fit: BoxFit.contain,
          image: AssetImage('images/carousel_slider.jpg'),
        ));
      },
      pagination: SwiperPagination(),
      // control:  SwiperControl(),
      itemHeight: 300,
      itemWidth: 300,
    );
  }
}
