import 'package:get/get.dart';

import 'controllers/images/images_controller.dart';
import 'controllers/posts/posts_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PostsControllerImp());
    Get.put(ImagesControllerImp());
  }
}
