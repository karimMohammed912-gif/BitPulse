import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/bottom_NavBar.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/home_cubit_cubit.dart';

import 'package:bitpulse/core/extension/theme_extension.dart';

import 'package:bitpulse/core/utils/widget_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  static final bool _hasInitialized =
      false; // Make it static to persist across widget rebuilds

  @override
  bool get wantKeepAlive => true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();

    // Initialize the PageController
    _pageController.addListener(() {
      setState(() {
        _selectedIndex = _pageController.page?.round() ?? 0;
      });
    });

    // Only load data once when the widget is first created
    context.read<HomeCubit>().initialLoad(_hasInitialized, context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.primary,

        title: SizedBox(
          width: 120,
          height: 120,
          child: Image.asset(
            "assets/App_logo.png",
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, color: Colors.red);
            },
          ),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: widgetOptions,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
