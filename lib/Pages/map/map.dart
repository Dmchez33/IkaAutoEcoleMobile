import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ika_auto_ecole/Pages/map/listeLieux.dart';

class localisation extends StatefulWidget {
  const localisation({Key? key}) : super(key: key);

  @override
  _localisationState createState() => _localisationState();
}

class _localisationState extends State<localisation> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Localisation'),
        actions: [Image.asset('assets/images/logoIkaAutoEcole.png')],
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text("Trouver le meilleur auto école près de chez toi"),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Image.asset('assets/images/car-driving.gif')),
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,

                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: _addDividersAfterItems(items),
                    customItemsHeights: _getCustomItemsHeights(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 40,
                    dropdownMaxHeight: 200,
                    buttonWidth: 240,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,

                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: _addDividersAfterItems(items),
                    customItemsHeights: _getCustomItemsHeights(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 40,
                    dropdownMaxHeight: 200,
                    buttonWidth: 240,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,

                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: _addDividersAfterItems(items),
                    customItemsHeights: _getCustomItemsHeights(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 40,
                    dropdownMaxHeight: 200,
                    buttonWidth: 240,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),


                  Row(children: [

                    Expanded(

                      child: ElevatedButton(

                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF6200EE)),
                          foregroundColor:
                              MaterialStateProperty.all(Color(0xFFFFFFFF)),
                          elevation: MaterialStateProperty.all(4),

                          //mouseCursor: MaterialStateProperty.all(MouseCursor())
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const listeLieux()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'TextButton',
                            ),
                            //Icon(Icons.book)
                          ],
                        ),
                      ),
                    )
                  ])
                ],
              ))
        ],
      ),
    );
  }
}