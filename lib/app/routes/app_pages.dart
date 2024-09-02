import 'package:get/get.dart';

import '../modules/Tasks/bindings/tasks_binding.dart';
import '../modules/Tasks/views/tasks_view.dart';
import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home2/bindings/home2_binding.dart';
import '../modules/home2/views/home2_view.dart';
import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/task_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME2,
      page: () => const Home2View(),
      binding: Home2Binding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => const TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.TASKS,
      page: () => const TasksView(),
      binding: TasksBinding(),
    ),
  ];
}
