  // List of different page contents
import 'package:bitpulse/Features/HomeFeature/Presentation/View/content/home_page_content.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/content/search_Content.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/content/settings_Content.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/content/exchange_coin_view.dart';
import 'package:flutter/material.dart';

final List<Widget> widgetOptions = <Widget>[
     HomePageContent(),
     ExchangeCoinView(),
     SearchContent(),
     SettingsContent(),
  ];