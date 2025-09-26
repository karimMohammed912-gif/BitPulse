import 'package:bitpulse/Features/HomeFeature/Data/Model/crypto_item_list/crypto_item_list.dart';
import 'package:bitpulse/core/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteStarWidget extends StatefulWidget {
  final bool initiallySelected;
  final Function(bool isSelected)? onSelectionChanged;

  const FavoriteStarWidget({
    super.key,
    this.initiallySelected = false,
    this.onSelectionChanged,
  });

  @override
  State<FavoriteStarWidget> createState() => _FavoriteStarWidgetState();
}

class _FavoriteStarWidgetState extends State<FavoriteStarWidget>
    with SingleTickerProviderStateMixin {
  late bool isSelected;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initiallySelected;
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
      if (isSelected) {
   
    Box<CryptoItemList> starsBox = Hive.box<CryptoItemList>('StarsBox');
        // Add to favorites logic
        final cryptoItem = CryptoItemList(
          name: 'Example Crypto',
          symbol: 'EXC',
          marketCap: 1000000,
       
        );
        starsBox.add(cryptoItem)
        ; // Example addition
      } else {
        // Remove from favorites logic
        Box<CryptoItemList> starsBox = Hive.box<CryptoItemList>('StarsBox');
        starsBox.deleteAt(0);
 // Example deletion
      }
    });
    
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isSelected ? 'Added to Stars List' : 'Removed from Stars List'),
        backgroundColor: isSelected ? AppColors.primary : AppColors.error,
        duration: const Duration(seconds: 1),
      ),
    );
    
    widget.onSelectionChanged?.call(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Icon(
                isSelected ? Icons.star : Icons.star_border,
                color: isSelected ? AppColors.primary : AppColors.grey,
                size: 25,
              ),
            ),
          );
        },
      ),
    );
  }
}