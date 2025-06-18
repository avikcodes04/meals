import 'package:flutter/material.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';
enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterset = false;
  var _lactoseFreeFilterset = false;
  var _vegetarianFilterset = false;
  var _veganFilterset = false;
  @override
  void initState() {
    super.initState();
    _glutenFreeFilterset = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterset = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterset = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterset = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(
      //         context,
      //       ).pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterset,
            Filter.lactoseFree: _lactoseFreeFilterset,
            Filter.vegetarian: _vegetarianFilterset,
            Filter.vegan: _veganFilterset,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterset,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterset = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  //color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              subtitle: Text(
                'only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  //color: Theme.of(context).colorScheme.onPrimary,
                  color: Colors.white,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            //another switch tile
            SwitchListTile(
              value: _lactoseFreeFilterset,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterset = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  //color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              subtitle: Text(
                'only include Lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  //color: Theme.of(context).colorScheme.onPrimary,
                  color: Colors.white,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            //vegetarian filter
            SwitchListTile(
              value: _vegetarianFilterset,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterset = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  //color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              subtitle: Text(
                'only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  //color: Theme.of(context).colorScheme.onPrimary,
                  color: Colors.white,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            //vegan filter
            SwitchListTile(
              value: _veganFilterset,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterset = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  //color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              subtitle: Text(
                'only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  //color: Theme.of(context).colorScheme.onPrimary,
                  color: Colors.white,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
