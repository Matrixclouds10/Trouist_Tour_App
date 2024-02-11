import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';

class CustomAppContData extends StatelessWidget {
  const CustomAppContData({super.key, required this.image, required this.title, required this.des});
 final String image;
 final String title;
 final String des;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h,),
          Center(
            child: SizedBox(
                height: 130.w,
                width: 130.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (context,error,v){
                      return const CustomLoadingWidget();
                    },
                  ),
                )),
          ),
          SizedBox(height: 35.h,),
          Text(
           title,
            style: TextStyles.font14CustomWight700wLato.copyWith(
                color: AppColorLight.customBlack
            ),),
          verticalSpace(16),
          Text(
            des,
            style: TextStyles.font14CustomWight700wLato.copyWith(
                color: AppColorLight.customBlack
            ),),
        ],
      ),
    );
  }
}
