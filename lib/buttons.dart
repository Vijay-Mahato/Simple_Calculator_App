import 'package:calculator_app/calculator.dart';
import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  const CalButton(
      {super.key,
      required this.buttonName,
      required this.buttonColor,
      required this.textColor,
      required this.calculation});
  final String buttonName;
  final Color buttonColor;
  final Color textColor;
  final void Function(dynamic btnText) calculation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(shape: BoxShape.circle, color: buttonColor),
      child: TextButton(
        onPressed: () {
          calculation(buttonName);
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all(const CircleBorder()),
          padding: WidgetStateProperty.all(const EdgeInsets.all(17)),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
              backgroundColor: buttonColor, color: textColor, fontSize: 35),
        ),
      ),
    );
  }
}

class LastRow extends StatelessWidget {
  const LastRow({super.key, required this.calculation});
  final void Function(dynamic btnText) calculation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 70,
          width: 165,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: TextButton(
                  onPressed: () {
                    calculation("0");
                  },
                  child: const Text(
                    "0",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                    ),
                  ))),
        ),
        Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(224, 224, 224, 1), shape: BoxShape.circle),
          child: TextButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all(const CircleBorder()),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(17))),
              onPressed: () {
                calculation("."); // Call the calculation function here
              },
              child: const Text(
                '.',
                style: TextStyle(fontSize: 35, color: Colors.black),
              )),
        ),
        Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
              color: const Color.fromRGBO(255, 160, 0, 1),
              shape: BoxShape.circle),
          child: TextButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all(const CircleBorder()),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(17))),
              onPressed: () {
                calculation("="); // Call the calculation function here
              },
              child: const Text(
                '=',
                style: TextStyle(fontSize: 35, color: Colors.white),
              )),
        ),
      ],
    );
  }
}
