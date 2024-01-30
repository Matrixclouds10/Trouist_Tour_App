import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
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
                const CustomSliderWidget(image: [AppImages.category,AppImages.category,AppImages.category,AppImages.category],),
                Positioned(
                    top: 40.h,
                    left: 10.w,
                    right: 10.w,
                    child:
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    const Spacer(),
                    IconButton(onPressed: (){
                      setState(() {
                        isFav=!isFav;
                      });
                    }, icon:  Icon(
                      isFav==false?
                      Icons.favorite_border_rounded:Icons.favorite,color:isFav==false? Colors.white:Colors.red,))
                  ],

                )),
                Positioned(
                    bottom: 50.h,
                    left: 0,
                    child:Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
                      ),
                      width: 130.w,
                      height: 30.h,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0,),
                          child: Text(
                            '3 Tour Packages',
                            textScaleFactor: ScaleSize.textScaleFactor(context),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.font12CustomRed500WeightLato.copyWith(
                              fontFamily: AppFontsFamily.fontPoppins,
                                fontWeight: FontWeight.w600,
                                color: AppColorLight.primaryColor),
                          ),
                        ),
                      ),
                    )
                )
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 16.w,right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Al-Rahma Mosque',
                    style: TextStyles.font17CustomBlack700WeightPoppins,
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(8),
                  Text('Lorem ipsum dolor sit amet consectetur. Facilisi nam quam tellus etiam non ut vel at magna. Felis porta fermentum scelerisque eget. Dolor aenean egestas facilisis eget.',
                    style: TextStyles.font17CustomGray400WightLato,
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(32),
                  Text('Related Programs',
                    style: TextStyles.font17CustomBlack700WeightPoppins,
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                                      textScaleFactor: ScaleSize.textScaleFactor(context),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
