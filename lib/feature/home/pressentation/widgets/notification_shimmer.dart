import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmerWidget extends StatelessWidget {
  const NotificationShimmerWidget({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            notificationShimmerItem(context),
            notificationShimmerItem(context),
            notificationShimmerItem(context),
            notificationShimmerItem(context),
            notificationShimmerItem(context),
          ],
        ),
      ),
    );
  }

  Widget notificationShimmerItem(context) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        width: double.infinity,
        height: 150.h,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(0),
                  color: Colors.grey.shade200,
                  boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 2)
                  ]),
            ),
          ),
        ),
  );
}
