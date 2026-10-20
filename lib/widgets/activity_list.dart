import 'package:flutter/material.dart';

import '../models/activity.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({
    super.key,
    this.shrinkWrap = false,
    this.physics,
    this.onActivityTap,
  });

  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final ValueChanged<Activity>? onActivityTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: daycareActivities.length,
      itemBuilder: (context, index) {
        final activity = daycareActivities[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFFE8EDE8)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: onActivityTap == null
                ? null
                : () => onActivityTap!(activity),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF4EC),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      activity.icone,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity.titre,
                          style: const TextStyle(
                            color: Color(0xFF315C4C),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          activity.description,
                          style: const TextStyle(
                            color: Color(0xFF718078),
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
