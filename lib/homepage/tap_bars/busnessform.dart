import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../accont_view/account.dart';
import '../../database.dart';

class BusinessForm extends StatefulWidget {
  const BusinessForm({super.key});

  @override
  State<BusinessForm> createState() => _BusinessFormState();
}

class _BusinessFormState extends State<BusinessForm> {
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessPasswordController = TextEditingController();
  TextEditingController companyController = TextEditingController();

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
        key: formKey1,
        child: Padding(
          padding: const EdgeInsets.only(right: 40, left: 40, top: 10),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text('COMPANY NAME',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: CupertinoColors.black)),
                    ),
                    const SizedBox(
                      height: 5,
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
                        autofillHints: const [AutofillHints.name],
                        enableSuggestions: true,
                        autocorrect: true,
                        showCursor: true,
                        autofocus: false,
                        textAlign: TextAlign.start,
                        strutStyle: const StrutStyle(),
                        style: const TextStyle(),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        controller: companyController,
                        validator: (ifuser) {
                          if (ifuser!.isEmpty && ifuser.length < 4) {
                            //return null;
                            return 'Please enter a valid Company ID';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            fillColor: CupertinoColors.white,
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)))),
                      ),
                    ),
                    Column(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.0, bottom: 5),
                            child: Text('LOGIN ID',
                                style: TextStyle(
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
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0, right: 0),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0, left: 0),
                            child: Center(
                              child: Text('PASSWORD',
                                  style: TextStyle(
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
                                if (ifpassword!.isEmpty) {
                                  return 'Please enter a password';
                                } else if (ifpassword.length < 10) {
                                  return 'password shouldnt be less than 4 characters';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0, right: 0),
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
                              FocusScope.of(context).unfocus();

                              if (formKey1.currentState!.validate()) {
                                FutureBuilder<Map<String, dynamic>>(
                                    future: Database(
                                            companyName: companyController.text,
                                            username:
                                                businessNameController.text,
                                            password:
                                                businessPasswordController.text, 
                                                )
                                        .getBusinessInfo(),
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
                                              color: CupertinoColors.activeBlue,
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 7, 38, 63))),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 0, top: 10, bottom: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       TextButton(
                        //         onPressed: () {},
                        //         child: const Text('Need help ?',
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 12,
                        //                 fontWeight: FontWeight.bold)),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
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

