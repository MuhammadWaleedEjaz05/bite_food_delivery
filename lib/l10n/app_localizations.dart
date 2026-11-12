import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('tr'),
    Locale('ur'),
  ];

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

  /// No description provided for @locationPermissionIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Location permission is required'**
  String get locationPermissionIsRequired;

  /// Error message with dynamic content
  ///
  /// In en, this message translates to:
  /// **'Error: {stateMessage}'**
  String errorStatemessage(Object stateMessage);

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @streetNo.
  ///
  /// In en, this message translates to:
  /// **'Street No.'**
  String get streetNo;

  /// No description provided for @zipCode.
  ///
  /// In en, this message translates to:
  /// **'ZIP Code'**
  String get zipCode;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @label.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get label;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @pleaseFillAllRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all required fields'**
  String get pleaseFillAllRequiredFields;

  /// No description provided for @userNotAuthenticated.
  ///
  /// In en, this message translates to:
  /// **'User not authenticated'**
  String get userNotAuthenticated;

  /// No description provided for @addressAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address added successfully!'**
  String get addressAddedSuccessfully;

  /// Error message when adding an address fails, with dynamic error content
  ///
  /// In en, this message translates to:
  /// **'Failed to add address: {error}'**
  String failedToAddAddressError(Object error);

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @addAddress.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get addAddress;

  /// No description provided for @failedToLoadAddresses.
  ///
  /// In en, this message translates to:
  /// **'Failed to load addresses'**
  String get failedToLoadAddresses;

  /// No description provided for @noSavedAddressesYet.
  ///
  /// In en, this message translates to:
  /// **'No saved addresses yet'**
  String get noSavedAddressesYet;

  /// No description provided for @pleaseSignInToViewAddresses.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to view addresses'**
  String get pleaseSignInToViewAddresses;

  /// No description provided for @deliveryAddress2.
  ///
  /// In en, this message translates to:
  /// **'DELIVERY ADDRESS'**
  String get deliveryAddress2;

  /// No description provided for @edit2.
  ///
  /// In en, this message translates to:
  /// **'EDIT'**
  String get edit2;

  /// No description provided for @selectAnAddress.
  ///
  /// In en, this message translates to:
  /// **'Select an address'**
  String get selectAnAddress;

  /// No description provided for @total2.
  ///
  /// In en, this message translates to:
  /// **'TOTAL : '**
  String get total2;

  /// No description provided for @checkout2.
  ///
  /// In en, this message translates to:
  /// **'CHECKOUT'**
  String get checkout2;

  /// No description provided for @yourCartIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get yourCartIsEmpty;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get allCategories;

  /// No description provided for @openRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Open Restaurants'**
  String get openRestaurants;

  /// No description provided for @clear2.
  ///
  /// In en, this message translates to:
  /// **'CLEAR'**
  String get clear2;

  /// No description provided for @apply2.
  ///
  /// In en, this message translates to:
  /// **'APPLY'**
  String get apply2;

  /// No description provided for @rating2.
  ///
  /// In en, this message translates to:
  /// **'RATING'**
  String get rating2;

  /// No description provided for @deliveryTime2.
  ///
  /// In en, this message translates to:
  /// **'DELIVERY TIME'**
  String get deliveryTime2;

  /// No description provided for @filterYourSearch.
  ///
  /// In en, this message translates to:
  /// **'Filter your search'**
  String get filterYourSearch;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAddress;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @noAddressSelected.
  ///
  /// In en, this message translates to:
  /// **'No address selected'**
  String get noAddressSelected;

  /// No description provided for @orderItems.
  ///
  /// In en, this message translates to:
  /// **'Order Items'**
  String get orderItems;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @deliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get deliveryFee;

  /// No description provided for @platformFee.
  ///
  /// In en, this message translates to:
  /// **'Platform Fee'**
  String get platformFee;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @orderPlaced.
  ///
  /// In en, this message translates to:
  /// **'Order Placed!'**
  String get orderPlaced;

  /// No description provided for @yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime.
  ///
  /// In en, this message translates to:
  /// **'Your order has been placed successfully.\\nTrack your order in real-time.'**
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  ///
  ///
  /// In en, this message translates to:
  /// **'Payment failed: {errorMessage}'**
  String paymentFailedPaymentstateerrormessage(Object errorMessage);

  /// Button text for confirming payment, with dynamic grand total
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment  •  PKR {grandTotal}'**
  String confirmPayment(Object grandTotal);

  /// No description provided for @paysWhenOrderArrives.
  ///
  /// In en, this message translates to:
  /// **'Pays When Order Arrives'**
  String get paysWhenOrderArrives;

  /// No description provided for @noCardDetails.
  ///
  /// In en, this message translates to:
  /// **'No card details'**
  String get noCardDetails;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @noFavouriteRestaurantsFound.
  ///
  /// In en, this message translates to:
  /// **'No favourite restaurants found.'**
  String get noFavouriteRestaurantsFound;

  /// No description provided for @noFavouriteFoodsFound.
  ///
  /// In en, this message translates to:
  /// **'No favourite foods found.'**
  String get noFavouriteFoodsFound;

  /// No description provided for @foods.
  ///
  /// In en, this message translates to:
  /// **'Foods'**
  String get foods;

  /// No description provided for @restaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// No description provided for @removeFromFavourites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favourites'**
  String get removeFromFavourites;

  /// No description provided for @areYouSureYouWantToRemoveThisFoodItem.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this food item from your favourites?'**
  String get areYouSureYouWantToRemoveThisFoodItem;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @orderAgain.
  ///
  /// In en, this message translates to:
  /// **'Order Again'**
  String get orderAgain;

  /// No description provided for @areYouSureYouWantToRemoveThisRestaurantFrom.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this restaurant from your favourites?'**
  String get areYouSureYouWantToRemoveThisRestaurantFrom;

  /// No description provided for @removeFromCart.
  ///
  /// In en, this message translates to:
  /// **'Remove from cart'**
  String get removeFromCart;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addToCart;

  /// No description provided for @chooseYourFlavor.
  ///
  /// In en, this message translates to:
  /// **'Choose your flavor'**
  String get chooseYourFlavor;

  /// No description provided for @chooseYourSize.
  ///
  /// In en, this message translates to:
  /// **'Choose your size'**
  String get chooseYourSize;

  /// No description provided for @passwordResetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Password Reset Link Sent'**
  String get passwordResetLinkSent;

  /// No description provided for @checkYourEmailForAPasswordResetLink.
  ///
  /// In en, this message translates to:
  /// **'Check your email for a password reset link. Click the link to reset your password on our website.'**
  String get checkYourEmailForAPasswordResetLink;

  /// No description provided for @passwordResetSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully! Please login with your new password.'**
  String get passwordResetSuccessfully;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @pleaseEnterYourEmailAddressToReceiveAPasswordReset.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address to receive a password reset link.'**
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @successfullySignedInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Successfully signed in with Google!'**
  String get successfullySignedInWithGoogle;

  /// Error message when Google Sign-In fails, with dynamic state message content
  ///
  /// In en, this message translates to:
  /// **'Google Sign-In Error: {stateMessage}'**
  String googleSigninErrorStatemessage(Object stateMessage);

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\\\'t have an account? '**
  String get dontHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// No description provided for @pleaseSignInToContinue.
  ///
  /// In en, this message translates to:
  /// **'Please Sign In to Continue'**
  String get pleaseSignInToContinue;

  /// No description provided for @noNotificationsYet.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get noNotificationsYet;

  /// Text showing the number of unread notifications, with dynamic unread count
  ///
  /// In en, this message translates to:
  /// **'{unreadCount} unread notifications'**
  String stateunreadcountUnreadNotifications(Object unreadCount);

  /// Tab text for all notifications, with dynamic total count
  ///
  /// In en, this message translates to:
  /// **'All ({totalCount})'**
  String allNotifications(Object totalCount);

  /// Tab text for unread notifications, with dynamic unread count
  ///
  /// In en, this message translates to:
  /// **'Unread ({unreadCount})'**
  String unreadNotifications(Object unreadCount);

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @clearAllNotifications.
  ///
  /// In en, this message translates to:
  /// **'Clear All Notifications'**
  String get clearAllNotifications;

  /// No description provided for @deleteAllNotificationsConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all notifications? This action cannot be undone.'**
  String get deleteAllNotificationsConfirmation;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get markAllAsRead;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// No description provided for @allYourFavorites.
  ///
  /// In en, this message translates to:
  /// **'All your favorites'**
  String get allYourFavorites;

  /// No description provided for @getAllYourLovedFoodsInOnePlace.
  ///
  /// In en, this message translates to:
  /// **'Get all your loved foods in one once place,you just place the orer we do the rest'**
  String get getAllYourLovedFoodsInOnePlace;

  /// No description provided for @orderFromChoosenChef.
  ///
  /// In en, this message translates to:
  /// **'Order from choosen chef'**
  String get orderFromChoosenChef;

  /// No description provided for @freeDeliveryOffers.
  ///
  /// In en, this message translates to:
  /// **'Free delivery offers'**
  String get freeDeliveryOffers;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @orderCancelledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Order cancelled successfully'**
  String get orderCancelledSuccessfully;

  /// No description provided for @noOngoingOrders.
  ///
  /// In en, this message translates to:
  /// **'No ongoing orders'**
  String get noOngoingOrders;

  /// No description provided for @noOrderHistory.
  ///
  /// In en, this message translates to:
  /// **'No order history'**
  String get noOrderHistory;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @clearOrderHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear Order History'**
  String get clearOrderHistory;

  /// No description provided for @areYouSureYouWantToDeleteAllOrderHistory.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all order history? This action cannot be undone.'**
  String get areYouSureYouWantToDeleteAllOrderHistory;

  /// No description provided for @noCompletedOrdersYet.
  ///
  /// In en, this message translates to:
  /// **'No completed orders yet'**
  String get noCompletedOrdersYet;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancelOrder;

  /// No description provided for @areYouSureYouWantToCancelThisOrder.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this order?'**
  String get areYouSureYouWantToCancelThisOrder;

  /// No description provided for @yesCancel.
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get yesCancel;

  /// No description provided for @reorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorder;

  /// No description provided for @cardInformation.
  ///
  /// In en, this message translates to:
  /// **'Card Information'**
  String get cardInformation;

  /// No description provided for @cardNumberIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Card number is required'**
  String get cardNumberIsRequired;

  /// No description provided for @cardNumberIsTooShort.
  ///
  /// In en, this message translates to:
  /// **'Card number is too short'**
  String get cardNumberIsTooShort;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @invalidMonth.
  ///
  /// In en, this message translates to:
  /// **'Invalid month'**
  String get invalidMonth;

  /// No description provided for @invalidCvc.
  ///
  /// In en, this message translates to:
  /// **'Invalid CVC'**
  String get invalidCvc;

  /// No description provided for @cvc.
  ///
  /// In en, this message translates to:
  /// **'CVC'**
  String get cvc;

  /// No description provided for @cardHolder.
  ///
  /// In en, this message translates to:
  /// **'Card Holder'**
  String get cardHolder;

  /// No description provided for @fullNameOnCard.
  ///
  /// In en, this message translates to:
  /// **'Full name on card'**
  String get fullNameOnCard;

  /// No description provided for @yourCardDetailsAreSecurelyHandledByStripeWeNever.
  ///
  /// In en, this message translates to:
  /// **'Your card details are securely handled by Stripe. We never store your full card number.'**
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever;

  /// No description provided for @adding.
  ///
  /// In en, this message translates to:
  /// **'Adding...'**
  String get adding;

  /// No description provided for @addCard.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get addCard;

  /// No description provided for @selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get selectPaymentMethod;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cashOnDelivery;

  /// No description provided for @payWhenYourOrderArrives.
  ///
  /// In en, this message translates to:
  /// **'Pay when your order arrives'**
  String get payWhenYourOrderArrives;

  /// No description provided for @cashOnDeliverySelected.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery selected'**
  String get cashOnDeliverySelected;

  /// No description provided for @visa.
  ///
  /// In en, this message translates to:
  /// **'Visa'**
  String get visa;

  /// No description provided for @selectFromYourSavedVisaCards.
  ///
  /// In en, this message translates to:
  /// **'Select from your saved Visa cards'**
  String get selectFromYourSavedVisaCards;

  /// No description provided for @mastercard.
  ///
  /// In en, this message translates to:
  /// **'Mastercard'**
  String get mastercard;

  /// No description provided for @selectFromYourSavedMastercards.
  ///
  /// In en, this message translates to:
  /// **'Select from your saved Mastercards'**
  String get selectFromYourSavedMastercards;

  /// No description provided for @savedCards.
  ///
  /// In en, this message translates to:
  /// **'Saved Cards'**
  String get savedCards;

  /// No description provided for @creditCardAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Credit card added successfully'**
  String get creditCardAddedSuccessfully;

  /// No description provided for @creditCardDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Credit card deleted successfully'**
  String get creditCardDeletedSuccessfully;

  /// No description provided for @failedToLoadCards.
  ///
  /// In en, this message translates to:
  /// **'Failed to load cards'**
  String get failedToLoadCards;

  /// No description provided for @noSavedCardsYet.
  ///
  /// In en, this message translates to:
  /// **'No saved cards yet'**
  String get noSavedCardsYet;

  /// No description provided for @addACardBelowToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Add a card below to get started'**
  String get addACardBelowToGetStarted;

  /// Message shown when a card is selected, with dynamic last 4 digits of the card
  ///
  /// In en, this message translates to:
  /// **'Card ending in {last4} selected'**
  String cardEndingInCreditcardlast4Selected(Object last4);

  /// No description provided for @addNewCard.
  ///
  /// In en, this message translates to:
  /// **'Add New Card'**
  String get addNewCard;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @guestUser.
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get guestUser;

  /// No description provided for @pleaseLoginToViewYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Please login to view your profile'**
  String get pleaseLoginToViewYourProfile;

  /// Title for edit profile modal, with dynamic field title
  ///
  /// In en, this message translates to:
  /// **'Edit {title}'**
  String editTitle(Object title);

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'SignUp'**
  String get signup;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @allRestaurants.
  ///
  /// In en, this message translates to:
  /// **'All Restaurants'**
  String get allRestaurants;

  /// No description provided for @failedToLoadFoodItemsPleaseTryAgainLater.
  ///
  /// In en, this message translates to:
  /// **'Failed to load food items. Please try again later.'**
  String get failedToLoadFoodItemsPleaseTryAgainLater;

  /// No description provided for @noFoodItemsAvailableForThisCategory.
  ///
  /// In en, this message translates to:
  /// **'No food items available for this category.'**
  String get noFoodItemsAvailableForThisCategory;

  /// No description provided for @myReviews.
  ///
  /// In en, this message translates to:
  /// **'My Reviews'**
  String get myReviews;

  /// No description provided for @popularRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Popular Restaurants'**
  String get popularRestaurants;

  /// No description provided for @noPopularRestaurantsFound.
  ///
  /// In en, this message translates to:
  /// **'No popular restaurants found'**
  String get noPopularRestaurantsFound;

  /// No description provided for @recentKeywords.
  ///
  /// In en, this message translates to:
  /// **'Recent Keywords'**
  String get recentKeywords;

  /// Message shown when a search keyword is added to recent searches, with dynamic search keyword
  ///
  /// In en, this message translates to:
  /// **'Added \"{search}\" to recent searches'**
  String addedStatesearchToRecentSearches(Object search);

  /// Message shown when a search keyword is removed from recent searches, with dynamic search keyword
  ///
  /// In en, this message translates to:
  /// **'Removed \"{search}\" from recent searches'**
  String removedStatesearchFromRecentSearches(Object search);

  /// No description provided for @noRecentSearches.
  ///
  /// In en, this message translates to:
  /// **'No recent searches'**
  String get noRecentSearches;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @preferences2.
  ///
  /// In en, this message translates to:
  /// **'PREFERENCES'**
  String get preferences2;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @themes.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get themes;

  /// No description provided for @versionInfoNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Version info not available'**
  String get versionInfoNotAvailable;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @pleaseSignUpToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Please Sign Up to get started'**
  String get pleaseSignUpToGetStarted;

  /// No description provided for @noActiveOrder.
  ///
  /// In en, this message translates to:
  /// **'No active order'**
  String get noActiveOrder;

  /// No description provided for @yourOrderHasBeenDelivered.
  ///
  /// In en, this message translates to:
  /// **'Your order has been delivered!'**
  String get yourOrderHasBeenDelivered;

  /// Message shown when calling the delivery person, with dynamic phone number
  ///
  /// In en, this message translates to:
  /// **'Calling {phoneNumber}...'**
  String callingphonenumber(Object phoneNumber);

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get locationPermissionDenied;

  /// No description provided for @courier.
  ///
  /// In en, this message translates to:
  /// **'Courier'**
  String get courier;

  /// No description provided for @estimatedDeliveryTime2.
  ///
  /// In en, this message translates to:
  /// **'ESTIMATED DELIVERY TIME'**
  String get estimatedDeliveryTime2;

  /// No description provided for @yourOrderHasBeenReceived.
  ///
  /// In en, this message translates to:
  /// **'Your order has been received'**
  String get yourOrderHasBeenReceived;

  /// No description provided for @theRestaurantIsPreparingYourFood.
  ///
  /// In en, this message translates to:
  /// **'The restaurant is preparing your food'**
  String get theRestaurantIsPreparingYourFood;

  /// No description provided for @yourOrderHasBeenPickedUpForDelivery.
  ///
  /// In en, this message translates to:
  /// **'Your order has been picked up for delivery'**
  String get yourOrderHasBeenPickedUpForDelivery;

  /// No description provided for @orderArrivingSoon.
  ///
  /// In en, this message translates to:
  /// **'Order arriving soon!'**
  String get orderArrivingSoon;

  /// No description provided for @selectDeliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Select Delivery Address'**
  String get selectDeliveryAddress;

  /// No description provided for @noAddressesFound.
  ///
  /// In en, this message translates to:
  /// **'No addresses found'**
  String get noAddressesFound;

  /// No description provided for @pleaseEnterAValidAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid address'**
  String get pleaseEnterAValidAddress;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @searchForRestaurantsOrDishes.
  ///
  /// In en, this message translates to:
  /// **'Search for restaurants or dishes'**
  String get searchForRestaurantsOrDishes;

  /// No description provided for @noRestaurantsFound.
  ///
  /// In en, this message translates to:
  /// **'No restaurants found'**
  String get noRestaurantsFound;

  /// No description provided for @updateDialog.
  ///
  /// In en, this message translates to:
  /// **'Update Dialog'**
  String get updateDialog;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailable;

  /// No description provided for @aNewVersionOfBiteIsReady.
  ///
  /// In en, this message translates to:
  /// **'A new version of Bite is ready!'**
  String get aNewVersionOfBiteIsReady;

  /// No description provided for @versionLatestversionIncludesNewFeatures.
  ///
  /// In en, this message translates to:
  /// **'Version latestVersion includes new features, '**
  String get versionLatestversionIncludesNewFeatures;

  /// No description provided for @performanceImprovementsAndBugFixes.
  ///
  /// In en, this message translates to:
  /// **'performance improvements, and bug fixes.'**
  String get performanceImprovementsAndBugFixes;

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNow;

  /// No description provided for @maybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get maybeLater;

  /// Validation error message for required fields, with dynamic field title
  ///
  /// In en, this message translates to:
  /// **'Please enter {title}'**
  String pleaseEnterWidgettitletolowercase(Object title);

  /// No description provided for @pleaseEnterAValidEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get pleaseEnterAValidEmailAddress;

  /// No description provided for @pleaseEnterAValidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get pleaseEnterAValidPhoneNumber;

  /// No description provided for @passwordMustBeAtLeast8CharactersLong.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long'**
  String get passwordMustBeAtLeast8CharactersLong;

  /// No description provided for @howDoITrackMyOrder.
  ///
  /// In en, this message translates to:
  /// **'How do I track my order?'**
  String get howDoITrackMyOrder;

  /// No description provided for @canICancelMyOrder.
  ///
  /// In en, this message translates to:
  /// **'Can I cancel my order?'**
  String get canICancelMyOrder;

  /// No description provided for @whatIfMyOrderIsDelayed.
  ///
  /// In en, this message translates to:
  /// **'What if my order is delayed?'**
  String get whatIfMyOrderIsDelayed;

  /// No description provided for @whatPaymentMethodsAreAccepted.
  ///
  /// In en, this message translates to:
  /// **'What payment methods are accepted?'**
  String get whatPaymentMethodsAreAccepted;

  /// No description provided for @isItSafeToUseMyCreditdebitCardOnBite.
  ///
  /// In en, this message translates to:
  /// **'Is it safe to use my credit/debit card on Bite?'**
  String get isItSafeToUseMyCreditdebitCardOnBite;

  /// No description provided for @canIUseMultiplePaymentMethodsForOneOrder.
  ///
  /// In en, this message translates to:
  /// **'Can I use multiple payment methods for one order?'**
  String get canIUseMultiplePaymentMethodsForOneOrder;

  /// No description provided for @whatShouldIDoIfAPaymentFails.
  ///
  /// In en, this message translates to:
  /// **'What should I do if a payment fails?'**
  String get whatShouldIDoIfAPaymentFails;

  /// No description provided for @whatAreYourDeliveryHours.
  ///
  /// In en, this message translates to:
  /// **'What are your delivery hours?'**
  String get whatAreYourDeliveryHours;

  /// No description provided for @doYouChargeADeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Do you charge a delivery fee?'**
  String get doYouChargeADeliveryFee;

  /// No description provided for @doYouDeliverToMyLocation.
  ///
  /// In en, this message translates to:
  /// **'Do you deliver to my location?'**
  String get doYouDeliverToMyLocation;

  /// No description provided for @canIScheduleADeliveryForALaterTime.
  ///
  /// In en, this message translates to:
  /// **'Can I schedule a delivery for a later time?'**
  String get canIScheduleADeliveryForALaterTime;

  /// No description provided for @ongoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get ongoing;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @addressUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address updated successfully'**
  String get addressUpdatedSuccessfully;

  /// Error message when updating an address fails, with dynamic error content
  ///
  /// In en, this message translates to:
  /// **'Failed to update address: {error}'**
  String failedToUpdateAddress(Object error);

  /// No description provided for @homeDeliverTo.
  ///
  /// In en, this message translates to:
  /// **'Deliver to'**
  String get homeDeliverTo;

  /// No description provided for @homeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Something delicious awaits.'**
  String get homeHeadline;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find your next favourite, one bite at a time.'**
  String get homeSubtitle;

  /// No description provided for @browseRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Browse restaurants'**
  String get browseRestaurants;

  /// No description provided for @retryAction.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retryAction;

  /// No description provided for @catalogLoadFailure.
  ///
  /// In en, this message translates to:
  /// **'We could not load this right now.'**
  String get catalogLoadFailure;

  /// No description provided for @catalogRefreshFailure.
  ///
  /// In en, this message translates to:
  /// **'Your saved results are shown. Refresh to try again.'**
  String get catalogRefreshFailure;

  /// No description provided for @noCategoriesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No categories available yet.'**
  String get noCategoriesAvailable;

  /// No description provided for @noOpenRestaurants.
  ///
  /// In en, this message translates to:
  /// **'No restaurants are open right now.'**
  String get noOpenRestaurants;

  /// No description provided for @deliveryMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String deliveryMinutes(int minutes);

  /// No description provided for @rememberEmail.
  ///
  /// In en, this message translates to:
  /// **'Remember email'**
  String get rememberEmail;

  /// No description provided for @menuAllItems.
  ///
  /// In en, this message translates to:
  /// **'All items'**
  String get menuAllItems;

  /// No description provided for @restaurantOpen.
  ///
  /// In en, this message translates to:
  /// **'Open now'**
  String get restaurantOpen;

  /// No description provided for @restaurantClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get restaurantClosed;

  /// No description provided for @itemUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Currently unavailable'**
  String get itemUnavailable;

  /// No description provided for @itemAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'Added to your cart'**
  String get itemAddedToCart;

  /// No description provided for @cartAddFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not add this item. Please try again.'**
  String get cartAddFailed;

  /// No description provided for @signInToOrder.
  ///
  /// In en, this message translates to:
  /// **'Sign in to place an order'**
  String get signInToOrder;

  /// No description provided for @quantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantityLabel;

  /// No description provided for @increaseQuantity.
  ///
  /// In en, this message translates to:
  /// **'Increase quantity'**
  String get increaseQuantity;

  /// No description provided for @decreaseQuantity.
  ///
  /// In en, this message translates to:
  /// **'Decrease quantity'**
  String get decreaseQuantity;

  /// No description provided for @catalogMissing.
  ///
  /// In en, this message translates to:
  /// **'This item is no longer available.'**
  String get catalogMissing;

  /// No description provided for @optionalChoices.
  ///
  /// In en, this message translates to:
  /// **'Optional · choose your favourites'**
  String get optionalChoices;

  /// No description provided for @savingItem.
  ///
  /// In en, this message translates to:
  /// **'Adding…'**
  String get savingItem;

  /// No description provided for @viewCartAction.
  ///
  /// In en, this message translates to:
  /// **'View cart'**
  String get viewCartAction;

  /// No description provided for @discoverTab.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discoverTab;

  /// No description provided for @ordersTab.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get ordersTab;

  /// No description provided for @accountTab.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountTab;

  /// No description provided for @discoveryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get discoveryAll;

  /// No description provided for @discoveryOpen.
  ///
  /// In en, this message translates to:
  /// **'Open now'**
  String get discoveryOpen;

  /// No description provided for @discoveryCategories.
  ///
  /// In en, this message translates to:
  /// **'All categories'**
  String get discoveryCategories;

  /// No description provided for @discoveryRated.
  ///
  /// In en, this message translates to:
  /// **'Top rated'**
  String get discoveryRated;

  /// No description provided for @discoveryName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get discoveryName;

  /// No description provided for @discoveryDelivery.
  ///
  /// In en, this message translates to:
  /// **'Fastest delivery'**
  String get discoveryDelivery;

  /// No description provided for @discoveryReset.
  ///
  /// In en, this message translates to:
  /// **'Reset filters'**
  String get discoveryReset;

  /// No description provided for @discoveryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No matches yet. Try another search or reset your filters.'**
  String get discoveryEmpty;

  /// No description provided for @discoveryMore.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get discoveryMore;

  /// No description provided for @cartChangeFailed.
  ///
  /// In en, this message translates to:
  /// **'Your cart could not be updated. Your items are still shown.'**
  String get cartChangeFailed;

  /// No description provided for @cartNeedsReview.
  ///
  /// In en, this message translates to:
  /// **'Review your cart: use one restaurant and available items with valid quantities.'**
  String get cartNeedsReview;

  /// No description provided for @cartEstimate.
  ///
  /// In en, this message translates to:
  /// **'Estimated item subtotal. Checkout confirms current prices and delivery fees.'**
  String get cartEstimate;

  /// No description provided for @checkoutChanged.
  ///
  /// In en, this message translates to:
  /// **'Your cart, address or prices changed. Review your total again.'**
  String get checkoutChanged;

  /// No description provided for @checkoutTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Checkout could not be completed. Please try again.'**
  String get checkoutTryAgain;

  /// No description provided for @checkoutCashNote.
  ///
  /// In en, this message translates to:
  /// **'Pay cash on delivery. Review the confirmed total before placing your order.'**
  String get checkoutCashNote;

  /// No description provided for @checkoutReview.
  ///
  /// In en, this message translates to:
  /// **'Review total'**
  String get checkoutReview;

  /// No description provided for @payByCard.
  ///
  /// In en, this message translates to:
  /// **'Pay by card'**
  String get payByCard;

  /// No description provided for @resumeCardPayment.
  ///
  /// In en, this message translates to:
  /// **'Resume card payment'**
  String get resumeCardPayment;

  /// No description provided for @cancelCardPayment.
  ///
  /// In en, this message translates to:
  /// **'Cancel card payment'**
  String get cancelCardPayment;

  /// No description provided for @cardPaymentPending.
  ///
  /// In en, this message translates to:
  /// **'Your card payment is pending. Resume it or cancel before changing your cart.'**
  String get cardPaymentPending;

  /// No description provided for @paymentAtCheckout.
  ///
  /// In en, this message translates to:
  /// **'Choose your payment method at checkout. Card details are collected by Stripe’s secure payment sheet; Bite does not save cards.'**
  String get paymentAtCheckout;

  /// No description provided for @updateAddress.
  ///
  /// In en, this message translates to:
  /// **'Update Address'**
  String get updateAddress;

  /// No description provided for @saveAddress.
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get saveAddress;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @enterStreet.
  ///
  /// In en, this message translates to:
  /// **'Enter street address'**
  String get enterStreet;

  /// No description provided for @enterCity.
  ///
  /// In en, this message translates to:
  /// **'Enter city'**
  String get enterCity;

  /// No description provided for @enterZipCode.
  ///
  /// In en, this message translates to:
  /// **'Enter ZIP code'**
  String get enterZipCode;

  /// No description provided for @enterCountry.
  ///
  /// In en, this message translates to:
  /// **'Enter country'**
  String get enterCountry;

  /// No description provided for @orderReceived.
  ///
  /// In en, this message translates to:
  /// **'Order Received'**
  String get orderReceived;

  /// No description provided for @orderReceivedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your order has been received by the restaurant'**
  String get orderReceivedSubtitle;

  /// No description provided for @preparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing Food'**
  String get preparing;

  /// No description provided for @preparingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The kitchen is cooking your meal'**
  String get preparingSubtitle;

  /// No description provided for @dispatched.
  ///
  /// In en, this message translates to:
  /// **'Out for Delivery'**
  String get dispatched;

  /// No description provided for @dispatchedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Courier has picked up your food'**
  String get dispatchedSubtitle;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @deliveredSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Order has been delivered safely'**
  String get deliveredSubtitle;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatus;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get orderId;

  /// No description provided for @orderDate.
  ///
  /// In en, this message translates to:
  /// **'Order Date'**
  String get orderDate;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get totalPrice;

  /// Estimated delivery arrival string
  ///
  /// In en, this message translates to:
  /// **'Estimated delivery: {time}'**
  String estimatedDeliveryTime(String time);

  /// No description provided for @orderDeliveredSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your order has been delivered successfully!'**
  String get orderDeliveredSuccessfully;

  /// No description provided for @helpAndSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpAndSupport;

  /// No description provided for @deliveryRider.
  ///
  /// In en, this message translates to:
  /// **'Delivery Courier'**
  String get deliveryRider;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @noOrdersInHistory.
  ///
  /// In en, this message translates to:
  /// **'No past orders yet'**
  String get noOrdersInHistory;

  /// No description provided for @writeReview.
  ///
  /// In en, this message translates to:
  /// **'Write a Review'**
  String get writeReview;

  /// No description provided for @rateOrder.
  ///
  /// In en, this message translates to:
  /// **'Rate Order'**
  String get rateOrder;

  /// No description provided for @rateRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Rate Restaurant'**
  String get rateRestaurant;

  /// No description provided for @tellUsYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Tell us about your experience...'**
  String get tellUsYourExperience;

  /// No description provided for @submitReview.
  ///
  /// In en, this message translates to:
  /// **'Submit Review'**
  String get submitReview;

  /// No description provided for @reviewSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Review submitted successfully'**
  String get reviewSubmitted;

  /// No description provided for @noReviewsYet.
  ///
  /// In en, this message translates to:
  /// **'No reviews written yet'**
  String get noReviewsYet;

  /// No description provided for @orderRating.
  ///
  /// In en, this message translates to:
  /// **'Order Rating'**
  String get orderRating;

  /// No description provided for @restaurantRating.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Rating'**
  String get restaurantRating;

  /// No description provided for @feedbackOptional.
  ///
  /// In en, this message translates to:
  /// **'Your feedback helps restaurants improve'**
  String get feedbackOptional;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'tr',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
