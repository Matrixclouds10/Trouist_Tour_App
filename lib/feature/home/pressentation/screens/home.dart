import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_make_program.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_search_home.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_to_body_home_widget.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_tourist_places.dart';
import 'package:tourist_tour_app/feature/offers/presentation/screens/offers_screen.dart';
import 'package:tourist_tour_app/feature/our_programs/presentation/screens/our_programs_screen.dart';
import 'package:tourist_tour_app/feature/tourist_places/presentation/screens/tourist_places_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_horizontal_list_view.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_title_row.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit =HomeCubit.get(context);
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 30.h),
        child: BlocConsumer<HomeCubit, DataState>(
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
                        CustomTitleRow(title: 'Our Programs', onTap: (){
                          NavigatePages.pushToPage(const OurProgramsScreen(), context);},),
                        verticalSpace(16),
                         const CustomHorizontalListView(),
                         verticalSpace(20),
                         Text("Custom Program", textScaleFactor: ScaleSize.textScaleFactor(context),
                         style: TextStyles.font24CustomBlack700WeightPoppins.copyWith(fontSize: 17),),
                         verticalSpace(16),
                         const CustomMakeProgram(),
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
                        CustomTitleRow(
                          title: 'Tourist Places', onTap: () {
                          NavigatePages.pushToPage(const TouristPlacesScreen(), context);
                        },),
                       verticalSpace(16),
                       const CustomTouristPlaces(),
                       verticalSpace(100),
                      ],
                    ),
                  ),
                );
          },
        ),
      ),
    );
  }
}
