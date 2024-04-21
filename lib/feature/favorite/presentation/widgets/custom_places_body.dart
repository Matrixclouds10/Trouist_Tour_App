import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/favorite/logic/favorite_cubit.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/tourist_places_details_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

import '../../../../core/shared_preference/shared_preference.dart';

class CustomPlacesBodyWidget extends StatelessWidget {
  const CustomPlacesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteCubit cubit =FavoriteCubit.get(context);
    return   RefreshIndicator(
      onRefresh: ()async{
        await Future.delayed(const Duration(seconds: 1)).then((value) {
          FavoriteCubit.get(context).getFavoritePlaces(HomeCubit.get(context).token!,context.locale.toString(),context);
        });
      },
      child: BlocConsumer<FavoriteCubit, DataState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(cubit.getFavoritePlacesList!=null){
            if(cubit.getFavoritePlacesList!.isNotEmpty){
              return Padding(
                  padding:  EdgeInsets.only(left: 16.w,right: 16.w,bottom: 60.h),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                      itemCount: cubit.getFavoritePlacesList!.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TouristPlaceDetailsScreen(touristPlaceResponse: cubit.getFavoritePlacesList![index],)));
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(top: 16.0,left: 1.w,right: 1.w),
                            child:
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                  boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 2)]
                              ),
                              child:  Padding(
                                padding:  EdgeInsets.only(bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft:  Radius.circular(10)),
                                          child: CustomSliderWidget(
                                            height: 235.h,
                                            image:cubit.getFavoritePlacesList![index].images!.map((e) => e.image!).toList(),),
                                        ),
                                        Positioned(
                                          top: 10.h,
                                          right: 10.w,
                                          child:
                                          StatefulBuilder(builder: (context,setState){
                                            return IconButton(onPressed: (){
                                              setState(() {
                                                cubit.getFavoritePlacesList![index].isFav= !cubit.getFavoritePlacesList![index].isFav!;
                                                 FavoriteCubit.get(context).addFavoritePlaces(cubit.getFavoritePlacesList![index].id!,HomeCubit.get(context).token!,context.locale.toString(),context);
                                              });
                                            }, icon:  Icon(
                                              cubit.getFavoritePlacesList![index].isFav==false?
                                              Icons.favorite_border_rounded:Icons.favorite,color:cubit.getFavoritePlacesList![index].isFav==false? Colors.white:Colors.red,));
                                          }),
                                        ),

                                      ],
                                    ),
                                    verticalSpace(0),
                                    Center(
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                                        child: Text(cubit.getFavoritePlacesList![index].title!,
                                          style: TextStyles.font14CustomBlack500w.copyWith(
                                              fontFamily: AppFontsFamily.fontPoppins
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalSpace(0),

                                  ],
                                ),
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
      ),
    );
  }
}
