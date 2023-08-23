import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import '../../../../core/service/services.dart';
import '../../../core/functions/crud.dart';
import '../../core/constants/app_strings.dart';
import '../../data/models/images_model.dart';
import '../../../data/remote/api.dart';
import '../../data/models/status_model.dart';
import '../../routes.dart';
import '../../view/widgets/login/snackbar.dart';

abstract class ImagesController extends GetxController {
  addImage();
  getImages();
  sortImages();
  getPostImages({required String postId});
  deleteImage({required ImageModelItem image});
}

class ImagesControllerImp extends ImagesController {
  MyService myService = Get.find();
  var isLoading = false.obs;
  var currentImage = 0.obs;
  File? file;
  List<File>? files;
  var imageKind = ''.obs;
  var selectedKind = ''.obs;
  var kindList = [
    AppStrings.sliderImages,
    AppStrings.gallery,
  ];
  late CarouselController carouselController;
  var allImages = <ImageModelItem>[].obs;
  var sliderImages = <ImageModelItem>[].obs;
  var galleryImages = <ImageModelItem>[].obs;
  var postImages = <ImageModelItem>[].obs;

  @override
  void onInit() {
    carouselController = CarouselController();
    getImages();
    super.onInit();
  }

  @override
  addImage() async {
    isLoading(true);
    try {
      var addImage = await Crud.postRequestWithFile(
        url: Api.addImages,
        data: {
          'kind': imageKind.value,
        },
        function: statusModelFromJson,
        file: file!,
        imageName: 'name',
      );
      if (addImage.status == 'suc') {
        Get.offAllNamed(AppRoutes.loadingScreen,
            arguments: [AppRoutes.mainScreen]);
        isLoading(false);
        update();
      } else {
        MySnackBar.snack(addImage.status, '');
        isLoading(false);
        update();
      }
    } catch (_) {
      isLoading(false);
      update();
    }
  }

  @override
  deleteImage({required ImageModelItem image}) async {
    isLoading(true);
    update();

    var delete = await Crud.postRequest(
      Api.deleteImages,
      {
        'id': image.id.toString(),
        'name': image.name,
      },
      statusModelFromJson,
    );
    if (delete.status == 'suc') {
      Get.offAllNamed(
        AppRoutes.loadingScreen,
        arguments: [AppRoutes.addImageScreen],
      );
      isLoading(false);
      update();
    } else {
      MySnackBar.snack(AppStrings.pleaseChekInternet, AppStrings.faild);
      isLoading(false);
      update();
    }
    try {} catch (_) {
      isLoading(false);
      update();
    }
  }

  @override
  getImages() async {
    isLoading(true);
    try {
      var images = await Crud.postRequest(
        Api.getImages,
        {},
        imageModelClassFromJson,
      );
      if (images.status == 'fail') {
        isLoading(false);
        update();
      } else if (images.status == 'suc') {
        allImages.addAll(images.data);
        sortImages();
        isLoading(false);
        update();
      }
    } catch (_) {
      isLoading(false);
      update();
    }
  }

  @override
  sortImages() {
    sliderImages.value = allImages.where(
      (image) {
        var imageKind = image.kind;
        return imageKind == '1';
      },
    ).toList();
    galleryImages.value = allImages.where(
      (image) {
        var imageKind = image.kind;
        return imageKind == '2';
      },
    ).toList();
  }

  @override
  getPostImages({required String postId}) {
    isLoading(true);
    update();
    postImages.clear();
    postImages.value = allImages.where(
      (image) {
        var imageKind = image.kind;
        return imageKind == postId;
      },
    ).toList();
    isLoading(false);
    update();
  }

  addGroupImages() async {
    isLoading(true);
    update();
    try {
      for (int i = 0; i < files!.length; i++) {
        var addImage = await Crud.postRequestWithFile(
          url: Api.addImages,
          data: {
            'kind': imageKind.value,
          },
          function: statusModelFromJson,
          file: files![i],
          imageName: 'name',
        );
        if (i == files!.length - 1) {
          if (addImage.status == 'suc') {
            Get.offAllNamed(
              AppRoutes.loadingScreen,
              arguments: [AppRoutes.addImageScreen],
            );
            isLoading(false);
            update();
          } else {
            MySnackBar.snack(AppStrings.pleaseChekInternet, '');
            isLoading(false);
            update();
          }
        } else {
          isLoading(false);
          update();
        }
      }
    } catch (_) {
      isLoading(false);
      update();
    }
  }

  deleteGroupImages({required List<ImageModelItem> images}) async {
    isLoading(true);
    update();
    try {
      for (int i = 0; i < files!.length; i++) {
        var delete = await Crud.postRequest(
          Api.deleteImages,
          {
            'id': images[i].id.toString(),
            'name': images[i].name,
          },
          statusModelFromJson,
        );
        if (i == images.length - 1) {
          if (delete.status == 'suc') {
            MySnackBar.snack(AppStrings.doneSuccessfully, '');
            isLoading(false);
            update();
          } else {
            MySnackBar.snack(AppStrings.pleaseChekInternet, '');
            isLoading(false);
            update();
          }
        } else {
          isLoading(false);
          update();
        }
      }
    } catch (_) {
      isLoading(false);
      update();
    }
  }
}
