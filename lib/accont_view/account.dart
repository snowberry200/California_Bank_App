import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../backgroundimage.dart';
import '../transaction.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;
  final String myString =
      //'A suspicious money transfer attempt was made on your account on September 10 2021. For security reasons we have placed  your account on temporaral hold for every transaction  until you return to the Unithed States of America . You may visit any of our branches and speak with our security team to reactivate your account. We deeply regret every inconvinience caused.';
      "Funds of Account to be released to Benefactor: Ms. Amie Riley Eisenberg upon proof of ownership. Ms. Eisenberg must be a legal resident of the United States of America to have the rights to claim ownership of funds in account as per the agreement between Mrs Doris Eisenberg and California Trust Bank.";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    dialogShow();
    Future.delayed(const Duration(seconds: 15), () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BackgroundImageWidget(
              image: const AssetImage(
                'images/coins5.jpeg',
              ),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  toolbarHeight: 100,
                  backgroundColor: CupertinoColors.white,
                  title: const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Image(
                        width: 550,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.contain,
                        height: 100,
                        image: AssetImage('images/cali.png')),
                  ),
                  elevation: 0,
                ),
              ))));
    });
  }

  dialogShow() {
    Future.delayed(
      const Duration(seconds: 5),
      () => showDialog(
          // barrierColor: const Color.fromARGB(255, 29, 61, 30),
          context: context,
          builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 310,
                    height: 450,
                    child: Card(
                        color: const Color.fromARGB(255, 17, 64, 102)
                            .withOpacity(1.0),
                        shadowColor: Colors.black,
                        surfaceTintColor: Colors.amber,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        borderOnForeground: true,
                        child: Center(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const ClipRect(
                                  child: SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Image(
                                            filterQuality: FilterQuality.high,
                                            image:
                                                AssetImage('images/seal.png')),
                                      ))),
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Center(
                                    child: RichText(
                                        text: const TextSpan(
                                            text:
                                                //'PROPERTY OF THE MRS. DORIS Eisenberg.',
                                                'PROPERTY OF MRS. DORIS Eisenberg.',
                                            style: TextStyle(
                                              letterSpacing: 1.0,
                                              decorationThickness: 2.5,
                                              color: Color.fromARGB(
                                                  255, 188, 49, 39),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      myString,
                                      style: const TextStyle(
                                        wordSpacing: 1.1,
                                        height: 2.5,
                                        decorationThickness: 2.5,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.1,
                                        fontSize: 12,
                                        color: CupertinoColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))),
                  ),
                ],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    List items = [
      Transaction(
          date: '10 / 10 / 07',
          credit: 'California Trust Bank',
          amount: '\u0024 50,000.00'),
      Transaction(
        date: '05 / 09 / 08',
        credit: 'California Trust Bank',
        amount: '\u0024 15,000.00',
      ),
      Transaction(
          date: '05 / 09 / 09',
          credit: 'California Trust Bank',
          amount: '\u0024 9,000.00'),
      Transaction(
          date: '07 / 06 / 11',
          credit: 'California Trust Bank',
          amount: '\u0024 10,000.00'),
      Transaction(
          date: '02 / 14 / 12',
          credit: 'California Trust Bank',
          amount: '\u0024 30,000.00'),
      Transaction(
          date: '10 / 10 / 12',
          credit: 'California Trust Bank',
          amount: '\u0024 80,000.00'),
      Transaction(
          date: '05 / 09 / 13',
          credit: 'California Trust Bank',
          amount: '\u0024 30,000.00'),
      Transaction(
          date: '05 / 09 / 14',
          credit: 'California Trust Bank',
          amount: '\u0024 90,000.00'),
      Transaction(
          date: '07 / 06 / 15',
          credit: 'California Trust Bank',
          amount: '\u0024 200,000.00'),
      Transaction(
          date: '02 / 14 / 17',
          credit: 'California Trust Bank',
          amount: '\u0024 90,000.00'),
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: CupertinoColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: IconButton(
            hoverColor: CupertinoColors.white.withOpacity(0),
            icon: AnimatedIcon(
              size: 20,
              icon: AnimatedIcons.menu_close,
              color: isPlaying ? CupertinoColors.systemRed : Colors.grey,
              progress: _animationController,
            ),
            onPressed: () {
              setState(() {
                isPlaying = !isPlaying;
                isPlaying
                    ? _animationController.forward()
                    : _animationController.reverse();
              });
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Image(
                width: 550,
                filterQuality: FilterQuality.high,
                fit: BoxFit.contain,
                height: 100,
                image: AssetImage('images/cali.png')),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                        width: 85,
                        filterQuality: FilterQuality.high,
                        height: 60,
                        'images/doris.jpeg',
                        fit: BoxFit.cover)),
                const Text('Hi Doris',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 58, 97),
                    )),
              ],
            ),
          )
        ],
        elevation: 10,
      ),
      body: SizedBox(
        child: CustomerWidget(
          items: items,
        ),
      ),
    );
  }
}

class CustomerWidget extends StatelessWidget {
  final List items;
  const CustomerWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: double.infinity,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 10, 58, 97)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Current Account',
                    style:
                        TextStyle(color: CupertinoColors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20),
                child: Column(
                  children: const [
                    Text(
                      'Available Balance',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 202, 202, 202)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '\u0024 604,000.00',
                      style: TextStyle(
                          letterSpacing: 1.5,
                          wordSpacing: 1.5,
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            // height: 100,
            width: double.infinity,
            color: const Color.fromARGB(138, 255, 255, 255),
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(0.5),
                    child: ListTile(
                        tileColor: Colors.grey,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        leading: Wrap(children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Color.fromARGB(255, 108, 40, 40),
                          ),
                          const SizedBox(width: 20),
                          Text(items[index].date,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold))
                        ]),
                        title: Center(
                          child: Wrap(children: [
                            RichText(
                                text: const TextSpan(
                                    text: 'credit: ',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ))),
                            Text(
                              '${items[index].credit}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                        ),
                        trailing: Text(items[index].amount,
                            style: const TextStyle(
                                letterSpacing: 1.2,
                                wordSpacing: 1.2,
                                fontSize: 13,
                                fontWeight: FontWeight.bold))),
                  );
                }),
          ),
        )
      ],
    );
  }
}
