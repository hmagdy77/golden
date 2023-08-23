import 'package:intl/intl.dart';
import '../../libraries.dart';

abstract class PostsController extends GetxController {
  getPosts();
  sortPosts();
  makeSeen({required int id});
}

class PostsControllerImp extends PostsController {
  MyService myService = Get.find();
  String alertKey = 'alertKey';
  var isLoading = false.obs;
  var currentImage = 0.obs;
  var postsList = <Post>[].obs;
  var offers = <Post>[].obs;
  var alerts = <Post>[].obs;
  var activties = <Post>[].obs;
  var news = <Post>[].obs;
  var formatter = DateFormat('dd-MM-yyyy');

  @override
  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic('posts');
    fcmConfig();
    setupInteractedMessage();
    getPosts();
    super.onInit();
  }

  @override
  getPosts() async {
    isLoading(true);
    try {
      var posts = await Crud.postRequest(
        Api.getPosts,
        {},
        postModelFromJson,
      );
      if (posts.status == 'suc') {
        postsList.addAll(posts.data);
        sortPosts();
        isLoading(false);
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

  @override
  sortPosts() {
    activties.value = postsList.where(
      (post) {
        var postKind = post.kind;
        return postKind == '1';
        // return postKind == 1;
      },
    ).toList();
    offers.value = postsList
        .where(
          (post) {
            var postKind = post.kind;
            // return postKind == 2;
            return postKind == '2';
          },
        )
        .toList()
        .reversed
        .toList();
    news.value = postsList
        .where(
          (post) {
            var postKind = post.kind;
            // return postKind == 3;
            return postKind == '3';
          },
        )
        .toList()
        .reversed
        .toList();
    alerts.value = postsList
        .where(
          (post) {
            var postKind = post.kind;
            // return postKind == 4;
            return postKind == '4';
          },
        )
        .toList()
        .reversed
        .toList();
  }

  @override
  makeSeen({required int id}) async {
    myService.sharedPreferences.setInt(alertKey, id);
  }

  fcmConfig() async {
    // ignore: unused_local_variable
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      announcement: false,
      provisional: false,
      criticalAlert: false,
    );
    FirebaseMessaging.onMessage.listen(
      (event) {
        Get.snackbar(
          event.notification!.title!,
          event.notification!.body!,
          duration: const Duration(seconds: 3),
        );
        FlutterRingtonePlayer.playNotification();
      },
    );
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      reciveMessageWhenAppTerminated(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(reciveMessageWhenAppTerminated);
  }

  void reciveMessageWhenAppTerminated(RemoteMessage message) {
    if (message.data["pageid"] == "2") {
      Get.toNamed(AppRoutes.offerScreen);
    } else if (message.data["pageid"] == "3") {
      Get.toNamed(AppRoutes.newsScreen);
    } else if (message.data["pageid"] == "4") {
      makeSeen(id: int.parse(alerts.first.id));
      Get.toNamed(AppRoutes.alertsScreen);
    }
  }

  void showSnack({required context, required String title}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.center,
          style: Get.textTheme.displayMedium!
              .copyWith(color: AppColorManger.lightScaffold),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.w02,
          vertical: AppSizes.h05,
        ),
        padding: EdgeInsets.all(AppSizes.h01),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColorManger.primary,
      ),
    );
  }
}
