import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';

class CustomSliderWidget extends StatefulWidget {
  final String image;
  const CustomSliderWidget({super.key, required this.image,});
  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        SizedBox(
          height: 376.h,
          // width: double.infinity,
          child: CarouselSlider(
            carouselController: carouselController,
            items:[
              Image.asset(widget.image,fit: BoxFit.cover,width:MediaQuery.of(context).size.width),
            ],
            options: CarouselOptions(
              height: 376.h,
              aspectRatio: 16/9,
              viewportFraction: 1,
              // enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              // autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              // enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason){
                setState(() {
                  print(index);
                  currentIndex =index;
                });
              },
              scrollDirection: Axis.horizontal,
            ),

          ),
        ),
        verticalSpace(8),
        Center(
          child: DotsIndicator(
            dotsCount: 5,
            position: currentIndex.toDouble(),
          ),
        ),
      ],
    );
  }
}
