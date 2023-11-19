import 'package:flutter/material.dart';
import 'package:untitled/src/data/services/get_it_mock.dart';
import 'package:untitled/src/ui/pages/facade/calculator/screens/widgets/displayer.dart';
import 'package:untitled/src/ui/pages/facade/calculator/screens/widgets/keyboart.dart';

import '../../../../../app.dart';
import '../calculator.dart';
import '../constants.dart';
import '../utils/utils.dart';

class MetaCalculatorFacade extends StatefulWidget {
  const MetaCalculatorFacade({super.key});

  @override
  MetaCalculatorFacadeState createState() => MetaCalculatorFacadeState();
}

class MetaCalculatorFacadeState extends State<MetaCalculatorFacade> {
  String _primaryDisplayerText = '';
  String _secondaryDisplayerText = '';

  void buttonPressed(String id) {
    bool naviagate = false;
    if ((_primaryDisplayerText.toString() + id == '...') && accessGuard()) {
      naviagate = true;
    }
    setState(
      () {
        if (naviagate) {
          getLastLoginTime(context);
        } else if (id == ButtonId.ac) {
          _primaryDisplayerText = '';
          _secondaryDisplayerText = '';
        } else if (id == ButtonId.equal) {
          double result = calculate(_primaryDisplayerText);
          if (result != double.infinity) {
            _secondaryDisplayerText = _primaryDisplayerText;
            _primaryDisplayerText = cleanResult(result);
          } else {
            _secondaryDisplayerText = 'Bad expression';
          }
        } else if (id == ButtonId.backspace) {
          _primaryDisplayerText =
              _primaryDisplayerText.replaceAll(RegExp(r'.$'), '');
          double result = calculate(_primaryDisplayerText);
          if (result != double.infinity) {
            _secondaryDisplayerText = cleanResult(result);
          }
        } else {
          _primaryDisplayerText += id;
          double result = calculate(_primaryDisplayerText);
          if (result != double.infinity) {
            _secondaryDisplayerText = cleanResult(result);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GetItMock.configurePrefs();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: Container(
          margin: const EdgeInsets.only(left: 8),
          child: const Text(kTitle),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Displayer(
                  primaryText: _primaryDisplayerText,
                  secondaryText: _secondaryDisplayerText),
            ),
            Expanded(
              flex: 2,
              child: Keyboard(buttonPressed),
            ),
          ],
        ),
      ),
    );
  }
}
