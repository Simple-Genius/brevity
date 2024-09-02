import 'package:brevity/app/data/constants.dart';
import 'package:brevity/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:brevity/app/modules/task/components/category_task_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskView extends GetView<CalendarController> {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 47),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
            ),
            Center(
              child: Text(
                'Create a Task',
                style: GoogleFonts.philosopher(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: GoogleFonts.philosopher(fontSize: 20),
                  ),
                  TextField(
                    controller: controller.nameController,
                    style: GoogleFonts.philosopher(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Date',
                    style: GoogleFonts.philosopher(fontSize: 20),
                  ),
                  TextField(
                    readOnly: true,
                    controller: controller.dateController,
                    style: GoogleFonts.philosopher(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 35.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 44),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Time',
                              style: GoogleFonts.philosopher(fontSize: 15),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () async {
                                controller.selectedStartTime.value =
                                    (await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            DateTime.now())))!;
                              },
                              child: Obx(() => Text(
                                    controller.selectedStartTime.value
                                        .format(context),
                                    style:
                                        GoogleFonts.philosopher(fontSize: 25),
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'End Time',
                              style: GoogleFonts.philosopher(fontSize: 15),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () async {
                                controller.selectedEndTime.value =
                                    (await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            DateTime.now())))!;
                              },
                              child: Obx(() => Text(
                                    controller.selectedEndTime.value
                                        .format(context),
                                    style:
                                        GoogleFonts.philosopher(fontSize: 25),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                        padding: EdgeInsets.only(left: 0, right: 37.5),
                        child: Divider()),
                    const SizedBox(height: 25),
                    Text('Description',
                        style: GoogleFonts.philosopher(fontSize: 25)),
                    const SizedBox(height: 23),
                    Text('Describe about the task',
                        style: GoogleFonts.philosopher(fontSize: 15)),
                    Padding(
                        padding: const EdgeInsets.only(right: 37.5),
                        child: TextField(
                          controller: controller.descriptionController,
                        )),
                    const SizedBox(height: 20),
                    Text('Category',
                        style: GoogleFonts.philosopher(fontSize: 20)),
                    SizedBox(
                      height: Get.height * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 40,
                            childAspectRatio: 111.43 / 50,
                            children: List.generate(
                                controller.categories.length, (int index) {
                              return Obx(() => CategoryTaskBox(
                                    name: controller.categories[index],
                                    onSelected: () {
                                      controller.selectedCategory.value =
                                          controller.categories[index];
                                      debugPrint(controller.categories[index]);
                                    },
                                    textColor:
                                        controller.selectedCategory.value ==
                                                controller.categories[index]
                                            ? Colors.white
                                            : Colors.black,
                                    color: controller.selectedCategory.value ==
                                            controller.categories[index]
                                        ? null
                                        : categoryColor,
                                    gradient:
                                        controller.selectedCategory.value ==
                                                controller.categories[index]
                                            ? categoryGradient
                                            : null,
                                  ));
                            })),
                      ),
                    ),
                    Obx(() => Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: InkWell(
                            splashColor: Colors.black,
                            onTap: () {
                              controller.createTask(context);
                            },
                            child: Container(
                              height: 50,
                              width: 274.22,
                              decoration: BoxDecoration(
                                  color: controller.isLoading.value == false
                                      ? null
                                      : Colors.grey,
                                  gradient: controller.isLoading.value == false
                                      ? const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                              Color(0xFF2CF37C),
                                              Color(0xff3A49F9)
                                            ])
                                      : null,
                                  borderRadius: BorderRadius.circular(40.57)),
                              child: Center(
                                child: controller.isLoading.value == true
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Create Task',
                                            style: GoogleFonts.philosopher(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(width: 10),
                                          const SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 1,
                                                color: Colors.white,
                                              ))
                                        ],
                                      )
                                    : Text(
                                        'Create Task',
                                        style: GoogleFonts.philosopher(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
