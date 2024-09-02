import 'package:brevity/app/modules/global_components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home2_controller.dart';

class Home2View extends GetView<Home2Controller> {
  const Home2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f5ff),
        bottomNavigationBar: buildBottomBar(0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 46),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
              ],
            ),
            const SizedBox(height: 52),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hello Arjun!',
                  style: GoogleFonts.philosopher(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(height: 23.68),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 58,
                  width: 124,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'My Tasks',
                        style: GoogleFonts.philosopher(
                            color: const Color(0xFF2E3A59),
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 58,
                  width: 124,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'In progress',
                        style: GoogleFonts.philosopher(
                            color: const Color(0xFF2E3A59),
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 58,
                  width: 124,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Completed',
                        style: GoogleFonts.philosopher(
                            color: const Color(0xFF2E3A59),
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 163.69,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 162,
                    height: 163.69,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            stops: [0, 0.35, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFE8121F),
                              Color(0xFFA07528),
                              Color(0xFF61CB2F)
                            ]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Task 1',
                      style: GoogleFonts.philosopher(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(width: 14),
                  Container(
                    width: 162,
                    height: 163.69,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            stops: [0, 0.46, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF20BE43),
                              Color(0xFF3076B2),
                              Color(0xFF3A49F9)
                            ]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Task 2',
                      style: GoogleFonts.philosopher(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(width: 14),
                  Container(
                    width: 162,
                    height: 163.69,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            stops: [0, 0.38, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF20BE43),
                              Color(0xFF3076B2),
                              Color(0xFF3A49F9)
                            ]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Task 3',
                      style: GoogleFonts.philosopher(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 85),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Progress',
                style: GoogleFonts.philosopher(
                    color: const Color(0xFF2E3A59),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // const SizedBox(height: 21.99),
            // //const TaskTile(),
            // const SizedBox(height: 22),
            // const TaskTile()
          ],
        ));
  }
}
