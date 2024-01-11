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
          title: 'Discover The Adventure',
          image: AppImages.onBoarding1,
          description: 'It is a long established fact that a reader will be distracted by',
        number: '1',
      ),
      OnBoardingModel(
        title: 'Book The Best Place',
        image: AppImages.onBoarding2,
        description: 'It is a long established fact that a reader will be distracted by ',
        number: '2',

      ),
      OnBoardingModel(
        title: 'Get Relax',
        image: AppImages.onBoarding3,
        number: '3',
        description: "It is a long established fact that a reader will be distracted by ",
      ),
    ];
    return list;
  }
}