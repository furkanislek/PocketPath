import 'package:pocketPath/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var userName = ''.obs;
  var surName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      Map<String, dynamic>? userData = await Auth().fetchUser();
      if (userData != null) {
        userName.value = userData['firstName'] ?? 'User';
        surName.value = userData["surname"] ?? '';
      } else {
        userName.value = '';
        surName.value = '';
      }
    } catch (e) {
      userName.value = 'Error loading user';
      surName.value = 'Error loading user';
    }
  }
}
