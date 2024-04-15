import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uber_ride_clone/data/models/ride_choice.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/components/ride_choice_card.dart';
import 'package:uber_ride_clone/presentation/ui/screens/ride_details/providers/ride_choice_provider.dart';

///Ride Choices
class RideChoices extends StatefulWidget {
  ///Default Constructor
  const RideChoices({
    super.key,
  });

  @override
  State<RideChoices> createState() => _RideChoicesState();
}

class _RideChoicesState extends State<RideChoices> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        if (ref.read(ridePlanSelectedProvider) == null) {
          Future.delayed(Duration.zero, () {
            ref.read(ridePlanSelectedProvider.notifier).state =
                RideChoiceModel.all.first.label;
          });
        }

        return Column(
          children: [RideChoiceModel.all.first]
              .map(
                (r) => RideChoiceCard(
                  imagePath: r.imagePath,
                  label: r.label,
                  arriveTime: r.arriveTime,
                  arriveDistanceInMin: r.arriveDistanceInMin,
                  action: r.action,
                  price: r.price,
                  actionTitle: r.actionTitle,
                  actionIcon: r.actionIcon,
                  priceAfterDiscount: r.priceAfterDiscount,
                  passengersCount: r.passengersCount,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
