import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';

class CustomGridViewWidget extends StatelessWidget {
  const CustomGridViewWidget({super.key,required this.titles, required this.images,
    required this.imageHeight, required this.crossAxisCount, required this.childAspectRatio,
    this.crossAxisSpacing, this.mainAxisSpacing, required this.onTap, });
    final double childAspectRatio;
    final int imageHeight;
    final double? crossAxisSpacing;
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
                SizedBox(
                  height:imageHeight.h,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(images[index],fit: BoxFit.cover,width: 168.w,),
                  ),
                ),
                verticalSpace(8),
                 Text(titles[index]),
              ],
            ),
          ),
        );
      }),
    );
  }

}
