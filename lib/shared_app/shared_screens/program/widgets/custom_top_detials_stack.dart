import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

class CustomTopDetailsStackWidget extends StatefulWidget {
  const CustomTopDetailsStackWidget({super.key});

  @override
  State<CustomTopDetailsStackWidget> createState() => _CustomTopDetailsStackWidgetState();
}

class _CustomTopDetailsStackWidgetState extends State<CustomTopDetailsStackWidget> {
  bool isFav =false;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        const CustomSliderWidget(image: [AppImages.test2,AppImages.test2,AppImages.test2,AppImages.test2,AppImages.test2,],),
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
                  Icons.favorite_border_rounded:Icons.favorite,color:isFav==false?  Colors.white:Colors.red,))
              ],

            )),
        Positioned(
            bottom: 50.h,
            left: 0,
            right: 90,
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
        )
      ],
    );
  }
}
