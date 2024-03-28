import 'package:chat_app/Services/connectivity_services.dart';
import 'package:chat_app/View/after_auth/HomeView.dart';
import 'package:chat_app/View/auth/LoginView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  @override
  void onInit() {
    checkConnection();
    super.onInit();
  }

  checkConnection() async {
    var result = await ConnectivityServices().checkConnectivity();
    if (result) {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAndToNamed(HomeView.viewID);
        return;
      } else {
        Get.offAndToNamed(LoginView.viewID);
        return;
      }
    }
  }
}
