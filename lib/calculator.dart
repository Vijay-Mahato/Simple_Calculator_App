import 'package:calculator_app/buttons.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      if (numOne != 0) {
        result = numOne / 100;
        finalResult = doesContainDecimal(result);
      } else {
        result = double.parse(result) / 100;
        finalResult = doesContainDecimal(result);
      }
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        // backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Calculator',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: text == "0" ? 100 : 40,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalButton(
                  buttonName: "AC",
                  buttonColor: Colors.grey.shade300,
                  textColor: Colors.black,
                  calculation: (btnText) {
                    calculation("AC");
                  },
                ),
                CalButton(
                    buttonName: "+/-",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "%",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "/",
                    buttonColor: const Color.fromRGBO(255, 160, 0, 1),
                    textColor: Colors.white,
                    calculation: calculation)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalButton(
                    buttonName: "7",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "8",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "9",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "x",
                    buttonColor: const Color.fromRGBO(255, 160, 0, 1),
                    textColor: Colors.white,
                    calculation: calculation)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalButton(
                    buttonName: "4",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "5",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "6",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "-",
                    buttonColor: const Color.fromRGBO(255, 160, 0, 1),
                    textColor: Colors.white,
                    calculation: calculation)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalButton(
                    buttonName: "1",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "2",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "3",
                    buttonColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    calculation: calculation),
                CalButton(
                    buttonName: "+",
                    buttonColor: const Color.fromRGBO(255, 160, 0, 1),
                    textColor: Colors.white,
                    calculation: calculation)
              ],
            ),
            const SizedBox(height: 10),
            LastRow(calculation: calculation)
          ],
        ),
      ),
    );
  }
}
