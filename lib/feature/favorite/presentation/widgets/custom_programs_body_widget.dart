import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_religious_program_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

class CustomProgramsBodyWidget extends StatelessWidget {
  const CustomProgramsBodyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    bool isFav =false;

    return   Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  height: 430.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                      boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 2)]
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft:  Radius.circular(10)),
                            child: CustomSliderWidget(
                              height: 235.h,
                              image: const [AppImages.test2,AppImages.test2,AppImages.test2,AppImages.test2],),
                          ),
                          Positioned(
                              top: 10.h,
                              right: 10.w,
                              child:
                              StatefulBuilder(builder: (context,setState){
                                return IconButton(onPressed: (){
                                  setState(() {
                                    isFav=!isFav;
                                  });
                                }, icon:  Icon(
                                  isFav==false?
                                  Icons.favorite_border_rounded:Icons.favorite,color:isFav==false?  Colors.white:Colors.red,));
                              }),
                          ),
                          Positioned(
                              bottom: 50.h,
                              left: 0,
                              right: 50,
                              child:Container(
                                decoration: const BoxDecoration(
                                    color: AppColorLight.customBlack,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
                                ),
                                width: 300.w,
                                height: 52.h,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0,),
                                    child: Text(
                                      '3 Days       25 Dec 23 - 28 Dec 23 ',
                                      textScaleFactor: ScaleSize.textScaleFactor(context),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.font17Black400WightLato.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      verticalSpace(0),
                      const CustomReligiousProgramWidget(isHasDes: false,),

                    ],
                  ),
                ),
              );
            })
    );
  }
}
/*
 verticalSpace(150),
            Image.asset(AppImages.search),
            verticalSpace(25),
            Text('Enter a place or tourist program',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font17CustomGray400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            )
 */