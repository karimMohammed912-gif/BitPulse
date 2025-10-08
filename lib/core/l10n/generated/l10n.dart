// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `BitPulse`
  String get appTitle {
    return Intl.message(
      'BitPulse',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get email {
    return Intl.message(
      'Email address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpButton {
    return Intl.message(
      'Sign up',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to continue your crypto journey`
  String get signInToContinueYourCryptoJourney {
    return Intl.message(
      'Sign in to continue your crypto journey',
      name: 'signInToContinueYourCryptoJourney',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get enterYourUsername {
    return Intl.message(
      'Enter your username',
      name: 'enterYourUsername',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccount {
    return Intl.message(
      'Create an account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Global market cap`
  String get Global_market_cap {
    return Intl.message(
      'Global market cap',
      name: 'Global_market_cap',
      desc: '',
      args: [],
    );
  }

  /// `is up`
  String get is_up {
    return Intl.message(
      'is up',
      name: 'is_up',
      desc: '',
      args: [],
    );
  }

  /// `is down`
  String get is_down {
    return Intl.message(
      'is down',
      name: 'is_down',
      desc: '',
      args: [],
    );
  }

  /// `My Stars List`
  String get my_stars_List {
    return Intl.message(
      'My Stars List',
      name: 'my_stars_List',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Exchange`
  String get Exchange {
    return Intl.message(
      'Exchange',
      name: 'Exchange',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Crypto List`
  String get Crypto_List {
    return Intl.message(
      'Crypto List',
      name: 'Crypto_List',
      desc: '',
      args: [],
    );
  }

  /// `Crypto Exchange`
  String get Crypto_Exchange {
    return Intl.message(
      'Crypto Exchange',
      name: 'Crypto_Exchange',
      desc: '',
      args: [],
    );
  }

  /// `Convert between different cryptocurrencies with real-time exchange rates `
  String
      get Convert_between_different_cryptocurrencieswith_real_time_exchange_rates {
    return Intl.message(
      'Convert between different cryptocurrencies with real-time exchange rates ',
      name:
          'Convert_between_different_cryptocurrencieswith_real_time_exchange_rates',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get features {
    return Intl.message(
      'Features',
      name: 'features',
      desc: '',
      args: [],
    );
  }

  /// `Real-time Rates`
  String get Real_time_Rates {
    return Intl.message(
      'Real-time Rates',
      name: 'Real_time_Rates',
      desc: '',
      args: [],
    );
  }

  /// `Easy Swapping`
  String get easy_Swapping {
    return Intl.message(
      'Easy Swapping',
      name: 'easy_Swapping',
      desc: '',
      args: [],
    );
  }

  /// `Precise Calculations`
  String get precise_Calculations {
    return Intl.message(
      'Precise Calculations',
      name: 'precise_Calculations',
      desc: '',
      args: [],
    );
  }

  /// `Start exchanging`
  String get start_exchanging {
    return Intl.message(
      'Start exchanging',
      name: 'start_exchanging',
      desc: '',
      args: [],
    );
  }

  /// `Quickly swap between different cryptocurrencies`
  String get Quickly_swap_between_different_cryptocurrencies {
    return Intl.message(
      'Quickly swap between different cryptocurrencies',
      name: 'Quickly_swap_between_different_cryptocurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Accurate calculations with detailed breakdown`
  String get Accurate_calculations_with_detailed_breakdown {
    return Intl.message(
      'Accurate calculations with detailed breakdown',
      name: 'Accurate_calculations_with_detailed_breakdown',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get Amount {
    return Intl.message(
      'Amount',
      name: 'Amount',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get From {
    return Intl.message(
      'From',
      name: 'From',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get To {
    return Intl.message(
      'To',
      name: 'To',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Now`
  String get Exchange_Now {
    return Intl.message(
      'Exchange Now',
      name: 'Exchange_Now',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get userid {
    return Intl.message(
      'User ID',
      name: 'userid',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get spanish {
    return Intl.message(
      'Spanish',
      name: 'spanish',
      desc: '',
      args: [],
    );
  }

  /// `German`
  String get german {
    return Intl.message(
      'German',
      name: 'german',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get portuguese {
    return Intl.message(
      'Portuguese',
      name: 'portuguese',
      desc: '',
      args: [],
    );
  }

  /// `Italian`
  String get italian {
    return Intl.message(
      'Italian',
      name: 'italian',
      desc: '',
      args: [],
    );
  }

  /// `Japanese`
  String get japanese {
    return Intl.message(
      'Japanese',
      name: 'japanese',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get chinese {
    return Intl.message(
      'Chinese',
      name: 'chinese',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out of Your Account`
  String get Sign_Out_of_Your_Account {
    return Intl.message(
      'Sign Out of Your Account',
      name: 'Sign_Out_of_Your_Account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get are_you_sure_you_want_to_logout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'are_you_sure_you_want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `App Theme`
  String get app_theme {
    return Intl.message(
      'App Theme',
      name: 'app_theme',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get Default {
    return Intl.message(
      'Default',
      name: 'Default',
      desc: '',
      args: [],
    );
  }

  /// `Bitcoin Orange`
  String get Bitcoin_Orange {
    return Intl.message(
      'Bitcoin Orange',
      name: 'Bitcoin_Orange',
      desc: '',
      args: [],
    );
  }

  /// `Ethereum Blue`
  String get Ethereum_Blue {
    return Intl.message(
      'Ethereum Blue',
      name: 'Ethereum_Blue',
      desc: '',
      args: [],
    );
  }

  /// `Classic Dark`
  String get Classic_Dark {
    return Intl.message(
      'Classic Dark',
      name: 'Classic_Dark',
      desc: '',
      args: [],
    );
  }

  /// `Minimal Light`
  String get Minimal_Light {
    return Intl.message(
      'Minimal Light',
      name: 'Minimal_Light',
      desc: '',
      args: [],
    );
  }

  /// `Purple Crypto`
  String get purple_crypto {
    return Intl.message(
      'Purple Crypto',
      name: 'purple_crypto',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `App Version & info`
  String get app_version {
    return Intl.message(
      'App Version & info',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `Clear Cache`
  String get clear_cache {
    return Intl.message(
      'Clear Cache',
      name: 'clear_cache',
      desc: '',
      args: [],
    );
  }

  /// `Reset App to Default Settings`
  String get reset_App_to_Default_Settings {
    return Intl.message(
      'Reset App to Default Settings',
      name: 'reset_App_to_Default_Settings',
      desc: '',
      args: [],
    );
  }

  /// `This will reset the app to default settings and clear all data. This action cannot be undone.`
  String
      get this_will_reset_the_app_to_default_settings_and_clear_all_data_this_action_cannot_be_undone {
    return Intl.message(
      'This will reset the app to default settings and clear all data. This action cannot be undone.',
      name:
          'this_will_reset_the_app_to_default_settings_and_clear_all_data_this_action_cannot_be_undone',
      desc: '',
      args: [],
    );
  }

  /// `Error: `
  String get Error_ {
    return Intl.message(
      'Error: ',
      name: 'Error_',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get Result {
    return Intl.message(
      'Result',
      name: 'Result',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Loading Exchange View ...`
  String get Loading_Exchange_View {
    return Intl.message(
      'Loading Exchange View ...',
      name: 'Loading_Exchange_View',
      desc: '',
      args: [],
    );
  }

  /// `Get real-time exchange rates for a wide range of cryptocurrencies`
  String get Get_real_time_exchange_rates_for_a_wide_range_of_cryptocurrencies {
    return Intl.message(
      'Get real-time exchange rates for a wide range of cryptocurrencies',
      name: 'Get_real_time_exchange_rates_for_a_wide_range_of_cryptocurrencies',
      desc: '',
      args: [],
    );
  }

  /// `Currency Exchange`
  String get currency_exchange {
    return Intl.message(
      'Currency Exchange',
      name: 'currency_exchange',
      desc: '',
      args: [],
    );
  }

  /// `About BitPulse`
  String get About_BitPulse {
    return Intl.message(
      'About BitPulse',
      name: 'About_BitPulse',
      desc: '',
      args: [],
    );
  }

  /// `BitPulse is a cryptocurrency tracking app that helps you monitor your favorite coins and stay updated with market trends.`
  String get Bitpulse_is {
    return Intl.message(
      'BitPulse is a cryptocurrency tracking app that helps you monitor your favorite coins and stay updated with market trends.',
      name: 'Bitpulse_is',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get OK {
    return Intl.message(
      'OK',
      name: 'OK',
      desc: '',
      args: [],
    );
  }

  /// `Tap the star icon on a crypto to add it to your favorites`
  String get tap_the_star_icon_on_a_crypto_to_add_it_to_your_favorites {
    return Intl.message(
      'Tap the star icon on a crypto to add it to your favorites',
      name: 'tap_the_star_icon_on_a_crypto_to_add_it_to_your_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Perform accurate currency conversions with advanced calculation tools`
  String
      get Perform_accurate_currency_conversions_with_advanced_calculation_tools {
    return Intl.message(
      'Perform accurate currency conversions with advanced calculation tools',
      name:
          'Perform_accurate_currency_conversions_with_advanced_calculation_tools',
      desc: '',
      args: [],
    );
  }

  /// `Cache cleared successfully`
  String get Cache_cleared_successfully {
    return Intl.message(
      'Cache cleared successfully',
      name: 'Cache_cleared_successfully',
      desc: '',
      args: [],
    );
  }

  /// `This will clear cached data but keep your settings and favorites.`
  String get Clear_Cache_message {
    return Intl.message(
      'This will clear cached data but keep your settings and favorites.',
      name: 'Clear_Cache_message',
      desc: '',
      args: [],
    );
  }

  /// `Clearing data...`
  String get Clearing_data {
    return Intl.message(
      'Clearing data...',
      name: 'Clearing_data',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get Clear_All {
    return Intl.message(
      'Clear All',
      name: 'Clear_All',
      desc: '',
      args: [],
    );
  }

  /// `Reset app to default`
  String get Reset_app_to_default {
    return Intl.message(
      'Reset app to default',
      name: 'Reset_app_to_default',
      desc: '',
      args: [],
    );
  }

  /// `Clear app cache data`
  String get Clear_app_cache_data {
    return Intl.message(
      'Clear app cache data',
      name: 'Clear_app_cache_data',
      desc: '',
      args: [],
    );
  }

  /// `Clear All Data`
  String get Clear_All_Data {
    return Intl.message(
      'Clear All Data',
      name: 'Clear_All_Data',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get Select_Language {
    return Intl.message(
      'Select Language',
      name: 'Select_Language',
      desc: '',
      args: [],
    );
  }

  /// `Logging out...`
  String get Logging_out {
    return Intl.message(
      'Logging out...',
      name: 'Logging_out',
      desc: '',
      args: [],
    );
  }

  /// `No items found`
  String get No_items_found {
    return Intl.message(
      'No items found',
      name: 'No_items_found',
      desc: '',
      args: [],
    );
  }

  /// `Initializing...`
  String get Initializing {
    return Intl.message(
      'Initializing...',
      name: 'Initializing',
      desc: '',
      args: [],
    );
  }

  /// `Load Data`
  String get Load_Data {
    return Intl.message(
      'Load Data',
      name: 'Load_Data',
      desc: '',
      args: [],
    );
  }

  /// `No favorites yet`
  String get No_favorites_yet {
    return Intl.message(
      'No favorites yet',
      name: 'No_favorites_yet',
      desc: '',
      args: [],
    );
  }

  /// `Tap the star icon to add favorites`
  String get Tap_the_star_icon_to_add_favorites {
    return Intl.message(
      'Tap the star icon to add favorites',
      name: 'Tap_the_star_icon_to_add_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get Something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'Something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later`
  String get Please_try_again_later {
    return Intl.message(
      'Please try again later',
      name: 'Please_try_again_later',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Go Back`
  String get goback {
    return Intl.message(
      'Go Back',
      name: 'goback',
      desc: '',
      args: [],
    );
  }

  /// `Added to Stars Lists`
  String get added_to_StarsList {
    return Intl.message(
      'Added to Stars Lists',
      name: 'added_to_StarsList',
      desc: '',
      args: [],
    );
  }

  /// `Removed from Stars List`
  String get removed_from_StarsList {
    return Intl.message(
      'Removed from Stars List',
      name: 'removed_from_StarsList',
      desc: '',
      args: [],
    );
  }

  /// `Loading crypto currencies...`
  String get Loadig_crypto_currencies {
    return Intl.message(
      'Loading crypto currencies...',
      name: 'Loadig_crypto_currencies',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get No_internet_connection {
    return Intl.message(
      'No internet connection',
      name: 'No_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `1`
  String get key1 {
    return Intl.message(
      '1',
      name: 'key1',
      desc: '',
      args: [],
    );
  }

  /// `Error loading market data`
  String get Error_loading_market_data {
    return Intl.message(
      'Error loading market data',
      name: 'Error_loading_market_data',
      desc: '',
      args: [],
    );
  }

  /// `Loading market data...`
  String get loading_market_data {
    return Intl.message(
      'Loading market data...',
      name: 'loading_market_data',
      desc: '',
      args: [],
    );
  }

  /// `24h Change`
  String get change_24h {
    return Intl.message(
      '24h Change',
      name: 'change_24h',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get No_data_available {
    return Intl.message(
      'No data available',
      name: 'No_data_available',
      desc: '',
      args: [],
    );
  }

  /// `Tap to load cryptocurrency data`
  String get Tap_to_load_cryptocurrency_data {
    return Intl.message(
      'Tap to load cryptocurrency data',
      name: 'Tap_to_load_cryptocurrency_data',
      desc: '',
      args: [],
    );
  }

  /// `App Theme`
  String get App_Theme {
    return Intl.message(
      'App Theme',
      name: 'App_Theme',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get Current {
    return Intl.message(
      'Current',
      name: 'Current',
      desc: '',
      args: [],
    );
  }

  /// `Version :1.0.0`
  String get Version {
    return Intl.message(
      'Version :1.0.0',
      name: 'Version',
      desc: '',
      args: [],
    );
  }

  /// `Build :001`
  String get Build {
    return Intl.message(
      'Build :001',
      name: 'Build',
      desc: '',
      args: [],
    );
  }

  /// `Professional green theme`
  String get Default_Desc {
    return Intl.message(
      'Professional green theme',
      name: 'Default_Desc',
      desc: '',
      args: [],
    );
  }

  /// `Classic Bitcoin orange colors`
  String get Bitcoin_Orange_Desc {
    return Intl.message(
      'Classic Bitcoin orange colors',
      name: 'Bitcoin_Orange_Desc',
      desc: '',
      args: [],
    );
  }

  /// `Ethereum-inspired blue theme`
  String get Ethereum_Blue_Desc {
    return Intl.message(
      'Ethereum-inspired blue theme',
      name: 'Ethereum_Blue_Desc',
      desc: '',
      args: [],
    );
  }

  /// `Material design dark theme`
  String get Classic_Dark_Desc {
    return Intl.message(
      'Material design dark theme',
      name: 'Classic_Dark_Desc',
      desc: '',
      args: [],
    );
  }

  /// `Clean and minimal light theme`
  String get Minimal_Light_Desc {
    return Intl.message(
      'Clean and minimal light theme',
      name: 'Minimal_Light_Desc',
      desc: '',
      args: [],
    );
  }

  /// `Modern purple crypto theme`
  String get purple_crypto_Desc {
    return Intl.message(
      'Modern purple crypto theme',
      name: 'purple_crypto_Desc',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Genesis Date`
  String get Genesis_Date {
    return Intl.message(
      'Genesis Date',
      name: 'Genesis_Date',
      desc: '',
      args: [],
    );
  }

  /// `Market Cap Rank`
  String get Market_Cap_Rank {
    return Intl.message(
      'Market Cap Rank',
      name: 'Market_Cap_Rank',
      desc: '',
      args: [],
    );
  }

  /// `Please wait while crypto details are loading...`
  String get Please_wait_while_crypto_details_are_loading {
    return Intl.message(
      'Please wait while crypto details are loading...',
      name: 'Please_wait_while_crypto_details_are_loading',
      desc: '',
      args: [],
    );
  }

  /// `Add to Favorites`
  String get add_to_favorites {
    return Intl.message(
      'Add to Favorites',
      name: 'add_to_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Removed from Favorites`
  String get removed_from_favorites {
    return Intl.message(
      'Removed from Favorites',
      name: 'removed_from_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `key Market Metrics`
  String get key_maket_metrics {
    return Intl.message(
      'key Market Metrics',
      name: 'key_maket_metrics',
      desc: '',
      args: [],
    );
  }

  /// `Homepage URL`
  String get homepage_url {
    return Intl.message(
      'Homepage URL',
      name: 'homepage_url',
      desc: '',
      args: [],
    );
  }

  /// `Key Engagement and Community`
  String get key_engagement_and_community {
    return Intl.message(
      'Key Engagement and Community',
      name: 'key_engagement_and_community',
      desc: '',
      args: [],
    );
  }

  /// `Sentiment Votes Down Percentage`
  String get sentiment_Votes_Down_Percentage {
    return Intl.message(
      'Sentiment Votes Down Percentage',
      name: 'sentiment_Votes_Down_Percentage',
      desc: '',
      args: [],
    );
  }

  /// `Sentiment Votes Up Percentage`
  String get sentiment_Votes_Up_Percentage {
    return Intl.message(
      'Sentiment Votes Up Percentage',
      name: 'sentiment_Votes_Up_Percentage',
      desc: '',
      args: [],
    );
  }

  /// `Watchlist and Categories`
  String get watchlist_and_categories {
    return Intl.message(
      'Watchlist and Categories',
      name: 'watchlist_and_categories',
      desc: '',
      args: [],
    );
  }

  /// `Watchlist Portfolio Users`
  String get watchlist_portfolio_users {
    return Intl.message(
      'Watchlist Portfolio Users',
      name: 'watchlist_portfolio_users',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `No description available`
  String get no_description_available {
    return Intl.message(
      'No description available',
      name: 'no_description_available',
      desc: '',
      args: [],
    );
  }

  /// `Subreddit URL`
  String get subreddit_url {
    return Intl.message(
      'Subreddit URL',
      name: 'subreddit_url',
      desc: '',
      args: [],
    );
  }

  /// `Important Resources`
  String get impotant_resources {
    return Intl.message(
      'Important Resources',
      name: 'impotant_resources',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
