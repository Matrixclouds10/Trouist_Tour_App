import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

class TouristPlaceDetailsScreen extends StatefulWidget {
  const TouristPlaceDetailsScreen({super.key});

  @override
  State<TouristPlaceDetailsScreen> createState() => _TouristPlaceDetailsScreenState();
}

class _TouristPlaceDetailsScreenState extends State<TouristPlaceDetailsScreen> {
  int currentIndex = 0;
  int currentIndex2 = 0;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const CustomSliderWidget(image: AppImages.category,),
                Positioned(
                    top: 40.h,
                    left: 10.w,
                    right: 10.w,
                    child:
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: const Icon(Icons.arrow_back_ios,color: AppColorLight.gray2,)),
                    const Spacer(),
                    IconButton(onPressed: (){
                      setState(() {
                        isFav=!isFav;
                      });
                    }, icon:  Icon(
                      isFav==false?
                      Icons.favorite_border_rounded:Icons.favorite,color:isFav==false? AppColorLight.gray2:Colors.red,))
                  ],

                ))
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 16.w,right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Al-Rahma Mosque',
                    style: TextStyles.font17CustomBlack700WeightPoppins,
                  ),
                  verticalSpace(8),
                  Text('Lorem ipsum dolor sit amet consectetur. Facilisi nam quam tellus etiam non ut vel at magna. Felis porta fermentum scelerisque eget. Dolor aenean egestas facilisis eget.',
                    style: TextStyles.font17CustomGray400Wight,
                  ),
                  verticalSpace(32),
                  Text('Related Programs',
                    style: TextStyles.font17CustomBlack700WeightPoppins,
                  ),
                  verticalSpace(16),
                  SizedBox(
                    height: 122.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context,index){
                          return Padding(
                            padding:  EdgeInsets.only(right: 8.w),
                            child: Column(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: 170.w,
                                    height: 90.h,
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        child: Image.asset(AppImages.test,fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(
                                    height: 24.h,
                                    child: Text('Religious',
                                      style: TextStyles.font17Black400WightLato.copyWith(color: AppColorLight.customBlack),
                                    )),
                              ],
                            ),
                          );
                        }),
                  ),

                ],
              ),
            )



          ]
        ),
      ),
    );
  }
}
