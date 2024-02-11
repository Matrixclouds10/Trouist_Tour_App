import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';

class CustomSliderWidget extends StatefulWidget {
  final List<String?> image;
  final bool? isHasRadius;
  final bool? isOffers;
  final double? height;
  final bool? isCenterPages;
  const CustomSliderWidget({super.key, required this.image, this.isHasRadius, this.height, this.isCenterPages, this.isOffers,});
  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        SizedBox(
          height:widget.height?? 376.h,
          // width: double.infinity,
          child: CarouselSlider(
            carouselController: carouselController,
            items: widget.image
                .map((String? e) =>
            widget.isHasRadius==true?
               widget.isOffers==true?
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.network(e!, fit: BoxFit.cover,
                   errorBuilder: (context ,error,v){
                    return const Center(child: CircularProgressIndicator(),);
                   },
                   width: double.infinity,),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffC00614),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      height: 120.h,
                      width:222.w,
                      child: Padding(
                        padding:  EdgeInsets.only(top: 5.h,left: 24.w,right: 24.w,bottom: 8.h),
                        child: FittedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              verticalSpace(5),
                              Text('now'.tr(),
                                // textScaleFactor: ScaleSize.textScaleFactor(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font17CustomGray400WightLato.copyWith(color: Colors.white),
                              ),
                              Text('${'off'.tr()} 0',
                                // textScaleFactor: ScaleSize.textScaleFactor(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font14CustomBlack500w.copyWith(fontSize: 32.sp,color: Colors.white),
                              ),
                              Text('offer_home'.tr(),
                                // textScaleFactor: ScaleSize.textScaleFactor(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font17CustomGray400WightLato.copyWith(color: Colors.white),
                              ),
                              verticalSpace(5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ) :
               ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(e!, fit: BoxFit.cover,
               width: double.infinity,),
            ):
            Image.network(e!, fit: BoxFit.cover,
             width: double.infinity,
           ),).toList(),
            options: CarouselOptions(
              height:widget.height?? 376.h,
              aspectRatio: 16/9,
              viewportFraction: 1,
               enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              // autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: widget.isCenterPages ??false,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason){
                setState(() {
                  currentIndex =index;
                });
              },
              scrollDirection: Axis.horizontal,
            ),

          ),
        ),
        verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          widget.image.asMap().entries.map((MapEntry<int, String?> entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == entry.key
                        ? AppColorLight.primaryColor
                        : Colors.black.withOpacity(0.2)),
              ),
            );
          }).toList(),
        ),

      ],
    );
  }
}
