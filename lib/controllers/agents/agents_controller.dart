import '../../libraries.dart';

abstract class AgentsController extends GetxController {
  addSign({required String activty, required context});
  addSuggest({required context});
}

class AgentsControllerImp extends AgentsController {
  MyService myService = Get.find();
  var isLoading = false.obs;
  late GroupController genderController;
  late GroupController signedController;
  late GroupController playedController;
  late GroupController borthersController;

  late TextEditingController name;
  late TextEditingController age;
  late TextEditingController phone;
  late TextEditingController sug;
  GlobalKey<FormState> addSignKey = GlobalKey<FormState>();
  GlobalKey<FormState> addSuggestKey = GlobalKey<FormState>();

  var printNumber = 0.obs;
  @override
  void onInit() {
    name = TextEditingController();
    age = TextEditingController();
    phone = TextEditingController();
    sug = TextEditingController();
    genderController = GroupController();
    signedController = GroupController();
    playedController = GroupController();
    borthersController = GroupController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    age.dispose();
    phone.dispose();
    sug.dispose();
    super.dispose();
  }

  @override
  addSign({required String activty, required context}) async {
    var formData = addSignKey.currentState;
    if (formData!.validate()) {
      isLoading(true);
      try {
        var add = await Crud.postRequest(
          Api.addSign,
          {
            'name': name.text,
            'age': age.text.toString(),
            'phone': phone.text.toString(),
            'activty': activty,
            'sug': '',
            'gender': genderController.selectedItem.toString() == AppStrings.boy
                ? '0'
                : '1',
            'borthers':
                borthersController.selectedItem.toString() == AppStrings.no
                    ? '0'
                    : '1',
            'signed': signedController.selectedItem.toString() == AppStrings.no
                ? '0'
                : '1',
            'played': playedController.selectedItem.toString() == AppStrings.no
                ? '0'
                : '1',
          },
          statusModelFromJson,
        );
        if (add.status == 'fail') {
          isLoading(false);
          update();
          showSnack(context: context, title: AppStrings.checkInternet);
          // Get.back();
        } else if (add.status == 'suc') {
          Get.back();
          showSnack(context: context, title: AppStrings.done);
          isLoading(false);
          update();
        }
      } catch (_) {
        isLoading(false);
        update();
        showSnack(context: context, title: AppStrings.checkInternet);
        // Get.back();
      }
    }
  }

  @override
  addSuggest({required context}) async {
    var formData = addSuggestKey.currentState;
    if (formData!.validate()) {
      isLoading(true);
      try {
        var add = await Crud.postRequest(
          Api.addSign,
          {
            'name': name.text,
            'phone': phone.text.toString(),
            'sug': sug.text.toString(),
            'age': '0',
            'activty': '0',
            'gender': '',
            'borthers': '',
            'signed': '',
            'played': '',
          },
          statusModelFromJson,
        );
        if (add.status == 'fail') {
          isLoading(false);
          update();
          showSnack(context: context, title: AppStrings.checkInternet);
          // Get.back();
        } else if (add.status == 'suc') {
          name.clear();
          phone.clear();
          sug.clear();
          showSnack(context: context, title: AppStrings.doneSend);
          isLoading(false);
          update();
        }
      } catch (_) {
        isLoading(false);
        update();
        showSnack(context: context, title: AppStrings.checkInternet);
        // Get.back();
      }
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
