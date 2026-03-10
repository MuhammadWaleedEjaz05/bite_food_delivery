// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get trackOrder => 'ﺐﻠﻄﻟﺍ ﻊﺒﺘﺗ';

  @override
  String get locationPermissionIsRequired => 'ﻊﻗﻮﻤﻟﺍ ﻥﺫﺇ ﺏﻮﻠﻄﻣ';

  @override
  String errorStatemessage(Object stateMessage) {
    return '\$$stateMessage :ﺄﻄﺧ';
  }

  @override
  String get address => 'ﻥﺍﻮﻨﻋ';

  @override
  String get streetNo => 'ﻉﺭﺎﺸﻟﺍ ﻢﻗﺭ';

  @override
  String get zipCode => 'ﻱﺪﻳﺮﺒﻟﺍ ﺰﻣﺮﻟﺍ';

  @override
  String get city => 'ﺔﻨﻳﺪﻣ';

  @override
  String get country => 'ﺔﻟﻭﺩ';

  @override
  String get label => 'ﻖﺼﻠﻣ';

  @override
  String get home => 'ﺖﻴﺑ';

  @override
  String get work => 'ﻞﻤﻋ';

  @override
  String get other => 'ﺮﺧﺁ';

  @override
  String get pleaseFillAllRequiredFields => 'ﺔﺑﻮﻠﻄﻤﻟﺍ ﻝﻮﻘﺤﻟﺍ ﺔﻓﺎﻛ ءﻞﻣ ﻰﺟﺮﻳ';

  @override
  String get userNotAuthenticated => 'ﻡﺪﺨﺘﺴﻤﻟﺍ ﺔﻗﺩﺎﺼﻣ ﻢﺘﺗ ﻢﻟ';

  @override
  String get addressAddedSuccessfully => '!ﺡﺎﺠﻨﺑ ﻥﺍﻮﻨﻌﻟﺍ ﺔﻓﺎﺿﺇ ﺖﻤﺗ';

  @override
  String failedToAddAddressError(Object error) {
    return '\$$error :ﻥﺍﻮﻨﻌﻟﺍ ﺔﻓﺎﺿﺇ ﺖﻠﺸﻓ';
  }

  @override
  String get save => 'ﻆﻔﺤﻳ';

  @override
  String get addAddress => 'ﻥﺍﻮﻨﻋ ﺔﻓﺎﺿﺇ';

  @override
  String get failedToLoadAddresses => 'ﻦﻳﻭﺎﻨﻌﻟﺍ ﻞﻴﻤﺤﺗ ﻞﺸﻓ';

  @override
  String get noSavedAddressesYet => 'ﻥﻵ﻿ﺍ ﻰﺘﺣ ﺔﻇﻮﻔﺤﻣ ﻦﻳﻭﺎﻨﻋ ﺪﺟﻮﺗ ﻻ';

  @override
  String get pleaseSignInToViewAddresses => 'ﻦﻳﻭﺎﻨﻌﻟﺍ ﺽﺮﻌﻟ ﻝﻮﺧﺪﻟﺍ ﻞﻴﺠﺴﺗ ءﺎﺟﺮﻟﺍ';

  @override
  String get deliveryAddress2 => 'ﻢﻴﻠﺴﺘﻟﺍ ﻥﺍﻮﻨﻋ';

  @override
  String get edit2 => 'ﺭﺮﺤﻳ';

  @override
  String get selectAnAddress => 'ﺎﻧﺍﻮﻨﻋ ﺩﺪﺣ';

  @override
  String get total2 => ': ﻉﻮﻤﺠﻤﻟﺍ';

  @override
  String get checkout2 => 'ﻊﻓﺪﻟﺍ';

  @override
  String get yourCartIsEmpty => 'ﺔﻏﺭﺎﻓ ﻚﺑ ﺔﺻﺎﺨﻟﺍ ﻕﻮﺴﺘﻟﺍ ﺔﻠﺳ';

  @override
  String get cart => 'ﺔﺑﺮﻋ';

  @override
  String get allCategories => 'ﺕﺎﺌﻔﻟﺍ ﻊﻴﻤﺟ';

  @override
  String get openRestaurants => 'ﺔﺣﻮﺘﻔﻤﻟﺍ ﻢﻋﺎﻄﻤﻟﺍ';

  @override
  String get clear2 => 'ﺢﺿﺍﻭ';

  @override
  String get apply2 => 'ﻡﺪﻘﺘﻳ';

  @override
  String get rating2 => 'ﻒﻴﻨﺼﺗ';

  @override
  String get deliveryTime2 => 'ﻢﻴﻠﺴﺘﻟﺍ ﺪﻋﻮﻣ';

  @override
  String get filterYourSearch => 'ﻚﺜﺤﺑ ﺔﻴﻔﺼﺗ';

  @override
  String get checkout => 'ﻊﻓﺪﻟﺍ';

  @override
  String get deliveryAddress => 'ﻢﻴﻠﺴﺘﻟﺍ ﻥﺍﻮﻨﻋ';

  @override
  String get change => 'ﺮﻴﻐﺘﻳ';

  @override
  String get noAddressSelected => 'ﻥﺍﻮﻨﻋ ﺪﻳﺪﺤﺗ ﻢﺘﻳ ﻢﻟ';

  @override
  String get orderItems => 'ﺐﻠﻄﻟﺍ ﺮﺻﺎﻨﻋ';

  @override
  String get paymentMethod => 'ﻊﻓﺪﻟﺍ ﺔﻘﻳﺮﻃ';

  @override
  String get orderSummary => 'ﺐﻠﻄﻟﺍ ﺺﺨﻠﻣ';

  @override
  String get subtotal => 'ﻲﻋﺮﻔﻟﺍ ﻉﻮﻤﺠﻤﻟﺍ';

  @override
  String get deliveryFee => 'ﻞﻴﺻﻮﺘﻟﺍ ﻡﻮﺳﺭ';

  @override
  String get platformFee => 'ﺔﺼﻨﻤﻟﺍ ﻡﻮﺳﺭ';

  @override
  String get total => 'ﻉﻮﻤﺠﻤﻟﺍ';

  @override
  String get orderPlaced => '!ﺐﻠﻄﻟﺍ ﻢﻳﺪﻘﺗ ﻢﺗ';

  @override
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime =>
      '.ﻲﻠﻌﻔﻟﺍ ﺖﻗﻮﻟﺍ ﻲﻓ ﻚﺒﻠﻃ ﻊﺒﺘﺗ\\n.ﺡﺎﺠﻨﺑ ﻚﺒﻠﻃ ﻢﻳﺪﻘﺗ ﻢﺗ ﺪﻘﻟ';

  @override
  String get backToHome => 'ﻝﺰﻨﻤﻟﺍ ﻰﻟﺇ ﺓﺩﻮﻌﻟﺍ';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return '\$$errorMessage :ﻊﻓﺪﻟﺍ ﻞﺸﻓ';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return '\$$grandTotal ﺔﻴﻧﺎﺘﺴﻛﺎﺑ ﺔﻴﺑﻭﺭ • ﻊﻓﺪﻟﺍ ﺪﻴﻛﺄﺗ';
  }

  @override
  String get paysWhenOrderArrives => 'ﺐﻠﻄﻟﺍ ﻝﻮﺻﻭ ﺪﻨﻋ ﻊﻓﺪﻳ';

  @override
  String get noCardDetails => 'ﺔﻗﺎﻄﺒﻟﺍ ﻞﻴﺻﺎﻔﺗ ﺪﺟﻮﺗ ﻻ';

  @override
  String get faqs => 'ﺔﻌﺋﺎﺸﻟﺍ ﺔﻠﺌﺳﻷ﻿ﺍ';

  @override
  String get delivery => 'ﻞﻴﺻﻮﺗ';

  @override
  String get payments => 'ﺕﺎﻋﻮﻓﺪﻤﻟﺍ';

  @override
  String get order => 'ﺐﻠﻃ';

  @override
  String get chat => 'ﺔﺛﺩﺎﺤﻣ';

  @override
  String get call => 'ﻞﺼﺘﻳ';

  @override
  String get email => 'ﻲﻧﻭﺮﺘﻜﻟﺇ ﺪﻳﺮﺑ';

  @override
  String get noFavouriteRestaurantsFound =>
      '.ﺔﻠﻀﻔﻤﻟﺍ ﻢﻋﺎﻄﻤﻟﺍ ﻰﻠﻋ ﺭﻮﺜﻌﻟﺍ ﻢﺘﻳ ﻢﻟ';

  @override
  String get noFavouriteFoodsFound => '.ﺔﻠﻀﻔﻤﻟﺍ ﺔﻤﻌﻃﻷ﻿ﺍ ﻰﻠﻋ ﺭﻮﺜﻌﻟﺍ ﻢﺘﻳ ﻢﻟ';

  @override
  String get foods => 'ﺔﻤﻌﻃﻷ﻿ﺍ';

  @override
  String get restaurants => 'ﻢﻋﺎﻄﻣ';

  @override
  String get removeFromFavourites => 'ﺔﻠﻀﻔﻤﻟﺍ ﻦﻣ ﺔﻟﺍﺯﺇ';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      '؟ﻚﻳﺪﻟ ﺔﻠﻀﻔﻤﻟﺍ ﻦﻣ ﻲﺋﺍﺬﻐﻟﺍ ﺮﺼﻨﻌﻟﺍ ﺍﺬﻫ ﺔﻟﺍﺯﺇ ﺪﻳﺮﺗ ﻚﻧﺃ ﺪﻛﺄﺘﻣ ﺖﻧﺃ ﻞﻫ';

  @override
  String get cancel => 'ﻲﻐﻠﻳ';

  @override
  String get remove => 'ﻞﻳﺰﻳ';

  @override
  String get orderAgain => 'ﻯﺮﺧﺃ ﺓﺮﻣ ﺐﻠﻃﺍ';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      '؟ﻚﻳﺪﻟ ﺔﻠﻀﻔﻤﻟﺍ ﻦﻣ ﻢﻌﻄﻤﻟﺍ ﺍﺬﻫ ﺔﻟﺍﺯﺇ ﺪﻳﺮﺗ ﻚﻧﺃ ﺪﻛﺄﺘﻣ ﺖﻧﺃ ﻞﻫ';

  @override
  String get removeFromCart => 'ﺔﺑﺮﻌﻟﺍ ﻦﻣ ﺔﻟﺍﺯﺇ';

  @override
  String get addToCart => 'ﺔﻠﺴﻟﺍ ﻰﻟﺇ ﻒﺿﺃ';

  @override
  String get chooseYourFlavor => 'ﻚﺘﻬﻜﻧ ﺮﺘﺧﺍ';

  @override
  String get chooseYourSize => 'ﻚﺑ ﺹﺎﺨﻟﺍ ﻢﺠﺤﻟﺍ ﺮﺘﺧﺍ';

  @override
  String get passwordResetLinkSent => 'ﺭﻭﺮﻤﻟﺍ ﺔﻤﻠﻛ ﻦﻴﻴﻌﺗ ﺓﺩﺎﻋﺇ ﻂﺑﺍﺭ ﻝﺎﺳﺭﺇ ﻢﺗ';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      '.ﺎﻨﻌﻗﻮﻣ ﻰﻠﻋ ﻚﺑ ﺔﺻﺎﺨﻟﺍ ﺭﻭﺮﻤﻟﺍ ﺔﻤﻠﻛ ﻦﻴﻴﻌﺗ ﺓﺩﺎﻋﻹ﻿ ﻂﺑﺍﺮﻟﺍ ﻕﻮﻓ ﺮﻘﻧﺍ .ﺭﻭﺮﻤﻟﺍ ﺔﻤﻠﻛ ﻦﻴﻴ';

  @override
  String get passwordResetSuccessfully =>
      '.ﻚﺑ ﺔﺻﺎﺨﻟﺍ ﺓﺪﻳﺪﺠﻟﺍ ﺭﻭﺮﻤﻟﺍ ﺔﻤﻠﻛ ﻡﺍﺪﺨﺘﺳﺎﺑ ﻝﻮﺧﺪﻟﺍ ﻞﻴﺠﺴﺗ ءﺎﺟﺮﻟﺍ !ﺡﺎﺠﻨﺑ ﺭﻭﺮﻤﻟﺍ ﺔﻤﻠﻛ';

  @override
  String get done => 'ﻲﻬﺘﻨﻣ';

  @override
  String get sendResetLink => 'ﻂﺒﻀﻟﺍ ﺓﺩﺎﻋﺇ ﻂﺑﺍﺭ ﻞﺳﺭﺃ';

  @override
  String get forgotPassword => 'ﺮﺴﻟﺍ ﺔﻤﻠﻛ ﺖﻴﺴﻧ ﻞﻫ';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      '.ﺭﻭﺮﻤﻟﺍ ﺔﻤﻠﻛ ﻦﻴﻴﻌﺗ ﺓﺩﺎﻋﺇ ﻂﺑﺍﺭ ﻲﻘﻠﺘﻟ ﻲﻧﻭﺮﺘﻜﻟﻹ﻿ﺍ ﻙﺪﻳﺮﺑ ﻥﺍﻮﻨﻋ ﻝﺎﺧﺩﺇ ءﺎﺟﺮﻟﺍ';

  @override
  String get or => 'ﻭﺃ';

  @override
  String get successfullySignedInWithGoogle =>
      '!Google ﻡﺍﺪﺨﺘﺳﺎﺑ ﺡﺎﺠﻨﺑ ﻝﻮﺧﺪﻟﺍ ﻞﻴﺠﺴﺗ ﻢﺗ';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'خطأ تسجيل الدخول إلى Google: \$$stateMessage';
  }

  @override
  String get dontHaveAnAccount => '؟ﺏﺎﺴﺣ ﻚﻳﺪﻟ ﺲﻴﻟ';

  @override
  String get signUp => 'ﻙﺍﺮﺘﺷﺍ';

  @override
  String get login => 'ﻝﻮﺧﺪﻟﺍ ﻞﻴﺠﺴﺗ';

  @override
  String get rememberMe => 'ﻰﻧﺮﻛﺬﺗ';

  @override
  String get password => 'ﺭﻭﺮﻤﻟﺍ ﺔﻤﻠﻛ';

  @override
  String get logIn => 'ﻝﻮﺧﺪﻟﺍ ﻞﻴﺠﺴﺗ';

  @override
  String get pleaseSignInToContinue => 'ﺔﻌﺑﺎﺘﻤﻠﻟ ﻝﻮﺧﺪﻟﺍ ﻞﻴﺠﺴﺗ ءﺎﺟﺮﻟﺍ';

  @override
  String get noNotificationsYet => 'ﻥﻵ﻿ﺍ ﻰﺘﺣ ﺕﺍﺭﺎﻄﺧﺇ ﺪﺟﻮﺗ ﻻ';

  @override
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return '\$$unreadCount ﺓءﻭﺮﻘﻤﻟﺍ ﺮﻴﻏ ﺕﺍﺭﺎﻌﺷﻹ﻿ﺍ';
  }

  @override
  String allNotifications(Object totalCount) {
    return '(\$$totalCount) ﻞﻜﻟﺍ';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return '(\$$unreadCount) ﺓءﻭﺮﻘﻣ ﺮﻴﻏ';
  }

  @override
  String get notifications => 'ﺕﺍﺭﺎﻌﺷﺇ';

  @override
  String get clearAllNotifications => 'ﺕﺍﺭﺎﻄﺧﻹ﻿ﺍ ﺔﻓﺎﻛ ﺢﺴﻣ';

  @override
  String get deleteAllNotificationsConfirmation =>
      '.ءﺍﺮﺟﻹ﻿ﺍ ﺍﺬﻫ ﻦﻋ ﻊﺟﺍﺮﺘﻟﺍ ﻦﻜﻤﻳ ﻻ﻿ ؟ﺕﺍﺭﺎﻄﺧﻹ﻿ﺍ ﺔﻓﺎﻛ ﻑﺬﺣ ﺪﻳﺮﺗ ﻚﻧﺃ ﺪﻛﺄﺘﻣ ﺖﻧﺃ ﻞﻫ';

  @override
  String get markAllAsRead => 'ﺓءﻭﺮﻘﻤﻛ ﻞﻜﻟﺍ ﻰﻠﻋ ﺔﻣﻼ﻿ﻋ ﻊﺿﻭ';

  @override
  String get clearAll => 'ﻞﻜﻟﺍ ﺢﺴﻣ';

  @override
  String get allYourFavorites => 'ﻚﻳﺪﻟ ﺔﻠﻀﻔﻤﻟﺍ ﻊﻴﻤﺟ';

  @override
  String get getAllYourLovedFoodsInOnePlace =>
      'ﻲﻗﺎﺒﻟﺎﺑ ﻡﻮﻘﻧ ﻦﺤﻧﻭ ﺐﻠﻄﻟﺍ ﻢﻳﺪﻘﺗ ﻯﻮﺳ ﻚﻴﻠﻋ ﺎﻣ ،ﺪﺣﺍﻭ ﻥﺎﻜﻣ ﻲﻓ ﺎﻬﺒﺤﺗ ﻲﺘﻟﺍ ﺔﻤﻌﻃﻷ﻿ﺍ ﻊﻴﻤﺟ';

  @override
  String get orderFromChoosenChef => 'ﺭﺎﺘﺨﻤﻟﺍ ﻒﻴﺸﻟﺍ ﻦﻣ ﺐﻠﻄﻟﺍ';

  @override
  String get freeDeliveryOffers => 'ﻲﻧﺎﺠﻤﻟﺍ ﻞﻴﺻﻮﺘﻟﺍ ﺽﻭﺮﻋ';

  @override
  String get getStarted => 'ﺃﺪﺑﺍ';

  @override
  String get next => 'ﻲﻟﺎﺘﻟﺍ';

  @override
  String get skip => 'ﻰﻄﺨﺘﻳ';

  @override
  String get orderCancelledSuccessfully => 'ﺡﺎﺠﻨﺑ ﺐﻠﻄﻟﺍ ءﺎﻐﻟﺇ ﻢﺗ';

  @override
  String get noOngoingOrders => 'ﺓﺮﻤﺘﺴﻣ ﺮﻣﺍﻭﺃ ﺪﺟﻮﺗ ﻻ';

  @override
  String get noOrderHistory => 'ﻡﺎﻈﻨﻟﺍ ﺦﻳﺭﺎﺗ ﺪﺟﻮﻳ ﻻ';

  @override
  String get orderHistory => 'ﺐﻠﻄﻟﺍ ﺦﻳﺭﺎﺗ';

  @override
  String get clearOrderHistory => 'ﺐﻠﻄﻟﺍ ﻞﺠﺳ ﺢﺴﻣ';

  @override
  String get areYouSureYouWantToDeleteAllOrderHistory =>
      '.ءﺍﺮﺟﻹ﻿ﺍ ﺍﺬﻫ ﻦﻋ ﻊﺟﺍﺮﺘﻟﺍ ﻦﻜﻤﻳ ﻻ﻿ ؟ﻞﻣﺎﻜﻟﺎﺑ ﺕﺎﺒﻠﻄﻟﺍ ﻞﺠﺳ ﻑﺬﺣ ﺪﻳﺮﺗ ﻚﻧﺃ ﺪﻛﺄﺘﻣ ﺖﻧﺃ ﻞﻫ';

  @override
  String get noCompletedOrdersYet => 'ﻥﻵ﻿ﺍ ﻰﺘﺣ ﺔﻠﻤﺘﻜﻣ ﺮﻣﺍﻭﺃ ﺪﺟﻮﺗ ﻻ';

  @override
  String get rate => 'ﻝﺪﻌﻣ';

  @override
  String get cancelOrder => 'ﺐﻠﻄﻟﺍ ءﺎﻐﻟﺇ';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      '؟ﺐﻠﻄﻟﺍ ﺍﺬﻫ ءﺎﻐﻟﺇ ﺪﻳﺮﺗ ﻚﻧﺃ ﺪﻛﺄﺘﻣ ﺖﻧﺃ ﻞﻫ';

  @override
  String get yesCancel => 'ءﺎﻐﻟﺇ ،ﻢﻌﻧ';

  @override
  String get reorder => 'ﺐﻴﺗﺮﺘﻟﺍ ﺓﺩﺎﻋﺇ';

  @override
  String get cardInformation => 'ﺔﻗﺎﻄﺒﻟﺍ ﺕﺎﻣﻮﻠﻌﻣ';

  @override
  String get cardNumberIsRequired => 'ﺏﻮﻠﻄﻣ ﺔﻗﺎﻄﺒﻟﺍ ﻢﻗﺭ';

  @override
  String get cardNumberIsTooShort => 'ﺍﺪًﺟ ﺮﻴﺼﻗ ﺔﻗﺎﻄﺒﻟﺍ ﻢﻗﺭ';

  @override
  String get required => 'ﺏﻮﻠﻄﻣ';

  @override
  String get invalidMonth => 'ﺢﻟﺎﺻ ﺮﻴﻏ ﺮﻬﺷ';

  @override
  String get invalidCvc => 'ﺢﻟﺎﺻ ﺮﻴﻏ (CVC) ﺔﻗﺎﻄﺒﻟﺍ ﻦﻣ ﻖﻘﺤﺘﻟﺍ ﺰﻣﺭ';

  @override
  String get cvc => 'ﺔﻗﺎﻄﺒﻟﺍ ﻦﻣ ﻖﻘﺤﺘﻟﺍ ﺰﻣﺭ';

  @override
  String get cardHolder => 'ﺔﻗﺎﻄﺒﻟﺍ ﻞﻣﺎﺣ';

  @override
  String get fullNameOnCard => 'ﺔﻗﺎﻄﺒﻟﺍ ﻰﻠﻋ ﻞﻣﺎﻜﻟﺍ ﻢﺳﻻ﻿ﺍ';

  @override
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever =>
      '.ﻞﻣﺎﻜﻟﺎﺑ ﻚﺘﻗﺎﻄﺑ ﻢﻗﺭ ﻦﻳﺰﺨﺘﺑ ﺍﺪًﺑﺃ ﻡﻮﻘﻧ ﻻ﻿ ﻦﺤﻧ .Stripe ﺔﻄﺳﺍﻮﺑ ﻦﻣﺁ ﻞﻜﺸﺑ ﻚﺘﻗﺎﻄﺑ ﻞﻴﺻﺎ';

  @override
  String get adding => '...ﺔﻓﺎﺿﻹ﻿ﺍ ﺭٍﺎﺟ';

  @override
  String get addCard => 'ﺔﻗﺎﻄﺑ ﻒﺿﺃ';

  @override
  String get selectPaymentMethod => 'ﻊﻓﺪﻟﺍ ﺔﻘﻳﺮﻃ ﺩﺪﺣ';

  @override
  String get cashOnDelivery => 'ﻢﻴﻠﺴﺘﻟﺍ ﺪﻨﻋ ﻊﻓﺪﻟﺍ';

  @override
  String get payWhenYourOrderArrives => 'ﻚﺒﻠﻃ ﻝﻮﺻﻭ ﺪﻨﻋ ﻊﻓﺩﺍ';

  @override
  String get cashOnDeliverySelected => 'ﻡﻼ﻿ﺘﺳﻻ﻿ﺍ ﺪﻨﻋ ﻊﻓﺪﻟﺍ ﺭﺎﻴﺘﺧﺍ ﻢﺗ';

  @override
  String get visa => 'ﺍﺰﻴﻓ';

  @override
  String get selectFromYourSavedVisaCards =>
      'ﻚﺑ ﺔﺻﺎﺨﻟﺍ ﺔﻇﻮﻔﺤﻤﻟﺍ ﺍﺰﻴﻓ ﺕﺎﻗﺎﻄﺑ ﻦﻣ ﺮﺘﺧﺍ';

  @override
  String get mastercard => 'ﺩﺭﺎﻛ ﺮﺘﺳﺎﻣ';

  @override
  String get selectFromYourSavedMastercards =>
      'ﻚﺑ ﺔﺻﺎﺨﻟﺍ ﺔﻇﻮﻔﺤﻤﻟﺍ Mastercard ﺕﺎﻗﺎﻄﺑ ﻦﻣ ﺮﺘﺧﺍ';

  @override
  String get savedCards => 'ﺔﻇﻮﻔﺤﻤﻟﺍ ﺕﺎﻗﺎﻄﺒﻟﺍ';

  @override
  String get creditCardAddedSuccessfully => 'ﺡﺎﺠﻨﺑ ﻥﺎﻤﺘﺋﻻ﻿ﺍ ﺔﻗﺎﻄﺑ ﺔﻓﺎﺿﺇ ﺖﻤﺗ';

  @override
  String get creditCardDeletedSuccessfully => 'ﺡﺎﺠﻨﺑ ﻥﺎﻤﺘﺋﻻ﻿ﺍ ﺔﻗﺎﻄﺑ ﻑﺬﺣ ﻢﺗ';

  @override
  String get failedToLoadCards => 'ﺕﺎﻗﺎﻄﺒﻟﺍ ﻞﻴﻤﺤﺗ ﻞﺸﻓ';

  @override
  String get noSavedCardsYet => 'ﻥﻵ﻿ﺍ ﻰﺘﺣ ﺔﻇﻮﻔﺤﻣ ﺕﺎﻗﺎﻄﺑ ﺪﺟﻮﺗ ﻻ';

  @override
  String get addACardBelowToGetStarted => 'ءﺪﺒﻠﻟ ﻩﺎﻧﺩﺃ ﺔﻗﺎﻄﺑ ﻒﺿﺃ';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return '\$$last4 ـﺑ ﻲﻬﺘﻨﺗ ﻲﺘﻟﺍ ﺔﻗﺎﻄﺒﻟﺍ ﺪﻳﺪﺤﺗ ﻢﺗ';
  }

  @override
  String get addNewCard => 'ﺓﺪﻳﺪﺟ ﺔﻗﺎﻄﺑ ﺔﻓﺎﺿﺇ';

  @override
  String get personalInfo => 'ﺔﻴﺼﺨﺸﻟﺍ ﺕﺎﻣﻮﻠﻌﻤﻟﺍ';

  @override
  String get guestUser => 'ﻒﻴﺿ ﻡﺪﺨﺘﺴﻣ';

  @override
  String get pleaseLoginToViewYourProfile =>
      'ﻚﺑ ﺹﺎﺨﻟﺍ ﻒﻳﺮﻌﺘﻟﺍ ﻒﻠﻣ ﺽﺮﻌﻟ ﻝﻮﺧﺪﻟﺍ ﻞﻴﺠﺴﺗ ءﺎﺟﺮﻟﺍ';

  @override
  String editTitle(Object title) {
    return '\$$title ﺮﻳﺮﺤﺗ';
  }

  @override
  String get apply => 'ﻡﺪﻘﺘﻳ';

  @override
  String get logout => 'ﺝﻭﺮﺨﻟﺍ ﻞﻴﺠﺴﺗ';

  @override
  String get signup => 'ﻙﺍﺮﺘﺷﺍ';

  @override
  String get profile => 'ﻲﻔﻳﺮﻌﺗ ﺏﺎﺴﺣ';

  @override
  String get allRestaurants => 'ﻢﻋﺎﻄﻤﻟﺍ ﻊﻴﻤﺟ';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      '.ﻖﺣﻻ﻿ ﺖﻗﻭ ﻲﻓ ﻯﺮﺧﺃ ﺓﺮﻣ ﺔﻟﻭﺎﺤﻤﻟﺍ ﻰﺟﺮﻳ .ﺔﻴﺋﺍﺬﻐﻟﺍ ﺩﺍﻮﻤﻟﺍ ﻞﻴﻤﺤﺗ ﻲﻓ ﻞﺸﻓ';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      '.ﺔﺌﻔﻟﺍ ﻩﺬﻬﻟ ﺔﺣﺎﺘﻣ ﺔﻴﺋﺍﺬﻏ ﺩﺍﻮﻣ ﺪﺟﻮﺗ ﻻ';

  @override
  String get myReviews => 'ﻲﺗﺎﻘﻴﻠﻌﺗ';

  @override
  String get popularRestaurants => 'ﺔﻴﺒﻌﺷ ﻢﻋﺎﻄﻣ';

  @override
  String get noPopularRestaurantsFound => 'ﺔﻴﺒﻌﺷ ﻢﻋﺎﻄﻣ ﻰﻠﻋ ﺭﻮﺜﻌﻟﺍ ﻢﺘﻳ ﻢﻟ';

  @override
  String get recentKeywords => 'ﺓﺮﻴﺧﻷ﻿ﺍ ﺔﻴﺴﻴﺋﺮﻟﺍ ﺕﺎﻤﻠﻜﻟﺍ';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return 'ﺓﺮﻴﺧﻷ﻿ﺍ ﺚﺤﺒﻟﺍ ﺕﺎﻴﻠﻤﻋ ﻰﻟﺇ \"\$$search\" ﺔﻓﺎﺿﺇ ﺖﻤﺗ';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return 'ﺓﺮﻴﺧﻷ﻿ﺍ ﺚﺤﺒﻟﺍ ﺕﺎﻴﻠﻤﻋ ﻦﻣ \"\$$search\" ﺔﻟﺍﺯﺇ ﺖﻤﺗ';
  }

  @override
  String get noRecentSearches => 'ﺔﺜﻳﺪﺣ ﺚﺤﺑ ﺕﺎﻴﻠﻤﻋ ﺪﺟﻮﺗ ﻻ';

  @override
  String get search => 'ﺚﺤﺒﻳ';

  @override
  String get preferences2 => 'ﺕﻼ﻿ﻴﻀﻔﺘﻟﺍ';

  @override
  String get darkMode => 'ﻢﻠﻈﻤﻟﺍ ﻊﺿﻮﻟﺍ';

  @override
  String get language => 'ﺔﻐﻟ';

  @override
  String get themes => 'ﻊﻴﺿﺍﻮﻤﻟﺍ';

  @override
  String get versionInfoNotAvailable => 'ﺓﺮﻓﻮﺘﻣ ﺮﻴﻏ ﺭﺍﺪﺻﻹ﻿ﺍ ﺕﺎﻣﻮﻠﻌﻣ';

  @override
  String get settings => 'ﺕﺍﺩﺍﺪﻋﺇ';

  @override
  String get fullName => 'ﻞﻣﺎﻜﻟﺍ ﻢﺳﻻ﻿ﺍ';

  @override
  String get phoneNumber => 'ﻥﻮﻔﻴﻠﺘﻟﺍ ﻢﻗﺭ';

  @override
  String get confirmPassword => 'ﺭﻭﺮﻤﻟﺍ ﺔﻤﻠﻛ ﺪﻴﻛﺄﺗ';

  @override
  String get pleaseSignUpToGetStarted => 'ءﺪﺒﻠﻟ ﻞﻴﺠﺴﺘﻟﺍ ﻰﺟﺮﻳ';

  @override
  String get noActiveOrder => 'ﻂﺸﻧ ﺮﻣﺃ ﺪﺟﻮﻳ ﻻ';

  @override
  String get yourOrderHasBeenDelivered => '!ﻚﺒﻠﻃ ﻢﻴﻠﺴﺗ ﻢﺗ ﺪﻘﻟ';

  @override
  String callingphonenumber(Object phoneNumber) {
    return '...\$$phoneNumber ـﺑ ﻝﺎﺼﺗﻻ﻿ﺍ ﺭٍﺎﺟ';
  }

  @override
  String get locationPermissionDenied => 'ﻊﻗﻮﻤﻟﺍ ﺪﻳﺪﺤﺗ ﻥﺫﺇ ﺾﻓﺭ ﻢﺗ';

  @override
  String get courier => 'ﻲﻋﺎﺳ';

  @override
  String get estimatedDeliveryTime2 => 'ﺭﺪﻘﻤﻟﺍ ﻢﻴﻠﺴﺘﻟﺍ ﺖﻗﻭ';

  @override
  String get yourOrderHasBeenReceived => 'ﻚﺒﻠﻃ ﻡﻼ﻿ﺘﺳﺍ ﻢﺗ ﺪﻘﻟ';

  @override
  String get theRestaurantIsPreparingYourFood => 'ﻚﻣﺎﻌﻃ ﺩﺍﺪﻋﺈﺑ ﻢﻌﻄﻤﻟﺍ ﻡﻮﻘﻳ';

  @override
  String get yourOrderHasBeenPickedUpForDelivery =>
      'ﻢﻴﻠﺴﺘﻠﻟ ﻚﺒﻠﻃ ﻡﻼ﻿ﺘﺳﺍ ﻢﺗ ﺪﻘﻟ';

  @override
  String get orderArrivingSoon => '!ﺎﺒﻳﺮﻗ ﻞﺼﻳ ﺐﻠﻄﻟﺍ';

  @override
  String get selectDeliveryAddress => 'ﻢﻴﻠﺴﺘﻟﺍ ﻥﺍﻮﻨﻋ ﺩﺪﺣ';

  @override
  String get noAddressesFound => 'ﻦﻳﻭﺎﻨﻋ ﻰﻠﻋ ﺭﻮﺜﻌﻟﺍ ﻢﺘﻳ ﻢﻟ';

  @override
  String get pleaseEnterAValidAddress => 'ﺢﻟﺎﺻ ﻥﺍﻮﻨﻋ ﻝﺎﺧﺩﺇ ءﺎﺟﺮﻟﺍ';

  @override
  String get seeAll => 'ﻞﻜﻟﺍ ﺔﻳﺅﺭ';

  @override
  String get searchForRestaurantsOrDishes => 'ﻕﺎﺒﻃﻷ﻿ﺍ ﻭﺃ ﻢﻋﺎﻄﻤﻟﺍ ﻦﻋ ﺚﺤﺒﻟﺍ';

  @override
  String get noRestaurantsFound => 'ﻢﻋﺎﻄﻣ ﻰﻠﻋ ﺭﻮﺜﻌﻟﺍ ﻢﺘﻳ ﻢﻟ';

  @override
  String get updateDialog => 'ﺭﺍﻮﺤﻟﺍ ﺚﻳﺪﺤﺗ';

  @override
  String get updateAvailable => 'ﺡﺎﺘﻣ ﺚﻳﺪﺤﺘﻟﺍ';

  @override
  String get aNewVersionOfBiteIsReady => '!ﺓﺰﻫﺎﺟ Bite ﻦﻣ ﺓﺪﻳﺪﺟ ﺔﺨﺴﻧ';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      '،ﺓﺪﻳﺪﺟ ﺕﺍﺰﻴﻣ \$latestVersion ﺭﺍﺪﺻﻹ﻿ﺍ ﻦﻤﻀﺘﻳ';

  @override
  String get performanceImprovementsAndBugFixes =>
      '.ءﺎﻄﺧﻷ﻿ﺍ ﺕﺎﺣﻼ﻿ﺻﺇﻭ ءﺍﺩﻷ﻿ﺍ ﻲﻓ ﺕﺎﻨﻴﺴﺤﺗ';

  @override
  String get updateNow => 'ﻥﻵ﻿ﺍ ﺚﻳﺪﺤﺘﻟﺍ';

  @override
  String get maybeLater => 'ﻖﺣﻻ﻿ ﺖﻗﻭ ﻲﻓ ﺎﻤﺑﺭ';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return '\$$title ﻝﺎﺧﺩﺇ ءﺎﺟﺮﻟﺍ';
  }

  @override
  String get pleaseEnterAValidEmailAddress =>
      'ﺢﻟﺎﺻ ﻲﻧﻭﺮﺘﻜﻟﺇ ﺪﻳﺮﺑ ﻥﺍﻮﻨﻋ ﻝﺎﺧﺩﺇ ﻰﺟﺮﻳ';

  @override
  String get pleaseEnterAValidPhoneNumber => 'ﺢﻟﺎﺻ ﻒﺗﺎﻫ ﻢﻗﺭ ﻝﺎﺧﺩﺇ ءﺎﺟﺮﻟﺍ';

  @override
  String get passwordMustBeAtLeast8CharactersLong =>
      'ﻞﻗﻷ﻿ﺍ ﻰﻠﻋ ﻑﺮﺣﺃ 8 ﻦﻣ ﺭﻭﺮﻤﻟﺍ ﺔﻤﻠﻛ ﻥﻮﻜﺘﺗ ﻥﺃ ﺐﺠﻳ';

  @override
  String get howDoITrackMyOrder => '؟ﻲﺒﻠﻃ ﻊﺒﺘﺗ ﻲﻨﻨﻜﻤﻳ ﻒﻴﻛ';

  @override
  String get canICancelMyOrder => '؟ﻲﺒﻠﻃ ءﺎﻐﻟﺇ ﻲﻨﻨﻜﻤﻳ ﻞﻫ';

  @override
  String get whatIfMyOrderIsDelayed => '؟ﻲﺒﻠﻃ ﺮﺧﺄﺗ ﻮﻟ ﺍﺫﺎﻣ';

  @override
  String get whatPaymentMethodsAreAccepted => '؟ﺔﻟﻮﺒﻘﻤﻟﺍ ﻊﻓﺪﻟﺍ ﻕﺮﻃ ﻲﻫ ﺎﻣ';

  @override
  String get isItSafeToUseMyCreditdebitCardOnBite =>
      '؟Bite ﻰﻠﻋ ﻲﺑ ﺔﺻﺎﺨﻟﺍ ﻢﺼﺨﻟﺍ/ﻥﺎﻤﺘﺋﻻ﻿ﺍ ﺔﻗﺎﻄﺑ ﻡﺍﺪﺨﺘﺳﺍ ﻦﻣﻵ﻿ﺍ ﻦﻣ ﻞﻫ';

  @override
  String get canIUseMultiplePaymentMethodsForOneOrder =>
      '؟ﺪﺣﺍﻭ ﺐﻠﻄﻟ ﺓﺩﺪﻌﺘﻣ ﻊﻓﺩ ﻕﺮﻃ ﻡﺍﺪﺨﺘﺳﺍ ﻲﻨﻨﻜﻤﻳ ﻞﻫ';

  @override
  String get whatShouldIDoIfAPaymentFails =>
      '؟ﻊﻓﺪﻟﺍ ﺔﻴﻠﻤﻋ ﺖﻠﺸﻓ ﺍﺫﺇ ﻞﻌﻓﺃ ﻥﺃ ﻲﻠﻋ ﺍﺫﺎﻣ';

  @override
  String get whatAreYourDeliveryHours => '؟ﻚﺑ ﺔﺻﺎﺨﻟﺍ ﻢﻴﻠﺴﺘﻟﺍ ﺕﺎﻋﺎﺳ ﻲﻫ ﺎﻣ';

  @override
  String get doYouChargeADeliveryFee => '؟ﻞﻴﺻﻮﺘﻟﺍ ﻡﻮﺳﺭ ﻥﻮﺿﺎﻘﺘﺗ ﻞﻫ';

  @override
  String get doYouDeliverToMyLocation => '؟ﻲﻌﻗﻮﻣ ﻰﻟﺇ ﻞﻴﺻﻮﺘﻟﺎﺑ ﻡﻮﻘﺗ ﻞﻫ';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      '؟ﻖﺣﻻ﻿ ﺖﻗﻭ ﻲﻓ ﻢﻴﻠﺴﺘﻟﺍ ﺔﻟﻭﺪﺟ ﻲﻨﻨﻜﻤﻳ ﻞﻫ';

  @override
  String get ongoing => 'ﺮﻤﺘﺴﻣ';

  @override
  String get history => 'ﺦﻳﺭﺎﺗ';

  @override
  String get favorites => 'ﺔﻠﻀﻔﻤﻟﺍ';

  @override
  String get reviews => 'ﺕﺎﻘﻴﻠﻌﺘﻟﺍ';

  @override
  String get phone => 'ﻒﺗﺎﻫ';
}
