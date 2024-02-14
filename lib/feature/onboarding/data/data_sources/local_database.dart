import 'package:easy_localization/easy_localization.dart';

import '../../../../core/global/images/app_images.dart';
import '../models/model.dart';

abstract class BaseLocalDataBase {
   getData();
}
class LocalDataBase implements BaseLocalDataBase{
  @override
  getData() {
    List<OnBoardingModel> list =[
      OnBoardingModel(
          title: 'on_title1'.tr(),
          image: AppImages.onBoarding1,
          description: 'on_des1'.tr(),
        number: '1',
      ),
      OnBoardingModel(
        title: 'on_title2'.tr(),
        image: AppImages.onBoarding2,
        description: 'on_des2'.tr(),
        number: '2',

      ),
      OnBoardingModel(
        title: 'on_title3'.tr(),
        image: AppImages.onBoarding3,
        number: '3',
        description: "on_des3".tr(),
      ),
    ];
    return list;
  }
}