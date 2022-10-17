import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/components/commonColor.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  bool isExpired;
  RegistrationScreen({required this.isExpired});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  final _formKey = GlobalKey<FormState>();
  FocusNode? fieldFocusNode;
  TextEditingController codeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? manufacturer;
  String? model;
  String? fp;
  String? textFile;

  late String uniqId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  deletemenu() async {
    print("delete");
    // await OrderAppDB.instance.deleteFromTableCommonQuery('menuTable', "");
  }

  @override
  Widget build(BuildContext context) {
    // final textfile = externalDirtext.getPublicDirectoryPath("");
    // print("Textfile data....$textfile");
    double topInsets = MediaQuery.of(context).viewInsets.top;
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        backgroundColor: P_Settings.color3,
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        body: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        customTextField("Company key", codeController,
                            "company key", context),
                        customTextField(
                            "Phone number", phoneController, "phone", context),

                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.3,
                          color: Colors.transparent,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                              elevation: 0,
                            ),
                            onPressed: () async {
                              String deviceInfo =
                                  "$manufacturer" + '' + "$model";
                              print("device info-----$deviceInfo");
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => LoginPage()),
                              // );

                              // await OrderAppDB.instance
                              //     .deleteFromTableCommonQuery('menuTable', "");
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 28, 13, 31),
                                  Color.fromARGB(255, 68, 164, 241)
                                ]),
                              ),
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.3,
                                alignment: Alignment.center,
                                child: Text(
                                  "Register",
                                  style: GoogleFonts.aBeeZee(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  // style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: size.height * 0.09,
                        // ),

                        // Consumer<Controller>(
                        //   builder: (context, value, child) {
                        //     if (value.isLoading) {
                        //       return SpinKitCircle(
                        //           // backgroundColor:,
                        //           color: Colors.black

                        //           // valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                        //           // value: 0.25,
                        //           );
                        //     } else {
                        //       return Container();
                        //     }
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField(String hinttext, TextEditingController controllerValue,
      String type, BuildContext context) {
    double topInsets = MediaQuery.of(context).viewInsets.top;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: TextFormField(
            keyboardType: type == "phone" ? TextInputType.number : null,
            style: TextStyle(color: P_Settings.color3),
            // scrollPadding:
            //     EdgeInsets.only(bottom: topInsets + size.height * 0.34),
            controller: controllerValue,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: type == "company key"
                    ? Icon(
                        Icons.business,
                        color: P_Settings.color3,
                      )
                    : Icon(
                        Icons.phone,
                        color: P_Settings.color3,
                      ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: P_Settings.color3, width: 1.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: P_Settings.color3,
                    width: 2.0,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    )),
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: P_Settings.color3,
                ),
                hintText: hinttext.toString()),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Please Enter ${hinttext}';
              }
              return null;
            },
          )),
    );
  }
}

Future<bool> _onBackPressed(BuildContext context) async {
  return await showDialog(context: context, builder: (context) => exit(0));
}
