// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get trackOrder => 'Track Order';

  @override
  String get locationPermissionIsRequired => 'Location permission is required';

  @override
  String errorStatemessage(Object stateMessage) {
    return 'Error: $stateMessage';
  }

  @override
  String get address => 'Address';

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
  String get pleaseFillAllRequiredFields => 'Please fill all required fields';

  @override
  String get userNotAuthenticated => 'User not authenticated';

  @override
  String get addressAddedSuccessfully => 'Address added successfully!';

  @override
  String failedToAddAddressError(Object error) {
    return 'Failed to add address: $error';
  }

  @override
  String get save => 'Save';

  @override
  String get addAddress => 'Add Address';

  @override
  String get failedToLoadAddresses => 'Failed to load addresses';

  @override
  String get noSavedAddressesYet => 'No saved addresses yet';

  @override
  String get pleaseSignInToViewAddresses => 'Please sign in to view addresses';

  @override
  String get deliveryAddress2 => 'DELIVERY ADDRESS';

  @override
  String get edit2 => 'EDIT';

  @override
  String get selectAnAddress => 'Select an address';

  @override
  String get total2 => 'TOTAL : ';

  @override
  String get checkout2 => 'CHECKOUT';

  @override
  String get yourCartIsEmpty => 'Your cart is empty';

  @override
  String get cart => 'Cart';

  @override
  String get allCategories => 'All Categories';

  @override
  String get openRestaurants => 'Open Restaurants';

  @override
  String get clear2 => 'CLEAR';

  @override
  String get apply2 => 'APPLY';

  @override
  String get rating2 => 'RATING';

  @override
  String get deliveryTime2 => 'DELIVERY TIME';

  @override
  String get filterYourSearch => 'Filter your search';

  @override
  String get checkout => 'Checkout';

  @override
  String get deliveryAddress => 'Delivery Address';

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
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime =>
      'Your order has been placed successfully.\\nTrack your order in real-time.';

  @override
  String get backToHome => 'Back to Home';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return 'Payment failed: $errorMessage';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return 'Confirm Payment  •  PKR $grandTotal';
  }

  @override
  String get paysWhenOrderArrives => 'Pays When Order Arrives';

  @override
  String get noCardDetails => 'No card details';

  @override
  String get faqs => 'FAQs';

  @override
  String get delivery => 'Delivery';

  @override
  String get payments => 'Payments';

  @override
  String get order => 'Order';

  @override
  String get chat => 'Chat';

  @override
  String get call => 'Call';

  @override
  String get email => 'Email';

  @override
  String get noFavouriteRestaurantsFound => 'No favourite restaurants found.';

  @override
  String get noFavouriteFoodsFound => 'No favourite foods found.';

  @override
  String get foods => 'Foods';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get removeFromFavourites => 'Remove from favourites';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      'Are you sure you want to remove this food item from your favourites?';

  @override
  String get cancel => 'Cancel';

  @override
  String get remove => 'Remove';

  @override
  String get orderAgain => 'Order Again';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      'Are you sure you want to remove this restaurant from your favourites?';

  @override
  String get removeFromCart => 'Remove from cart';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get chooseYourFlavor => 'Choose your flavor';

  @override
  String get chooseYourSize => 'Choose your size';

  @override
  String get passwordResetLinkSent => 'Password Reset Link Sent';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      'Check your email for a password reset link. Click the link to reset your password on our website.';

  @override
  String get passwordResetSuccessfully =>
      'Password reset successfully! Please login with your new password.';

  @override
  String get done => 'Done';

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      'Please enter your email address to receive a password reset link.';

  @override
  String get or => 'Or';

  @override
  String get successfullySignedInWithGoogle =>
      'Successfully signed in with Google!';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'Google Sign-In Error: $stateMessage';
  }

  @override
  String get dontHaveAnAccount => 'Don\\\'t have an account? ';

  @override
  String get signUp => 'Sign Up';

  @override
  String get login => 'Login';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get password => 'Password';

  @override
  String get logIn => 'Log In';

  @override
  String get pleaseSignInToContinue => 'Please Sign In to Continue';

  @override
  String get noNotificationsYet => 'No notifications yet';

  @override
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return '$unreadCount unread notifications';
  }

  @override
  String allNotifications(Object totalCount) {
    return 'All ($totalCount)';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return 'Unread ($unreadCount)';
  }

  @override
  String get notifications => 'Notifications';

  @override
  String get clearAllNotifications => 'Clear All Notifications';

  @override
  String get deleteAllNotificationsConfirmation =>
      'Are you sure you want to delete all notifications? This action cannot be undone.';

  @override
  String get markAllAsRead => 'Mark all as read';

  @override
  String get clearAll => 'Clear all';

  @override
  String get allYourFavorites => 'All your favorites';

  @override
  String get getAllYourLovedFoodsInOnePlace =>
      'Get all your loved foods in one once place,you just place the orer we do the rest';

  @override
  String get orderFromChoosenChef => 'Order from choosen chef';

  @override
  String get freeDeliveryOffers => 'Free delivery offers';

  @override
  String get getStarted => 'Get Started';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get orderCancelledSuccessfully => 'Order cancelled successfully';

  @override
  String get noOngoingOrders => 'No ongoing orders';

  @override
  String get noOrderHistory => 'No order history';

  @override
  String get orderHistory => 'Order History';

  @override
  String get clearOrderHistory => 'Clear Order History';

  @override
  String get areYouSureYouWantToDeleteAllOrderHistory =>
      'Are you sure you want to delete all order history? This action cannot be undone.';

  @override
  String get noCompletedOrdersYet => 'No completed orders yet';

  @override
  String get rate => 'Rate';

  @override
  String get cancelOrder => 'Cancel Order';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      'Are you sure you want to cancel this order?';

  @override
  String get yesCancel => 'Yes, Cancel';

  @override
  String get reorder => 'Reorder';

  @override
  String get cardInformation => 'Card Information';

  @override
  String get cardNumberIsRequired => 'Card number is required';

  @override
  String get cardNumberIsTooShort => 'Card number is too short';

  @override
  String get required => 'Required';

  @override
  String get invalidMonth => 'Invalid month';

  @override
  String get invalidCvc => 'Invalid CVC';

  @override
  String get cvc => 'CVC';

  @override
  String get cardHolder => 'Card Holder';

  @override
  String get fullNameOnCard => 'Full name on card';

  @override
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever =>
      'Your card details are securely handled by Stripe. We never store your full card number.';

  @override
  String get adding => 'Adding...';

  @override
  String get addCard => 'Add Card';

  @override
  String get selectPaymentMethod => 'Select Payment Method';

  @override
  String get cashOnDelivery => 'Cash on Delivery';

  @override
  String get payWhenYourOrderArrives => 'Pay when your order arrives';

  @override
  String get cashOnDeliverySelected => 'Cash on Delivery selected';

  @override
  String get visa => 'Visa';

  @override
  String get selectFromYourSavedVisaCards =>
      'Select from your saved Visa cards';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get selectFromYourSavedMastercards =>
      'Select from your saved Mastercards';

  @override
  String get savedCards => 'Saved Cards';

  @override
  String get creditCardAddedSuccessfully => 'Credit card added successfully';

  @override
  String get creditCardDeletedSuccessfully =>
      'Credit card deleted successfully';

  @override
  String get failedToLoadCards => 'Failed to load cards';

  @override
  String get noSavedCardsYet => 'No saved cards yet';

  @override
  String get addACardBelowToGetStarted => 'Add a card below to get started';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return 'Card ending in $last4 selected';
  }

  @override
  String get addNewCard => 'Add New Card';

  @override
  String get personalInfo => 'Personal Info';

  @override
  String get guestUser => 'Guest User';

  @override
  String get pleaseLoginToViewYourProfile =>
      'Please login to view your profile';

  @override
  String editTitle(Object title) {
    return 'Edit $title';
  }

  @override
  String get apply => 'Apply';

  @override
  String get logout => 'Logout';

  @override
  String get signup => 'SignUp';

  @override
  String get profile => 'Profile';

  @override
  String get allRestaurants => 'All Restaurants';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      'Failed to load food items. Please try again later.';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      'No food items available for this category.';

  @override
  String get myReviews => 'My Reviews';

  @override
  String get popularRestaurants => 'Popular Restaurants';

  @override
  String get noPopularRestaurantsFound => 'No popular restaurants found';

  @override
  String get recentKeywords => 'Recent Keywords';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return 'Added \"$search\" to recent searches';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return 'Removed \"$search\" from recent searches';
  }

  @override
  String get noRecentSearches => 'No recent searches';

  @override
  String get search => 'Search';

  @override
  String get preferences2 => 'PREFERENCES';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get themes => 'Themes';

  @override
  String get versionInfoNotAvailable => 'Version info not available';

  @override
  String get settings => 'Settings';

  @override
  String get fullName => 'Full Name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get pleaseSignUpToGetStarted => 'Please Sign Up to get started';

  @override
  String get noActiveOrder => 'No active order';

  @override
  String get yourOrderHasBeenDelivered => 'Your order has been delivered!';

  @override
  String callingphonenumber(Object phoneNumber) {
    return 'Calling $phoneNumber...';
  }

  @override
  String get locationPermissionDenied => 'Location permission denied';

  @override
  String get courier => 'Courier';

  @override
  String get estimatedDeliveryTime2 => 'ESTIMATED DELIVERY TIME';

  @override
  String get yourOrderHasBeenReceived => 'Your order has been received';

  @override
  String get theRestaurantIsPreparingYourFood =>
      'The restaurant is preparing your food';

  @override
  String get yourOrderHasBeenPickedUpForDelivery =>
      'Your order has been picked up for delivery';

  @override
  String get orderArrivingSoon => 'Order arriving soon!';

  @override
  String get selectDeliveryAddress => 'Select Delivery Address';

  @override
  String get noAddressesFound => 'No addresses found';

  @override
  String get pleaseEnterAValidAddress => 'Please enter a valid address';

  @override
  String get seeAll => 'See All';

  @override
  String get searchForRestaurantsOrDishes => 'Search for restaurants or dishes';

  @override
  String get noRestaurantsFound => 'No restaurants found';

  @override
  String get updateDialog => 'Update Dialog';

  @override
  String get updateAvailable => 'Update Available';

  @override
  String get aNewVersionOfBiteIsReady => 'A new version of Bite is ready!';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      'Version latestVersion includes new features, ';

  @override
  String get performanceImprovementsAndBugFixes =>
      'performance improvements, and bug fixes.';

  @override
  String get updateNow => 'Update Now';

  @override
  String get maybeLater => 'Maybe Later';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return 'Please enter $title';
  }

  @override
  String get pleaseEnterAValidEmailAddress =>
      'Please enter a valid email address';

  @override
  String get pleaseEnterAValidPhoneNumber =>
      'Please enter a valid phone number';

  @override
  String get passwordMustBeAtLeast8CharactersLong =>
      'Password must be at least 8 characters long';

  @override
  String get howDoITrackMyOrder => 'How do I track my order?';

  @override
  String get canICancelMyOrder => 'Can I cancel my order?';

  @override
  String get whatIfMyOrderIsDelayed => 'What if my order is delayed?';

  @override
  String get whatPaymentMethodsAreAccepted =>
      'What payment methods are accepted?';

  @override
  String get isItSafeToUseMyCreditdebitCardOnBite =>
      'Is it safe to use my credit/debit card on Bite?';

  @override
  String get canIUseMultiplePaymentMethodsForOneOrder =>
      'Can I use multiple payment methods for one order?';

  @override
  String get whatShouldIDoIfAPaymentFails =>
      'What should I do if a payment fails?';

  @override
  String get whatAreYourDeliveryHours => 'What are your delivery hours?';

  @override
  String get doYouChargeADeliveryFee => 'Do you charge a delivery fee?';

  @override
  String get doYouDeliverToMyLocation => 'Do you deliver to my location?';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      'Can I schedule a delivery for a later time?';

  @override
  String get ongoing => 'Ongoing';

  @override
  String get history => 'History';

  @override
  String get favorites => 'Favorites';

  @override
  String get reviews => 'Reviews';

  @override
  String get phone => 'Phone';

  @override
  String get addressUpdatedSuccessfully => 'Address updated successfully';

  @override
  String failedToUpdateAddress(Object error) {
    return 'Failed to update address: $error';
  }

  @override
  String get homeDeliverTo => 'Deliver to';

  @override
  String get homeHeadline => 'Something delicious awaits.';

  @override
  String get homeSubtitle => 'Find your next favourite, one bite at a time.';

  @override
  String get browseRestaurants => 'Browse restaurants';

  @override
  String get retryAction => 'Try again';

  @override
  String get catalogLoadFailure => 'We could not load this right now.';

  @override
  String get catalogRefreshFailure =>
      'Your saved results are shown. Refresh to try again.';

  @override
  String get noCategoriesAvailable => 'No categories available yet.';

  @override
  String get noOpenRestaurants => 'No restaurants are open right now.';

  @override
  String deliveryMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get rememberEmail => 'Remember email';

  @override
  String get menuAllItems => 'All items';

  @override
  String get restaurantOpen => 'Open now';

  @override
  String get restaurantClosed => 'Closed';

  @override
  String get itemUnavailable => 'Currently unavailable';

  @override
  String get itemAddedToCart => 'Added to your cart';

  @override
  String get cartAddFailed => 'Could not add this item. Please try again.';

  @override
  String get signInToOrder => 'Sign in to place an order';

  @override
  String get quantityLabel => 'Quantity';

  @override
  String get increaseQuantity => 'Increase quantity';

  @override
  String get decreaseQuantity => 'Decrease quantity';

  @override
  String get catalogMissing => 'This item is no longer available.';

  @override
  String get optionalChoices => 'Optional · choose your favourites';

  @override
  String get savingItem => 'Adding…';

  @override
  String get viewCartAction => 'View cart';

  @override
  String get discoverTab => 'Discover';

  @override
  String get ordersTab => 'Orders';

  @override
  String get accountTab => 'Account';

  @override
  String get discoveryAll => 'All';

  @override
  String get discoveryOpen => 'Open now';

  @override
  String get discoveryCategories => 'All categories';

  @override
  String get discoveryRated => 'Top rated';

  @override
  String get discoveryName => 'Name';

  @override
  String get discoveryDelivery => 'Fastest delivery';

  @override
  String get discoveryReset => 'Reset filters';

  @override
  String get discoveryEmpty =>
      'No matches yet. Try another search or reset your filters.';

  @override
  String get discoveryMore => 'Show more';

  @override
  String get cartChangeFailed =>
      'Your cart could not be updated. Your items are still shown.';

  @override
  String get cartNeedsReview =>
      'Review your cart: use one restaurant and available items with valid quantities.';

  @override
  String get cartEstimate =>
      'Estimated item subtotal. Checkout confirms current prices and delivery fees.';

  @override
  String get checkoutChanged =>
      'Your cart, address or prices changed. Review your total again.';

  @override
  String get checkoutTryAgain =>
      'Checkout could not be completed. Please try again.';

  @override
  String get checkoutCashNote =>
      'Pay cash on delivery. Review the confirmed total before placing your order.';

  @override
  String get checkoutReview => 'Review total';

  @override
  String get payByCard => 'Pay by card';

  @override
  String get resumeCardPayment => 'Resume card payment';

  @override
  String get cancelCardPayment => 'Cancel card payment';

  @override
  String get cardPaymentPending =>
      'Your card payment is pending. Resume it or cancel before changing your cart.';

  @override
  String get paymentAtCheckout =>
      'Choose your payment method at checkout. Card details are collected by Stripe’s secure payment sheet; Bite does not save cards.';

  @override
  String get updateAddress => 'Update Address';

  @override
  String get saveAddress => 'Save Address';

  @override
  String get street => 'Street';

  @override
  String get enterStreet => 'Enter street address';

  @override
  String get enterCity => 'Enter city';

  @override
  String get enterZipCode => 'Enter ZIP code';

  @override
  String get enterCountry => 'Enter country';

  @override
  String get orderReceived => 'Order Received';

  @override
  String get orderReceivedSubtitle =>
      'Your order has been received by the restaurant';

  @override
  String get preparing => 'Preparing Food';

  @override
  String get preparingSubtitle => 'The kitchen is cooking your meal';

  @override
  String get dispatched => 'Out for Delivery';

  @override
  String get dispatchedSubtitle => 'Courier has picked up your food';

  @override
  String get delivered => 'Delivered';

  @override
  String get deliveredSubtitle => 'Order has been delivered safely';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get orderStatus => 'Order Status';

  @override
  String get orderDetails => 'Order Details';

  @override
  String get orderId => 'Order ID';

  @override
  String get orderDate => 'Order Date';

  @override
  String get totalPrice => 'Total Price';

  @override
  String estimatedDeliveryTime(String time) {
    return 'Estimated delivery: $time';
  }

  @override
  String get orderDeliveredSuccessfully =>
      'Your order has been delivered successfully!';

  @override
  String get helpAndSupport => 'Help & Support';

  @override
  String get deliveryRider => 'Delivery Courier';

  @override
  String get review => 'Review';

  @override
  String get noOrdersInHistory => 'No past orders yet';

  @override
  String get writeReview => 'Write a Review';

  @override
  String get rateOrder => 'Rate Order';

  @override
  String get rateRestaurant => 'Rate Restaurant';

  @override
  String get tellUsYourExperience => 'Tell us about your experience...';

  @override
  String get submitReview => 'Submit Review';

  @override
  String get reviewSubmitted => 'Review submitted successfully';

  @override
  String get noReviewsYet => 'No reviews written yet';

  @override
  String get orderRating => 'Order Rating';

  @override
  String get restaurantRating => 'Restaurant Rating';

  @override
  String get feedbackOptional => 'Your feedback helps restaurants improve';
}
