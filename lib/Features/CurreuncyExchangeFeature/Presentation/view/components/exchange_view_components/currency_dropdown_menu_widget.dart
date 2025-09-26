import 'package:flutter/material.dart';

class CurrencyDropdownMenuWidget extends StatelessWidget {
  const CurrencyDropdownMenuWidget({
    super.key,
    required this.currencies,
    required this.currentValue,
    required this.label,
    required this.onChanged,
  });

  final List<Map<String, String>> currencies;
  final String currentValue;
  final String label;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: currentValue,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      isExpanded: true, // Prevents overflow
      items: currencies.map((currency) {
        return DropdownMenuItem(
          value: currency['id'],
          child: SizedBox(
            width: double.infinity,
            child: Text(
              '${currency['name']} (${currency['symbol']})',
              overflow: TextOverflow.ellipsis, //  Handle long text
              maxLines: 1,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      //  Custom dropdown button to handle overflow
      selectedItemBuilder: (BuildContext context) {
        return currencies.map((currency) {
          return SizedBox(
            width: double.infinity,
            child: Text(
              '${currency['name']} (${currency['symbol']})',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          );
        }).toList();
      },
    );
  }
}
