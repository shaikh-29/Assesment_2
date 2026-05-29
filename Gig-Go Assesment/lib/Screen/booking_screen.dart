import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Provider/booking_provider.dart';
import '../models/gig_model.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final GigModel gig;

  const BookingScreen({
    super.key,
    required this.gig,
  });

  @override
  State<BookingScreen> createState() =>
      _BookingScreenState();
}

class _BookingScreenState
    extends State<BookingScreen> {

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {

    final provider =
        Provider.of<BookingProvider>(context);

    // Responsive Sizes
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Book Freelancer",
          style: TextStyle(
            fontSize: sw * 0.05,
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

                    CircleAvatar(
                      radius: sw * 0.08,

                      backgroundColor:
                          Colors.indigo.shade100,

                      child: Text(
                        widget.gig.name[0],

                        style: TextStyle(
                          fontSize: sw * 0.06,
                          fontWeight:
                              FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ),

                    SizedBox(width: sw * 0.04),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          Text(
                            widget.gig.name,

                            style: TextStyle(
                              fontSize:
                                  sw * 0.05,

                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                              height: sh * 0.008),

                          Text(
                            widget.gig.title,

                            style: TextStyle(
                              color:
                                  Colors.grey.shade700,

                              fontSize:
                                  sw * 0.038,
                            ),
                          ),

                          SizedBox(
                              height: sh * 0.012),

                          Text(
                            "\$${widget.gig.price}",

                            style: TextStyle(
                              fontSize:
                                  sw * 0.05,

                              fontWeight:
                                  FontWeight.bold,

                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: sh * 0.04),

            /// STEP 1
            if (provider.bookingState ==
                BookingState.initial)

              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: sh * 0.07,

                  child: ElevatedButton(
                    onPressed: () {
                      provider.startBooking();
                    },

                    child: Text(
                      "Start Booking",

                      style: TextStyle(
                        fontSize:
                            sw * 0.045,
                      ),
                    ),
                  ),
                ),
              ),

            /// STEP 2
            if (provider.bookingState ==
                BookingState.selecting)

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Select Project Date",

                    style: TextStyle(
                      fontSize:
                          sw * 0.055,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: sh * 0.025),

                  Card(
                    child: ListTile(

                      leading: Icon(
                        Icons.calendar_month,
                        size: sw * 0.07,
                      ),

                      title: Text(

                        selectedDate == null
                            ? "Choose Date"
                            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",

                        style: TextStyle(
                          fontSize:
                              sw * 0.04,
                        ),
                      ),

                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: sw * 0.045,
                      ),

                      onTap: () async {

                        DateTime? pickedDate =
                            await showDatePicker(

                          context: context,

                          initialDate:
                              DateTime.now(),

                          firstDate:
                              DateTime.now(),

                          lastDate:
                              DateTime(2030),
                        );

                        if (pickedDate != null) {

                          setState(() {
                            selectedDate =
                                pickedDate;
                          });
                        }
                      },
                    ),
                  ),

                  SizedBox(height: sh * 0.04),

                  SizedBox(
                    width: double.infinity,
                    height: sh * 0.07,

                    child: ElevatedButton(

                      onPressed:
                          selectedDate == null
                              ? null
                              : () {

                                  provider
                                      .confirmBooking();
                                },

                      child: Text(
                        "Confirm Booking",

                        style: TextStyle(
                          fontSize:
                              sw * 0.045,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            /// STEP 3
            if (provider.bookingState ==
                BookingState.confirming)

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Confirm Your Booking",

                    style: TextStyle(
                      fontSize:
                          sw * 0.055,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: sh * 0.025),

                  Card(
                    child: Padding(

                      padding:
                          EdgeInsets.all(
                              sw * 0.045),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          Text(
                            "Freelancer: ${widget.gig.name}",

                            style: TextStyle(
                              fontSize:
                                  sw * 0.042,
                            ),
                          ),

                          SizedBox(
                              height:
                                  sh * 0.012),

                          Text(
                            "Gig: ${widget.gig.title}",

                            style: TextStyle(
                              fontSize:
                                  sw * 0.042,
                            ),
                          ),

                          SizedBox(
                              height:
                                  sh * 0.012),

                          Text(
                            "Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",

                            style: TextStyle(
                              fontSize:
                                  sw * 0.042,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: sh * 0.04),

                  SizedBox(
                    width: double.infinity,
                    height: sh * 0.07,

                    child: ElevatedButton(

                      onPressed: () {
                        provider.completeBooking();
                      },

                      child: Text(
                        "Complete Booking",

                        style: TextStyle(
                          fontSize:
                              sw * 0.045,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            /// SUCCESS
            if (provider.bookingState ==
                BookingState.booked)

              Center(
                child: Column(
                  children: [

                    SizedBox(height: sh * 0.04),

                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: sw * 0.25,
                    ),

                    SizedBox(height: sh * 0.025),

                    Text(
                      "Booking Successful!",

                      style: TextStyle(
                        fontSize:
                            sw * 0.065,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: sh * 0.015),

                    Text(
                      "Your project has been booked successfully.",

                      textAlign:
                          TextAlign.center,

                      style: TextStyle(
                        color:
                            Colors.grey.shade700,

                        fontSize:
                            sw * 0.04,
                      ),
                    ),

                    SizedBox(height: sh * 0.04),

                    SizedBox(
                      width: double.infinity,
                      height: sh * 0.07,

                      child: ElevatedButton(

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.red,
                        ),

                        onPressed: () {
                          provider.cancelBooking();
                        },

                        child: Text(
                          "Cancel Booking",

                          style: TextStyle(
                            fontSize:
                                sw * 0.045,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            /// CANCELLED
            if (provider.bookingState ==
                BookingState.cancelled)

              Center(
                child: Column(
                  children: [

                    SizedBox(height: sh * 0.08),

                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: sw * 0.24,
                    ),

                    SizedBox(height: sh * 0.025),

                    Text(
                      "Booking Cancelled",

                      style: TextStyle(
                        fontSize:
                            sw * 0.06,

                        fontWeight:
                            FontWeight.bold,

                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
