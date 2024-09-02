import 'package:brevity/app/modules/Tasks/controllers/tasks_controller.dart';
import 'package:brevity/app/modules/components/tasktile.dart';
import 'package:brevity/app/modules/global_components/bottom_nav_bar.dart';
import 'package:brevity/app/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksView extends GetView<TasksController> {
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: buildBottomBar(2),
        backgroundColor: const Color(0xFFF2F5FF),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF2F5FF),
          title: Text(
            'Tasks',
            style: GoogleFonts.philosopher(
                color: const Color(0xFF2E3A59),
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'All tasks',
              ),
              Tab(
                text: 'Current tasks',
              ),
              Tab(
                text: 'Completed tasks',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          StreamBuilder(
            stream: dataService.retrieveData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      while (index < snapshot.data!.length) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.009),
                          child: TaskTile(
                              taskName: snapshot.data![index]['name'],
                              time: snapshot.data![index]['start_time'],
                              id: snapshot.data![index]['uid'],
                              taskDate: snapshot.data![index]['date']),
                        );
                      }
                    },
                  ),
                );
              }
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 2,
              ));
            },
          ),
          const Icon(Icons.dashboard_customize_rounded),
          const Icon(Icons.add_circle)
        ]),
      ),
    );
  }
}
