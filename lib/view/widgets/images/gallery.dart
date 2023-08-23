import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';
import '../../../data/models/images_model.dart';
import '../../../data/remote/api.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key, required this.imagesPostList});

  final List<ImageModelItem> imagesPostList;
  // final ImagesControllerImp imagesControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    final imagesList = List<String>.generate(imagesPostList.length,
        (int index) => '${Api.viewOneImage}/${imagesPostList[index].name}',
        growable: true);
    return Column(
      children: [
        GalleryImage(
          numOfShowImages: imagesList.length,
          imageUrls: imagesList,
          titleGallery: '',
        ),
      ],
    );
  }
}

// Expanded(
        //   child: GridView.builder(
        //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //       maxCrossAxisExtent: AppSizes.h3,
        //     ),
        //     itemBuilder: (context, index) {
        //       return GestureDetector(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: MyImageContainer(
        //               url:
        //                   '${AppStrings.apiViewPlaceImages}/${imagesList[index].imageName}'),
        //         ),
        //       );
        //     },
        //     itemCount: imagesList.length,
        //   ),
        // )

        // ImageSlider(
        //   deffualtUrl:
        //       '${AppStrings.apiViewPlaceLogoImage}/${place.placeImage}',
        //   images: placeImagesController.imagesList,
        // ),