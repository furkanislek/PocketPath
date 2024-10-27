import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(null);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkUserStatus();
  }

  void checkUserStatus() {
    _firebaseAuth.authStateChanges().listen((User? currentUser) {
      user.value = currentUser;
      isLoading.value = false; 
    });
  }
}
