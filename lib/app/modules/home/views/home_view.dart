import 'package:brevity/app/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;



    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Image.asset('images/Rectangle 1.png'),
          const SizedBox(height: 20),
          Text(
            'Welcome',
            style: GoogleFonts.philosopher(fontSize: 21),
          ),
          Text(
            'By signing this, you agree to our',
            style: GoogleFonts.philosopher(fontSize: 16),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Terms and privacy policy',
                style: GoogleFonts.philosopher(
                  fontSize: 16,
                  color: const Color(0xFF036BB9),
                ),
              )),
          const SizedBox(height: 23),
          Expanded(
            child: Container(
              width: width,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFC700),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18))),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                            hintText: 'User Name',
                            hintStyle: GoogleFonts.montserrat(
                                fontSize: 15, color: const Color(0xff000000)),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(

                            hintText: 'Password',
                            hintStyle: GoogleFonts.montserrat(
                                fontSize: 15, color: const Color(0xff000000)),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 28),
                      Checkbox(
                          fillColor: WidgetStateProperty.resolveWith((states) {
                            return Colors.white;
                          }),
                          value: true,
                          checkColor: Colors.black,
                          onChanged: (value) {}),
                      Text(
                        'Rememeber pasword',
                        style: GoogleFonts.philosopher(),
                      ),
                      const SizedBox(width: 50),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password',
                            style: GoogleFonts.philosopher(
                                color: const Color(0xFF0386D0)),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 41,
                          width: 151,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0386D0),
                              ),
                              child: Text(
                                'Login',
                                style: GoogleFonts.philosopher(
                                    color: Colors.white),
                              ))),
                      const SizedBox(width: 27, height: 21),
                      SizedBox(
                          height: 41,
                          width: 151,
                          child: ElevatedButton(
                              onPressed: (){
                                authService.signUp(controller.emailController.text, controller.passwordController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      side:
                                          BorderSide(color: Color(0xFF0386D0)),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ))),
                              child: Text(
                                'Register',
                                style: GoogleFonts.philosopher(
                                    color: const Color(0xFF0386D0)),
                              ))),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('or connect with', style: GoogleFonts.coda()),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 52,
                    width: 354,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    color: Color(0xFFE74C3C), width: 3))),
                        child: Text('Google',
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE74C3C)))),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 54,
                    width: 354,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Color(0xFF0386D0),
                                  width: 3,
                                ))),
                        child: Text('Facebook',
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF0386D0)))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
