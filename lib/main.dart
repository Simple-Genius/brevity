import 'package:brevity/app/modules/calendar/views/calendar_view.dart';
import 'package:brevity/app/modules/home/controllers/home_controller.dart';
import 'package:brevity/app/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/modules/calendar/controllers/calendar_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/services/auth_service.dart';

void main() async {
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env['PROJECT_URL'] ?? '',
    anonKey: dotenv.env['API_KEY'] ?? "",
  );
  Get.put<AuthService>(AuthService());
  Get.put<DataService>(DataService());
  Get.put(HomeController());
  Get.put(CalendarController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      getPages: AppPages.routes,
      home: const CalendarView(),
    ),
  );
}
