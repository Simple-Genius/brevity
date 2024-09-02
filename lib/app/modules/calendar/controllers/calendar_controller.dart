import 'package:brevity/app/data/model.dart';
import 'package:brevity/app/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  //TODO: Implement CalendarController

  RxString taskDate = DateFormat('MMMM dd, y').format(DateTime.now()).obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString selectedCategory = 'Presentation'.obs;
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Rx<TimeOfDay> selectedStartTime = const TimeOfDay(hour: 0, minute: 0).obs;
  Rx<TimeOfDay> selectedEndTime = const TimeOfDay(hour: 0, minute: 0).obs;
  RxBool isLoading = false.obs;

  List<String> categories = [
    'Presentation',
    'Class',
    'Meeting',
    'Lab',
    'Test',
    'Project'
  ];

  @override
  void onInit() {
    super.onInit();
    dateController.text = taskDate.value;
  }

  Future<void> createTask(BuildContext context) async {
    isLoading.value = true;
    final task = Task(
        nameController.text,
        selectedCategory.value,
        taskDate.value,
        descriptionController.text,
        selectedEndTime.value.format(context),
        selectedStartTime.value.format(context));

    await dataService.saveData(task);
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
