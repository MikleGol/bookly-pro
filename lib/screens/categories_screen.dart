import 'package:flutter/material.dart';
import '../theme/bookly_colors.dart';
import '../widgets/app_text_field.dart';
import '../widgets/filter_chip_button.dart';
import '../widgets/category_card.dart';
import '../data/app_data.dart';

final filters = ['All', 'Popular', 'Nearby'];

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final nullFocus = FocusNode();
  final searchFocus = FocusNode();
  final searchController = TextEditingController();
  int selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BooklyColors.primary100,

      appBar: AppBar(
        backgroundColor: BooklyColors.primary100,
        title: Text(
          'All Categories',
          style: TextStyle(
            fontSize: 18,
            color: BooklyColors.neutral900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              AppTextField(
                focusNode: searchFocus,
                controller: searchController,
                type: TextInputType.text,
                validate: () {},
                hintText: 'Search categories',
                height: 56,
                width: double.infinity,
                prefixIcon: Icon(Icons.search, color: BooklyColors.neutral400),
                nextFocus: nullFocus,
              ),
              SizedBox(height: 12),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Row(
                  spacing: 10,
                  children: List.generate(filters.length, (index) {
                    final isSelected = selectedFilterIndex == index;

                    return FilterChipButton(
                      text: filters[index],
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedFilterIndex = index;
                        });
                      }, selectedColor: BooklyColors.primary400,
                    );
                  }),
                ),
              ),
              SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppData.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 150
                ),

                itemBuilder: (context, index) {
                  return CategoryCard(category: AppData.categories[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
