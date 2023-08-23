import 'libraries.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PostsControllerImp());
    Get.put(ImagesControllerImp());
    Get.put(AgentsControllerImp());
  }
}
