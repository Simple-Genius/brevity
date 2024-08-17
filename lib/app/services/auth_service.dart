import 'package:brevity/app/data/constants.dart';
import 'package:brevity/app/modules/home2/views/home2_view.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {

  Future<void> signUpWithOtp(String? email, String? phone) async {
    await supabase.auth.signInWithOtp(phone: phone, email: email);
    if (supabase.auth.currentUser != null){
      Get.to(Home2View());
    }
  }

  Future<void> signUp(String email, String password) async {
    await supabase.auth.signUp(password: password,email: email);
    if (supabase.auth.currentUser != null){
      Get.to(Home2View());
    }
  }

  Future<void> signIn(String email, String password) async {
    await supabase.auth.signInWithPassword(password: password,email: email);
    if (supabase.auth.currentUser != null){
      Get.to(Home2View());
    }
  }
}
