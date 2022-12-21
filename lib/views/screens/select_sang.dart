import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:psalms_skrifberymings/models/psalm.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/models/vers.dart';
import 'package:psalms_skrifberymings/src/enums/beryming.dart';
import 'package:psalms_skrifberymings/src/enums/sang_tipe.dart';
import 'package:psalms_skrifberymings/views/screens/home.dart';
// ignore: unused_import
import 'package:psalms_skrifberymings/views/widgets/psalm_widgets.dart';

class SelectSangView extends StatefulWidget {
  const SelectSangView({super.key});

  @override
  State<SelectSangView> createState() => _SelectSangViewState();
}

class _SelectSangViewState extends State<SelectSangView> {
  // Create a variable to store the selected option
  SangTipe? kiesSangTipe;
  int sangNommer = 0;
  double min = 1;
  double max = 150;
  Sang sang = Sang(SangTipe.psalm, "Geen Sang Gekies", Beryming.totius, []);
  List<Vers> selectedVerse = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PsalmWidgets.appBar(title: "Kies Lied"),
      body: SizedBox(
          child: Column(
        children: [
          const SizedBox(height: 60),
          DropdownButton(
            // Set the initially selected value to the first option
            value: kiesSangTipe ?? SangTipe.psalm,
            // Set the dropdown menu items to the list of options
            items: SangTipe.values.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type.text),
              );
            }).toList(),
            // Set the onChanged callback to update the selectedOption variable
            onChanged: (newValue) {
              setState(() {
                kiesSangTipe = newValue;
              });
            },
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SpinBox(
              min: min,
              max: max,
              value: 5,
              digits: 3,
              decoration: const InputDecoration(labelText: 'Kies Lied Nommer'),
              onChanged: (value) {
                setState(() {
                  sang = Psalm.mock(nommer: value.toInt());
                });
              },
            ),
          ),
          const SizedBox(height: 60),
          MultiSelectContainer(
              key: ValueKey(sang.verse.length),
              items: sang.getChoices(),
              onChange: (allSelectedItems, selectedItem) {
                setState(() {
                  selectedVerse = allSelectedItems;
                });
              }),
          const SizedBox(height: 60),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: ((context) => HomeView(
                        sang: Sang(kiesSangTipe ?? SangTipe.psalm, sang.naam,
                            sang.beryming, selectedVerse)))));
              },
              child: const Text(
                "Vertoon",
                style: TextStyle(fontSize: 20),
              ))
        ],
      )),
    );
  }
}
