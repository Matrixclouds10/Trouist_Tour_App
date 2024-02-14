import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/feature/favorite/logic/favorite_cubit.dart';
import 'package:tourist_tour_app/feature/home/data/models/offer_model.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_show_image.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

class CustomTopDetailsStackWidget extends StatelessWidget {
   CustomTopDetailsStackWidget({super.key,  this.endDate,  this.startDate,  this.day, required this.image, required this.isVideo, required this.id});
  final String? endDate;
  final String? startDate;
  final String? day;
  final int id;
  final List<String?> image;
  final List<bool?> isVideo;
  bool isFav =false;

  @override
  Widget build(BuildContext context) {
    List<OfferModel> list=[];
    for(int i=0;i<=image.length-1;i++){
      list.add(OfferModel(image: image[i]!, off:isVideo[i]!.toString()));
    }
    return  Stack(
      children: [
        InkWell(
            onTap: (){
              showCustomImages(context: context, images:  list);
            },
            child: CustomSliderWidget(image:image,imageList: list,)),
        Positioned(
            top: 40.h,
            left: 10.w,
            right: 10.w,
            child:
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                const Spacer(),
                StatefulBuilder(builder: (context,setState){
                  return IconButton(onPressed: (){
                    setState(() {
                      isFav=!isFav;
                    });
                    FavoriteCubit.get(context).addFavoriteProgram(id,HomeCubit.get(context).token!,context.locale.toString(),context,);
                  },
                      icon:  Icon(
                        isFav==false?
                        Icons.favorite_border_rounded:Icons.favorite,color:isFav==false?  Colors.white:Colors.red,));
                })
              ],
            )),
        Positioned(
            bottom: 50.h,
            left: 0,
            right: 90,
            child:Container(
              decoration: const BoxDecoration(
                  color: AppColorLight.customBlack,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
              ),
              width: 300.w,
              height: 52.h,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,),
                  child: Text(
                    '${day??'3'} ${'days'.tr()}   ${startDate??'25 Dec 23'}/ ${startDate??'25 Dec 23'}',
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font17Black400WightLato.copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
        )
      ],
    );
  }
}
