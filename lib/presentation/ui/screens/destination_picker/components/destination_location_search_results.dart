import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';
import 'package:uber_ride_clone/core/extensions/navigator.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/components/location_search_placeholder_tile.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/providers/destination_location_search_provider.dart';
import 'package:uber_ride_clone/presentation/ui/screens/destination_picker/providers/destination_place_provider.dart';
import 'package:uber_ride_clone/presentation/ui/screens/home/components/recent_location_tile.dart';
import 'package:uber_ride_clone/presentation/ui/screens/maps/providers/destination_place_id_provider.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/index.dart';

///Widget that shown results of destination location search.
class DestinationLocationSearchResults extends StatefulWidget {
  ///Default Constructor
  const DestinationLocationSearchResults({super.key});

  @override
  State<StatefulWidget> createState() =>
      _DestinationLocationSearchResultsState();
}

class _DestinationLocationSearchResultsState
    extends State<DestinationLocationSearchResults> {
  Future<void> _startRide() async {
    await context.pushTo(const RideDetailsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final search = ref.watch(destinationLocationSearchProvider);

        if (search == null || search.isEmpty) {
          return const _Empty();
        }

        final predictions = ref.watch(destinationPlacesSearchProvider(search));

        if (predictions.isLoading || predictions.isReloading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey,
            child: const LocationSearchPlaceholderTile(),
          );
        }

        return predictions.maybeMap(
          data: (data) {
            if (data.value == null || data.value!.isEmpty) {
              return const _Empty();
            }

            final predictions = data.value ?? [];

            if (predictions.isEmpty) return const SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Search results',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: context.width,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: predictions.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          ///Update the destination place id for all listeners
                          ///(widgets, providers)

                          ref.read(destinationPlaceIdProvider.notifier).state =
                              predictions[index].placeId;

                          await _startRide();
                        },
                        child: RecentLocationTile(
                          title: predictions[index].title,
                          subtitle: predictions[index].description,
                          leading: predictions[index].establishmentIcon,
                        ),
                        // child: LocationSearchResultTile(
                        //   place: predictions[index].title,
                        //   location: predictions[index].description,
                        //   leading: predictions[index].establishmentIcon,
                        // ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: AppSizes.h_4,
                    ),
                  ),
                ),
              ],
            );
          },
          orElse: () => const _Empty(),
        );
      },
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppSizes.h_20,
    );
  }
}
