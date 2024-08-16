import 'package:flutter/material.dart';
import 'package:meal/widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static const filter = 'filter';
  final Function Save;
  final Map<String, bool> currentSwitch;

  const Filters(this.Save, this.currentSwitch);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool? GlutenFree = false;
  bool? LactoseFree = false;
  bool? Vegan = false;
  bool? Vegetarian = false;

  @override
  void initState() {
     GlutenFree = widget.currentSwitch['gluten'];
     LactoseFree = widget.currentSwitch['lactose'];
     Vegan = widget.currentSwitch['vegan'];
     Vegetarian = widget.currentSwitch['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed:(){
              final Map<String, bool> selectedFilters =  {
                'gluten': GlutenFree as bool,
                'lactose': LactoseFree as bool,
                'vegan': Vegan as bool,
                'vegetarian': Vegetarian as bool,
              };
              widget.Save(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Center(
              child: Text(
                'Adjust your meal selection',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text('Gluten Free'),
                  value: GlutenFree as bool,
                  onChanged: (bool value) {
                    setState(() {
                      GlutenFree = value;
                    });
                  },
                  subtitle: const Text('Only include gluten free meals'),
                ),
                SwitchListTile(
                  title: const Text('Lactose Free'),
                  value: LactoseFree as bool,
                  onChanged: (bool value) {
                    setState(() {
                      LactoseFree = value;
                    });
                  },
                  subtitle: const Text('Only include Lactose Free meals'),
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  value: Vegan as bool,
                  onChanged: (bool value) {
                    setState(() {
                      Vegan = value;
                    });
                  },
                  subtitle: const Text('Only include Vegan meals'),
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  value: Vegetarian as bool,
                  onChanged: (bool value) {
                    setState(() {
                      Vegetarian = value;
                    });
                  },
                  subtitle: const Text('Only include Vegetarian meals'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
