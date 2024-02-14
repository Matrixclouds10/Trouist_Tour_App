import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import 'package:tourist_tour_app/feature/home/data/models/offer_model.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_display_video.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_video_player.dart';
import 'package:video_player/video_player.dart';
void showCustomImages({required BuildContext context, required List<OfferModel?> images}){
  Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
        PageController imagePageController =
        PageController();
        return Stack(
          children: [
            PhotoViewGallery.builder(
              pageController: imagePageController,
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return
                  PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider( images[index]!.image),
                  initialScale: PhotoViewComputedScale.covered,
                  heroAttributes: PhotoViewHeroAttributes(
                      tag: images[index]!),
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered,
                    errorBuilder: (context, error, stackTrace) {
                      // Return a custom widget to display when image loading fails
                      return Material(
                        child:
                        images[index]!.off=='true'?
                        VideoPlayerWidget(videoUrl: images[index]!.image):
                        Image.asset(
                          AppImages.video,
                          width: double.infinity,
                          height: double.infinity,// Path to your custom error image
                        ),
                      );
                    },
                    onTapUp: (context, details, controllerValue) {

                    },
                );
              },

              itemCount:  images.length,
              loadingBuilder: (BuildContext context, ImageChunkEvent? event) => Center(
                child:
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(AppImages.holder,fit: BoxFit.cover,),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: event == null ? 0 : event.cumulativeBytesLoaded /
                              event.expectedTotalBytes!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: imagePageController,
                count:  images.length,
                effect: SlideEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Colors.white,
                    dotColor:
                    Colors.white.withOpacity(0.3)),
                onDotClicked: (int index) =>
                    imagePageController.animateToPage(
                        index,
                        duration:
                        const Duration(milliseconds: 250),
                        curve: Curves.ease),
              ),
            ),
          ],
        );
      }));
}
