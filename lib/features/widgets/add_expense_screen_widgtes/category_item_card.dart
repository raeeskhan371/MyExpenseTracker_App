import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItemCard extends StatelessWidget {
  String categoryText;
  Color catergoryContainerColor;
  Color SubCatergoryContainer;
  IconData catergoryIcon;

  CategoryItemCard({
    super.key,
    required this.categoryText,
    required this.catergoryContainerColor,
    required this.SubCatergoryContainer,
    required this.catergoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: SubCatergoryContainer.withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 10,
          ),
        ],

        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: SubCatergoryContainer,
            ),

            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(catergoryIcon, color: Colors.white),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            categoryText,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
