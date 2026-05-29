import 'package:flutter/material.dart';

enum BookingState {
  initial,
  selecting,
  confirming,
  booked,
  cancelled,
}

class BookingProvider extends ChangeNotifier {
  BookingState bookingState = BookingState.initial;

  void startBooking() {
    bookingState = BookingState.selecting;
    notifyListeners();
  }

  void confirmBooking() {
    bookingState = BookingState.confirming;
    notifyListeners();
  }

  void completeBooking() {
    bookingState = BookingState.booked;
    notifyListeners();
  }

  void cancelBooking() {
    bookingState = BookingState.cancelled;
    notifyListeners();
  }

  void reset() {
    bookingState = BookingState.initial;
    notifyListeners();
  }
}