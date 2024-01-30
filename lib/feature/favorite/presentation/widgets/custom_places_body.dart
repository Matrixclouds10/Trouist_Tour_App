import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

class CustomPlacesBodyWidget extends StatelessWidget {
  const CustomPlacesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFav=false;
    return   Padding(
      padding:  EdgeInsets.only(left: 16.w,right: 16.w),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            height: 317.h,
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

                  ],
                ),
                verticalSpace(0),
                Padding(
                  padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                  child: Text('Al-Rahma Mosque',
                  style: TextStyles.font14CustomBlack500w.copyWith(
                    fontFamily: AppFontsFamily.fontPoppins
                  ),
                  ),
                ),
                verticalSpace(0),

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