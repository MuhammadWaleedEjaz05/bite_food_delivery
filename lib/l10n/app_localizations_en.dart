// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get allYourFavorites => 'All your favorites';

  @override
  String get getLovedFoodsDescription =>
      'Get all your loved foods in one once place,you just place the orer we do the rest';

  @override
  String get orderFromChosenChef => 'Order from choosen chef';

  @override
  String get freeDeliveryOffers => 'Free delivery offers';

  @override
  String get getStarted => 'Get Started';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get login => 'Login';

  @override
  String get logIn => 'Log In';

  @override
  String get pleaseSignInToContinue => 'Please Sign In to Continue';

  @override
  String get or => 'Or';

  @override
  String get successfullySignedInGoogle =>
      'Successfully signed in with Google!';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get signUp => 'Sign Up';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPasswordTitle => 'Forgot Password';

  @override
  String get passwordResetLinkSent => 'Password Reset Link Sent';

  @override
  String get checkEmailResetLink =>
      'Check your email for a password reset link. Click the link to reset your password on our website.';

  @override
  String get done => 'Done';

  @override
  String get passwordResetSuccess =>
      'Password reset successfully! Please login with your new password.';

  @override
  String get pleaseEnterEmailReset =>
      'Please enter your email address to receive a password reset link.';

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get fullName => 'Full Name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get pleaseSignUpToGetStarted => 'Please Sign Up to get started';

  @override
  String get deliverTo => 'DELIVER TO';

  @override
  String get selectLocation => 'Select Location';

  @override
  String heyUser(String userName) {
    return 'Hey $userName, ';
  }

  @override
  String get goodMorning => 'Good Morning! 👋';

  @override
  String get heyThere => 'Hey there, ';

  @override
  String get allCategories => 'All Categories';

  @override
  String get openRestaurants => 'Open Restaurants';

  @override
  String get search => 'Search';

  @override
  String get popularRestaurants => 'Popular Restaurants';

  @override
  String get noPopularRestaurantsFound => 'No popular restaurants found';

  @override
  String get recentKeywords => 'Recent Keywords';

  @override
  String get noRecentSearches => 'No recent searches';

  @override
  String addedToRecentSearches(String searchTerm) {
    return 'Added \"$searchTerm\" to recent searches';
  }

  @override
  String removedFromRecentSearches(String searchTerm) {
    return 'Removed \"$searchTerm\" from recent searches';
  }

  @override
  String get searchRestaurantsOrDishes => 'Search for restaurants or dishes';

  @override
  String get noRestaurantsFound => 'No restaurants found';

  @override
  String get deliveryAddress => 'DELIVERY ADDRESS';

  @override
  String get edit => 'EDIT';

  @override
  String get selectAnAddress => 'Select an address';

  @override
  String get totalLabel => 'TOTAL : ';

  @override
  String pkrAmount(String amount) {
    return 'PKR $amount';
  }

  @override
  String get checkoutButton => 'CHECKOUT';

  @override
  String get yourCartIsEmpty => 'Your cart is empty';

  @override
  String get initializingCart => 'Initializing cart...';

  @override
  String get cart => 'Cart';

  @override
  String get checkout => 'Checkout';

  @override
  String get deliveryAddressTitle => 'Delivery Address';

  @override
  String get change => 'Change';

  @override
  String get noAddressSelected => 'No address selected';

  @override
  String get orderItems => 'Order Items';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get deliveryFee => 'Delivery Fee';

  @override
  String get platformFee => 'Platform Fee';

  @override
  String get total => 'Total';

  @override
  String get orderPlaced => 'Order Placed!';

  @override
  String get orderPlacedSuccessfully =>
      'Your order has been placed successfully.\nTrack your order in real-time.';

  @override
  String get trackOrder => 'Track Order';

  @override
  String get backToHome => 'Back to Home';

  @override
  String confirmPaymentAmount(String amount) {
    return 'Confirm Payment  •  PKR $amount';
  }

  @override
  String rsPrice(String price) {
    return 'RS $price';
  }

  @override
  String get chooseYourFlavor => 'Choose your flavor';

  @override
  String get chooseYourSize => 'Choose your size';

  @override
  String get tenInch => '10 inch';

  @override
  String get sixteenInch => '16 inch';

  @override
  String get twentyInch => '20 inch';

  @override
  String get removeFromCart => 'Remove from cart';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get allItems => 'All Items';

  @override
  String get all => 'All';

  @override
  String get failedLoadFoodItems =>
      'Failed to load food items. Please try again later.';

  @override
  String get noFoodItemsCategory =>
      'No food items available for this category.';

  @override
  String get free => 'Free';

  @override
  String deliveryTimeMin(String minutes) {
    return '$minutes min';
  }

  @override
  String get allRestaurants => 'All Restaurants';

  @override
  String get selectPaymentMethod => 'Select Payment Method';

  @override
  String get cashOnDelivery => 'Cash on Delivery';

  @override
  String get payWhenOrderArrives => 'Pay when your order arrives';

  @override
  String get cashOnDeliverySelected => 'Cash on Delivery selected';

  @override
  String get visa => 'Visa';

  @override
  String get selectVisaCards => 'Select from your saved Visa cards';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get selectMastercardCards => 'Select from your saved Mastercards';

  @override
  String cardEndingInSelected(String last4) {
    return 'Card ending in $last4 selected';
  }

  @override
  String noCardsSavedAddFirst(String cardType) {
    return 'No $cardType cards saved. Add one first.';
  }

  @override
  String get savedCards => 'Saved Cards';

  @override
  String get creditCardAddedSuccess => 'Credit card added successfully';

  @override
  String get creditCardDeletedSuccess => 'Credit card deleted successfully';

  @override
  String get noSavedCardsYet => 'No saved cards yet';

  @override
  String get addCardBelowToGetStarted => 'Add a card below to get started';

  @override
  String maskedCardNumber(String last4) {
    return '**** **** **** $last4';
  }

  @override
  String cardHolderExpiry(String holderName, String expiryDate) {
    return '$holderName  •  $expiryDate';
  }

  @override
  String get addNewCard => 'Add New Card';

  @override
  String get cardInformation => 'Card Information';

  @override
  String get cardNumberPlaceholder => '4242 4242 4242 4242';

  @override
  String get cardNumberRequired => 'Card number is required';

  @override
  String get cardNumberTooShort => 'Card number is too short';

  @override
  String get mmyyPlaceholder => 'MM/YY';

  @override
  String get invalidMonth => 'Invalid month';

  @override
  String get cvcPlaceholder => 'CVC';

  @override
  String get invalidCvc => 'Invalid CVC';

  @override
  String get fullNameOnCard => 'Full name on card';

  @override
  String get cardSecurityNote =>
      'Your card details are securely handled by Stripe. We never store your full card number.';

  @override
  String get adding => 'Adding...';

  @override
  String get addCard => 'Add Card';

  @override
  String get addAddress => 'Add Address';

  @override
  String get addressNotAvailable => 'Address not available';

  @override
  String get failedLoadAddresses => 'Failed to load addresses';

  @override
  String get noSavedAddresses => 'No saved addresses yet';

  @override
  String get pleaseSignInAddresses => 'Please sign in to view addresses';

  @override
  String get address => 'Address';

  @override
  String get locationPermissionRequired => 'Location permission is required';

  @override
  String get streetNo => 'Street No.';

  @override
  String get zipCode => 'ZIP Code';

  @override
  String get city => 'City';

  @override
  String get country => 'Country';

  @override
  String get label => 'Label';

  @override
  String get home => 'Home';

  @override
  String get work => 'Work';

  @override
  String get other => 'Other';

  @override
  String get pleaseFillAllFields => 'Please fill all required fields';

  @override
  String get userNotAuthenticated => 'User not authenticated';

  @override
  String get addressAddedSuccessfully => 'Address added successfully!';

  @override
  String failedToAddAddress(String error) {
    return 'Failed to add address: $error';
  }

  @override
  String get save => 'Save';

  @override
  String get selectDeliveryAddress => 'Select Delivery Address';

  @override
  String get noAddressesFound => 'No addresses found';

  @override
  String get iLoveFastFood => 'I Love Fast Food';

  @override
  String get logout => 'Logout';

  @override
  String get profile => 'Profile';

  @override
  String get personalInfo => 'Personal Info';

  @override
  String get guestUser => 'Guest User';

  @override
  String get pleaseLoginViewProfile => 'Please login to view your profile';

  @override
  String editTitle(String title) {
    return 'Edit $title';
  }

  @override
  String enterTitle(String title) {
    return 'Enter $title';
  }

  @override
  String get apply => 'Apply';

  @override
  String get phone => 'Phone';

  @override
  String get favourite => 'Favourite';

  @override
  String get foods => 'Foods';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get noFavouriteRestaurants => 'No favourite restaurants found.';

  @override
  String get noFavouriteFoods => 'No favourite foods found.';

  @override
  String get orderRatings => 'Order Ratings';

  @override
  String get restaurantRatings => 'Restaurant Ratings';

  @override
  String get userReviews => 'User Reviews';

  @override
  String get submit => 'Submit';

  @override
  String get review => 'Review';

  @override
  String get myReviews => 'My Reviews';

  @override
  String get orderCancelledSuccessfully => 'Order cancelled successfully';

  @override
  String get clearOrderHistory => 'Clear Order History';

  @override
  String get confirmDeleteOrderHistory =>
      'Are you sure you want to delete all order history? This action cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get clearAll => 'Clear All';

  @override
  String get clearOrderHistoryMenu => 'Clear order history';

  @override
  String get orderHistory => 'Order History';

  @override
  String get noCompletedOrders => 'No completed orders yet';

  @override
  String get noOngoingOrders => 'No ongoing orders';

  @override
  String get noOrderHistory => 'No order history';

  @override
  String get ongoing => 'Ongoing';

  @override
  String get history => 'History';

  @override
  String get noActiveOrder => 'No active order';

  @override
  String get orderDelivered => 'Your order has been delivered!';

  @override
  String callingNumber(String phoneNumber) {
    return 'Calling $phoneNumber...';
  }

  @override
  String get locationPermissionDenied => 'Location permission denied';

  @override
  String get orderReceived => 'Your order has been received';

  @override
  String get restaurantPreparingFood => 'The restaurant is preparing your food';

  @override
  String get orderPickedUp => 'Your order has been picked up for delivery';

  @override
  String get orderArrivingSoon => 'Order arriving soon!';

  @override
  String get estimatedDeliveryTime => 'ESTIMATED DELIVERY TIME';

  @override
  String estimatedMinutes(String minutes) {
    return '$minutes min';
  }

  @override
  String orderedAt(String date) {
    return 'Orderd At $date';
  }

  @override
  String get courier => 'Courier';

  @override
  String get noNotificationsYet => 'No notifications yet';

  @override
  String unreadNotificationsCount(int count) {
    return '$count unread notifications';
  }

  @override
  String get noNotifications => 'No notifications';

  @override
  String get notifications => 'Notifications';

  @override
  String get markAllAsRead => 'Mark all as read';

  @override
  String get clearAllNotifications => 'Clear all';

  @override
  String get allTab => 'All';

  @override
  String get unread => 'Unread';

  @override
  String get preferences => 'PREFERENCES';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get themes => 'Themes';

  @override
  String get settings => 'Settings';

  @override
  String get versionInfoNotAvailable => 'Version info not available';

  @override
  String get faqs => 'FAQs';

  @override
  String get orderFaq => 'Order';

  @override
  String get paymentsFaq => 'Payments';

  @override
  String get deliveryFaq => 'Delivery';

  @override
  String get chat => 'Chat';

  @override
  String get call => 'Call';

  @override
  String get howTrackOrder => 'How do I track my order?';

  @override
  String get canCancelOrder => 'Can I cancel my order?';

  @override
  String get whatIfOrderDelayed => 'What if my order is delayed?';

  @override
  String get whatPaymentMethodsAccepted => 'What payment methods are accepted?';

  @override
  String get isCardSafeBite =>
      'Is it safe to use my credit/debit card on Bite?';

  @override
  String get canUseMultiplePaymentMethods =>
      'Can I use multiple payment methods for one order?';

  @override
  String get whatIfPaymentFails => 'What should I do if a payment fails?';

  @override
  String get whatDeliveryHours => 'What are your delivery hours?';

  @override
  String get chargeDeliveryFee => 'Do you charge a delivery fee?';

  @override
  String get deliverToLocation => 'Do you deliver to my location?';

  @override
  String get scheduleDeliveryLater =>
      'Can I schedule a delivery for a later time?';

  @override
  String get clear => 'CLEAR';

  @override
  String get applyFilter => 'APPLY';

  @override
  String get ratingFilter => 'RATING';

  @override
  String get lessThan3_5 => '< 3.5';

  @override
  String get between3_5And4_0 => '3.5 - 4.0';

  @override
  String get greaterThan4_0 => '> 4.0';

  @override
  String get deliveryTimeFilter => 'DELIVERY TIME';

  @override
  String get lessThan15Min => '< 15 min';

  @override
  String get between15And30Min => '15 - 30 min';

  @override
  String get greaterThan30Min => '> 30 min';

  @override
  String get filterYourSearch => 'Filter your search';

  @override
  String get seeAll => 'See All';

  @override
  String enterField(String field) {
    return 'Enter $field';
  }

  @override
  String pleaseEnterField(String field) {
    return 'Please enter $field';
  }

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email address';

  @override
  String get pleaseEnterValidPhone => 'Please enter a valid phone number';

  @override
  String get passwordMinimum8Chars =>
      'Password must be at least 8 characters long';

  @override
  String get favorites => 'Favorites';

  @override
  String get reviews => 'Reviews';

  @override
  String get updateAvailable => 'Update Available';

  @override
  String get newBiteVersionReady => 'A new version of Bite is ready!';

  @override
  String updateDescription(String version) {
    return 'Version $version includes new features, performance improvements, and bug fixes.';
  }

  @override
  String versionPrefix(String version) {
    return 'v$version';
  }

  @override
  String get updateNow => 'Update Now';

  @override
  String get maybeLater => 'Maybe Later';

  @override
  String errorMessage(String message) {
    return 'Error: $message';
  }
}
