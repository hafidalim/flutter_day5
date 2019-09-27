import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';


class PageNumberPicker extends StatefulWidget {

  _PageNumberPickerState createState() => _PageNumberPickerState();
}

class _PageNumberPickerState extends State<PageNumberPicker> {

  int currentIntValue = 10;
  double currentDoublevalue = 3.0;

  NumberPicker intNumberPicker, decNumberPicker;

  handleValueChanged(num value){
    if( value != null) {
      if(value is int){
        setState(() {
          currentIntValue = value;
        });
      }else{
        setState(() {
          currentDoublevalue = value;
        });
      }
    }
  }

  handleValueChangedExternally(num value){
    if( value != null) {
      if(value is int){
        setState(() {
          currentIntValue = value;
          intNumberPicker.animateInt(value);
        });
      }else{
        setState(() {
          currentDoublevalue = value;
          decNumberPicker.animateDecimal(value.toInt());
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    intNumberPicker = new NumberPicker.integer(
      initialValue: currentIntValue,
      minValue: 0,
      maxValue: 100,
      step: 10,
      onChanged: handleValueChanged
    );

    decNumberPicker = new NumberPicker.decimal(
      initialValue: currentDoublevalue,
      minValue: 1, maxValue: 5,
      decimalPlaces: 2, //mengatur 2 angka dibelakang koma
      onChanged: handleValueChanged
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Page number Picker'),
        backgroundColor: Colors.brown,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            intNumberPicker,
            RaisedButton(
              child: Text('Current int Value : $currentIntValue'),
              color: Colors.brown, 
              onPressed: () {
                showIntegerDialog();
              },
            ),
            decNumberPicker,
            RaisedButton(
              
              child: Text('Current Decimal Value : $currentDoublevalue'),
              color: Colors.brown, 
              onPressed: () {
                showDialogDouble();
              },
            ),       
          ],
        ),
      ),
    );
  }

  //Dialog show integer
  Future showIntegerDialog() async{
    await showDialog<int>(context: context,
    builder: (BuildContext context){
      return NumberPickerDialog.integer(minValue: 0,maxValue: 100, initialIntegerValue: currentIntValue,);
      },
    ).then(handleValueChangedExternally);
  }
  
  Future showDialogDouble() async{
    await showDialog<double>(
      context: context,
      builder: (BuildContext context){
        return NumberPickerDialog.decimal(minValue: 1,maxValue: 5, initialDoubleValue: currentDoublevalue,
          decimalPlaces: 2,
          title: Text('Silahkan pilih bilangan desimal'),
        );
      },
    ).then(handleValueChangedExternally);
  }
}