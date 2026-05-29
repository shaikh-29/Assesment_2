import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../Provider/gig_provider.dart';
import '../widgets/gig_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
        Provider.of<GigProvider>(context);

    // Responsive Sizes
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Gig-Go",

          style: TextStyle(
            fontSize: sw * 0.055,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(sw * 0.04),

        child: Column(
          children: [

            /// SEARCH BAR
            TextField(

              decoration: InputDecoration(

                hintText: "Search gigs...",

                hintStyle: TextStyle(
                  fontSize: sw * 0.04,
                ),

                prefixIcon: Icon(
                  Icons.search,
                  size: sw * 0.06,
                ),

                filled: true,
                fillColor: Colors.white,

                contentPadding: EdgeInsets.symmetric(
                  vertical: sh * 0.018,
                ),

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(14),

                  borderSide: BorderSide.none,
                ),
              ),

              onChanged: provider.updateSearch,
            ),

            SizedBox(height: sh * 0.02),

            /// CATEGORY CHIPS
            SizedBox(
              height: sh * 0.055,

              child: ListView.builder(

                scrollDirection: Axis.horizontal,

                itemCount:
                    provider.categories.length,

                itemBuilder: (_, index) {

                  final category =
                      provider.categories[index];

                  return Padding(

                    padding: EdgeInsets.only(
                      right: sw * 0.02,
                    ),

                    child: ChoiceChip(

                      label: Text(
                        category,

                        style: TextStyle(
                          fontSize:
                              sw * 0.035,
                        ),
                      ),

                      selected:
                          provider.selectedCategory ==
                              category,

                      onSelected: (_) {

                        provider.updateCategory(
                            category);
                      },
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: sh * 0.015),

            /// PRICE SLIDER
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  "Max Price: \$${provider.maxPrice.toStringAsFixed(0)}",

                  style: TextStyle(
                    fontSize: sw * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Slider(

                  value: provider.maxPrice,

                  min: 50,
                  max: 500,
                  divisions: 9,

                  label: provider.maxPrice
                      .toStringAsFixed(0),

                  onChanged:
                      provider.updatePrice,
                ),
              ],
            ),

            /// CHECKBOXES
            Row(
              children: [

                Expanded(
                  child: CheckboxListTile(

                    contentPadding:
                        EdgeInsets.zero,

                    value:
                        provider.availableOnly,

                    onChanged: (value) {

                      provider.toggleAvailability(
                          value!);
                    },

                    title: Text(
                      "Available",

                      style: TextStyle(
                        fontSize:
                            sw * 0.035,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: CheckboxListTile(

                    contentPadding:
                        EdgeInsets.zero,

                    value:
                        provider.topRatedOnly,

                    onChanged: (value) {

                      provider.toggleTopRated(
                          value!);
                    },

                    title: Text(
                      "Top Rated",

                      style: TextStyle(
                        fontSize:
                            sw * 0.035,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: sh * 0.01),

            /// GIG LIST
            Expanded(
              child: ListView.builder(

                physics:
                    const BouncingScrollPhysics(),

                itemCount:
                    provider.filteredGigs.length,

                itemBuilder: (_, index) {

                  return Padding(

                    padding: EdgeInsets.only(
                      bottom: sh * 0.015,
                    ),

                    child: GigCard(
                      gig:
                          provider.filteredGigs[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
