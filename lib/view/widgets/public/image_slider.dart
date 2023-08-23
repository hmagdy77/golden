import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../images/my_image_container.dart';
 
class ImageSlider extends StatelessWidget {
  const ImageSlider(
      {super.key, required this.deffualtUrl, required this.images});
  final String deffualtUrl;
  final List images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount:
          images.length, //placeImagesController.placeMenuImagesList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        if (images.isEmpty) {
          return MyImageContainer(
            url: deffualtUrl,
            width: Sizes.width,
          );
        } else {
          var image = images[itemIndex];
          return MyImageContainer(
            url: image,
            //'${AppStrings.apiViewPlaceImages}/${image.imageName}',
          );
        }
      },
      options: CarouselOptions(
        autoPlay: true,
        pauseAutoPlayOnTouch: true,
        height: AppSizes.h3,
        autoPlayInterval: const Duration(milliseconds: 1300),
        viewportFraction: 1,
        enableInfiniteScroll: true,
      ),
    );
  }
}
