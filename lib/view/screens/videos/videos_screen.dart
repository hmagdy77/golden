import '../../../libraries.dart';

class VideosScreen extends StatelessWidget {
  VideosScreen({super.key});
  final VideosControllerImp videosController = Get.put(VideosControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.viedosLibrary),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.h01),
        child: Obx(
          () {
            if (videosController.isLoading.value) {
              return const MyLottieLoading();
            } else if (videosController.videosList.isEmpty) {
              return const MyLottieInternet();
            } else {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    // margin: const EdgeInsets.all(8),
                    child: YoutubePlayer(
                      key:
                          ObjectKey(videosController.youTubecontrollers[index]),
                      controller: videosController.youTubecontrollers[index],
                      actionsPadding: const EdgeInsets.only(left: 16.0),
                      bottomActions: [
                        CurrentPosition(),
                        const SizedBox(width: 10.0),
                        ProgressBar(isExpanded: true),
                        const SizedBox(width: 10.0),
                        RemainingDuration(),
                        // FullScreenButton(),
                      ],
                    ),
                  );
                },
                itemCount: videosController.youTubecontrollers.length,
                separatorBuilder: (context, _) => Divider(
                  color: context.theme.primaryColorLight,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
