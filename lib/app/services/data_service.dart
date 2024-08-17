import 'package:brevity/app/data/constants.dart';
import 'package:brevity/app/data/model.dart';
import 'package:get/get.dart';

class DataService extends GetxService {
  final uid = '6f609bd7-b254-4579-99bc-c003a729188e';

  Future<void> saveData(Task task) async {
    await supabase.from('tasks').insert({
      'name': task.name,
      'date': task.date,
      'start_time': task.startTime,
      'end_time': task.endTime,
      'description': task.description,
      'category': task.category
    });
  }

  Future<List<Map<String, dynamic>>> retrieveData() async {
    return await supabase.from('tasks').select();
  }
}
