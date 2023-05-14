import 'dart:async';

import 'package:flutter/material.dart';

class TimeConversion extends StatefulWidget {
  const TimeConversion({Key? key}) : super(key: key);

  @override
  _TimeConversionState createState() => _TimeConversionState();
}

class _TimeConversionState extends State<TimeConversion> {
  late String _input = 'WIB';
  late String _output = 'WIB';
  DateTime _result = DateTime.now();
  Timer _timer = Timer.periodic(const Duration(seconds: 1), (timer) {});

  @override
  void initState() {
    super.initState();
    _input = 'WIB';
    _output = 'WIB';
    _result = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _result = DateTime.now();
      });
    });
  }

  void _onInputChanged(String? value) {
    setState(() {
      _input = value ?? 'WIB';
    });
  }

  void _onOutputChanged(String? value) {
    setState(() {
      _output = value ?? 'WIB';
    });
  }

  void _convert() {
    setState(() {
      switch (_input) {
        case 'WIB':
          switch (_output) {
            case 'WIB':
              _result = DateTime.now();
              break;
            case 'WITA':
              _result = DateTime.now().add(const Duration(hours: 1));
              break;
            case 'WIT':
              _result = DateTime.now().add(const Duration(hours: 2));
              break;
            case 'UTC':
              _result = DateTime.now().subtract(const Duration(hours: 7));
              break;
          }
          break;
        case 'WITA':
          switch (_output) {
            case 'WIB':
              _result = DateTime.now().subtract(const Duration(hours: 1));
              break;
            case 'WITA':
              _result = DateTime.now();
              break;
            case 'WIT':
              _result = DateTime.now().add(const Duration(hours: 1));
              break;
            case 'UTC':
              _result = DateTime.now().subtract(const Duration(hours: 8));
              break;
          }
          break;
        case 'WIT':
          switch (_output) {
            case 'WIB':
              _result = DateTime.now().subtract(const Duration(hours: 2));
              break;
            case 'WITA':
              _result = DateTime.now().subtract(const Duration(hours: 1));
              break;
            case 'WIT':
              _result = DateTime.now();
              break;
            case 'UTC':
              _result = DateTime.now().subtract(const Duration(hours: 9));
              break;
          }
          break;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildInput() {
    return DropdownButtonFormField<String>(
      value: _input,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Input',
      ),
      onChanged: _onInputChanged,
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
      ],
    );
  }

  Widget _buildOutput() {
    return DropdownButtonFormField<String>(
      value: _output,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Output',
      ),
      onChanged: _onOutputChanged,
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
      ],
    );
  }

  Widget _buildResult() {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
      initialData: _result,
      builder: (context, snapshot) {
        return Text(
          '${_result.hour}:${_result.minute}:${_result.second}',
          style: const TextStyle(fontSize: 30),
        );
      },
    );
  }

  Widget _buildConvertButton() {
    return ElevatedButton(
      onPressed: _convert,
      child: const Text('Convert'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInput(),
            const SizedBox(
              height: 20,
            ),
            _buildOutput(),
            const SizedBox(
              height: 20,
            ),
            _buildConvertButton(),
            const SizedBox(
              height: 20,
            ),
            _buildResult(),
          ],
        ),
      ),
    );
  }
}


