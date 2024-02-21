import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/favorite/logic/favorite_cubit.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_religious_program_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

class CustomProgramsBodyWidget extends StatelessWidget {
  const CustomProgramsBodyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    FavoriteCubit cubit =FavoriteCubit.get(context);
    return BlocConsumer<FavoriteCubit, DataState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(cubit.getFavoriteList!=null){
            if(cubit.getFavoriteList!.isNotEmpty){
              return Padding(
                  padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                  child: ListView.builder(
                      itemCount: cubit.getFavoriteList!.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: InkWell(
                            onTap: (){
                              NavigatePages.pushToPage( ProgramDetailsScreen(
                                programResponse: cubit.getFavoriteList![index],
                              ), context);
                            },
                            child: Container(
                              height: 430.h,
                              width: 343.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                  boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 2)]
                              ),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft:  Radius.circular(10)),
                                        child: CustomSliderWidget(
                                          height: 235.h,
                                          image: cubit.getFavoriteList![index].images!.map((e) => e.image!).toList()),
                                      ),
                                      Positioned(
                                        top: 10.h,
                                        right: 10.w,
                                        child:
                                        StatefulBuilder(builder: (context,setState){
                                          return IconButton(onPressed: (){
                                            setState(() {
                                              cubit.getFavoriteList![index].isFav=!cubit.getFavoriteList![index].isFav!;
                                            });
                                            FavoriteCubit.get(context).addFavoriteProgram(cubit.getFavoriteList![index].id!,HomeCubit.get(context).token!,context.locale.toString(), context);
                                          }, icon:  Icon(
                                            cubit.getFavoriteList![index].isFav==false?
                                            Icons.favorite_border_rounded:Icons.favorite,color:cubit.getFavoriteList![index].isFav==false?  Colors.white:Colors.red,));
                                        }),
                                      ),
                                      Positioned(
                                          bottom: 50.h,
                                          left: 0,
                                          right: 50,
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
                                      ),
                                    ],
                                  ),
                                    CustomReligiousProgramWidget(
                                     programResponse:cubit.getFavoriteList![index],
                                     isHasDes: false,),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
              );
            }else{
              return Center(child: Text('no_data_currently'.tr()),);
            }
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}