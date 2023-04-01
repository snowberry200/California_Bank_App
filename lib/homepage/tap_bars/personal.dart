import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../accont_view/account.dart';
import '../../database.dart';

class PersonalForm extends StatefulWidget {
  const PersonalForm({super.key});

  @override
  State<PersonalForm> createState() => _PersonalFormState();
}

class _PersonalFormState extends State<PersonalForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessPasswordController = TextEditingController();
  TextEditingController companyController = TextEditingController();
   // regular expression to check if string
  RegExp passValid = RegExp(r"(?=.*\d{2,4})(?=.*[A-Z])(?=.*\W)");
  //A function that validate user entered password
  bool validatePassword(String pass) {
    String passWord = pass.trim();
    if (passValid.hasMatch(passWord)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    businessNameController.dispose();
    businessPasswordController.dispose();
    companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(right: 40, left: 40, top: 0),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 10),
                            child: Text('USER NAME',
                                style: TextStyle(
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: CupertinoColors.black)),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          child: TextFormField(
                            maxLines: 1,
                            focusNode: FocusNode(),
                            autovalidateMode: AutovalidateMode.disabled,
                            enableIMEPersonalizedLearning: true,
                            selectionControls: CupertinoTextSelectionControls(),
                            textCapitalization: TextCapitalization.none,
                            enableInteractiveSelection: true,
                            autofillHints: const [AutofillHints.email],
                            enableSuggestions: true,
                            autocorrect: true,
                            showCursor: true,
                            autofocus: false,
                            textAlign: TextAlign.start,
                            strutStyle: const StrutStyle(),
                            style: const TextStyle(),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            controller: businessNameController,
                            validator: (ifemail) =>
                                !EmailValidator.validate(ifemail!)
                                    ? 'Enter a valid User ID'
                                    : null,
                            decoration: const InputDecoration(
                                fillColor: CupertinoColors.white,
                                filled: true,
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)))),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Center(
                              child: Text('PASSWORD',
                                  style: TextStyle(
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: CupertinoColors.black)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: SizedBox(
                            height: 70,
                            child: TextFormField(
                              maxLines: 1,
                              focusNode: FocusNode(),
                              textInputAction: TextInputAction.done,
                              autovalidateMode: AutovalidateMode.disabled,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                fillColor: CupertinoColors.white,
                                filled: true,
                                // labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsets.only(left: 10, right: 10),
                              ),
                              controller: businessPasswordController,
                              validator: (ifpassword) {
                                if (ifpassword!.isNotEmpty &&
                                    ifpassword.length < 6) {
                                  return 'Password must be more than 6 characters';
                                } else if (ifpassword.isEmpty) {
                                  return "Proszę wprowadzić hasło";
                                }
                                bool result = validatePassword(ifpassword);
                                if (result) {
                                  // create account event
                                  return null;
                                } else {
                                  return " Enter a correct password";
                                }
                              },
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5, right: 0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20, right: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              minimumSize: const Size.fromHeight(45),
                              fixedSize: const Size(150, 30),
                            ),
                            onPressed: () {
                              // FocusScope.of(context).unfocus();

                              if (formKey.currentState!.validate()) {
                                FutureBuilder<Map<String, dynamic>>(
                                    future: Database(
                                      companyName: '',
                                      username: businessNameController.text,
                                      password: businessPasswordController.text,
                                    ).getData(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<Map<String, dynamic>>
                                            snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Container();
                                      } else {
                                        return const CircularProgressIndicator();
                                      }
                                    });

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: const [
                                          CircularProgressIndicator(
                                              color: Colors.amber,
                                              strokeWidth: 4,
                                              backgroundColor:
                                                  CupertinoColors.white),
                                          SizedBox(height: 50),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7))),
                                            color: Colors.grey,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text('please wait...',
                                                  style: TextStyle(
                                                      letterSpacing: 1.2,
                                                      color: CupertinoColors
                                                          .white)),
                                            ),
                                          ),
                                        ],
                                      ));
                                    });
                                // Timer(const Duration(seconds: 3),
                                //     () => {launchUrl(url), Navigator.pop(context)});
                                Future.delayed(const Duration(seconds: 3), () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const AccountView()));
                                });

                                debugPrint(
                                    'User ID:${businessNameController.text} Password:${businessPasswordController.text} Company:${companyController.text}');
                              }
                            },
                            child: const Text('SIGN IN',
                                style: TextStyle(
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 7, 38, 63))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Enrol Now',
                              style: TextStyle(
                                  letterSpacing: 1.2,
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                        left: 40,
                        right: 40,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          minimumSize: const Size.fromHeight(45),
                          fixedSize: const Size(150, 30),
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: const Text('MORTGAGE LOGIN',
                            style: TextStyle(
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromARGB(255, 7, 38, 63))),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ]),
            ),
          ),
        ));
  }
}

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   passwordController.dispose();
  //   companyController.dispose();

  //   super.dispose();
  // }

