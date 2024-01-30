import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
    MediaQuery(
        data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0, ),
        child:
        Scaffold(
            body:Padding(
              padding:  EdgeInsets.only(left: 16.w,right: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(70),
                    CustomTextField(
                      borderColor: AppColorLight.customGray,
                      hintText: 'Search For A Tourist Place',
                      hintStyle: TextStyles.font14CustomGray400w,
                      prefixIcon: const Icon(Icons.search,color: AppColorLight.gray2,),
                      controller: TextEditingController(),
                    ),
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
                  ],
                ),
              ),
            )
        )
        );


  }
}
