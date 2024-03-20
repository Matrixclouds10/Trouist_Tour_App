import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class PlacesShimmerWidget extends StatelessWidget {
  const PlacesShimmerWidget({Key? key, this.height}) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: double.infinity,
        height: height?? 200.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:4 ,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child:  Shimmer.fromColors(
                  enabled: true,
                  baseColor:  Colors.grey[300]! ,
                  highlightColor:  Colors.grey[100]!,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: 140.h,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                        boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 2)]
                    ),
                  ),
                ),
              );
            }),
      );
  }
}