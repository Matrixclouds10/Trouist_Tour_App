import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/auth/presentation/screens/log_as.dart';
import '../../data/models/model.dart';

class CustomPageViewBodyWidget extends StatelessWidget {
  const CustomPageViewBodyWidget({super.key, required this.onBoardingModel,});
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 452.h,
                width: 376.w,
                child: Image.asset(
                  onBoardingModel.image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 452.h,
                width: 376.w,
                color: const Color(0xff000000).withOpacity(0.30),),
              Positioned(
                top: 70.h,
                right: 16.5.w,
                child: InkWell(
                  onTap: (){
                    NavigatePages.pushToPage(const LogAs(), context);
                  },
                  child: SizedBox(
                    width: 30.w,
                    height:17.h,
                    child: const Text("Skip",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),)
            ],
          ),
          verticalSpace(25),
          SizedBox(
            width: 274.w,
            height: 32.h,
            child:
                Text(onBoardingModel.title,textAlign: TextAlign.center,
            style: TextStyles.font24CustomBlack700Weight,)
          ),
          verticalSpace(8),
          SizedBox(
            width: 343.w,
            height: 50.h,
            child: Text(
                onBoardingModel.description,
                // getLang(context ,'onBoardingDescription${onBoardingModel.number}'),
                style:  TextStyles.font17CustomGray400Wight,
                textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(32),
        ]);
  }
}
