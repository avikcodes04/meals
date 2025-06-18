import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterset = false;
  var _lactoseFreeFilterset = false;
  var _vegetarianFilterset = false;
  var _veganFilterset = false;
  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterset = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterset = activeFilters[Filter.lactoseFree]!;
    _vegetarianFilterset = activeFilters[Filter.vegetarian]!;
    _veganFilterset = activeFilters[Filter.vegan]!;
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
        canPop: true,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterset,
            Filter.lactoseFree: _lactoseFreeFilterset,
            Filter.vegetarian: _vegetarianFilterset,
            Filter.vegan: _veganFilterset,
          });
          //Navigator.of(context).pop({});
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
