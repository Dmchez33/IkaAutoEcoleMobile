import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';



class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  bool get isDateAndTimeValid {
    if (_selectedDate == null || _selectedTime == null) {
      return false;
    }

    final now = DateTime.now();
    final selectedDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    return selectedDateTime.isAfter(now);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Color(0xFFFFFFFF),
          ),
          onPressed: () => _selectDate(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.calendar_today),
              Text(_selectedDate?.toString() ?? 'Sélectionner une date'),
              Opacity(
                opacity: 0.0,
                child: Icon(Icons.calendar_today),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Color(0xFFFFFFFF),
          ),
          onPressed: () => _selectTime(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.access_time),
              Text(_selectedTime?.toString() ?? 'Sélectionner une heure'),
              Opacity(
                opacity: 0.0,
                child: Icon(Icons.calendar_today),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: isDateAndTimeValid
              ? () {
            Dialogs.materialDialog(
                msg: 'Êtes-vous sûr de vouloir réserver ?',
                title: 'Confirmation',
                color: Colors.white,
                context: context,
                dialogWidth: kIsWeb ? 0.3 : null,
                onClose: (value) =>
                    print("returned value is '$value'"),
                actions: [
                  IconsOutlineButton(
                    onPressed: () {
                      Navigator.of(context).pop(['Test', 'List']);
                    },
                    text: 'Annuler',
                    iconData: Icons.cancel_outlined,
                    textStyle: TextStyle(color: Colors.grey),
                    iconColor: Colors.grey,
                  ),
                  IconsButton(
                    onPressed: () {},
                    text: "Envoyer",
                    color: Color(0xFF6200EE),
                    textStyle: TextStyle(color: Colors.white),
                    iconColor: Colors.white,
                  ),
                ]);
          }
              : null,
          child: Text('Réserver'),
        ),
      ],
    );
  }
}
