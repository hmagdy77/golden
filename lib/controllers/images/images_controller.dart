import '../../libraries.dart';

abstract class ImagesController extends GetxController {
  getImages();
  sortImages();
  getPostImages({required String postId});
}

class ImagesControllerImp extends ImagesController {
  MyService myService = Get.find();
  var isLoading = false.obs;
  var currentImage = 0.obs;
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
    // isLoading(true);
    // update();
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

    // isLoading(false);
    // update();
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
}
