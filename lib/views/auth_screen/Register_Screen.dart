import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kwikq/const/imgs.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController phonecontroller = TextEditingController();
  Country country = CountryParser.parseCountryCode('IN');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              Image.asset(
                get_started,
                height: 300,
              ),
              SizedBox(height: 20),
              Text("Register",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(
                "Add your phone number. We'll send you a verification code",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              phonenumber(),
              SizedBox(
                height: 20,
              ),
              getotp()
            ],
          ),
        ),
      )),
    );
    ;
  }

  SizedBox getotp() {
    return SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => RegisterPage());
                },
                child: Text(" Get OTP  "),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)))),
              ),
            );
  }

  TextFormField phonenumber() {
    return TextFormField(
      cursorColor: Colors.purple,
      controller: phonecontroller,
      onChanged: (value) {
        setState(() {
          phonecontroller.text = value;
        });
      },
      decoration: InputDecoration(
          hintText: "Enter phone number",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black12)),
          prefixIcon: Container(
            padding: EdgeInsets.all(12.0),
            child: InkWell(
              child: Text(
                "${country.flagEmoji} + ${country.phoneCode}",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          suffixIcon: phonecontroller.text.length > 9
              ? Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              : null),
    );
  }
}
