import 'package:get/get.dart';

class TasksController extends GetxController {
  //TODO: Implement TasksController

  final count = 0.obs;

  RxString currentId = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
