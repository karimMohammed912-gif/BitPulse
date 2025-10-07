import 'package:flutter/material.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({
    super.key,
    required this.context,
    required this.themeName,
    required this.themeDescription,
    required this.themeData,
    required this.isSelected,
    required this.onTap,
  });

  final BuildContext context;
  final String themeName;
  final String themeDescription;
  final ThemeData themeData;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          print('InkWell tapped for: $themeName');
          onTap();
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? themeData.primaryColor
                  : Colors.grey.withOpacity(0.3),
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? themeData.primaryColor.withOpacity(0.1) : null,
          ),
          child: Row(
            children: [
              // Theme Color Preview
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: themeData.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Theme Name and Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      themeName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? themeData.primaryColor : null,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      themeDescription,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              // Selection Indicator
              if (isSelected) ...[
                Icon(
                  Icons.check_circle,
                  color: themeData.primaryColor,
                  size: 24,
                ),
              ] else ...[
                Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.grey[400],
                  size: 24,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
