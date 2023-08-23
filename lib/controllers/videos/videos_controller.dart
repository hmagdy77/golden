
import '../../libraries.dart';

abstract class VideosController extends GetxController {
  getVideos();
}

class VideosControllerImp extends VideosController {
  var isLoading = false.obs;
  var videosList = <Video>[].obs;
  var youTubecontrollers = <YoutubePlayerController>[].obs;

  @override
  void onInit() {
    getVideos();
    super.onInit();
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
