import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';

class CustomGridViewWidget extends StatelessWidget {
  const CustomGridViewWidget({super.key,required this.titles, required this.images,
    required this.imageHeight, required this.crossAxisCount, required this.childAspectRatio,
    this.crossAxisSpacing, this.mainAxisSpacing, required this.onTap, this.isPlaces, });
    final double childAspectRatio;
    final int imageHeight;
    final double? crossAxisSpacing;
    final bool? isPlaces;
    final double? mainAxisSpacing;
    final void Function() onTap;
    final int crossAxisCount;
   final List<String> titles;
   final List<String> images;
  @override
  Widget build(BuildContext context) {
    return  GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing:crossAxisSpacing?? 0,
      mainAxisSpacing:mainAxisSpacing?? 0,
      childAspectRatio: (1 / childAspectRatio).h,
      children: List.generate(titles.length, (index) {
        return InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 168.w,
            child: Column(
              children: [
                isPlaces==true?Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        height:imageHeight.h,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(images[index],fit: BoxFit.cover,width: 168.w,),
                        ),
                      ),
                      Positioned(
                          top: imageHeight.h/1.59,
                          left: 0,
                          child:Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
                            ),
                            width: 120.w,
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
                ):
                Expanded(
                  child: SizedBox(
                    height:imageHeight.h,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(images[index],fit: BoxFit.cover,width: 168.w,),
                    ),
                  ),
                ),
                verticalSpace(8),
                 Text(titles[index],
                   style: TextStyles.font17Black400WightLato,
                   textScaleFactor: ScaleSize.textScaleFactor(context),
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                 ),
              ],
            ),
          ),
        );
      }),
    );
  }

}
