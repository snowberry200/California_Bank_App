// import 'package:cali_bank/presentation/homepage/tap_bars/personal.dart';
// import 'package:cali_bank/presentation/homepage/tap_bars/treasury.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'backgroundimage.dart';
// import '../../LayOut/LayOut.dart';
import '../backgroundimage.dart';
import '../layout/layout.dart';
import '../presentation/register.dart';
import 'tap_bars/business.dart';
import 'tap_bars/personal.dart';
import 'tap_bars/treasury.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final BorderRadiusGeometry borderradius = BorderRadius.circular(8);
  late TabController tabBarController;
  late AnimationController _animationController;
  bool isPlaying = false;
  // final List mobilePics = [const AssetImage('images/coins2.jpeg'),
  // const AssetImage('images/coins5.jpeg')];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    tabBarController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BackgroundImageWidget(
      image: Layout.isMobile(context)
          ? const AssetImage('images/green.jpeg')
          : const AssetImage('images/buildings.jpeg'),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: CupertinoColors.white,
            leading: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: PopupMenuButton(
                    position: PopupMenuPosition.under,
                    icon: const Icon(Icons.menu,color:Colors.black),
                    elevation: 10,
                    itemBuilder: (context) => [
                          PopupMenuItem<dynamic>(
                            mouseCursor: MouseCursor.defer,
                            value: 0,
                            child: Center(
                                child: TextButton(
                                    child: const Text(
                                      'Sign in',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 4, 55, 97),
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onPressed: () {})),
                          ),
                          PopupMenuItem<dynamic>(
                            mouseCursor: MouseCursor.defer,
                            value: 1,
                            child: Center(
                                child: TextButton(
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 4, 55, 97),
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return const Scaffold(
                                            backgroundColor: CupertinoColors
                                                .extraLightBackgroundGray,
                                            body: Register());
                                      }));
                                    })),
                          ),
                          PopupMenuItem<dynamic>(
                            mouseCursor: MouseCursor.defer,
                            value: 2,
                            child: Center(
                                child: TextButton(
                                    child: const Text(
                                      'Contact',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 4, 55, 97),
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onPressed: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(builder: (context) {
                                      //   return const 
                                      //   Scaffold(
                                      //       backgroundColor: CupertinoColors
                                      //           .extraLightBackgroundGray,
                                      //       body: Contact());
                                      // }));
                                    }
                                    )
                                    ),
                          ),
                          // PopupMenuItem<dynamic>(
                          //   value: 3,
                          //   child: Center(
                          //       child: TextButton(
                          //     onPressed: () => Navigator.of(context)
                          //         .push(MaterialPageRoute(builder: (context) {
                          //       return Scaffold(
                          //           backgroundColor: CupertinoColors
                          //               .extraLightBackgroundGray,
                          //           body:
                          //            Container(
                          //               color: Colors.white,
                          //               child: const FandQ())
                          //               );
                          //     })),
                          //     child: const Text(
                          //       'f&q',
                          //       style: TextStyle(
                          //           fontSize: 14,
                          //           color: Color.fromARGB(255, 4, 55, 97),
                          //           letterSpacing: 1.2,
                          //           fontWeight: FontWeight.w600),
                          //     ),
                          //   )),
                          // ),
                        ])
            ),
            title: const Padding(
              padding: EdgeInsets.only(top: 20.0, left: 30, right: 30),
              child: Image(
                  width: 550,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                  height: 100,
                  image: AssetImage('images/cali.png')),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 30.0, bottom: 25, top: 25, left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      color: Colors.amber,
                      Icons.lock,
                      size: 20,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        ' LOGIN',
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
            elevation: 0,
          ),
          body: Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 0, left: 25, right: 25),
              child: Center(
                  child: SizedBox(
                width: Layout.isMobile(context) ? width : width / 2.3,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: DefaultTabController(
                      initialIndex: 0,
                      length: 3, // length of tabs
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          height: 40,
                          child: TabBar(
                            controller: tabBarController,
                            physics: const NeverScrollableScrollPhysics(),
                            labelColor: CupertinoColors.white,
                            labelStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white),
                            padding: const EdgeInsets.only(
                                left: 1, top: 1, right: 1),
                            isScrollable: false,
                            indicator: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: Color.fromARGB(255, 10, 58, 97)),
                            unselectedLabelColor: CupertinoColors.black,
                            tabs: const [
                              Tab(
                                text: 'PERSONAL',
                              ),
                              Tab(text: 'BUSINESS'),
                              Tab(text: 'TREASURY'),
                            ],
                          ),
                        ),
                        Container(
                            height: 400,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            child: TabBarView(
                                controller: tabBarController,
                                dragStartBehavior: DragStartBehavior.down,
                                physics: const NeverScrollableScrollPhysics(),
                                children: const <Widget>[
                                  Center(
                                    child: PersonalForm(),
                                  ),
                                  Center(child: Business()),
                                  Center(
                                    child: Treasury(),
                                  ),
                                ]))
                      ])),
                ),
              )))),
    );
  }
}
