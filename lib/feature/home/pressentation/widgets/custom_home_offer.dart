import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/home/data/models/offer_model.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_offer_widget.dart';

class CustomHomeOffer extends StatefulWidget {
  const CustomHomeOffer({super.key, required this.image,  this.height, this.isCenterPages, this.offerProgramResponse});
  final List<String?> image;
  final List<ProgramResponse>? offerProgramResponse;
  final double? height;
  final bool? isCenterPages;
  @override
  State<CustomHomeOffer> createState() => _CustomHomeOfferState();
}
class _CustomHomeOfferState extends State<CustomHomeOffer> {
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List title =[];
    List<OfferModel> list=[];
    widget.offerProgramResponse!=[];
    for(int j=0;j<=widget.offerProgramResponse!.length-1;j++){
     var res= ((double.parse(widget.offerProgramResponse![j].price!.toString()) -double.parse( widget.offerProgramResponse![j].newPrice!.toString()))/ double.parse(widget.offerProgramResponse![j].price!.toString())) *100;
      title.add(res.toString().substring(0,4));
    }

    for(int i=0;i<=widget.image.length-1;i++){
      list.add(OfferModel(image: widget.image[i]!, off: title[i]));
    }
    return Column(
      children: <Widget>[
        SizedBox(
          height:widget.height?? 376.h,
          // width: double.infinity,
          child: CarouselSlider(
            carouselController: carouselController,
            items:list
                .map((e) =>
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.network(e.image, fit: BoxFit.cover,
                    errorBuilder: (context ,error,v){
                      return const Center(child: CircularProgressIndicator(),);
                    },
                    width: double.infinity,),
                  CustomOfferWidget(off: e.off),
                ],
              ),
            )).toList(),
            options: CarouselOptions(
              height:widget.height?? 376.h,
              aspectRatio: 16/9,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              // autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: widget.isCenterPages ??false,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason){
                setState(() {
                  currentIndex =index;
                });
              },
              scrollDirection: Axis.horizontal,
            ),

          ),
        ),
        verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          widget.image.asMap().entries.map((MapEntry<int, String?> entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == entry.key
                        ? AppColorLight.primaryColor
                        : Colors.black.withOpacity(0.2)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
