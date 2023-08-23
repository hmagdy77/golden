import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/service/services.dart';
import '../../../core/functions/crud.dart';
import '../../data/models/posts_model.dart';
import '../../../data/remote/api.dart';
import '../../data/models/status_model.dart';
import '../../routes.dart';

abstract class PostsController extends GetxController {
  getPosts();
  sortPosts();
  addOffer();
  addNews();
  addAct();
  addAlert();
  setPostDate({required context, required bool start});
  editPost({required Post post});
  deletePost({required Post post});
}

class PostsControllerImp extends PostsController {
  MyService myService = Get.find();
  GlobalKey<FormState> addOfferKey = GlobalKey<FormState>();
  GlobalKey<FormState> addNewsKey = GlobalKey<FormState>();
  GlobalKey<FormState> addActKey = GlobalKey<FormState>();
  GlobalKey<FormState> editPostKey = GlobalKey<FormState>();
  GlobalKey<FormState> addAlertKey = GlobalKey<FormState>();

  var isLoading = false.obs;
  var currentImage = 0.obs;
  var postsList = <Post>[].obs;
  var offers = <Post>[].obs;
  var alerts = <Post>[].obs;
  var activties = <Post>[].obs;
  var news = <Post>[].obs;
  var formatter = DateFormat('dd-MM-yyyy');
  var uploadFormatter = DateFormat('yyyy-MM-dd');
  File? file;
  late TextEditingController title;
  late TextEditingController header;
  late TextEditingController content;
  var startDate = ''.obs;
  var endDate = ''.obs;
  var selectedKind = ''.obs;

  @override
  void onInit() {
    getPosts();
    title = TextEditingController();
    header = TextEditingController();
    content = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    header.dispose();
    content.dispose();
    super.dispose();
  }

  @override
  addOffer() async {
    var offerData = addOfferKey.currentState;
    if (offerData!.validate()) {
      try {
        isLoading(true);
        var addPost = await Crud.postRequestWithFile(
          url: Api.addPost,
          data: {
            'title': title.text,
            'header': header.text,
            'content': content.text,
            'kind': '2',
            'start':
                startDate.isEmpty ? DateTime.now().toString() : startDate.value,
            'end': endDate.isEmpty ? DateTime.now().toString() : endDate.value,
          },
          function: statusModelFromJson,
          file: file!,
          imageName: 'image',
        );
        if (addPost.status == 'suc') {
          isLoading(false);
          Get.offAllNamed(AppRoutes.loadingScreen,
              arguments: [AppRoutes.addPostScreen]);
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
  addNews() async {
    var newsData = addNewsKey.currentState;
    if (newsData!.validate()) {
      try {
        isLoading(true);
        var addPost = await Crud.postRequestWithFile(
          url: Api.addPost,
          data: {
            'title': title.text,
            'header': header.text,
            'content': content.text,
            'kind': '3',
            'start': DateTime.now().toString(),
            'end': DateTime.now().toString(),
          },
          function: statusModelFromJson,
          file: file!,
          imageName: 'image',
        );
        if (addPost.status == 'suc') {
          isLoading(false);
          Get.offAllNamed(AppRoutes.loadingScreen,
              arguments: [AppRoutes.addPostScreen]);
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
  addAct() async {
    var acrData = addActKey.currentState;
    if (acrData!.validate()) {
      try {
        isLoading(true);
        var addPost = await Crud.postRequestWithFile(
          url: Api.addPost,
          data: {
            'title': title.text,
            'header': 'header',
            'content': content.text,
            'kind': '1',
            'start': DateTime.now().toString(),
            'end': DateTime.now().toString(),
          },
          function: statusModelFromJson,
          file: file!,
          imageName: 'image',
        );
        if (addPost.status == 'suc') {
          isLoading(false);
          Get.offAllNamed(
            AppRoutes.loadingScreen,
            arguments: [AppRoutes.addPostScreen],
          );
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
  addAlert() async {
    var acrData = addAlertKey.currentState;
    if (acrData!.validate()) {
      isLoading(true);
      var addPost = await Crud.postRequestWithFile(
        url: Api.addPost,
        data: {
          'title': title.text,
          'header': 'header',
          'content': content.text,
          'kind': '4',
          'start': DateTime.now().toString(),
          'end': endDate.value.toString(),
        },
        function: statusModelFromJson,
        file: file!,
        imageName: 'image',
      );
      if (addPost.status == 'suc') {
        isLoading(false);
        Get.offAllNamed(
          AppRoutes.loadingScreen,
          arguments: [AppRoutes.addPostScreen],
        );
        update();
      } else {
        isLoading(false);
        update();
      }
      try {} catch (_) {
        isLoading(false);
        update();
      }
    }
  }

  @override
  editPost({required Post post}) async {
    var formData = editPostKey.currentState;
    if (formData!.validate()) {
      isLoading(true);
      try {
        var editPost = await Crud.postRequest(
          Api.editPost,
          {
            'id': post.id.toString(),
            'title': title.text,
            'header': header.text,
            'content': content.text,
            'start':
                startDate.isEmpty ? post.start.toString() : startDate.value,
            'end': endDate.isEmpty ? post.end.toString() : endDate.value,
          },
          statusModelFromJson,
        );
        if (editPost.status == 'suc') {
          Get.offAllNamed(AppRoutes.loadingScreen,
              arguments: [AppRoutes.mainScreen]);
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
  }

  @override
  deletePost({required Post post}) async {
    var formData = editPostKey.currentState;
    if (formData!.validate()) {
      isLoading(true);
      try {
        var delete = await Crud.postRequest(
          Api.deletePost,
          {
            'id': post.id.toString(),
            'image': post.image.toString(),
          },
          statusModelFromJson,
        );
        if (delete.status == 'suc') {
          Get.offAllNamed(
            AppRoutes.loadingScreen,
            arguments: [AppRoutes.mainScreen],
          );
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
  }

  @override
  setPostDate({required context, required bool start}) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        } else {
          if (start) {
            startDate.value = uploadFormatter.format(pickedDate);
          } else {
            endDate.value = uploadFormatter.format(pickedDate);
          }
        }
      },
    );
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
        //  return postKind == 1;
      },
    ).toList();
    offers.value = postsList
        .where(
          (post) {
            var postKind = post.kind;
            return postKind == '2';
            //  return postKind == 2;
          },
        )
        .toList()
        .reversed
        .toList();
    news.value = postsList
        .where(
          (post) {
            var postKind = post.kind;
            return postKind == '3';
            //  return postKind == 3;
          },
        )
        .toList()
        .reversed
        .toList();
    alerts.value = postsList
        .where(
          (post) {
            var postKind = post.kind;
            return postKind == '4';
          },
        )
        .toList()
        .reversed
        .toList();
  }
}
