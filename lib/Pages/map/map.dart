import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:ika_auto_ecole/Pages/map/listeLieux.dart';
import 'package:select_searchable_list/select_searchable_list.dart';

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

  final Map<int, String> _listCategories = {
    1: 'Boot',
    2: 'Casual',
    3: 'Flat',
    4: 'Flip',
    5: 'Lace up',
    6: 'Loafer',
    7: 'Slip-on',
    8: 'Moccasins'
  };

  // Default value
  final List<int> _selectedCategory = [1];

  final Map<int, String> _listColors = {
    1: 'Black',
    2: 'Blue',
    3: 'Brown',
    4: 'Gold',
    5: 'Green',
    6: 'Grey',
    7: 'Orange',
    8: 'Pink',
    9: 'Purple',
    10: 'Red'
  };

  // Default value
  final List<int> _selectedColors = [2, 4];
  final TextEditingController _categoryTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Localisation'),
        actions: [Image.asset('assets/images/logoIkaAutoEcole.png')],
      ),
      body:
          Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset(
                'assets/images/localisation.png',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    child: ListTile(
                      leading: Image.asset('assets/images/localisateur.png',
                          width: 100, height: 100, fit: BoxFit.fill),
                      title: const Text(
                        'Ne perdez plus de temps à chercher une auto-école près de chez vous !',
                        style: TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 2,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text(
                        'Avec notre page de localisation sur IKAAUTOECOLE '
                        'vous pouvez facilement trouver les auto-écoles les plus '
                        'proches de votre adresse.',
                        style: TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 2,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Image.asset('assets/images/Image.png',
                        fit: BoxFit.cover),
                  ),
                  const Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text(
                        "Cliquez pour trouver l'auto-école près de chez vous et réservez vos cours dès maintenant !",
                        style: TextStyle(
                          letterSpacing: 1,
                          wordSpacing: 2,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),

                  /*Card(
                        elevation: 0,
                        child: ListTile(
                          leading: Image.asset('assets/images/cours.png',width: 100,height: 100,fit: BoxFit.fill),
                          title: const Text(
                              'Faites un pas vers votre permis de conduire '
                                  'en utilisant notre plateforme efficace et pratique.',style: TextStyle(letterSpacing: 1, wordSpacing: 2,fontFamily: 'Poppins',fontSize: 16, fontWeight: FontWeight.w600,),textAlign: TextAlign.justify,),
                        ),
                      ),*/
                  Container(
                    margin: EdgeInsets.only(right: 20, bottom: 20),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: AnimatedButton(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const listeLieux(),
                                settings:
                                    const RouteSettings(name: '/listelieux')),
                          );
                        },
                        height: 40,
                        width: 100,
                        text: '>>',
                        selectedGradientColor: const LinearGradient(
                            colors: [Color(0xFF1A237E), Color(0xFF1A237E)]),
                        isReverse: true,
                        selectedTextColor: Colors.white,
                        transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                        textStyle: TextStyle(color: Colors.black),
                        borderColor: Colors.black,
                        borderWidth: 1,
                        borderRadius: 5,
                      ),
                    ),
                  ),
                  Card(
                    child: DropDownTextField(
                      textEditingController: _categoryTextEditingController,
                      title: 'Category',
                      hint: 'Select Category',
                      options: _listCategories,
                      selectedOptions: _selectedCategory,
                      onChanged: (selectedIds) {
                        // setState(() => selectedIds);
                      },
                    ),
                  )
                ],
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}
