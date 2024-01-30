import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_to_body_home_widget.dart';
import 'package:tourist_tour_app/feature/make_program/presentation/screens/custom_program_screen.dart';
import 'package:tourist_tour_app/feature/offers/presentation/screens/offers_screen.dart';
import 'package:tourist_tour_app/feature/our_programs/presentation/screens/our_programs_screen.dart';
import 'package:tourist_tour_app/feature/search/presentation/screen/search_screen.dart';
import 'package:tourist_tour_app/feature/tourist_places/presentation/screens/tourist_places_details_screen.dart';
import 'package:tourist_tour_app/feature/tourist_places/presentation/screens/tourist_places_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_horizontal_list_view.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_title_row.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 30.h),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w,right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(40),
                Center(child: SvgPicture.asset(AppImages.logoSvg)),
                verticalSpace(16),
                const CustomTopBodyHomeWidget(),
               InkWell(
                 onTap: (){
                   NavigatePages.pushToPage( const SearchScreen(), context);
                 },
                 child: CustomTextField(
                   enabled: false,
                   borderColor: AppColorLight.customGray,
                     hintText: 'Search For A Tourist Place',
                     hintStyle: TextStyles.font14CustomGray400w,
                     prefixIcon: const Icon(Icons.search,color: AppColorLight.gray2,),
                     controller: TextEditingController()),
               ),
               verticalSpace(25),
                CustomTitleRow(title: 'Our Programs', onTap: (){
                  NavigatePages.pushToPage(const OurProgramsScreen(), context);
                },),
               verticalSpace(16),
               SizedBox(
                 height: 122.h,
                 child:
                 CustomHorizontalListView(
                   image: AppImages.test2, title: 'Religious',
                     onTap: (){NavigatePages.pushToPage(const ProgramDetailsScreen(), context);},),
                   ),
               verticalSpace(20),
               Text("Custom Program",
                 textScaleFactor: ScaleSize.textScaleFactor(context),
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyles.font24CustomBlack700WeightPoppins.copyWith(fontSize: 17),
               ),
               verticalSpace(16),
               Container(
                 height:170.h ,
                 width: 345.w,
                 decoration: BoxDecoration(
                   borderRadius: const BorderRadius.all(Radius.circular(10)),
                   color: AppColorLight.customGray.withOpacity(0.10),
                 ),
                 child: Column(
                   children: [
                     verticalSpace(16),
                     FittedBox(
                       child: SizedBox(
                         width:315.w,
                         // height: 71.h,
                         child: Center(
                           child: Text('Lorem ipsum dolor sit amet consectetur. Facilisi nam quam tellus etiam non ut vel at magna. Felis porta fermentum .',
                           style: TextStyles.font17CustomGray400WightLato.copyWith(
                             color: const Color(0xff4C5756)
                           ),
                             textScaleFactor: ScaleSize.textScaleFactor(context),
                             maxLines: 3,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.center,
                           ),
                         ),
                       ),
                     ),
                     verticalSpace(10),
                     Container(
                       padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 0),
                       child: CustomMaterialButtonWidget(
                           height: 36,
                           minWidth: 205.w,
                           text: 'Make Your Program',
                           textSize: 14,
                           onPressed: (){
                             NavigatePages.pushToPage(const CustomProgramScreen(), context);

                           }),
                     ),
                     verticalSpace(0),

                   ],
                 ),
               ),
               verticalSpace(15),
                InkWell(
                  onTap: (){
                    NavigatePages.pushToPage(const OffersScreen(), context);
                  },
                  child: CustomSliderWidget(
                    height: 190.h,
                    isCenterPages: true,
                    isOffers: true,
                    isHasRadius: true,
                    image: const [AppImages.offer,AppImages.offer,AppImages.offer,AppImages.offer,AppImages.offer,AppImages.offer,],),
                ),
               verticalSpace(25),
               Row(
                 children: [
                   Text("Tourist Places",
                     style: TextStyles.font24CustomBlack700WeightPoppins.copyWith(fontSize: 17),
                     textScaleFactor: ScaleSize.textScaleFactor(context),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                   const Spacer(),
                   InkWell(
                     onTap: (){
                       NavigatePages.pushToPage(const TouristPlacesScreen(), context);
                     },
                     child: Text("See All",
                       textScaleFactor: ScaleSize.textScaleFactor(context),
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyles.font12CustomGray400WeightLato.copyWith(
                         fontFamily: AppFontsFamily.fontPoppins,
                         color: const Color(0xffE74646),
                         fontWeight: FontWeight.w700,
                       ),
                     ),
                   ),
                 ],
               ),
               verticalSpace(16),
               GridView.count(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 crossAxisCount: 2,
                 crossAxisSpacing: 5,
                 mainAxisSpacing: 10,
                 childAspectRatio: 1 / 0.75,
                 children: List.generate(10, (index) {
                   return InkWell(
                     onTap: (){
                       NavigatePages.pushToPage(const TouristPlaceDetailsScreen(), context);
                     },
                     child: SizedBox(
                       width: 168.w,
                       child: Column(
                         children: [
                           Expanded(
                             child: SizedBox(
                               height:100.h,
                               child: ClipRRect(
                                 borderRadius: const BorderRadius.all(Radius.circular(10)),
                                 child: Image.asset(AppImages.testImage,fit: BoxFit.cover,width: 168.w,),
                               ),
                             ),
                           ),
                           verticalSpace(8),
                            Text('Rijal Almaa Village',
                             textScaleFactor: ScaleSize.textScaleFactor(context),
                             maxLines: 1,
                             overflow: TextOverflow.ellipsis,
                           ),
                         ],
                       ),
                     ),
                   );
                 }),
               ),
               verticalSpace(100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
