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

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Track Order`
  String get trackOrder {
    return Intl.message('Track Order', name: 'trackOrder', desc: '', args: []);
  }

  /// `Location permission is required`
  String get locationPermissionIsRequired {
    return Intl.message(
      'Location permission is required',
      name: 'locationPermissionIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Error: {stateMessage}`
  String errorStatemessage(Object stateMessage) {
    return Intl.message(
      'Error: $stateMessage',
      name: 'errorStatemessage',
      desc: 'Error message with dynamic content',
      args: [stateMessage],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Street No.`
  String get streetNo {
    return Intl.message('Street No.', name: 'streetNo', desc: '', args: []);
  }

  /// `ZIP Code`
  String get zipCode {
    return Intl.message('ZIP Code', name: 'zipCode', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Label`
  String get label {
    return Intl.message('Label', name: 'label', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Work`
  String get work {
    return Intl.message('Work', name: 'work', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Please fill all required fields`
  String get pleaseFillAllRequiredFields {
    return Intl.message(
      'Please fill all required fields',
      name: 'pleaseFillAllRequiredFields',
      desc: '',
      args: [],
    );
  }

  /// `User not authenticated`
  String get userNotAuthenticated {
    return Intl.message(
      'User not authenticated',
      name: 'userNotAuthenticated',
      desc: '',
      args: [],
    );
  }

  /// `Address added successfully!`
  String get addressAddedSuccessfully {
    return Intl.message(
      'Address added successfully!',
      name: 'addressAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add address: {error}`
  String failedToAddAddressError(Object error) {
    return Intl.message(
      'Failed to add address: $error',
      name: 'failedToAddAddressError',
      desc:
          'Error message when adding an address fails, with dynamic error content',
      args: [error],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Add Address`
  String get addAddress {
    return Intl.message('Add Address', name: 'addAddress', desc: '', args: []);
  }

  /// `Failed to load addresses`
  String get failedToLoadAddresses {
    return Intl.message(
      'Failed to load addresses',
      name: 'failedToLoadAddresses',
      desc: '',
      args: [],
    );
  }

  /// `No saved addresses yet`
  String get noSavedAddressesYet {
    return Intl.message(
      'No saved addresses yet',
      name: 'noSavedAddressesYet',
      desc: '',
      args: [],
    );
  }

  /// `Please sign in to view addresses`
  String get pleaseSignInToViewAddresses {
    return Intl.message(
      'Please sign in to view addresses',
      name: 'pleaseSignInToViewAddresses',
      desc: '',
      args: [],
    );
  }

  /// `DELIVERY ADDRESS`
  String get deliveryAddress2 {
    return Intl.message(
      'DELIVERY ADDRESS',
      name: 'deliveryAddress2',
      desc: '',
      args: [],
    );
  }

  /// `EDIT`
  String get edit2 {
    return Intl.message('EDIT', name: 'edit2', desc: '', args: []);
  }

  /// `Select an address`
  String get selectAnAddress {
    return Intl.message(
      'Select an address',
      name: 'selectAnAddress',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL : `
  String get total2 {
    return Intl.message('TOTAL : ', name: 'total2', desc: '', args: []);
  }

  /// `CHECKOUT`
  String get checkout2 {
    return Intl.message('CHECKOUT', name: 'checkout2', desc: '', args: []);
  }

  /// `Your cart is empty`
  String get yourCartIsEmpty {
    return Intl.message(
      'Your cart is empty',
      name: 'yourCartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `All Categories`
  String get allCategories {
    return Intl.message(
      'All Categories',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }

  /// `Open Restaurants`
  String get openRestaurants {
    return Intl.message(
      'Open Restaurants',
      name: 'openRestaurants',
      desc: '',
      args: [],
    );
  }

  /// `CLEAR`
  String get clear2 {
    return Intl.message('CLEAR', name: 'clear2', desc: '', args: []);
  }

  /// `APPLY`
  String get apply2 {
    return Intl.message('APPLY', name: 'apply2', desc: '', args: []);
  }

  /// `RATING`
  String get rating2 {
    return Intl.message('RATING', name: 'rating2', desc: '', args: []);
  }

  /// `DELIVERY TIME`
  String get deliveryTime2 {
    return Intl.message(
      'DELIVERY TIME',
      name: 'deliveryTime2',
      desc: '',
      args: [],
    );
  }

  /// `Filter your search`
  String get filterYourSearch {
    return Intl.message(
      'Filter your search',
      name: 'filterYourSearch',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Delivery Address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `No address selected`
  String get noAddressSelected {
    return Intl.message(
      'No address selected',
      name: 'noAddressSelected',
      desc: '',
      args: [],
    );
  }

  /// `Order Items`
  String get orderItems {
    return Intl.message('Order Items', name: 'orderItems', desc: '', args: []);
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Delivery Fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Platform Fee`
  String get platformFee {
    return Intl.message(
      'Platform Fee',
      name: 'platformFee',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Order Placed!`
  String get orderPlaced {
    return Intl.message(
      'Order Placed!',
      name: 'orderPlaced',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been placed successfully.\nTrack your order in real-time.`
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime {
    return Intl.message(
      'Your order has been placed successfully.\\nTrack your order in real-time.',
      name: 'yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHome {
    return Intl.message('Back to Home', name: 'backToHome', desc: '', args: []);
  }

  /// `Payment failed: {errorMessage}`
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return Intl.message(
      'Payment failed: $errorMessage',
      name: 'paymentFailedPaymentstateerrormessage',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `Confirm Payment  •  PKR {grandTotal}`
  String confirmPayment(Object grandTotal) {
    return Intl.message(
      'Confirm Payment  •  PKR $grandTotal',
      name: 'confirmPayment',
      desc: 'Button text for confirming payment, with dynamic grand total',
      args: [grandTotal],
    );
  }

  /// `Pays When Order Arrives`
  String get paysWhenOrderArrives {
    return Intl.message(
      'Pays When Order Arrives',
      name: 'paysWhenOrderArrives',
      desc: '',
      args: [],
    );
  }

  /// `No card details`
  String get noCardDetails {
    return Intl.message(
      'No card details',
      name: 'noCardDetails',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faqs {
    return Intl.message('FAQs', name: 'faqs', desc: '', args: []);
  }

  /// `Delivery`
  String get delivery {
    return Intl.message('Delivery', name: 'delivery', desc: '', args: []);
  }

  /// `Payments`
  String get payments {
    return Intl.message('Payments', name: 'payments', desc: '', args: []);
  }

  /// `Order`
  String get order {
    return Intl.message('Order', name: 'order', desc: '', args: []);
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Call`
  String get call {
    return Intl.message('Call', name: 'call', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `No favourite restaurants found.`
  String get noFavouriteRestaurantsFound {
    return Intl.message(
      'No favourite restaurants found.',
      name: 'noFavouriteRestaurantsFound',
      desc: '',
      args: [],
    );
  }

  /// `No favourite foods found.`
  String get noFavouriteFoodsFound {
    return Intl.message(
      'No favourite foods found.',
      name: 'noFavouriteFoodsFound',
      desc: '',
      args: [],
    );
  }

  /// `Foods`
  String get foods {
    return Intl.message('Foods', name: 'foods', desc: '', args: []);
  }

  /// `Restaurants`
  String get restaurants {
    return Intl.message('Restaurants', name: 'restaurants', desc: '', args: []);
  }

  /// `Remove from favourites`
  String get removeFromFavourites {
    return Intl.message(
      'Remove from favourites',
      name: 'removeFromFavourites',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this food item from your favourites?`
  String get areYouSureYouWantToRemoveThisFoodItem {
    return Intl.message(
      'Are you sure you want to remove this food item from your favourites?',
      name: 'areYouSureYouWantToRemoveThisFoodItem',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Remove`
  String get remove {
    return Intl.message('Remove', name: 'remove', desc: '', args: []);
  }

  /// `Order Again`
  String get orderAgain {
    return Intl.message('Order Again', name: 'orderAgain', desc: '', args: []);
  }

  /// `Are you sure you want to remove this restaurant from your favourites?`
  String get areYouSureYouWantToRemoveThisRestaurantFrom {
    return Intl.message(
      'Are you sure you want to remove this restaurant from your favourites?',
      name: 'areYouSureYouWantToRemoveThisRestaurantFrom',
      desc: '',
      args: [],
    );
  }

  /// `Remove from cart`
  String get removeFromCart {
    return Intl.message(
      'Remove from cart',
      name: 'removeFromCart',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message('Add to cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Choose your flavor`
  String get chooseYourFlavor {
    return Intl.message(
      'Choose your flavor',
      name: 'chooseYourFlavor',
      desc: '',
      args: [],
    );
  }

  /// `Choose your size`
  String get chooseYourSize {
    return Intl.message(
      'Choose your size',
      name: 'chooseYourSize',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Link Sent`
  String get passwordResetLinkSent {
    return Intl.message(
      'Password Reset Link Sent',
      name: 'passwordResetLinkSent',
      desc: '',
      args: [],
    );
  }

  /// `Check your email for a password reset link. Click the link to reset your password on our website.`
  String get checkYourEmailForAPasswordResetLink {
    return Intl.message(
      'Check your email for a password reset link. Click the link to reset your password on our website.',
      name: 'checkYourEmailForAPasswordResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully! Please login with your new password.`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password reset successfully! Please login with your new password.',
      name: 'passwordResetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Send Reset Link`
  String get sendResetLink {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address to receive a password reset link.`
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset {
    return Intl.message(
      'Please enter your email address to receive a password reset link.',
      name: 'pleaseEnterYourEmailAddressToReceiveAPasswordReset',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Successfully signed in with Google!`
  String get successfullySignedInWithGoogle {
    return Intl.message(
      'Successfully signed in with Google!',
      name: 'successfullySignedInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Google Sign-In Error: {stateMessage}`
  String googleSigninErrorStatemessage(Object stateMessage) {
    return Intl.message(
      'Google Sign-In Error: $stateMessage',
      name: 'googleSigninErrorStatemessage',
      desc:
          'Error message when Google Sign-In fails, with dynamic state message content',
      args: [stateMessage],
    );
  }

  /// `Don\'t have an account? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\\\'t have an account? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Log In`
  String get logIn {
    return Intl.message('Log In', name: 'logIn', desc: '', args: []);
  }

  /// `Please Sign In to Continue`
  String get pleaseSignInToContinue {
    return Intl.message(
      'Please Sign In to Continue',
      name: 'pleaseSignInToContinue',
      desc: '',
      args: [],
    );
  }

  /// `No notifications yet`
  String get noNotificationsYet {
    return Intl.message(
      'No notifications yet',
      name: 'noNotificationsYet',
      desc: '',
      args: [],
    );
  }

  /// `{unreadCount} unread notifications`
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return Intl.message(
      '$unreadCount unread notifications',
      name: 'stateunreadcountUnreadNotifications',
      desc:
          'Text showing the number of unread notifications, with dynamic unread count',
      args: [unreadCount],
    );
  }

  /// `All ({totalCount})`
  String allNotifications(Object totalCount) {
    return Intl.message(
      'All ($totalCount)',
      name: 'allNotifications',
      desc: 'Tab text for all notifications, with dynamic total count',
      args: [totalCount],
    );
  }

  /// `Unread ({unreadCount})`
  String unreadNotifications(Object unreadCount) {
    return Intl.message(
      'Unread ($unreadCount)',
      name: 'unreadNotifications',
      desc: 'Tab text for unread notifications, with dynamic unread count',
      args: [unreadCount],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Clear All Notifications`
  String get clearAllNotifications {
    return Intl.message(
      'Clear All Notifications',
      name: 'clearAllNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all notifications? This action cannot be undone.`
  String get deleteAllNotificationsConfirmation {
    return Intl.message(
      'Are you sure you want to delete all notifications? This action cannot be undone.',
      name: 'deleteAllNotificationsConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Mark all as read`
  String get markAllAsRead {
    return Intl.message(
      'Mark all as read',
      name: 'markAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Clear all`
  String get clearAll {
    return Intl.message('Clear all', name: 'clearAll', desc: '', args: []);
  }

  /// `All your favorites`
  String get allYourFavorites {
    return Intl.message(
      'All your favorites',
      name: 'allYourFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Get all your loved foods in one once place,you just place the orer we do the rest`
  String get getAllYourLovedFoodsInOnePlace {
    return Intl.message(
      'Get all your loved foods in one once place,you just place the orer we do the rest',
      name: 'getAllYourLovedFoodsInOnePlace',
      desc: '',
      args: [],
    );
  }

  /// `Order from choosen chef`
  String get orderFromChoosenChef {
    return Intl.message(
      'Order from choosen chef',
      name: 'orderFromChoosenChef',
      desc: '',
      args: [],
    );
  }

  /// `Free delivery offers`
  String get freeDeliveryOffers {
    return Intl.message(
      'Free delivery offers',
      name: 'freeDeliveryOffers',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Order cancelled successfully`
  String get orderCancelledSuccessfully {
    return Intl.message(
      'Order cancelled successfully',
      name: 'orderCancelledSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `No ongoing orders`
  String get noOngoingOrders {
    return Intl.message(
      'No ongoing orders',
      name: 'noOngoingOrders',
      desc: '',
      args: [],
    );
  }

  /// `No order history`
  String get noOrderHistory {
    return Intl.message(
      'No order history',
      name: 'noOrderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Order History`
  String get orderHistory {
    return Intl.message(
      'Order History',
      name: 'orderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Clear Order History`
  String get clearOrderHistory {
    return Intl.message(
      'Clear Order History',
      name: 'clearOrderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all order history? This action cannot be undone.`
  String get areYouSureYouWantToDeleteAllOrderHistory {
    return Intl.message(
      'Are you sure you want to delete all order history? This action cannot be undone.',
      name: 'areYouSureYouWantToDeleteAllOrderHistory',
      desc: '',
      args: [],
    );
  }

  /// `No completed orders yet`
  String get noCompletedOrdersYet {
    return Intl.message(
      'No completed orders yet',
      name: 'noCompletedOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message('Rate', name: 'rate', desc: '', args: []);
  }

  /// `Cancel Order`
  String get cancelOrder {
    return Intl.message(
      'Cancel Order',
      name: 'cancelOrder',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this order?`
  String get areYouSureYouWantToCancelThisOrder {
    return Intl.message(
      'Are you sure you want to cancel this order?',
      name: 'areYouSureYouWantToCancelThisOrder',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Cancel`
  String get yesCancel {
    return Intl.message('Yes, Cancel', name: 'yesCancel', desc: '', args: []);
  }

  /// `Reorder`
  String get reorder {
    return Intl.message('Reorder', name: 'reorder', desc: '', args: []);
  }

  /// `Card Information`
  String get cardInformation {
    return Intl.message(
      'Card Information',
      name: 'cardInformation',
      desc: '',
      args: [],
    );
  }

  /// `Card number is required`
  String get cardNumberIsRequired {
    return Intl.message(
      'Card number is required',
      name: 'cardNumberIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Card number is too short`
  String get cardNumberIsTooShort {
    return Intl.message(
      'Card number is too short',
      name: 'cardNumberIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message('Required', name: 'required', desc: '', args: []);
  }

  /// `Invalid month`
  String get invalidMonth {
    return Intl.message(
      'Invalid month',
      name: 'invalidMonth',
      desc: '',
      args: [],
    );
  }

  /// `Invalid CVC`
  String get invalidCvc {
    return Intl.message('Invalid CVC', name: 'invalidCvc', desc: '', args: []);
  }

  /// `CVC`
  String get cvc {
    return Intl.message('CVC', name: 'cvc', desc: '', args: []);
  }

  /// `Card Holder`
  String get cardHolder {
    return Intl.message('Card Holder', name: 'cardHolder', desc: '', args: []);
  }

  /// `Full name on card`
  String get fullNameOnCard {
    return Intl.message(
      'Full name on card',
      name: 'fullNameOnCard',
      desc: '',
      args: [],
    );
  }

  /// `Your card details are securely handled by Stripe. We never store your full card number.`
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever {
    return Intl.message(
      'Your card details are securely handled by Stripe. We never store your full card number.',
      name: 'yourCardDetailsAreSecurelyHandledByStripeWeNever',
      desc: '',
      args: [],
    );
  }

  /// `Adding...`
  String get adding {
    return Intl.message('Adding...', name: 'adding', desc: '', args: []);
  }

  /// `Add Card`
  String get addCard {
    return Intl.message('Add Card', name: 'addCard', desc: '', args: []);
  }

  /// `Select Payment Method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select Payment Method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Pay when your order arrives`
  String get payWhenYourOrderArrives {
    return Intl.message(
      'Pay when your order arrives',
      name: 'payWhenYourOrderArrives',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery selected`
  String get cashOnDeliverySelected {
    return Intl.message(
      'Cash on Delivery selected',
      name: 'cashOnDeliverySelected',
      desc: '',
      args: [],
    );
  }

  /// `Visa`
  String get visa {
    return Intl.message('Visa', name: 'visa', desc: '', args: []);
  }

  /// `Select from your saved Visa cards`
  String get selectFromYourSavedVisaCards {
    return Intl.message(
      'Select from your saved Visa cards',
      name: 'selectFromYourSavedVisaCards',
      desc: '',
      args: [],
    );
  }

  /// `Mastercard`
  String get mastercard {
    return Intl.message('Mastercard', name: 'mastercard', desc: '', args: []);
  }

  /// `Select from your saved Mastercards`
  String get selectFromYourSavedMastercards {
    return Intl.message(
      'Select from your saved Mastercards',
      name: 'selectFromYourSavedMastercards',
      desc: '',
      args: [],
    );
  }

  /// `Saved Cards`
  String get savedCards {
    return Intl.message('Saved Cards', name: 'savedCards', desc: '', args: []);
  }

  /// `Credit card added successfully`
  String get creditCardAddedSuccessfully {
    return Intl.message(
      'Credit card added successfully',
      name: 'creditCardAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Credit card deleted successfully`
  String get creditCardDeletedSuccessfully {
    return Intl.message(
      'Credit card deleted successfully',
      name: 'creditCardDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load cards`
  String get failedToLoadCards {
    return Intl.message(
      'Failed to load cards',
      name: 'failedToLoadCards',
      desc: '',
      args: [],
    );
  }

  /// `No saved cards yet`
  String get noSavedCardsYet {
    return Intl.message(
      'No saved cards yet',
      name: 'noSavedCardsYet',
      desc: '',
      args: [],
    );
  }

  /// `Add a card below to get started`
  String get addACardBelowToGetStarted {
    return Intl.message(
      'Add a card below to get started',
      name: 'addACardBelowToGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Card ending in {last4} selected`
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return Intl.message(
      'Card ending in $last4 selected',
      name: 'cardEndingInCreditcardlast4Selected',
      desc:
          'Message shown when a card is selected, with dynamic last 4 digits of the card',
      args: [last4],
    );
  }

  /// `Add New Card`
  String get addNewCard {
    return Intl.message('Add New Card', name: 'addNewCard', desc: '', args: []);
  }

  /// `Personal Info`
  String get personalInfo {
    return Intl.message(
      'Personal Info',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Guest User`
  String get guestUser {
    return Intl.message('Guest User', name: 'guestUser', desc: '', args: []);
  }

  /// `Please login to view your profile`
  String get pleaseLoginToViewYourProfile {
    return Intl.message(
      'Please login to view your profile',
      name: 'pleaseLoginToViewYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Edit {title}`
  String editTitle(Object title) {
    return Intl.message(
      'Edit $title',
      name: 'editTitle',
      desc: 'Title for edit profile modal, with dynamic field title',
      args: [title],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `SignUp`
  String get signup {
    return Intl.message('SignUp', name: 'signup', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `All Restaurants`
  String get allRestaurants {
    return Intl.message(
      'All Restaurants',
      name: 'allRestaurants',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load food items. Please try again later.`
  String get failedToLoadFoodItemsPleaseTryAgainLater {
    return Intl.message(
      'Failed to load food items. Please try again later.',
      name: 'failedToLoadFoodItemsPleaseTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `No food items available for this category.`
  String get noFoodItemsAvailableForThisCategory {
    return Intl.message(
      'No food items available for this category.',
      name: 'noFoodItemsAvailableForThisCategory',
      desc: '',
      args: [],
    );
  }

  /// `My Reviews`
  String get myReviews {
    return Intl.message('My Reviews', name: 'myReviews', desc: '', args: []);
  }

  /// `Popular Restaurants`
  String get popularRestaurants {
    return Intl.message(
      'Popular Restaurants',
      name: 'popularRestaurants',
      desc: '',
      args: [],
    );
  }

  /// `No popular restaurants found`
  String get noPopularRestaurantsFound {
    return Intl.message(
      'No popular restaurants found',
      name: 'noPopularRestaurantsFound',
      desc: '',
      args: [],
    );
  }

  /// `Recent Keywords`
  String get recentKeywords {
    return Intl.message(
      'Recent Keywords',
      name: 'recentKeywords',
      desc: '',
      args: [],
    );
  }

  /// `Added "{search}" to recent searches`
  String addedStatesearchToRecentSearches(Object search) {
    return Intl.message(
      'Added "$search" to recent searches',
      name: 'addedStatesearchToRecentSearches',
      desc:
          'Message shown when a search keyword is added to recent searches, with dynamic search keyword',
      args: [search],
    );
  }

  /// `Removed "{search}" from recent searches`
  String removedStatesearchFromRecentSearches(Object search) {
    return Intl.message(
      'Removed "$search" from recent searches',
      name: 'removedStatesearchFromRecentSearches',
      desc:
          'Message shown when a search keyword is removed from recent searches, with dynamic search keyword',
      args: [search],
    );
  }

  /// `No recent searches`
  String get noRecentSearches {
    return Intl.message(
      'No recent searches',
      name: 'noRecentSearches',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `PREFERENCES`
  String get preferences2 {
    return Intl.message(
      'PREFERENCES',
      name: 'preferences2',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Themes`
  String get themes {
    return Intl.message('Themes', name: 'themes', desc: '', args: []);
  }

  /// `Version info not available`
  String get versionInfoNotAvailable {
    return Intl.message(
      'Version info not available',
      name: 'versionInfoNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Sign Up to get started`
  String get pleaseSignUpToGetStarted {
    return Intl.message(
      'Please Sign Up to get started',
      name: 'pleaseSignUpToGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `No active order`
  String get noActiveOrder {
    return Intl.message(
      'No active order',
      name: 'noActiveOrder',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been delivered!`
  String get yourOrderHasBeenDelivered {
    return Intl.message(
      'Your order has been delivered!',
      name: 'yourOrderHasBeenDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Calling {phoneNumber}...`
  String callingphonenumber(Object phoneNumber) {
    return Intl.message(
      'Calling $phoneNumber...',
      name: 'callingphonenumber',
      desc:
          'Message shown when calling the delivery person, with dynamic phone number',
      args: [phoneNumber],
    );
  }

  /// `Location permission denied`
  String get locationPermissionDenied {
    return Intl.message(
      'Location permission denied',
      name: 'locationPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Courier`
  String get courier {
    return Intl.message('Courier', name: 'courier', desc: '', args: []);
  }

  /// `ESTIMATED DELIVERY TIME`
  String get estimatedDeliveryTime2 {
    return Intl.message(
      'ESTIMATED DELIVERY TIME',
      name: 'estimatedDeliveryTime2',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been received`
  String get yourOrderHasBeenReceived {
    return Intl.message(
      'Your order has been received',
      name: 'yourOrderHasBeenReceived',
      desc: '',
      args: [],
    );
  }

  /// `The restaurant is preparing your food`
  String get theRestaurantIsPreparingYourFood {
    return Intl.message(
      'The restaurant is preparing your food',
      name: 'theRestaurantIsPreparingYourFood',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been picked up for delivery`
  String get yourOrderHasBeenPickedUpForDelivery {
    return Intl.message(
      'Your order has been picked up for delivery',
      name: 'yourOrderHasBeenPickedUpForDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Order arriving soon!`
  String get orderArrivingSoon {
    return Intl.message(
      'Order arriving soon!',
      name: 'orderArrivingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Select Delivery Address`
  String get selectDeliveryAddress {
    return Intl.message(
      'Select Delivery Address',
      name: 'selectDeliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `No addresses found`
  String get noAddressesFound {
    return Intl.message(
      'No addresses found',
      name: 'noAddressesFound',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid address`
  String get pleaseEnterAValidAddress {
    return Intl.message(
      'Please enter a valid address',
      name: 'pleaseEnterAValidAddress',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Search for restaurants or dishes`
  String get searchForRestaurantsOrDishes {
    return Intl.message(
      'Search for restaurants or dishes',
      name: 'searchForRestaurantsOrDishes',
      desc: '',
      args: [],
    );
  }

  /// `No restaurants found`
  String get noRestaurantsFound {
    return Intl.message(
      'No restaurants found',
      name: 'noRestaurantsFound',
      desc: '',
      args: [],
    );
  }

  /// `Update Dialog`
  String get updateDialog {
    return Intl.message(
      'Update Dialog',
      name: 'updateDialog',
      desc: '',
      args: [],
    );
  }

  /// `Update Available`
  String get updateAvailable {
    return Intl.message(
      'Update Available',
      name: 'updateAvailable',
      desc: '',
      args: [],
    );
  }

  /// `A new version of Bite is ready!`
  String get aNewVersionOfBiteIsReady {
    return Intl.message(
      'A new version of Bite is ready!',
      name: 'aNewVersionOfBiteIsReady',
      desc: '',
      args: [],
    );
  }

  /// `Version latestVersion includes new features, `
  String get versionLatestversionIncludesNewFeatures {
    return Intl.message(
      'Version latestVersion includes new features, ',
      name: 'versionLatestversionIncludesNewFeatures',
      desc: '',
      args: [],
    );
  }

  /// `performance improvements, and bug fixes.`
  String get performanceImprovementsAndBugFixes {
    return Intl.message(
      'performance improvements, and bug fixes.',
      name: 'performanceImprovementsAndBugFixes',
      desc: '',
      args: [],
    );
  }

  /// `Update Now`
  String get updateNow {
    return Intl.message('Update Now', name: 'updateNow', desc: '', args: []);
  }

  /// `Maybe Later`
  String get maybeLater {
    return Intl.message('Maybe Later', name: 'maybeLater', desc: '', args: []);
  }

  /// `Please enter {title}`
  String pleaseEnterWidgettitletolowercase(Object title) {
    return Intl.message(
      'Please enter $title',
      name: 'pleaseEnterWidgettitletolowercase',
      desc:
          'Validation error message for required fields, with dynamic field title',
      args: [title],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEnterAValidEmailAddress {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEnterAValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get pleaseEnterAValidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'pleaseEnterAValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get passwordMustBeAtLeast8CharactersLong {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'passwordMustBeAtLeast8CharactersLong',
      desc: '',
      args: [],
    );
  }

  /// `How do I track my order?`
  String get howDoITrackMyOrder {
    return Intl.message(
      'How do I track my order?',
      name: 'howDoITrackMyOrder',
      desc: '',
      args: [],
    );
  }

  /// `Can I cancel my order?`
  String get canICancelMyOrder {
    return Intl.message(
      'Can I cancel my order?',
      name: 'canICancelMyOrder',
      desc: '',
      args: [],
    );
  }

  /// `What if my order is delayed?`
  String get whatIfMyOrderIsDelayed {
    return Intl.message(
      'What if my order is delayed?',
      name: 'whatIfMyOrderIsDelayed',
      desc: '',
      args: [],
    );
  }

  /// `What payment methods are accepted?`
  String get whatPaymentMethodsAreAccepted {
    return Intl.message(
      'What payment methods are accepted?',
      name: 'whatPaymentMethodsAreAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Is it safe to use my credit/debit card on Bite?`
  String get isItSafeToUseMyCreditdebitCardOnBite {
    return Intl.message(
      'Is it safe to use my credit/debit card on Bite?',
      name: 'isItSafeToUseMyCreditdebitCardOnBite',
      desc: '',
      args: [],
    );
  }

  /// `Can I use multiple payment methods for one order?`
  String get canIUseMultiplePaymentMethodsForOneOrder {
    return Intl.message(
      'Can I use multiple payment methods for one order?',
      name: 'canIUseMultiplePaymentMethodsForOneOrder',
      desc: '',
      args: [],
    );
  }

  /// `What should I do if a payment fails?`
  String get whatShouldIDoIfAPaymentFails {
    return Intl.message(
      'What should I do if a payment fails?',
      name: 'whatShouldIDoIfAPaymentFails',
      desc: '',
      args: [],
    );
  }

  /// `What are your delivery hours?`
  String get whatAreYourDeliveryHours {
    return Intl.message(
      'What are your delivery hours?',
      name: 'whatAreYourDeliveryHours',
      desc: '',
      args: [],
    );
  }

  /// `Do you charge a delivery fee?`
  String get doYouChargeADeliveryFee {
    return Intl.message(
      'Do you charge a delivery fee?',
      name: 'doYouChargeADeliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Do you deliver to my location?`
  String get doYouDeliverToMyLocation {
    return Intl.message(
      'Do you deliver to my location?',
      name: 'doYouDeliverToMyLocation',
      desc: '',
      args: [],
    );
  }

  /// `Can I schedule a delivery for a later time?`
  String get canIScheduleADeliveryForALaterTime {
    return Intl.message(
      'Can I schedule a delivery for a later time?',
      name: 'canIScheduleADeliveryForALaterTime',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing`
  String get ongoing {
    return Intl.message('Ongoing', name: 'ongoing', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Address updated successfully`
  String get addressUpdatedSuccessfully {
    return Intl.message(
      'Address updated successfully',
      name: 'addressUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update address: {error}`
  String failedToUpdateAddress(Object error) {
    return Intl.message(
      'Failed to update address: $error',
      name: 'failedToUpdateAddress',
      desc:
          'Error message when updating an address fails, with dynamic error content',
      args: [error],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'ur'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
