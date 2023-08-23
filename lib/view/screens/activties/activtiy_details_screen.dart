import '../../../libraries.dart';

class ActivtiyDetailsScreen extends StatelessWidget {
  ActivtiyDetailsScreen({super.key});
  final Post post = Get.arguments[0];
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.golden),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.h02),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    post.title,
                    style: context.textTheme.bodySmall!
                        .copyWith(color: AppColorManger.primary),
                    textAlign: TextAlign.center,
                  ), // for height
                  SizedBox(
                    height: AppSizes.h02,
                  ),

                  MyImage(
                    url: '${Api.viewPostsImages}/${post.image}',
                    width: double.infinity,
                    height: AppSizes.h35,
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h02,
                  ),
                  Text(
                    post.content,
                    style: context.textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            MyButton(
              text: AppStrings.reveseNow,
              onPressed: () {
                agentsController.age.clear();
                agentsController.name.clear();
                agentsController.phone.clear();
                Get.toNamed(
                  AppRoutes.activtiySignScreen,
                  arguments: [post],
                );
              },
              minWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}
