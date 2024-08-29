import 'package:brevity/app/data/constants.dart';
import 'package:brevity/app/data/model.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DataService extends GetxService {
  @override
  onInit() {
    super.onInit();
    retrieveData();
  }

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

  SupabaseStreamBuilder retrieveData() {
    return supabase
        .from('tasks')
        .stream(primaryKey: ['id']).order('id', ascending: false);
  }

  Future<void> deleteTask(String id) async {
    await supabase.from('tasks').delete().eq('uid', id);
  }
}
