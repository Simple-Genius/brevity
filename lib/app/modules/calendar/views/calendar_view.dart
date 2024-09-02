import 'package:brevity/app/modules/global_components/bottom_nav_bar.dart';
import 'package:brevity/app/routes/app_pages.dart';
import 'package:brevity/app/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomBar(1),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(height: 23),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    dataService.retrieveData();
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 30),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('MMMM, y').format(DateTime.now()),
                    style: GoogleFonts.philosopher(
                        color: const Color(0xFF2E3A59),
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  )),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.TASK);
                },
                child: Container(
                  height: 38,
                  width: 93,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFF32C74), Color(0xff3A49F9)]),
                      borderRadius: BorderRadius.circular(40.57)),
                  child: Center(
                    child: Text(
                      '+ Add task',
                      style: GoogleFonts.philosopher(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 17),
          Obx(() => TableCalendar(
                headerVisible: false,
                firstDay: DateTime.utc(2022, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                selectedDayPredicate: (DateTime selectedDate) {
                  if (controller.selectedDate.value == selectedDate) {
                    return true;
                  }
                  return false;
                },
                currentDay: controller.selectedDate.value,
                onDaySelected: (dateTime1, dateTime2) {
                  debugPrint(dateTime1.toString());
                  controller.taskDate.value =
                      DateFormat('MMMM dd, y').format(dateTime1);
                  controller.dateController.text = controller.taskDate.value;
                  controller.selectedDate.value = dateTime1;
                },
              )),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: const Color(0xFFF2F5FF),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                const SizedBox(height: 76),
                Padding(
                  padding: const EdgeInsets.only(left: 29.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Tasks',
                      style: GoogleFonts.philosopher(
                          color: const Color(0xFF2E3A59),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
