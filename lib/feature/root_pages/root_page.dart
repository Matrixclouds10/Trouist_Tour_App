import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_screen.dart';
import 'package:tourist_tour_app/feature/favorite/presentation/screens/favorite_screen.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/home.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/more_screen.dart';
import 'package:tourist_tour_app/feature/search/presentation/screen/search_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_bottom_bar.dart';

class RootPages extends StatefulWidget {
  final String? check;
  const RootPages({super.key, this.check});

  @override
  State<RootPages> createState() => _RootPagesState();
}
class _RootPagesState extends State<RootPages> {
  int currentIndex=0;
   List<Widget> screens =
     [
      const Home(),
      const FavoriteScreen(),
      const SearchScreen(),
      const BookingScreen(),
      const MoreScreen(),
     ];

   @override
  void initState() {
     if(widget.check==null){
       currentIndex=0;
     }else{
       currentIndex=int.parse(widget.check!).toInt();
     }
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
          data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,),
          child: Scaffold(
             body:   Stack(
               children: [
                 screens[currentIndex],
                 Positioned(
                     left: 0,
                     right: 0,
                     bottom: 0,
                     child: bottomNavigationBar())
               ],
             ),
          ) );


  }
  Widget bottomNavigationBar() {
    return
      Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 80.h,
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Container(
                height: 61.h,
                color: Colors.white,
                // color: const Color(0xff8E8E8E).withOpacity(0.15),
                child: Padding(
                  padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            currentIndex==0? SizedBox(
                                height: 40.h,
                                width:40.w,
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image.asset('assets/images/hag.png',),
                                    const Icon(Icons.home_outlined,color: Colors.white,)
                                  ],)):
                            InkWell(
                              onTap: (){
                                setState(() {
                                  currentIndex=0;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.home_outlined,color: AppColorLight.gray2,),
                                  Text('Home',
                                    style: TextStyles.font10CustomGray500WightPoppins,
                                  )
                                ],
                              ),
                            ),
                            currentIndex==1?
                            SizedBox(
                                height: 40.h,
                                width:40.w,
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image.asset('assets/images/hag.png',),
                                    const Icon(Icons.favorite_border,color: Colors.white,)
                                  ],)):
                            InkWell(
                              onTap: (){
                                setState(() {
                                  currentIndex=1;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.favorite_border,color: AppColorLight.gray2,),
                                  Text('Favorite',
                                    style: TextStyles.font10CustomGray500WightPoppins,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(null),
                            Text('Search',
                              style: TextStyles.font10CustomGray500WightPoppins,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            currentIndex==3? SizedBox(
                                height: 40.h,
                                width:40.w,
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image.asset('assets/images/hag.png',),
                                    const Icon(Icons.calendar_month_outlined,color: Colors.white,)
                                  ],)):
                            InkWell(
                              onTap: (){
                                setState(() {
                                  currentIndex=3;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.calendar_month_outlined,color: AppColorLight.gray2,),
                                  Text('Bookings',
                                    style: TextStyles.font10CustomGray500WightPoppins,
                                  )
                                ],
                              ),
                            ),
                            currentIndex==4? SizedBox(
                                height: 40.h,
                                width:40.w,
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image.asset('assets/images/hag.png',),
                                    const Icon(Icons.menu,color: Colors.white,)
                                  ],)):
                            InkWell(
                              onTap: (){
                                setState(() {
                                  currentIndex=4;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.menu,color: AppColorLight.gray2,),
                                  Text('More',
                                    style: TextStyles.font10CustomGray500WightPoppins,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              child: Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child:  Icon(Icons.search,size: currentIndex==2?40:33,color: AppColorLight.primaryColor,)
              ),
            ),
          ),
        ],
      );
  }
}
