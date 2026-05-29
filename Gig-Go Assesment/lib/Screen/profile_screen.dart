import 'package:flutter/material.dart';
// import'package:flutter/material.dart';

import '../models/gig_model.dart';
import '../widgets/badge_widget.dart';
import '../widgets/rating_stars.dart';
import 'booking_screen.dart';

class ProfileScreen extends StatelessWidget {

  final GigModel gig;

  const ProfileScreen({
    super.key,
    required this.gig,
  });

  @override
  Widget build(BuildContext context) {

    // Responsive Sizes
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(

        title: Text(
          "Freelancer Profile",

          style: TextStyle(
            fontSize: sw * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: EdgeInsets.all(sw * 0.045),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            /// TOP CARD
            Card(

              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20),
              ),

              elevation: 4,

              child: Padding(

                padding:
                    EdgeInsets.all(sw * 0.045),

                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    /// AVATAR
                    CircleAvatar(

                      radius: sw * 0.09,

                      backgroundColor:
                          Colors.indigo.shade100,

                      child: Text(

                        gig.name[0],

                        style: TextStyle(
                          fontSize: sw * 0.07,
                          fontWeight:
                              FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ),

                    SizedBox(width: sw * 0.045),

                    /// DETAILS
                    Expanded(
                      child: Column(

                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          Text(
                            gig.name,

                            style: TextStyle(
                              fontSize:
                                  sw * 0.055,

                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                              height: sh * 0.008),

                          Text(
                            gig.title,

                            style: TextStyle(
                              fontSize:
                                  sw * 0.04,

                              color: Colors
                                  .grey.shade700,
                            ),
                          ),

                          SizedBox(
                              height: sh * 0.012),

                          Row(
                            children: [

                              RatingStars(
                                rating:
                                    gig.rating,
                              ),

                              SizedBox(
                                  width:
                                      sw * 0.02),

                              Text(
                                gig.rating
                                    .toString(),

                                style:
                                    TextStyle(
                                  fontSize:
                                      sw * 0.038,

                                  fontWeight:
                                      FontWeight
                                          .w600,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                              height: sh * 0.008),

                          Text(
                            "${gig.reviews} Reviews",

                            style: TextStyle(
                              fontSize:
                                  sw * 0.036,

                              color: Colors
                                  .grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: sh * 0.03),

            /// BADGES
            Wrap(

              spacing: sw * 0.025,
              runSpacing: sh * 0.012,

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

            SizedBox(height: sh * 0.035),

            /// ABOUT
            Text(
              "About Freelancer",

              style: TextStyle(
                fontSize: sw * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: sh * 0.012),

            Text(

              gig.description,

              style: TextStyle(
                fontSize: sw * 0.039,
                color: Colors.grey.shade800,
                height: 1.5,
              ),
            ),

            SizedBox(height: sh * 0.035),

            /// SKILLS
            Text(
              "Skills",

              style: TextStyle(
                fontSize: sw * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: sh * 0.015),

            Wrap(

              spacing: sw * 0.025,
              runSpacing: sh * 0.012,

              children:
                  gig.skills.map((skill) {

                return Chip(

                  label: Text(

                    skill,

                    style: TextStyle(
                      fontSize:
                          sw * 0.035,
                    ),
                  ),

                  backgroundColor:
                      Colors.indigo.shade50,
                );

              }).toList(),
            ),

            SizedBox(height: sh * 0.035),

            /// PRICE CARD
            Card(

              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(18),
              ),

              child: Padding(

                padding:
                    EdgeInsets.all(sw * 0.045),

                child: Row(

                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [

                    Text(
                      "Project Price",

                      style: TextStyle(
                        fontSize:
                            sw * 0.045,

                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),

                    Text(
                      "\$${gig.price}",

                      style: TextStyle(
                        fontSize:
                            sw * 0.055,

                        fontWeight:
                            FontWeight.bold,

                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: sh * 0.045),

            /// BOOK BUTTON
            SizedBox(

              width: double.infinity,
              height: sh * 0.07,

              child: ElevatedButton(

                style:
                    ElevatedButton.styleFrom(

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                            15),
                  ),
                ),

                onPressed: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) =>
                          BookingScreen(
                        gig: gig,
                      ),
                    ),
                  );
                },

                child: Text(
                  "Book Now",

                  style: TextStyle(
                    fontSize:
                        sw * 0.045,
                  ),
                ),
              ),
            ),

            SizedBox(height: sh * 0.03),
          ],
        ),
      ),
    );
  }
}

