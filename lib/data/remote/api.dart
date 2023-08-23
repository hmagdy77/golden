class Api {
  //*************************google maps***********************
  static const String apiGoogleMaps =
      'https://www.google.com/maps/search/?api=1&query=';

  //***************************Api***************************
  static const String baseUrl = 'https://goldensportsacademy.com/golden';
  // 'http://10.0.2.2/golden';
  //'http://ahmedaliads.com/golden';
  static const String agentAreaUrl =
      'https://goldswimming-guardian.web.app/#/onboarding';
  static const String goldenWebUrl = 'goldensportsacademy.com';
  //***************************images***************************
  static const String getImages = '$baseUrl/images/view_all.php';
  static const String viewOneImage = '$baseUrl/images/saved';
  //***************************posts***************************
  static const String getPosts = '$baseUrl/posts/view_all.php';
  static const String viewPostsImages = '$baseUrl/posts/saved';
//***************************videos***************************
  static const String getVideos = '$baseUrl/videos/view.php';
//***************************videos***************************
  static const String addSign = '$baseUrl/agents/add.php';
}
