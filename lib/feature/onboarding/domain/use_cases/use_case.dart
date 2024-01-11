import '../repositories/base_repo.dart';

class OnBoardingUseCase{
  final BaseOnBoardingRepo baseOnBoardingRepo;

  OnBoardingUseCase(this.baseOnBoardingRepo);

   getOnBoarding(){
    return baseOnBoardingRepo.getOnBoarding();
  }
}