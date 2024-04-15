import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/providers/destination_location_search_provider.dart';

///Find Destination Location TextField
class DestinationLocationSearchField extends ConsumerStatefulWidget {
  ///Default Constructor
  const DestinationLocationSearchField({
    super.key,
  });

  @override
  ConsumerState<DestinationLocationSearchField> createState() =>
      _DestinationLocationSearchFieldState();
}

class _DestinationLocationSearchFieldState
    extends ConsumerState<DestinationLocationSearchField> {
  late TextEditingController _searchController;

  @override
  void dispose() {
    _searchController
      ..removeListener(_updateQueryNotifier)
      ..dispose();
    super.dispose();
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    _searchController.addListener(_updateQueryNotifier);
    super.initState();
  }

  void _updateQueryNotifier() {
    ref.read(destinationLocationSearchProvider.notifier).state =
        _searchController.text;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        fillColor: Colors.grey[200],
        filled: true,
        hintText: 'Where to?',
        labelText: 'Destination',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}
