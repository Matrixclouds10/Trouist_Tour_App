import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/extensions.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/routing/routes.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/offers_screen.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/tourist_places_screen.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_home_offer.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_make_program.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_search_home.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_to_body_home_widget.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_tourist_places.dart';
import 'package:tourist_tour_app/feature/our_programs/presentation/screens/our_programs_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_dialog.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_horizontal_list_view.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_title_row.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {

    HomeCubit cubit =HomeCubit.get(context);
    cubit.getLoc();
    // cubit.initHome(context: context);
    return PopScope(
      canPop: false,
      onPopInvoked: (_)  async{
        var res = await CacheHelper.getDate(key: 'isLog');
        if(res==null){
          await Future.delayed(const Duration(microseconds: 0)).then((value){
            context.pushReplacementNamed(Routes.logAsScreen);
          });
        }
        else{
          await Future.delayed(const Duration(microseconds: 0)).then((value) {
            showCustomDialog(title:'exit'.tr(),des: 'exit_mes'.tr(),bt1:  'yes'.tr(),bt2: 'no'.tr(),
                onPressed1: (){
                  exit(0);
                },
                context: context);
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.only(top: 30.h),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(40),
                          Center(child: SvgPicture.asset(AppImages.logoSvg)),
                          verticalSpace(16),
                          const CustomTopBodyHomeWidget(),
                          const CustomSearchHome(),
                          verticalSpace(25),
                          CustomTitleRow(title: 'our_programs'.tr(), onTap: (){
                            NavigatePages.pushToPage(const OurProgramsScreen(), context);},),
                          verticalSpace(16),
                           const CustomHorizontalListView(),
                           verticalSpace(20),
                           Text("custom_program".tr(),
                           style: TextStyles.font24CustomBlack700WeightPoppins.copyWith(fontSize: 17),
                             overflow: TextOverflow.ellipsis,
                             maxLines: 1,
                           ),
                           verticalSpace(16),
                           const CustomMakeProgram(),
                           verticalSpace(15),
                          cubit.offersResponseModel!=null?
                              cubit.offersResponseModel!.isNotEmpty?
                           InkWell(
                            onTap: (){
                              NavigatePages.pushToPage( OffersScreen(offersResponseModel: cubit.offersResponseModel,), context);
                            },

                            child:
                            CustomHomeOffer(
                              offerProgramResponse: cubit.offersResponseModel! ,
                              height: 190.h,
                              isCenterPages: true,
                              image: cubit.offersResponseModel!.map((e) => e.images![0].image!).toList(),),
                          ) : const SizedBox.shrink():
                          const SizedBox.shrink(),
                         verticalSpace(25),
                          CustomTitleRow(
                            title: 'tourist_places'.tr(), onTap: () {
                            NavigatePages.pushToPage(const TouristPlacesScreen(), context);
                          },),
                         verticalSpace(16),
                         cubit.touristPlacesResponseModel!=null?
                         const CustomTouristPlaces():
                          const CustomLoadingWidget(),
                         verticalSpace(100),
                        ],
                      ),
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
