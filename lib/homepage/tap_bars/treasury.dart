import 'package:flutter/material.dart';

class Treasury extends StatefulWidget {
  const Treasury({super.key});

  @override
  State<Treasury> createState() => _TreasuryState();
}

class _TreasuryState extends State<Treasury> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40),
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Treasury Gateway® Login',
              style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
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
                },
                child: const Text('TREASURY GATEWAY®',
                    style: TextStyle(
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromARGB(255, 7, 38, 63))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
