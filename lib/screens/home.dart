import 'package:calculator/apptheme.dart';
import 'package:calculator/components/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/form_input_field.dart';
import '../models/calculator_api.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalculatorApi client = CalculatorApi();

  final _formKey = GlobalKey<FormState>();
  TextEditingController _digitController1 = TextEditingController();
  TextEditingController _digitController2 = TextEditingController();

  // Future<List<String>> getCurrencyList() async {
  //   return await client.getCurrencies();
  // }

  @override
  void initState() {
    _digitController1;
    _digitController2;
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  List<String> currencies = [];
  late String from;
  late String to;

  late double rate;
  String symbols = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 40,
            left: 24,
            right: 24,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sort,
                      size: 30,
                      color: AppTheme.kSecondaryAppColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: AppTheme.kSecondaryAppColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text.rich(
                TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'Currency\nCalculator',
                    style: GoogleFonts.righteous(
                      fontSize: 30,
                      color: AppTheme.kBlueAppColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '.',
                    style: GoogleFonts.righteous(
                      fontSize: 30,
                      color: AppTheme.kSecondaryAppColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 40),
              TextFieldEdited(
                suffixText: 'EUR',
                digitController: _digitController1,
                validatorMessage: 'Enter a value to be converted here',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldEdited(
                digitController: _digitController2,
                suffixText: 'PLN',
                validatorMessage: 'Enter the value to be converted here',
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  customDropDown(currencies, from, (val) {}),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.kSecondaryAppColor,
                  minimumSize: const Size(
                    double.infinity,
                    60,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Convert',
                  style: GoogleFonts.righteous(
                    color: AppTheme.kMainAppColor,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        textAlign: TextAlign.center,
                        'Mid-market exchange rate at 13:38 UTC',
                        style: TextStyle(
                          color: Colors.blue[400],
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info,
                        color: AppTheme.kLightGreyText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
