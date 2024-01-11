import '../../domain/repositories/base_repo.dart';
import '../data_sources/local_database.dart';

class OnBoardingRepo extends BaseOnBoardingRepo{
  final BaseLocalDataBase baseLocalDataBase;
  OnBoardingRepo(this.baseLocalDataBase);
  @override
   getOnBoarding() {
   return baseLocalDataBase.getData();
  }
}