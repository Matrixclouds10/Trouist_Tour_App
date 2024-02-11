import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';

class CustomOfferItems extends StatelessWidget {
  const CustomOfferItems({super.key, required this.offersProgramResponse});
final ProgramResponse offersProgramResponse;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 16.h,left: 16.w,right: 16.w),
      child: InkWell(
        onTap: (){
          NavigatePages.pushToPage( ProgramDetailsScreen(type: 'offer', programResponse: offersProgramResponse,
          ), context);
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
              SizedBox(
                width: 150.w,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius:
                  context.locale==const Locale('en')?
                  const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)):
                      const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10),
                  ),
                  child:
                  Image.network(
                    offersProgramResponse.images![0].image! ,
                  errorBuilder: (context ,error,v){
                      return const CustomLoadingWidget();
                  }
                  ,fit: BoxFit.cover,),
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(9),
                    Text(offersProgramResponse.name!,
                      style: TextStyles.font17CustomBlack700WeightPoppins,
                    ),
                    verticalSpace(3),
                    Expanded(
                      child: Text(offersProgramResponse.description!,
                        style: TextStyles.font17Black400WightLato.copyWith(color: AppColorLight.desColor),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    verticalSpace(3),
                    Row(
                      children: [
                        Text('${offersProgramResponse.price!} ${'rs'.tr()}',
                          style:
                          offersProgramResponse.newPrice!=null?
                          TextStyles.font12CustomRed500WeightLato.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColorLight.redColor,
                            fontFamily: AppFontsFamily.fontPoppins
                          ):
                          TextStyles.font12CustomRed500WeightLato.copyWith(
                              fontFamily: AppFontsFamily.fontPoppins
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        horizontalSpace(5),
                        offersProgramResponse.newPrice!=null?
                        Text('${offersProgramResponse.newPrice!} ${'rs'.tr()}',
                          style: TextStyles.font12CustomRed500WeightLato.copyWith(
                              fontFamily: AppFontsFamily.fontPoppins,
                              color: AppColorLight.desColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ):
                        const SizedBox.shrink(),
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
