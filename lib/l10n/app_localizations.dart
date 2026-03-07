import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

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
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @allYourFavorites.
  ///
  /// In en, this message translates to:
  /// **'All your favorites'**
  String get allYourFavorites;

  /// No description provided for @getLovedFoodsDescription.
  ///
  /// In en, this message translates to:
  /// **'Get all your loved foods in one once place,you just place the orer we do the rest'**
  String get getLovedFoodsDescription;

  /// No description provided for @orderFromChosenChef.
  ///
  /// In en, this message translates to:
  /// **'Order from choosen chef'**
  String get orderFromChosenChef;

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

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

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

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @successfullySignedInGoogle.
  ///
  /// In en, this message translates to:
  /// **'Successfully signed in with Google!'**
  String get successfullySignedInGoogle;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordTitle;

  /// No description provided for @passwordResetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Password Reset Link Sent'**
  String get passwordResetLinkSent;

  /// No description provided for @checkEmailResetLink.
  ///
  /// In en, this message translates to:
  /// **'Check your email for a password reset link. Click the link to reset your password on our website.'**
  String get checkEmailResetLink;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully! Please login with your new password.'**
  String get passwordResetSuccess;

  /// No description provided for @pleaseEnterEmailReset.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address to receive a password reset link.'**
  String get pleaseEnterEmailReset;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

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

  /// No description provided for @deliverTo.
  ///
  /// In en, this message translates to:
  /// **'DELIVER TO'**
  String get deliverTo;

  /// No description provided for @selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get selectLocation;

  /// No description provided for @heyUser.
  ///
  /// In en, this message translates to:
  /// **'Hey {userName}, '**
  String heyUser(String userName);

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning! 👋'**
  String get goodMorning;

  /// No description provided for @heyThere.
  ///
  /// In en, this message translates to:
  /// **'Hey there, '**
  String get heyThere;

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

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

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

  /// No description provided for @noRecentSearches.
  ///
  /// In en, this message translates to:
  /// **'No recent searches'**
  String get noRecentSearches;

  /// No description provided for @addedToRecentSearches.
  ///
  /// In en, this message translates to:
  /// **'Added \"{searchTerm}\" to recent searches'**
  String addedToRecentSearches(String searchTerm);

  /// No description provided for @removedFromRecentSearches.
  ///
  /// In en, this message translates to:
  /// **'Removed \"{searchTerm}\" from recent searches'**
  String removedFromRecentSearches(String searchTerm);

  /// No description provided for @searchRestaurantsOrDishes.
  ///
  /// In en, this message translates to:
  /// **'Search for restaurants or dishes'**
  String get searchRestaurantsOrDishes;

  /// No description provided for @noRestaurantsFound.
  ///
  /// In en, this message translates to:
  /// **'No restaurants found'**
  String get noRestaurantsFound;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'DELIVERY ADDRESS'**
  String get deliveryAddress;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'EDIT'**
  String get edit;

  /// No description provided for @selectAnAddress.
  ///
  /// In en, this message translates to:
  /// **'Select an address'**
  String get selectAnAddress;

  /// No description provided for @totalLabel.
  ///
  /// In en, this message translates to:
  /// **'TOTAL : '**
  String get totalLabel;

  /// No description provided for @pkrAmount.
  ///
  /// In en, this message translates to:
  /// **'PKR {amount}'**
  String pkrAmount(String amount);

  /// No description provided for @checkoutButton.
  ///
  /// In en, this message translates to:
  /// **'CHECKOUT'**
  String get checkoutButton;

  /// No description provided for @yourCartIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get yourCartIsEmpty;

  /// No description provided for @initializingCart.
  ///
  /// In en, this message translates to:
  /// **'Initializing cart...'**
  String get initializingCart;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @deliveryAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAddressTitle;

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

  /// No description provided for @orderPlacedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your order has been placed successfully.\nTrack your order in real-time.'**
  String get orderPlacedSuccessfully;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @confirmPaymentAmount.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment  •  PKR {amount}'**
  String confirmPaymentAmount(String amount);

  /// No description provided for @rsPrice.
  ///
  /// In en, this message translates to:
  /// **'RS {price}'**
  String rsPrice(String price);

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

  /// No description provided for @tenInch.
  ///
  /// In en, this message translates to:
  /// **'10 inch'**
  String get tenInch;

  /// No description provided for @sixteenInch.
  ///
  /// In en, this message translates to:
  /// **'16 inch'**
  String get sixteenInch;

  /// No description provided for @twentyInch.
  ///
  /// In en, this message translates to:
  /// **'20 inch'**
  String get twentyInch;

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

  /// No description provided for @allItems.
  ///
  /// In en, this message translates to:
  /// **'All Items'**
  String get allItems;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @failedLoadFoodItems.
  ///
  /// In en, this message translates to:
  /// **'Failed to load food items. Please try again later.'**
  String get failedLoadFoodItems;

  /// No description provided for @noFoodItemsCategory.
  ///
  /// In en, this message translates to:
  /// **'No food items available for this category.'**
  String get noFoodItemsCategory;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @deliveryTimeMin.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String deliveryTimeMin(String minutes);

  /// No description provided for @allRestaurants.
  ///
  /// In en, this message translates to:
  /// **'All Restaurants'**
  String get allRestaurants;

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

  /// No description provided for @payWhenOrderArrives.
  ///
  /// In en, this message translates to:
  /// **'Pay when your order arrives'**
  String get payWhenOrderArrives;

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

  /// No description provided for @selectVisaCards.
  ///
  /// In en, this message translates to:
  /// **'Select from your saved Visa cards'**
  String get selectVisaCards;

  /// No description provided for @mastercard.
  ///
  /// In en, this message translates to:
  /// **'Mastercard'**
  String get mastercard;

  /// No description provided for @selectMastercardCards.
  ///
  /// In en, this message translates to:
  /// **'Select from your saved Mastercards'**
  String get selectMastercardCards;

  /// No description provided for @cardEndingInSelected.
  ///
  /// In en, this message translates to:
  /// **'Card ending in {last4} selected'**
  String cardEndingInSelected(String last4);

  /// No description provided for @noCardsSavedAddFirst.
  ///
  /// In en, this message translates to:
  /// **'No {cardType} cards saved. Add one first.'**
  String noCardsSavedAddFirst(String cardType);

  /// No description provided for @savedCards.
  ///
  /// In en, this message translates to:
  /// **'Saved Cards'**
  String get savedCards;

  /// No description provided for @creditCardAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Credit card added successfully'**
  String get creditCardAddedSuccess;

  /// No description provided for @creditCardDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Credit card deleted successfully'**
  String get creditCardDeletedSuccess;

  /// No description provided for @noSavedCardsYet.
  ///
  /// In en, this message translates to:
  /// **'No saved cards yet'**
  String get noSavedCardsYet;

  /// No description provided for @addCardBelowToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Add a card below to get started'**
  String get addCardBelowToGetStarted;

  /// No description provided for @maskedCardNumber.
  ///
  /// In en, this message translates to:
  /// **'**** **** **** {last4}'**
  String maskedCardNumber(String last4);

  /// No description provided for @cardHolderExpiry.
  ///
  /// In en, this message translates to:
  /// **'{holderName}  •  {expiryDate}'**
  String cardHolderExpiry(String holderName, String expiryDate);

  /// No description provided for @addNewCard.
  ///
  /// In en, this message translates to:
  /// **'Add New Card'**
  String get addNewCard;

  /// No description provided for @cardInformation.
  ///
  /// In en, this message translates to:
  /// **'Card Information'**
  String get cardInformation;

  /// No description provided for @cardNumberPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'4242 4242 4242 4242'**
  String get cardNumberPlaceholder;

  /// No description provided for @cardNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Card number is required'**
  String get cardNumberRequired;

  /// No description provided for @cardNumberTooShort.
  ///
  /// In en, this message translates to:
  /// **'Card number is too short'**
  String get cardNumberTooShort;

  /// No description provided for @mmyyPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'MM/YY'**
  String get mmyyPlaceholder;

  /// No description provided for @invalidMonth.
  ///
  /// In en, this message translates to:
  /// **'Invalid month'**
  String get invalidMonth;

  /// No description provided for @cvcPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'CVC'**
  String get cvcPlaceholder;

  /// No description provided for @invalidCvc.
  ///
  /// In en, this message translates to:
  /// **'Invalid CVC'**
  String get invalidCvc;

  /// No description provided for @fullNameOnCard.
  ///
  /// In en, this message translates to:
  /// **'Full name on card'**
  String get fullNameOnCard;

  /// No description provided for @cardSecurityNote.
  ///
  /// In en, this message translates to:
  /// **'Your card details are securely handled by Stripe. We never store your full card number.'**
  String get cardSecurityNote;

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

  /// No description provided for @addAddress.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get addAddress;

  /// No description provided for @addressNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Address not available'**
  String get addressNotAvailable;

  /// No description provided for @failedLoadAddresses.
  ///
  /// In en, this message translates to:
  /// **'Failed to load addresses'**
  String get failedLoadAddresses;

  /// No description provided for @noSavedAddresses.
  ///
  /// In en, this message translates to:
  /// **'No saved addresses yet'**
  String get noSavedAddresses;

  /// No description provided for @pleaseSignInAddresses.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to view addresses'**
  String get pleaseSignInAddresses;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @locationPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Location permission is required'**
  String get locationPermissionRequired;

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

  /// No description provided for @pleaseFillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all required fields'**
  String get pleaseFillAllFields;

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

  /// No description provided for @failedToAddAddress.
  ///
  /// In en, this message translates to:
  /// **'Failed to add address: {error}'**
  String failedToAddAddress(String error);

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

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

  /// No description provided for @iLoveFastFood.
  ///
  /// In en, this message translates to:
  /// **'I Love Fast Food'**
  String get iLoveFastFood;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

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

  /// No description provided for @pleaseLoginViewProfile.
  ///
  /// In en, this message translates to:
  /// **'Please login to view your profile'**
  String get pleaseLoginViewProfile;

  /// No description provided for @editTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit {title}'**
  String editTitle(String title);

  /// No description provided for @enterTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter {title}'**
  String enterTitle(String title);

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @favourite.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get favourite;

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

  /// No description provided for @noFavouriteRestaurants.
  ///
  /// In en, this message translates to:
  /// **'No favourite restaurants found.'**
  String get noFavouriteRestaurants;

  /// No description provided for @noFavouriteFoods.
  ///
  /// In en, this message translates to:
  /// **'No favourite foods found.'**
  String get noFavouriteFoods;

  /// No description provided for @orderRatings.
  ///
  /// In en, this message translates to:
  /// **'Order Ratings'**
  String get orderRatings;

  /// No description provided for @restaurantRatings.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Ratings'**
  String get restaurantRatings;

  /// No description provided for @userReviews.
  ///
  /// In en, this message translates to:
  /// **'User Reviews'**
  String get userReviews;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @myReviews.
  ///
  /// In en, this message translates to:
  /// **'My Reviews'**
  String get myReviews;

  /// No description provided for @orderCancelledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Order cancelled successfully'**
  String get orderCancelledSuccessfully;

  /// No description provided for @clearOrderHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear Order History'**
  String get clearOrderHistory;

  /// No description provided for @confirmDeleteOrderHistory.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all order history? This action cannot be undone.'**
  String get confirmDeleteOrderHistory;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @clearOrderHistoryMenu.
  ///
  /// In en, this message translates to:
  /// **'Clear order history'**
  String get clearOrderHistoryMenu;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @noCompletedOrders.
  ///
  /// In en, this message translates to:
  /// **'No completed orders yet'**
  String get noCompletedOrders;

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

  /// No description provided for @noActiveOrder.
  ///
  /// In en, this message translates to:
  /// **'No active order'**
  String get noActiveOrder;

  /// No description provided for @orderDelivered.
  ///
  /// In en, this message translates to:
  /// **'Your order has been delivered!'**
  String get orderDelivered;

  /// No description provided for @callingNumber.
  ///
  /// In en, this message translates to:
  /// **'Calling {phoneNumber}...'**
  String callingNumber(String phoneNumber);

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get locationPermissionDenied;

  /// No description provided for @orderReceived.
  ///
  /// In en, this message translates to:
  /// **'Your order has been received'**
  String get orderReceived;

  /// No description provided for @restaurantPreparingFood.
  ///
  /// In en, this message translates to:
  /// **'The restaurant is preparing your food'**
  String get restaurantPreparingFood;

  /// No description provided for @orderPickedUp.
  ///
  /// In en, this message translates to:
  /// **'Your order has been picked up for delivery'**
  String get orderPickedUp;

  /// No description provided for @orderArrivingSoon.
  ///
  /// In en, this message translates to:
  /// **'Order arriving soon!'**
  String get orderArrivingSoon;

  /// No description provided for @estimatedDeliveryTime.
  ///
  /// In en, this message translates to:
  /// **'ESTIMATED DELIVERY TIME'**
  String get estimatedDeliveryTime;

  /// No description provided for @estimatedMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String estimatedMinutes(String minutes);

  /// No description provided for @orderedAt.
  ///
  /// In en, this message translates to:
  /// **'Orderd At {date}'**
  String orderedAt(String date);

  /// No description provided for @courier.
  ///
  /// In en, this message translates to:
  /// **'Courier'**
  String get courier;

  /// No description provided for @noNotificationsYet.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get noNotificationsYet;

  /// No description provided for @unreadNotificationsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} unread notifications'**
  String unreadNotificationsCount(int count);

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get noNotifications;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get markAllAsRead;

  /// No description provided for @clearAllNotifications.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAllNotifications;

  /// No description provided for @allTab.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allTab;

  /// No description provided for @unread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'PREFERENCES'**
  String get preferences;

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

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @themes.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get themes;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @versionInfoNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Version info not available'**
  String get versionInfoNotAvailable;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @orderFaq.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get orderFaq;

  /// No description provided for @paymentsFaq.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get paymentsFaq;

  /// No description provided for @deliveryFaq.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get deliveryFaq;

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

  /// No description provided for @howTrackOrder.
  ///
  /// In en, this message translates to:
  /// **'How do I track my order?'**
  String get howTrackOrder;

  /// No description provided for @canCancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Can I cancel my order?'**
  String get canCancelOrder;

  /// No description provided for @whatIfOrderDelayed.
  ///
  /// In en, this message translates to:
  /// **'What if my order is delayed?'**
  String get whatIfOrderDelayed;

  /// No description provided for @whatPaymentMethodsAccepted.
  ///
  /// In en, this message translates to:
  /// **'What payment methods are accepted?'**
  String get whatPaymentMethodsAccepted;

  /// No description provided for @isCardSafeBite.
  ///
  /// In en, this message translates to:
  /// **'Is it safe to use my credit/debit card on Bite?'**
  String get isCardSafeBite;

  /// No description provided for @canUseMultiplePaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Can I use multiple payment methods for one order?'**
  String get canUseMultiplePaymentMethods;

  /// No description provided for @whatIfPaymentFails.
  ///
  /// In en, this message translates to:
  /// **'What should I do if a payment fails?'**
  String get whatIfPaymentFails;

  /// No description provided for @whatDeliveryHours.
  ///
  /// In en, this message translates to:
  /// **'What are your delivery hours?'**
  String get whatDeliveryHours;

  /// No description provided for @chargeDeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Do you charge a delivery fee?'**
  String get chargeDeliveryFee;

  /// No description provided for @deliverToLocation.
  ///
  /// In en, this message translates to:
  /// **'Do you deliver to my location?'**
  String get deliverToLocation;

  /// No description provided for @scheduleDeliveryLater.
  ///
  /// In en, this message translates to:
  /// **'Can I schedule a delivery for a later time?'**
  String get scheduleDeliveryLater;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'CLEAR'**
  String get clear;

  /// No description provided for @applyFilter.
  ///
  /// In en, this message translates to:
  /// **'APPLY'**
  String get applyFilter;

  /// No description provided for @ratingFilter.
  ///
  /// In en, this message translates to:
  /// **'RATING'**
  String get ratingFilter;

  /// No description provided for @lessThan3_5.
  ///
  /// In en, this message translates to:
  /// **'< 3.5'**
  String get lessThan3_5;

  /// No description provided for @between3_5And4_0.
  ///
  /// In en, this message translates to:
  /// **'3.5 - 4.0'**
  String get between3_5And4_0;

  /// No description provided for @greaterThan4_0.
  ///
  /// In en, this message translates to:
  /// **'> 4.0'**
  String get greaterThan4_0;

  /// No description provided for @deliveryTimeFilter.
  ///
  /// In en, this message translates to:
  /// **'DELIVERY TIME'**
  String get deliveryTimeFilter;

  /// No description provided for @lessThan15Min.
  ///
  /// In en, this message translates to:
  /// **'< 15 min'**
  String get lessThan15Min;

  /// No description provided for @between15And30Min.
  ///
  /// In en, this message translates to:
  /// **'15 - 30 min'**
  String get between15And30Min;

  /// No description provided for @greaterThan30Min.
  ///
  /// In en, this message translates to:
  /// **'> 30 min'**
  String get greaterThan30Min;

  /// No description provided for @filterYourSearch.
  ///
  /// In en, this message translates to:
  /// **'Filter your search'**
  String get filterYourSearch;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @enterField.
  ///
  /// In en, this message translates to:
  /// **'Enter {field}'**
  String enterField(String field);

  /// No description provided for @pleaseEnterField.
  ///
  /// In en, this message translates to:
  /// **'Please enter {field}'**
  String pleaseEnterField(String field);

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get pleaseEnterValidEmail;

  /// No description provided for @pleaseEnterValidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get pleaseEnterValidPhone;

  /// No description provided for @passwordMinimum8Chars.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long'**
  String get passwordMinimum8Chars;

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

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailable;

  /// No description provided for @newBiteVersionReady.
  ///
  /// In en, this message translates to:
  /// **'A new version of Bite is ready!'**
  String get newBiteVersionReady;

  /// No description provided for @updateDescription.
  ///
  /// In en, this message translates to:
  /// **'Version {version} includes new features, performance improvements, and bug fixes.'**
  String updateDescription(String version);

  /// No description provided for @versionPrefix.
  ///
  /// In en, this message translates to:
  /// **'v{version}'**
  String versionPrefix(String version);

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

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String errorMessage(String message);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
