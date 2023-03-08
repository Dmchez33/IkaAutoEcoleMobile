import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Pages/utilities/keys.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:intl/intl.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
class ReservationScreen extends StatefulWidget {
  final int? idcours;
  final int? idauto;
  final int? idaprenant;
  const ReservationScreen({super.key, this.idcours, this.idauto, this.idaprenant});
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
  Reservation(String date, String heure) async {
    Map data = {'date': date, 'heure': heure};

    print(data);
    var jsonResponse = null;
    Map<String, String> headers = {"Content-Type": "application/json"};

    final msg = jsonEncode({"date": date, "heure": heure});


    //jsonResponse = json.decode(response.body);
    http.post(Uri.parse('$url/AutoEcole/reserverCours/${widget.idauto}/${widget.idcours}/${widget.idaprenant}'),
        headers: {"Content-Type": "application/json"},
        body: msg).then((response) {
      if (response.statusCode == 200) {
        // Afficher un message de réussite ou rediriger l'utilisateur vers une autre page.
        print("donner envoyer avec succes");

        /*btn1(context);*/
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Reservation',textAlign: TextAlign.center,),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text('Votre reservation est encours de traitement nous vous envoyerons un sms dans un bref delai '
                    ,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A237E),
                      minimumSize: Size(double.infinity, 50.0),
                    ),
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop(['Test', 'List']);
                    },
                  ),
                ],
              ) ,

            );
          },
        );
      } else {
        // Afficher une erreur.
        String jsonString = response.body;
        Map<String, dynamic> jsonMap = jsonDecode(utf8.decode(response.bodyBytes));
        String message = jsonMap['message'];
        print(message);
        //print(jsonDecode(response.body).);
        _displaySuccessMotionToast(message);

      }
    });
  }

  //ALERTE TOASTE
  void _displaySuccessMotionToast(String message) {
    MotionToast.warning(
      title: const Text(
        'Alerte',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(
        '${message}',
        style: TextStyle(fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.ltr,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      dismissable: false,
    ).show(context);
  }
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final timeFormat = TimeOfDayFormat.HH_colon_mm;

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
              Text(
                _selectedDate == null
                    ? 'Sélectionner une date'
                    : dateFormat.format(_selectedDate!),
              ),
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
              Text(
                _selectedTime == null
                    ? 'Sélectionner une heure'
                    : '${_selectedTime?.toString().substring(10, 15)}',
              ),
              Opacity(
                opacity: 0.0,
                child: Icon(Icons.calendar_today),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF6200EE)),
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
                    onPressed: () {
                      Reservation('${dateFormat.format(_selectedDate!)}','${_selectedTime?.toString().substring(10, 15)}');
                      Navigator.of(context).pop(['Test', 'List']);
                    },
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
