import 'dart:async';

import 'package:flutter/material.dart';

class TimeConversion extends StatefulWidget {
  const TimeConversion({Key? key}) : super(key: key);

  @override
  _TimeConversionState createState() => _TimeConversionState();
}

// make me 4 converter for time WIB, WITA, WIT, UTC, JST
// 1. make me a button (WITA, WIT, UTC, JST) to convert
// 2. make me a function to convert
// 3. make me a textfield for the output
// 4. make time now as the input

class _TimeConversionState extends State<TimeConversion> {
  late String _timeInput;
  late String _timeOutput;

  @override
  void initState() {
    super.initState();
    _timeInput = DateTime.now().toString();
    _timeOutput = 'WIB';
  }

  void _onTimeOutputChanged(String? value) {
    setState(() {
      _timeOutput = value ?? 'WIB';
    });
  }

  void _convert() {
    setState(() {
      switch (_timeOutput) {
        case 'WIB':
          _timeInput = DateTime.now().toString();
          break;
        case 'WITA':
          _timeInput = DateTime.now().add(const Duration(hours: 1)).toString();
          break;
        case 'WIT':
          _timeInput = DateTime.now().add(const Duration(hours: 2)).toString();
          break;
        case 'UTC':
          _timeInput = DateTime.now().toUtc().toString();
          break;
        case 'JST':
          _timeInput = DateTime.now().add(const Duration(hours: 7)).toString();
          break;
        default:
          _timeInput = DateTime.now().toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Conversion'),
      automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: DateTime.now().toString()),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Time Input',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField<String>(
              value: _timeOutput,
              onChanged: _onTimeOutputChanged,
              items: const [
                DropdownMenuItem(
                  value: 'WIB',
                  child: Text('WIB'),
                ),
                DropdownMenuItem(
                  value: 'WITA',
                  child: Text('WITA'),
                ),
                DropdownMenuItem(
                  value: 'WIT',
                  child: Text('WIT'),
                ),
                DropdownMenuItem(
                  value: 'UTC',
                  child: Text('UTC'),
                ),
                DropdownMenuItem(
                  value: 'JST',
                  child: Text('JST'),
                ),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Time Output',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              onPressed: _convert,
              child: const Text('Convert'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: _timeInput),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Time Output',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
