import 'package:brevity/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var routesList = [Routes.HOME2, Routes.CALENDAR, Routes.TASKS];

BottomNavigationBar buildBottomBar (int selectedIndex){
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: Colors.deepPurple,
    unselectedItemColor: Colors.black,
    items:const[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: '', ),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: ''),
    ],
    onTap: (value){
      selectedIndex = value;
      Get.offAllNamed(routesList[selectedIndex]);
    },
  );
}