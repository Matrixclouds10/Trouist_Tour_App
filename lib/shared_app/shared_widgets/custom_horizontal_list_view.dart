import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({super.key, this.onTap, required this.image, required this.title});
  final void Function()? onTap;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context,index){
          return InkWell(
            onTap: onTap,
            child: Padding(
              padding:  EdgeInsets.only(right: 8.w),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 90.w,
                      height: 90.h,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(image,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  SizedBox(
                      height: 25.h,
                      child: Text(title,
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font17Black400WightLato.copyWith(color: AppColorLight.customBlack),
                      )),
                ],
              ),
            ),
          );
        });
  }
}
