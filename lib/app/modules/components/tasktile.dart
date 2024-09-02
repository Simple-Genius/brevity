import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {super.key,
      required this.taskName,
      required this.time,
      required this.taskDate,
      required this.id});
  final String taskName;
  final String time;
  final String taskDate;
  final String id;

  List<String> actions = ['Edit', 'Delete'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 65.99,
        width: 381,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.82)),
        child: Row(
          children: [
            const SizedBox(width: 20),
            const Icon(Icons.calendar_month),
            const SizedBox(width: 29),
            SizedBox(
              width: Get.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    taskName,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.philosopher(
                        color: const Color(0xFF2E3A59),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'on $taskDate at $time',
                    style: GoogleFonts.philosopher(
                        color: const Color(0xFFBFC8E8), fontSize: 10),
                  ),
                ],
              ),
            ),
            const Spacer(),
            MenuAnchor(
              builder: (context, MenuController controller, Widget? child) {
                return IconButton(
                    onPressed: () {
                      controller.isOpen
                          ? controller.close()
                          : controller.open();
                    },
                    icon: const Icon(Icons.more_vert));
              },
              menuChildren:
                  List<MenuItemButton>.generate(actions.length, (index) {
                return MenuItemButton(
                    child: Text(actions[index]), onPressed: () {});
              }, growable: true),
            )
          ],
        ),
      ),
    );
  }
}
