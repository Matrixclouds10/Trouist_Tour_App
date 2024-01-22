import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/offers/presentation/screens/offer_details.dart';

class CustomOfferItems extends StatelessWidget {
  const CustomOfferItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 16.h,left: 16.w,right: 16.w),
      child: InkWell(
        onTap: (){
          NavigatePages.pushToPage(const OfferDetailsScreen(), context);
        },
        child: Container(
             height: 152.h,
             width: 343.w,
          decoration:  BoxDecoration(
              color: AppColorLight.customGray.withOpacity(0.10),
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: Row(
            children: [
              Expanded(child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                child:
                Image.asset(AppImages.test,fit: BoxFit.cover,),
              )),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(9),
                    Text('National Day Offer',
                      style: TextStyles.font17CustomBlack700WeightPoppins,
                    ),
                    verticalSpace(5),
                    Text('Lorem ipsum dolor tamet consectetur viverra pellent .....',
                      style: TextStyles.font17Black400WightLato.copyWith(color: AppColorLight.desColor),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(5),
                    Row(
                      children: [
                        Text('2000 RS',
                          style: TextStyles.font12CustomRed500WeightLato.copyWith(
                            fontFamily: AppFontsFamily.fontPoppins
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        horizontalSpace(5),
                        Text('1500 RS',
                          style: TextStyles.font12CustomRed500WeightLato.copyWith(
                              fontFamily: AppFontsFamily.fontPoppins,
                              color: AppColorLight.desColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
