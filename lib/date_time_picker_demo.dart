import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
    home: DateTimePickerApp(),
  ));
}

class DateTimePickerApp extends StatefulWidget {
  const DateTimePickerApp({super.key});

  @override
  State<StatefulWidget> createState() => _DateTimePickerAppState();
}

class _DateTimePickerAppState extends State<DateTimePickerApp> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100),
      );

      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
      );
      if (pickedTime != null && pickedTime != _selectedTime) {
        setState(() {
          _selectedTime = pickedTime;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Date and Time Picker Demo"),),
      body: Center(
        child: Column(
          children: [
            datePickerWidget(context),
            timePickerWidget(context),
          ]
        ),
      ),
    );
  }

  Widget datePickerWidget(BuildContext context) {
    return Column(children: [
      Text(
        _selectedDate == null 
        ? "No Date Selected" 
        : "Selected Date: ${DateFormat("dd-MM-yyyy").format(_selectedDate!)}"
        ),
      ElevatedButton(
        onPressed: () => _selectDate(context), 
        child: const Text("Select Date"))
    ],);
  }

  Widget timePickerWidget(BuildContext context) {
    return Column(children: [
      Text(_selectedTime == null 
      ? "No time selected" 
      : "Selected Time: ${_selectedTime!.format(context)}" 
      ),
      ElevatedButton(
        onPressed: () => _selectTime(context), 
        child: const Text("Select Time")
        )
    ],);
  }

  
}