import 'package:flutter/material.dart';

import '../models/gig_model.dart';
import '../repositery/gig_repository.dart';
// import '../repositories/gig_repository.dart';

class GigProvider extends ChangeNotifier {
  final GigRepository repository;

  GigProvider(this.repository);

  List<GigModel> _allGigs = [];
  List<GigModel> filteredGigs = [];

  String searchQuery = '';
  String selectedCategory = 'All';
  double maxPrice = 500;
  bool availableOnly = false;
  bool topRatedOnly = false;

  List<String> categories = [
    'All',
    'Development',
    'Design',
    'Editing',
  ];

  Future<void> loadGigs() async {
    _allGigs = await repository.getGigs();
    applyFilters();
  }

  void updateSearch(String value) {
    searchQuery = value;
    applyFilters();
  }

  void updateCategory(String value) {
    selectedCategory = value;
    applyFilters();
  }

  void updatePrice(double value) {
    maxPrice = value;
    applyFilters();
  }

  void toggleAvailability(bool value) {
    availableOnly = value;
    applyFilters();
  }

  void toggleTopRated(bool value) {
    topRatedOnly = value;
    applyFilters();
  }

  void applyFilters() {
    filteredGigs = _allGigs.where((gig) {
      final matchesSearch =
          gig.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              gig.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              gig.category.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesCategory =
          selectedCategory == 'All' || gig.category == selectedCategory;

      final matchesPrice = gig.price <= maxPrice;

      final matchesAvailability =
          !availableOnly || gig.isAvailable;

      final matchesTopRated =
          !topRatedOnly || gig.isTopRated;

      return matchesSearch &&
          matchesCategory &&
          matchesPrice &&
          matchesAvailability &&
          matchesTopRated;
    }).toList();

    notifyListeners();
  }
}