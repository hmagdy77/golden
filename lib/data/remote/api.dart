class Api {
  //*************************google maps***********************
  static const String apiGoogleMaps =
      'https://www.google.com/maps/search/?api=1&query=';

  //***************************Api***************************
  static const String baseUrl = 'https://goldensportsacademy.com/golden';
  // 'http://localhost/golden';
  // 'http://ahmedaliads.com/golden';
  // 'http://10.0.2.2/golden';
  //***************************images***************************
  static const String addImages = '$baseUrl/images/add.php';
  static const String deleteImages = '$baseUrl/images/delete.php';
  static const String getImages = '$baseUrl/images/view_all.php';
  static const String viewOneImage = '$baseUrl/images/saved';
  //***************************posts***************************
  static const String addPost = '$baseUrl/posts/add.php';
  static const String editPost = '$baseUrl/posts/edit.php';
  static const String deletePost = '$baseUrl/posts/delete.php';
  static const String getPosts = '$baseUrl/posts/view_all.php';
  static const String viewPostsImages = '$baseUrl/posts/saved';
//***************************videos***************************
  static const String getVideos = '$baseUrl/videos/view.php';
  static const String addVideos = '$baseUrl/videos/add.php';
  static const String deleteVideos = '$baseUrl/videos/delete.php';
//***************************videos***************************
  static const String getSigns = '$baseUrl/agents/view.php';
  static const String editSigns = '$baseUrl/agents/edit.php';
  static const String deleteSigns = '$baseUrl/agents/delete.php';
}
