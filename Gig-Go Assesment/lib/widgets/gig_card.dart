import 'package:flutter/material.dart';

import '../Screen/profile_screen.dart';
import '../models/gig_model.dart';
// import '../screens/profile_screen.dart';
import 'badge_widget.dart';
import 'rating_stars.dart';

class GigCard extends StatelessWidget {
  final GigModel gig;

  const GigCard({
    super.key,
    required this.gig,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProfileScreen(gig: gig),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              /// TOP ROW
              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  /// AVATAR
                  CircleAvatar(
                    radius: 28,
                    backgroundColor:
                        Colors.indigo.shade100,
                    child: Text(
                      gig.name[0],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  /// DETAILS
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          gig.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          gig.title,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          gig.category,
                          style: TextStyle(
                            color:
                                Colors.indigo.shade400,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// PRICE
                  Text(
                    "\$${gig.price}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              /// RATING ROW
              Row(
                children: [

                  RatingStars(
                    rating: gig.rating,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    gig.rating.toString(),
                    style: const TextStyle(
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 6),

                  Text(
                    "(${gig.reviews} reviews)",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// BADGES
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [

                  if (gig.isTopRated)
                    const BadgeWidget(
                      text: "Top Rated",
                      color: Colors.orange,
                    ),

                  if (gig.isInstantBook)
                    const BadgeWidget(
                      text: "Instant Book",
                      color: Colors.green,
                    ),

                  BadgeWidget(
                    text: gig.isAvailable
                        ? "Available"
                        : "Unavailable",
                    color: gig.isAvailable
                        ? Colors.blue
                        : Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}