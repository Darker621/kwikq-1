import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kwikq/const/imgs.dart';
import 'package:kwikq/services/provider/auth_provider.dart';
import 'package:kwikq/views/auth_screen/Register_Screen.dart';
import 'package:kwikq/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
  
  
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                get_started,
                height: 300,
              ),
              SizedBox(height: 20),
              Text("Let's get started",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(
                "Efficiency Elevated, Waiting Eliminated",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Get_started()
            ],
          ),
        ),
      )),
    );
  }

  SizedBox Get_started() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
        final ap = Provider.of<AuthProvider>(context,listen: false);
         ap.isSignedIn == true
         ? Get.to(()=>HomeScreen())
         : Get.to(()=>RegisterPage());
         
        },
        child: Text(" Get's Started  "),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.purple),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)))),
      ),
    );
  }
}
