import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'busnessform.dart';
import 'personal.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  final _duration = const Duration(milliseconds: 250);
  final _height = 20;
  final _width = 40;
  bool toggleValue = true;
  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 0, bottom: 0),
      child: Wrap(children: [
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40),
          child: toggleMethod(),
        ),
        toggleValue ? const BusinessForm() : const PersonalForm(),
      ]),
    );
  }

  Row toggleMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0, right: 10),
          child: TextButton(
            onPressed: () {
              setState(() {
                toggleValue = false;
              });
            },
            child: Text(
              'New Sign In',
              style: TextStyle(
                  letterSpacing: 1.2,
                  color: toggleValue
                      ? const Color.fromARGB(255, 50, 142, 76)
                      : const Color.fromARGB(255, 10, 58, 97),
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, right: 0, bottom: 10),
          child: InkWell(
            onTap: toggleButton,
            child: Tooltip(
              message: toggleValue ? "New Sign in" : "Legacy Sign in",
              textStyle: TextStyle(
                  letterSpacing: 1.2,
                  fontFamily: 'CrimsonPro',
                  color: CupertinoColors.white.withOpacity(0.8),
                  fontSize: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: AnimatedContainer(
                    duration: _duration,
                    height: _height as double,
                    width: _width as double,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toggleValue
                          ? const Color.fromARGB(255, 50, 142, 76)
                          : const Color.fromARGB(255, 10, 58, 97),
                    ),
                    child: Stack(children: [
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeIn,
                          top: 0,
                          left: toggleValue ? 20.0 : 0.0,
                          right: toggleValue ? 0.00 : 20.0,
                          child: InkWell(
                              hoverColor: CupertinoColors.white.withOpacity(0),
                              onTap: () => {
                                    toggleButton,
                                  },
                              child: AnimatedSwitcher(
                                  duration: _duration,
                                  transitionBuilder: (Widget child,
                                      Animation<double> animation) {
                                    return ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    );
                                  },
                                  child: toggleValue
                                      ? Icon(
                                          Icons.circle,
                                          color: CupertinoColors.white,
                                          size: 20,
                                          key: UniqueKey(),
                                        )
                                      : Icon(Icons.circle,
                                          color: CupertinoColors.white,
                                          size: 20,
                                          key: UniqueKey()))))
                    ])),
              ),
            ),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: TextButton(
              onPressed: () {
                setState(() {
                  toggleValue = true;
                });
              },
              child: Text(
                'Legacy Sign In',
                style: TextStyle(
                    letterSpacing: 1.2,
                    color: toggleValue
                        ? const Color.fromARGB(255, 10, 58, 97)
                        : const Color.fromARGB(255, 50, 142, 76),
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
