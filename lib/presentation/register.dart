import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dobInfo = 'date of birth must be in this format MM/DD/YYYY';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  final dobController = TextEditingController();

  final emailController = TextEditingController();

  final firstnameController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final lastnameController = TextEditingController();

  final numberController = TextEditingController();

  final stateController = TextEditingController();

  RegExp firstName = RegExp(r'([A-Z]{1}[a-z]{2,}?)');

  bool firstNameValid(String first) {
    if (firstName.hasMatch(first)) {
      return true;
    } else {
      return false;
    }
  }

  RegExp lastName = RegExp(r'([A-Z]{1}[a-z]{2,}?)');
  bool lastNameValid(String last) {
    String lastname = last.trim();
    if (lastName.hasMatch(lastname)) {
      return true;
    } else {
      return false;
    }
  }

  RegExp dob = RegExp(r'([0-9]{2}\/[0-9]{2}\/[0-9]{4}?)');
  bool dateofBirth(String doB) {
    if (dob.hasMatch(doB)) {
      return true;
    } else {
      return false;
    }
  }

  RegExp state = RegExp(r'([A-Z]{1}[a-z]{3,}?)');
  bool stateValid(String stateV) {
    if (state.hasMatch(stateV)) {
      return true;
    } else {
      return false;
    }
  }

  RegExp telValid = RegExp(r'([0-9]{10}?)');
  bool validateTelephone(String tell) {
    String telephone = tell.trim();
    if (telValid.hasMatch(telephone)) {
      return true;
    } else {
      return false;
    }
  }

  RegExp passValid = RegExp(r"(?=.*\d{2,4})(?=.*[A-Z])(?=.*\W)");
  bool passwordValidate(String pass) {
    String password = pass.trim();
    if (passValid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (const Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 20),
                  child: Center(
                    child: Text('Registeration',
                        style: TextStyle(
                            fontSize: 28,
                            color: CupertinoColors.darkBackgroundGray)),
                  ),
                )),
                const Divider(
                  color: CupertinoColors.lightBackgroundGray,
                  thickness: 1,
                  indent: 2,
                  height: 0,
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                        key: _formkey,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: firstnameController,
                                decoration: InputDecoration(
                                    hintText: 'first name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                keyboardType: TextInputType.name,
                                textCapitalization:
                                    TextCapitalization.characters,
                                textInputAction: TextInputAction.next,
                                validator: (ifFirstName) {
                                  if (ifFirstName != null &&
                                      ifFirstName.length <= 3) {
                                    return 'Please enter correct name';
                                  }
                                  bool result = firstNameValid(ifFirstName!);
                                  if (result) {
                                    return null;
                                  } else {
                                    return 'first alphabet must be UPPERCASE';
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: lastnameController,
                                  decoration: InputDecoration(
                                      hintText: 'last name',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  keyboardType: TextInputType.name,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  textInputAction: TextInputAction.next,
                                  validator: (iflastname) {
                                    if (iflastname != null &&
                                        iflastname.length <= 3) {
                                      return 'Please enter correct name';
                                    }
                                    bool result = lastNameValid(iflastname!);
                                    {
                                      if (result) {
                                        return null;
                                      } else {
                                        return 'first alphabet must be UPPERCASE';
                                      }
                                    }
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: dobController,
                                  decoration: InputDecoration(
                                    hintText: 'dd/mm/year',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    counterText: '',
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9/]")),
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  textInputAction: TextInputAction.next,
                                  validator: (ifdob) {
                                    if (ifdob!.isEmpty) {
                                      return 'Enter Your Date of Birth';
                                    }
                                    bool result = dateofBirth(ifdob);
                                    if (result) {
                                      return null;
                                    } else {
                                      return dobInfo;
                                    }
                                  }),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 10),
                          //   child: SizedBox(
                          //     width: 300,
                          //     child: TextFormField(
                          //         autovalidateMode:
                          //             AutovalidateMode.onUserInteraction,
                          //         controller: cityController,
                          //         decoration: InputDecoration(
                          //             hintText: 'city name',
                          //             border: OutlineInputBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(10))),
                          //         keyboardType: TextInputType.name,
                          //         textCapitalization:
                          //             TextCapitalization.characters,
                          //         textInputAction: TextInputAction.next,
                          //         validator: (ifCity) {
                          //           if (ifCity != null && ifCity.length < 3) {
                          //             return 'Please enter correct city name';
                          //           } else {
                          //             return null;
                          //           }
                          //         }),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: stateController,
                                  decoration: InputDecoration(
                                      hintText: 'state',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  keyboardType: TextInputType.name,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  textInputAction: TextInputAction.next,
                                  validator: (ifstate) {
                                    if (ifstate!.isEmpty &&
                                        ifstate.length < 4) {
                                      return 'Please enter your State name';
                                    }
                                    bool result = stateValid(ifstate);
                                    if (result) {
                                      return null;
                                    } else {
                                      return 'enter a correct US State name ';
                                    }
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: numberController,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                      hintText: 'phone number',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (ifphone) {
                                    if (ifphone!.isEmpty) {
                                      return 'please enter phone number';
                                    }

                                    bool result = validateTelephone(ifphone);
                                    if (result) {
                                      return null;
                                    } else {
                                      return 'Please enter a correct Phone number';
                                    }
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: 'email address',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                keyboardType: TextInputType.emailAddress,
                                textCapitalization:
                                    TextCapitalization.characters,
                                textInputAction: TextInputAction.next,
                                validator: (ifemail) =>
                                    !EmailValidator.validate(ifemail!)
                                        ? 'Enter a valid email'
                                        : null,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: passwordController,
                                  maxLength: 12,
                                  decoration: InputDecoration(
                                      hintText: 'password',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  keyboardType: TextInputType.name,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  textInputAction: TextInputAction.next,
                                  validator: (password) {
                                    if (password!.isEmpty &&
                                        password.length < 6) {
                                      return 'Please enter password ';
                                    }
                                    bool result = passwordValidate(password);
                                    if (result) {
                                      return null;
                                    } else {
                                      return 'please enter correct password';
                                    }
                                  }),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 248, 238, 142),
                                      width: 2),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  shadowColor: Colors.black,
                                ),
                                onPressed: () {
                                  debugPrint('Email:${emailController.text}');
                                  debugPrint(
                                      'Password:${passwordController.text}');
                                  debugPrint(
                                      'Firstname:${firstnameController.text}');
                                  debugPrint(
                                      'Lastname:${lastnameController.text}');
                                  debugPrint('DOB:${dobController.text}');
                                  // debugPrint('City:${cityController.text}');
                                  debugPrint('state:${stateController.text}');
                                  debugPrint('Phone:${numberController.text}');

                                  final form = formkey.currentState!;
                                  if (form.validate()) {
                                    const Text('You\'re good to go');
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text('Submit'),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            color: CupertinoColors.lightBackgroundGray,
                            thickness: 1,
                            indent: 2,
                            height: 0,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ]))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
