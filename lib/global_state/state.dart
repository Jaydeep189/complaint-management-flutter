import 'package:get/get.dart';

class GetUid extends GetxController {
  var uid = ''.obs;
  void storeUid(String uid) {
    this.uid.value = uid;
  }
}
