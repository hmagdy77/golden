import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../core/functions/crud.dart';
import '../../../data/remote/api.dart';
import '../../core/constants/app_strings.dart';
import '../../data/models/status_model.dart';
import '../../data/models/videos_model.dart';
import '../../routes.dart';
import '../../view/widgets/login/snackbar.dart';

abstract class AlertController extends GetxController {
  getVideos();
  addVideo();
  deleteVideo({required String id});
}

class AlertControllerImp extends AlertController {
  var isLoading = false.obs;
  var videosList = <Video>[].obs;
  late TextEditingController url;
  GlobalKey<FormState> addVideoKey = GlobalKey<FormState>();
  var youTubecontrollers = <YoutubePlayerController>[].obs;

  @override
  void onInit() {
    getVideos();
    url = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    url.dispose();
    super.dispose();
  }

  @override
  addVideo() async {
    var formData = addVideoKey.currentState;
    if (formData!.validate()) {
      try {
        isLoading(true);
        var addVideo = await Crud.postRequest(
          Api.addVideos,
          {'url': url.text},
          statusModelFromJson,
        );
        if (addVideo.status == 'suc') {
          isLoading(false);
          Get.offAllNamed(AppRoutes.loadingScreen,
              arguments: [AppRoutes.addVideoScreen]);
          update();
        } else {
          isLoading(false);
          update();
        }
      } catch (_) {
        isLoading(false);
        update();
      }
    }
  }

  @override
  deleteVideo({required String id}) async {
    try {
      isLoading(true);
      var addVideo = await Crud.postRequest(
        Api.deleteVideos,
        {'id': id},
        statusModelFromJson,
      );
      if (addVideo.status == 'suc') {
        Get.offAllNamed(AppRoutes.loadingScreen,
            arguments: [AppRoutes.addVideoScreen]);
        isLoading(false);
        update();
      } else {
        MySnackBar.snack(AppStrings.pleaseChekInternet, AppStrings.faild);
        isLoading(false);
        update();
      }
    } catch (_) {
      isLoading(false);
      update();
    }
  }

  @override
  getVideos() async {
    isLoading(true);
    try {
      var videos = await Crud.postRequest(
        Api.getVideos,
        {},
        videoModelFromJson,
      );
      if (videos.status == 'fail') {
        isLoading(false);
        update();
      } else if (videos.status == 'suc') {
        videosList.addAll(videos.data);
        youTubecontrollers.value = videosList
            .map<YoutubePlayerController>(
              (video) => YoutubePlayerController(
                initialVideoId: video.url,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                ),
              ),
            )
            .toList();
        isLoading(false);
        update();
      }
    } catch (_) {
      isLoading(false);
      update();
    }
  }
}
