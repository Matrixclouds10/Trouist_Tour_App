import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({super.key, this.onTap, this.height,});
  final void Function()? onTap;
  final double? height;
  @override
  Widget build(BuildContext context) {
    var cubit =HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if( cubit.programResponseModel!=null){
          return SizedBox(
            height:height?? 122.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cubit.programResponseModel!.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: onTap??(){
                      NavigatePages.pushToPage( ProgramDetailsScreen(programResponse: cubit.programResponseModel![index],), context);
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right: 8.w),
                      child: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 90.w,
                              height: 90.h,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(cubit.programResponseModel![index].images![0].image!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context,error,v){
                                      return const Center(child: CircularProgressIndicator(),);
                                    },
                                  )),
                            ),
                          ),
                          SizedBox(
                              height: 25.h,
                              width: 80.w,
                              child: Text(cubit.programResponseModel![index].name!,
                                textScaleFactor: ScaleSize.textScaleFactor(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font17Black400WightLato.copyWith(color: AppColorLight.customBlack),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  );
                }),
          );
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
