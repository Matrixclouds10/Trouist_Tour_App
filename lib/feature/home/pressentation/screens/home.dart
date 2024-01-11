import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController controller =TextEditingController();

  int currentIndex = 0;
  int currentIndex2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(10),
              SvgPicture.asset(AppImages.logoSvg),
              verticalSpace(16),
             Padding(
               padding: EdgeInsets.only(left: 16.w,right: 16.w),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(
                     width: 342.w,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Icon(Icons.location_on_outlined,
                           color: Theme.of(context).primaryColor,),
                         horizontalSpace(4),
                         Text('king Abdelaziz St',
                           style: TextStyles.font17Black400Wight,
                         ),
                         const Spacer(),
                         const Icon(Icons.notifications_none,
                           color: AppColorLight.gray2,
                         )
                       ],
                     ),
                   ),
                   verticalSpace(16),
                   Text(" Let's The Fun Begin !",
                     style: TextStyles.font24CustomBlack700Weight,
                   ),
                   verticalSpace(16),
                   SizedBox(
                     height: 190.h,
                     // width: double.infinity,
                     child: CarouselSlider(
                         items:[
                           ClipRRect(
                                borderRadius:const BorderRadius.all(Radius.circular(10)),
                               child: Image.asset(AppImages.category,fit: BoxFit.cover,width:MediaQuery.of(context).size.width)),
                         ],
                         options: CarouselOptions(
                           height: 190.h,
                           aspectRatio: 16/9,
                           viewportFraction: 1,
                           initialPage: 0,
                           enableInfiniteScroll: true,
                           reverse: false,
                           autoPlay: true,
                           autoPlayInterval: const Duration(seconds: 3),
                           autoPlayAnimationDuration: const Duration(milliseconds: 800),
                           autoPlayCurve: Curves.easeInOut,
                           enlargeCenterPage: true,
                           enlargeFactor: 0.3,
                           onPageChanged: (index, reason){
                             setState(() {
                               print('tets : $index');
                               // carouselController.nextPage();
                               currentIndex =index;
                             });
                           },
                           scrollDirection: Axis.horizontal,
                         ),

                     ),
                   ),
                   verticalSpace(8),
                   Center(
                     child: DotsIndicator(
                       dotsCount: 3,
                       position: currentIndex.toDouble(),
                     ),
                   ),
                   verticalSpace(16),
                   CustomTextField(
                     borderColor: AppColorLight.customGray,
                       hintText: 'Search For A Tourist Place',
                       hintStyle: TextStyles.font14CustomGray400w,
                       prefixIcon: const Icon(Icons.search,color: AppColorLight.gray2,),
                       controller: controller),
                   verticalSpace(25),
                   Row(
                     children: [
                       Text("Our Programs",
                         style: TextStyles.font24CustomBlack700Weight.copyWith(fontSize: 17),
                       ),
                       const Spacer(),
                       Text("See All",
                         style: TextStyles.font12CustomGray400Weight.copyWith(
                             color: const Color(0xffE74646),
                             fontWeight: FontWeight.w700,
                             ),
                       ),
                     ],
                   ),
                   verticalSpace(16),
                   SizedBox(
                     height: 122.h,
                     child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: 10,
                         itemBuilder: (context,index){
                       return Padding(
                         padding:  EdgeInsets.only(right: 8.w),
                         child: Column(
                           children: [
                             Expanded(
                               child: Container(
                                 width: 90.w,
                                 height: 90.h,
                                 child: Image.asset(AppImages.program1),
                               ),
                             ),
                             SizedBox(
                                 height: 24.h,
                                 child: Text('Religious',
                                 style: TextStyles.font17Black400Wight.copyWith(color: AppColorLight.customBlack),
                                 )),
                           ],
                         ),
                       );
                     }),
                   ),
                   verticalSpace(25),
                   Text("Custom Program",
                     style: TextStyles.font24CustomBlack700Weight.copyWith(fontSize: 17),
                   ),
                   verticalSpace(16),
                   Container(
                     height:170.h ,
                     width: 345.w,
                     decoration: BoxDecoration(
                       borderRadius: const BorderRadius.all(Radius.circular(10)),
                       color: AppColorLight.customGray.withOpacity(0.10),
                     ),
                     child: Column(
                       children: [
                         verticalSpace(16),
                         SizedBox(
                           width:315.w,
                           height: 71.h,
                           child: Text('Lorem ipsum dolor sit amet consectetur. Facilisi nam quam tellus etiam non ut vel at magna. Felis porta fermentum .',
                           style: TextStyles.font17CustomGray400Wight.copyWith(
                             color: const Color(0xff4C5756)
                           ),
                             textAlign: TextAlign.center,
                           ),
                         ),
                         verticalSpace(24),
                         CustomMaterialButtonWidget(
                             height: 36,
                             minWidth: 205.w,
                             text: 'Make Your Program',
                             textSize: 14,
                             onPressed: (){}),
                       ],
                     ),
                   ),
                   verticalSpace(15),
                   SizedBox(
                     height: 190.h,
                     child: CarouselSlider(
                       items:[
                         ClipRRect(
                             borderRadius:const BorderRadius.all(Radius.circular(10)),
                             child: Stack(
                               children: [
                                 Image.asset(AppImages.offer,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
                                 Center(
                                   child: Container(
                                     height: 100.h,
                                     width:222.w,
                                     color: const Color(0xffC00614),
                                     child: Padding(
                                       padding:  EdgeInsets.only(top: 5.h,left: 24.w,right: 24.w,bottom: 8.h),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisSize: MainAxisSize.min,
                                         children: [
                                           Container(
                                             height: 20.h,
                                             child: Text('NOW',
                                               style: TextStyles.font17CustomGray400Wight.copyWith(color: Colors.white),
                                             ),
                                           ),
                                           Container(
                                             height: 38.h,
                                             child: Text('40% OFF',
                                               style: TextStyles.font14CustomBlack500w.copyWith(fontSize: 32.sp,color: Colors.white),
                                             ),
                                           ),
                                           Container(
                                             height: 20.h,
                                             child: Text('Amazing Offers Here',
                                               style: TextStyles.font17CustomGray400Wight.copyWith(color: Colors.white),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             )),
                       ],
                       options: CarouselOptions(
                         height: 400,
                         aspectRatio: 16/9,
                         viewportFraction: 1,
                         initialPage: 0,
                         enableInfiniteScroll: true,
                         reverse: false,
                         autoPlay: true,
                         autoPlayInterval: const Duration(seconds: 3),
                         autoPlayAnimationDuration: const Duration(milliseconds: 800),
                         autoPlayCurve: Curves.easeInOut,
                         enlargeCenterPage: true,
                         enlargeFactor: 0.3,
                         onPageChanged: (index, reason){
                           setState(() {
                             currentIndex2 =index;
                             print(index);
                             print(currentIndex2);

                           });
                         },
                         scrollDirection: Axis.horizontal,
                       ),

                     ),
                   ),
                   verticalSpace(8),

                   Center(
                     child: DotsIndicator(
                       dotsCount: 3,
                       position: currentIndex2.toDouble(),
                     ),
                   ),
                   verticalSpace(25),
                   Row(
                     children: [
                       Text("Tourist Places",
                         style: TextStyles.font24CustomBlack700Weight.copyWith(fontSize: 17),
                       ),
                       const Spacer(),
                       Text("See All",
                         style: TextStyles.font12CustomGray400Weight.copyWith(
                           color: const Color(0xffE74646),
                           fontWeight: FontWeight.w700,
                         ),
                       ),
                     ],
                   ),
                   verticalSpace(16),
                   GridView.count(
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     crossAxisCount: 2,
                     crossAxisSpacing: 5,
                     mainAxisSpacing: 10,
                     childAspectRatio: 1 / 0.75,
                     children: List.generate(10, (index) {
                       return SizedBox(
                         width: 168.w,
                         child: Column(
                           children: [
                             SizedBox(
                               height:100.h,
                               child: ClipRRect(
                                 borderRadius: const BorderRadius.all(Radius.circular(10)),
                                 child: Image.asset(AppImages.testImage,fit: BoxFit.cover,width: 168.w,),
                               ),
                             ),
                             verticalSpace(8),
                             const Text('Rijal Almaa Village'),
                           ],
                         ),
                       );
                     }),
                   ),
                   verticalSpace(100),
                 ],
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
