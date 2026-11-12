// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get trackOrder => 'آرڈر ٹریک کریں';

  @override
  String get locationPermissionIsRequired => 'مقام کی اجازت درکار ہے';

  @override
  String errorStatemessage(Object stateMessage) {
    return 'خرابی: $stateMessage';
  }

  @override
  String get address => 'پتہ';

  @override
  String get streetNo => 'سڑک نمبر';

  @override
  String get zipCode => 'زپ کوڈ';

  @override
  String get city => 'شہر';

  @override
  String get country => 'ملک';

  @override
  String get label => 'لیبل';

  @override
  String get home => 'گھر';

  @override
  String get work => 'کام';

  @override
  String get other => 'دیگر';

  @override
  String get pleaseFillAllRequiredFields => 'براہ کرم تمام ضروری فیلڈز بھریں';

  @override
  String get userNotAuthenticated => 'صارف کی تصدیق نہیں ہوئی';

  @override
  String get addressAddedSuccessfully => 'پتہ کامیابی سے شامل کیا گیا!';

  @override
  String failedToAddAddressError(Object error) {
    return 'پتہ شامل کرنے میں ناکام: $error';
  }

  @override
  String get save => 'محفوظ کریں';

  @override
  String get addAddress => 'پتہ شامل کریں';

  @override
  String get failedToLoadAddresses => 'پتے لوڈ کرنے میں ناکام';

  @override
  String get noSavedAddressesYet => 'ابھی کوئی محفوظ پتہ نہیں';

  @override
  String get pleaseSignInToViewAddresses =>
      'پتے دیکھنے کے لیے براہ کرم سائن ان کریں';

  @override
  String get deliveryAddress2 => 'ڈیلیوری پتہ';

  @override
  String get edit2 => 'ترمیم';

  @override
  String get selectAnAddress => 'ایک پتہ منتخب کریں';

  @override
  String get total2 => 'کل: ';

  @override
  String get checkout2 => 'چیک آؤٹ';

  @override
  String get yourCartIsEmpty => 'آپ کی ٹوکری خالی ہے';

  @override
  String get cart => 'ٹوکری';

  @override
  String get allCategories => 'تمام زمرے';

  @override
  String get openRestaurants => 'کھلی ریستورانیں';

  @override
  String get clear2 => 'صاف کریں';

  @override
  String get apply2 => 'استعمال کریں';

  @override
  String get rating2 => 'ریٹنگ';

  @override
  String get deliveryTime2 => 'ڈیلیوری وقت';

  @override
  String get filterYourSearch => 'اپنی تلاش کو فلٹر کریں';

  @override
  String get checkout => 'چیک آؤٹ';

  @override
  String get deliveryAddress => 'ڈیلیوری پتہ';

  @override
  String get change => 'تبدیل کریں';

  @override
  String get noAddressSelected => 'کوئی پتہ منتخب نہیں ہے';

  @override
  String get orderItems => 'آرڈر کی اشیاء';

  @override
  String get paymentMethod => 'ادائیگی کا طریقہ';

  @override
  String get orderSummary => 'آرڈر کا خلاصہ';

  @override
  String get subtotal => 'ذیلی کل';

  @override
  String get deliveryFee => 'ڈیلیوری فیس';

  @override
  String get platformFee => 'پلیٹ فارم فیس';

  @override
  String get total => 'کل';

  @override
  String get orderPlaced => 'آرڈر دیا گیا!';

  @override
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime =>
      'آپ کا آرڈر کامیابی سے دیا گیا۔\\nاپنے آرڈر کو حقیقی وقت میں ٹریک کریں۔';

  @override
  String get backToHome => 'گھر واپس جائیں';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return 'ادائیگی ناکام: $errorMessage';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return 'ادائیگی کی تصدیق کریں  •  PKR $grandTotal';
  }

  @override
  String get paysWhenOrderArrives => 'آرڈر پہنچنے پر ادا کریں';

  @override
  String get noCardDetails => 'کوئی کارڈ کی تفصیلات نہیں';

  @override
  String get faqs => 'اکثر پوچھے جانے والے سوالات';

  @override
  String get delivery => 'ڈیلیوری';

  @override
  String get payments => 'ادائیگیاں';

  @override
  String get order => 'آرڈر';

  @override
  String get chat => 'بات چیت';

  @override
  String get call => 'کال';

  @override
  String get email => 'ای میل';

  @override
  String get noFavouriteRestaurantsFound =>
      'کوئی پسندیدہ ریستورانیں نہیں ملیں۔';

  @override
  String get noFavouriteFoodsFound => 'کوئی پسندیدہ کھانے نہیں ملے۔';

  @override
  String get foods => 'کھانے';

  @override
  String get restaurants => 'ریستورانیں';

  @override
  String get removeFromFavourites => 'پسندیدہ سے ہٹائیں';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      'کیا آپ اس کھانے کو اپنی پسندیدہ چیزوں سے ہٹانا چاہتے ہیں؟';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get remove => 'ہٹائیں';

  @override
  String get orderAgain => 'دوبارہ آرڈر کریں';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      'کیا آپ اس ریستوران کو اپنی پسندیدہ چیزوں سے ہٹانا چاہتے ہیں؟';

  @override
  String get removeFromCart => 'ٹوکری سے ہٹائیں';

  @override
  String get addToCart => 'ٹوکری میں شامل کریں';

  @override
  String get chooseYourFlavor => 'اپنا ذائقہ منتخب کریں';

  @override
  String get chooseYourSize => 'اپنا سائز منتخب کریں';

  @override
  String get passwordResetLinkSent => 'پاس ورڈ ری سیٹ لنک بھیجا گیا';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      'اپنی ای میل میں پاس ورڈ ری سیٹ لنک کے لیے چیک کریں۔ اپنے پاس ورڈ کو ہماری ویب سائٹ پر ری سیٹ کرنے کے لیے لنک پر کلک کریں۔';

  @override
  String get passwordResetSuccessfully =>
      'پاس ورڈ کامیابی سے ری سیٹ ہوگیا! براہ کرم اپنے نئے پاس ورڈ کے ساتھ لاگ ان کریں۔';

  @override
  String get done => 'ہو گیا';

  @override
  String get sendResetLink => 'ری سیٹ لنک بھیجیں';

  @override
  String get forgotPassword => 'پاس ورڈ بھول گئے';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      'پاس ورڈ ری سیٹ لنک وصول کرنے کے لیے براہ کرم اپنا ای میل ایڈریس درج کریں۔';

  @override
  String get or => 'یا';

  @override
  String get successfullySignedInWithGoogle =>
      'Google کے ساتھ کامیابی سے سائن ان کیا!';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'Google سائن ان خرابی: $stateMessage';
  }

  @override
  String get dontHaveAnAccount => 'کوئی اکاؤنٹ نہیں ہے؟ ';

  @override
  String get signUp => 'سائن اپ کریں';

  @override
  String get login => 'لاگ ان';

  @override
  String get rememberMe => 'مجھے یاد رکھیں';

  @override
  String get password => 'پاس ورڈ';

  @override
  String get logIn => 'لاگ ان کریں';

  @override
  String get pleaseSignInToContinue =>
      'جاری رکھنے کے لیے براہ کرم سائن ان کریں';

  @override
  String get noNotificationsYet => 'ابھی کوئی اطلاعات نہیں';

  @override
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return '$unreadCount غیر پڑھی گئی اطلاعات';
  }

  @override
  String allNotifications(Object totalCount) {
    return 'تمام ($totalCount)';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return 'غیر پڑھے ($unreadCount)';
  }

  @override
  String get notifications => 'اطلاعات';

  @override
  String get clearAllNotifications => 'تمام اطلاعات صاف کریں';

  @override
  String get deleteAllNotificationsConfirmation =>
      'کیا آپ تمام اطلاعات حذف کرنا چاہتے ہیں؟ یہ کارروائی واپس نہیں کی جا سکتی۔';

  @override
  String get markAllAsRead => 'تمام کو پڑھے ہوئے کے طور پر نشان زد کریں';

  @override
  String get clearAll => 'تمام صاف کریں';

  @override
  String get allYourFavorites => 'آپ کی تمام پسندیدہ چیزیں';

  @override
  String get getAllYourLovedFoodsInOnePlace =>
      'اپنے تمام پسندیدہ کھانے ایک جگہ حاصل کریں، آپ آرڈر دیں ہم باقی کام کریں';

  @override
  String get orderFromChoosenChef => 'منتخب شیف سے آرڈر کریں';

  @override
  String get freeDeliveryOffers => 'مفت ڈیلیوری کی پیشکش';

  @override
  String get getStarted => 'شروع کریں';

  @override
  String get next => 'اگلا';

  @override
  String get skip => 'چھوڑیں';

  @override
  String get orderCancelledSuccessfully => 'آرڈر کامیابی سے منسوخ کیا گیا';

  @override
  String get noOngoingOrders => 'کوئی جاری آرڈرز نہیں';

  @override
  String get noOrderHistory => 'کوئی آرڈر کی تاریخ نہیں';

  @override
  String get orderHistory => 'آرڈر کی تاریخ';

  @override
  String get clearOrderHistory => 'آرڈر کی تاریخ صاف کریں';

  @override
  String get areYouSureYouWantToDeleteAllOrderHistory =>
      'کیا آپ تمام آرڈر کی تاریخ حذف کرنا چاہتے ہیں؟ یہ کارروائی واپس نہیں کی جا سکتی۔';

  @override
  String get noCompletedOrdersYet => 'ابھی کوئی مکمل آرڈرز نہیں';

  @override
  String get rate => 'درجہ بندی کریں';

  @override
  String get cancelOrder => 'آرڈر منسوخ کریں';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      'کیا آپ یہ آرڈر منسوخ کرنا چاہتے ہیں؟';

  @override
  String get yesCancel => 'ہاں، منسوخ کریں';

  @override
  String get reorder => 'دوبارہ آرڈر کریں';

  @override
  String get cardInformation => 'کارڈ کی معلومات';

  @override
  String get cardNumberIsRequired => 'کارڈ نمبر ضروری ہے';

  @override
  String get cardNumberIsTooShort => 'کارڈ نمبر بہت مختصر ہے';

  @override
  String get required => 'ضروری';

  @override
  String get invalidMonth => 'غلط مہینہ';

  @override
  String get invalidCvc => 'غلط CVC';

  @override
  String get cvc => 'CVC';

  @override
  String get cardHolder => 'کارڈ کے مالک';

  @override
  String get fullNameOnCard => 'کارڈ پر مکمل نام';

  @override
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever =>
      'آپ کی کارڈ کی تفصیلات Stripe کے ذریعے محفوظ طریقے سے سنبھالی جاتی ہیں۔ ہم کبھی بھی آپ کا مکمل کارڈ نمبر محفوظ نہیں کرتے۔';

  @override
  String get adding => 'شامل کیا جا رہا ہے...';

  @override
  String get addCard => 'کارڈ شامل کریں';

  @override
  String get selectPaymentMethod => 'ادائیگی کا طریقہ منتخب کریں';

  @override
  String get cashOnDelivery => 'ڈیلیوری پر نقد';

  @override
  String get payWhenYourOrderArrives => 'آپ کے آرڈر پہنچنے پر ادا کریں';

  @override
  String get cashOnDeliverySelected => 'ڈیلیوری پر نقد منتخب شدہ';

  @override
  String get visa => 'Visa';

  @override
  String get selectFromYourSavedVisaCards =>
      'اپنے محفوظ Visa کارڈز سے منتخب کریں';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get selectFromYourSavedMastercards =>
      'اپنے محفوظ Mastercardsسے منتخب کریں';

  @override
  String get savedCards => 'محفوظ کارڈز';

  @override
  String get creditCardAddedSuccessfully =>
      'کریڈٹ کارڈ کامیابی سے شامل کیا گیا';

  @override
  String get creditCardDeletedSuccessfully =>
      'کریڈٹ کارڈ کامیابی سے حذف کیا گیا';

  @override
  String get failedToLoadCards => 'کارڈز لوڈ کرنے میں ناکام';

  @override
  String get noSavedCardsYet => 'ابھی کوئی محفوظ کارڈز نہیں';

  @override
  String get addACardBelowToGetStarted =>
      'شروع کرنے کے لیے نیچے کارڈ شامل کریں';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return '$last4 پر ختم ہونے والا کارڈ منتخب شدہ';
  }

  @override
  String get addNewCard => 'نیا کارڈ شامل کریں';

  @override
  String get personalInfo => 'ذاتی معلومات';

  @override
  String get guestUser => 'مہمان صارف';

  @override
  String get pleaseLoginToViewYourProfile =>
      'اپنا پروفائل دیکھنے کے لیے براہ کرم لاگ ان کریں';

  @override
  String editTitle(Object title) {
    return '$title میں ترمیم کریں';
  }

  @override
  String get apply => 'استعمال کریں';

  @override
  String get logout => 'لاگ آؤٹ';

  @override
  String get signup => 'سائن اپ';

  @override
  String get profile => 'پروفائل';

  @override
  String get allRestaurants => 'تمام ریستورانیں';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      'کھانے کی اشیاء لوڈ کرنے میں ناکام۔ براہ کرم بعد میں دوبارہ کوشش کریں۔';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      'اس زمرے کے لیے کوئی کھانے کی اشیاء دستیاب نہیں۔';

  @override
  String get myReviews => 'میرے جائزے';

  @override
  String get popularRestaurants => 'مشہور ریستورانیں';

  @override
  String get noPopularRestaurantsFound => 'کوئی مشہور ریستورانیں نہیں ملیں';

  @override
  String get recentKeywords => 'حالیہ الفاظ';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return '\"$search\" کو حالیہ تلاش میں شامل کیا گیا';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return '\"$search\" کو حالیہ تلاش سے ہٹایا گیا';
  }

  @override
  String get noRecentSearches => 'کوئی حالیہ تلاش نہیں';

  @override
  String get search => 'تلاش کریں';

  @override
  String get preferences2 => 'ترجیحات';

  @override
  String get darkMode => 'ڈارک موڈ';

  @override
  String get language => 'زبان';

  @override
  String get themes => 'تھیمز';

  @override
  String get versionInfoNotAvailable => 'ورژن کی معلومات دستیاب نہیں';

  @override
  String get settings => 'ترتیبات';

  @override
  String get fullName => 'مکمل نام';

  @override
  String get phoneNumber => 'فون نمبر';

  @override
  String get confirmPassword => 'پاس ورڈ کی تصدیق کریں';

  @override
  String get pleaseSignUpToGetStarted =>
      'شروع کرنے کے لیے براہ کرم سائن اپ کریں';

  @override
  String get noActiveOrder => 'کوئی فعال آرڈر نہیں';

  @override
  String get yourOrderHasBeenDelivered => 'آپ کا آرڈر ڈیلیور کر دیا گیا ہے!';

  @override
  String callingphonenumber(Object phoneNumber) {
    return '$phoneNumber کو کال کیا جا رہا ہے...';
  }

  @override
  String get locationPermissionDenied => 'مقام کی اجازت مسترد کر دی گئی';

  @override
  String get courier => 'کوریئر';

  @override
  String get estimatedDeliveryTime2 => 'متوقع ڈیلیوری وقت';

  @override
  String get yourOrderHasBeenReceived => 'آپ کا آرڈر وصول کیا جا چکا ہے';

  @override
  String get theRestaurantIsPreparingYourFood =>
      'ریستوران آپ کا کھانا تیار کر رہا ہے';

  @override
  String get yourOrderHasBeenPickedUpForDelivery =>
      'آپ کا آرڈر ڈیلیوری کے لیے اٹھایا جا چکا ہے';

  @override
  String get orderArrivingSoon => 'آرڈر جلد آنے والا ہے!';

  @override
  String get selectDeliveryAddress => 'ڈیلیوری پتہ منتخب کریں';

  @override
  String get noAddressesFound => 'کوئی پتے نہیں ملے';

  @override
  String get pleaseEnterAValidAddress => 'براہ کرم ایک درست پتہ درج کریں';

  @override
  String get seeAll => 'تمام دیکھیں';

  @override
  String get searchForRestaurantsOrDishes => 'ریستورانیں یا پکوان تلاش کریں';

  @override
  String get noRestaurantsFound => 'کوئی ریستورانیں نہیں ملیں';

  @override
  String get updateDialog => 'اپڈیٹ ڈائیلاگ';

  @override
  String get updateAvailable => 'اپڈیٹ دستیاب ہے';

  @override
  String get aNewVersionOfBiteIsReady => 'Bite کا ایک نیا ورژن تیار ہے!';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      'ورژن latestVersion میں نئی خصوصیات شامل ہیں، ';

  @override
  String get performanceImprovementsAndBugFixes =>
      'کارکردگی میں بہتری، اور بگ فکسز۔';

  @override
  String get updateNow => 'ابھی اپڈیٹ کریں';

  @override
  String get maybeLater => 'شاید بعد میں';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return 'براہ کرم $title درج کریں';
  }

  @override
  String get pleaseEnterAValidEmailAddress =>
      'براہ کرم ایک درست ای میل ایڈریس درج کریں';

  @override
  String get pleaseEnterAValidPhoneNumber =>
      'براہ کرم ایک درست فون نمبر درج کریں';

  @override
  String get passwordMustBeAtLeast8CharactersLong =>
      'پاس ورڈ کم از کم 8 حروف لمبا ہونا چاہیے';

  @override
  String get howDoITrackMyOrder => 'میں اپنے آرڈر کو کیسے ٹریک کروں؟';

  @override
  String get canICancelMyOrder => 'کیا میں اپنے آرڈر کو منسوخ کر سکتا ہوں؟';

  @override
  String get whatIfMyOrderIsDelayed => 'اگر میرا آرڈر تاخیر سے ہو تو کیا ہو؟';

  @override
  String get whatPaymentMethodsAreAccepted =>
      'کون سے ادائیگی کے طریقے قبول کیے جاتے ہیں؟';

  @override
  String get isItSafeToUseMyCreditdebitCardOnBite =>
      'کیا Bite پر اپنے کریڈٹ/ڈیبٹ کارڈ کا استعمال محفوظ ہے؟';

  @override
  String get canIUseMultiplePaymentMethodsForOneOrder =>
      'کیا میں ایک آرڈر کے لیے متعدد ادائیگی کے طریقے استعمال کر سکتا ہوں؟';

  @override
  String get whatShouldIDoIfAPaymentFails =>
      'اگر ادائیگی ناکام ہو تو مجھے کیا کرنا چاہیے؟';

  @override
  String get whatAreYourDeliveryHours => 'آپ کے ڈیلیوری کے اوقات کیا ہیں؟';

  @override
  String get doYouChargeADeliveryFee => 'کیا آپ ڈیلیوری فیس وصول کرتے ہیں؟';

  @override
  String get doYouDeliverToMyLocation => 'کیا آپ میری جگہ پر ڈیلیوری کرتے ہیں؟';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      'کیا میں بعد میں ڈیلیوری کے لیے شیڈول کر سکتا ہوں؟';

  @override
  String get ongoing => 'جاری';

  @override
  String get history => 'تاریخ';

  @override
  String get favorites => 'پسندیدہ';

  @override
  String get reviews => 'جائزے';

  @override
  String get phone => 'فون';

  @override
  String get addressUpdatedSuccessfully => 'پتہ کامیابی سے اپ ڈیٹ ہو گیا';

  @override
  String failedToUpdateAddress(Object error) {
    return 'پتہ اپ ڈیٹ کرنے میں ناکام: $error';
  }

  @override
  String get homeDeliverTo => 'یہاں ڈیلیور کریں';

  @override
  String get homeHeadline => 'کچھ مزیدار آپ کا منتظر ہے۔';

  @override
  String get homeSubtitle => 'اپنا اگلا پسندیدہ کھانا تلاش کریں۔';

  @override
  String get browseRestaurants => 'ریستوران تلاش کریں';

  @override
  String get retryAction => 'دوبارہ کوشش کریں';

  @override
  String get catalogLoadFailure => 'ابھی لوڈ نہیں ہو سکا۔';

  @override
  String get catalogRefreshFailure =>
      'پچھلے نتائج دکھائے جا رہے ہیں۔ دوبارہ ریفریش کریں۔';

  @override
  String get noCategoriesAvailable => 'ابھی کوئی زمرہ دستیاب نہیں۔';

  @override
  String get noOpenRestaurants => 'ابھی کوئی ریستوران کھلا نہیں۔';

  @override
  String deliveryMinutes(int minutes) {
    return '$minutes منٹ';
  }

  @override
  String get rememberEmail => 'ای میل یاد رکھیں';

  @override
  String get menuAllItems => 'تمام اشیاء';

  @override
  String get restaurantOpen => 'ابھی کھلا ہے';

  @override
  String get restaurantClosed => 'بند';

  @override
  String get itemUnavailable => 'فی الحال دستیاب نہیں';

  @override
  String get itemAddedToCart => 'کارٹ میں شامل ہو گیا';

  @override
  String get cartAddFailed => 'شامل نہیں ہو سکا۔ دوبارہ کوشش کریں۔';

  @override
  String get signInToOrder => 'آرڈر کے لیے سائن ان کریں';

  @override
  String get quantityLabel => 'تعداد';

  @override
  String get increaseQuantity => 'تعداد بڑھائیں';

  @override
  String get decreaseQuantity => 'تعداد کم کریں';

  @override
  String get catalogMissing => 'یہ آئٹم اب دستیاب نہیں۔';

  @override
  String get optionalChoices => 'اختیاری · اپنی پسند منتخب کریں';

  @override
  String get savingItem => 'شامل ہو رہا ہے…';

  @override
  String get viewCartAction => 'کارٹ دیکھیں';

  @override
  String get discoverTab => 'دریافت کریں';

  @override
  String get ordersTab => 'آرڈرز';

  @override
  String get accountTab => 'اکاؤنٹ';

  @override
  String get discoveryAll => 'سب';

  @override
  String get discoveryOpen => 'ابھی کھلا ہے';

  @override
  String get discoveryCategories => 'تمام زمرے';

  @override
  String get discoveryRated => 'بہترین درجہ بندی';

  @override
  String get discoveryName => 'نام';

  @override
  String get discoveryDelivery => 'تیز ترین ترسیل';

  @override
  String get discoveryReset => 'فلٹرز ری سیٹ کریں';

  @override
  String get discoveryEmpty =>
      'کوئی نتیجہ نہیں۔ دوسری تلاش کریں یا فلٹرز ری سیٹ کریں۔';

  @override
  String get discoveryMore => 'مزید دکھائیں';

  @override
  String get cartChangeFailed =>
      'کارٹ اپ ڈیٹ نہیں ہو سکا۔ آپ کی اشیا اب بھی دکھائی گئی ہیں۔';

  @override
  String get cartNeedsReview =>
      'کارٹ دیکھیں: ایک ریسٹورنٹ اور درست مقدار میں دستیاب اشیا منتخب کریں۔';

  @override
  String get cartEstimate =>
      'اشیا کا تخمینی مجموعہ۔ چیک آؤٹ موجودہ قیمتوں اور ترسیل کی فیس کی تصدیق کرتا ہے۔';

  @override
  String get checkoutChanged =>
      'کارٹ، پتہ یا قیمتیں بدل گئی ہیں۔ مجموعہ دوبارہ دیکھیں۔';

  @override
  String get checkoutTryAgain => 'چیک آؤٹ مکمل نہیں ہو سکا۔ دوبارہ کوشش کریں۔';

  @override
  String get checkoutCashNote =>
      'ترسیل پر نقد ادائیگی کریں۔ آرڈر دینے سے پہلے تصدیق شدہ مجموعہ دیکھیں۔';

  @override
  String get checkoutReview => 'مجموعہ دیکھیں';

  @override
  String get payByCard => 'کارڈ سے ادائیگی';

  @override
  String get resumeCardPayment => 'کارڈ ادائیگی جاری رکھیں';

  @override
  String get cancelCardPayment => 'کارڈ ادائیگی منسوخ کریں';

  @override
  String get cardPaymentPending =>
      'کارڈ کی ادائیگی زیر التوا ہے۔ کارٹ بدلنے سے پہلے اسے مکمل یا منسوخ کریں۔';

  @override
  String get paymentAtCheckout =>
      'چیک آؤٹ پر ادائیگی کا طریقہ منتخب کریں۔ کارڈ کی تفصیلات Stripe محفوظ طریقے سے لیتا ہے؛ Bite کارڈ محفوظ نہیں کرتا۔';

  @override
  String get updateAddress => 'پتہ اپ ڈیٹ کریں';

  @override
  String get saveAddress => 'پتہ محفوظ کریں';

  @override
  String get street => 'گلی';

  @override
  String get enterStreet => 'گلی کا پتہ درج کریں';

  @override
  String get enterCity => 'شہر درج کریں';

  @override
  String get enterZipCode => 'زپ کوڈ درج کریں';

  @override
  String get enterCountry => 'ملک درج کریں';

  @override
  String get orderReceived => 'آرڈر موصول ہوا';

  @override
  String get orderReceivedSubtitle => 'آپ کا آرڈر ریستوران کو موصول ہو گیا ہے';

  @override
  String get preparing => 'کھانا تیار ہو رہا ہے';

  @override
  String get preparingSubtitle => 'کچن آپ کا کھانا تیار کر رہا ہے';

  @override
  String get dispatched => 'ڈیلیوری کے لیے روانہ';

  @override
  String get dispatchedSubtitle => 'رائڈر نے آپ کا کھانا اٹھا لیا ہے';

  @override
  String get delivered => 'ڈیلیور ہو گیا';

  @override
  String get deliveredSubtitle => 'آرڈر بحفاظت پہنچا دیا گیا ہے';

  @override
  String get cancelled => 'منسوخ شدہ';

  @override
  String get orderStatus => 'آرڈر کی صورتحال';

  @override
  String get orderDetails => 'آرڈر کی تفصیلات';

  @override
  String get orderId => 'آرڈر نمبر';

  @override
  String get orderDate => 'آرڈر کی تاریخ';

  @override
  String get totalPrice => 'کل رقم';

  @override
  String estimatedDeliveryTime(String time) {
    return 'متوقع ڈیلیوری: $time';
  }

  @override
  String get orderDeliveredSuccessfully =>
      'آپ کا آرڈر کامیابی سے ڈیلیور ہو گیا ہے!';

  @override
  String get helpAndSupport => 'مدد اور رہنمائی';

  @override
  String get deliveryRider => 'ڈیلیوری رائیڈر';

  @override
  String get review => 'رائے دیں';

  @override
  String get noOrdersInHistory => 'ابھی تک کوئی پرانا آرڈر نہیں ہے';

  @override
  String get writeReview => 'تبصرہ لکھیں';

  @override
  String get rateOrder => 'آرڈر کی درجہ بندی کریں';

  @override
  String get rateRestaurant => 'ریستوراں کی درجہ بندی کریں';

  @override
  String get tellUsYourExperience => 'اپنے تجربے کے بارے میں بتائیں...';

  @override
  String get submitReview => 'تبصرہ جمع کرائیں';

  @override
  String get reviewSubmitted => 'تبصرہ کامیابی سے جمع ہو گیا';

  @override
  String get noReviewsYet => 'ابھی تک کوئی تبصرہ نہیں لکھا گیا';

  @override
  String get orderRating => 'آرڈر کی درجہ بندی';

  @override
  String get restaurantRating => 'ریستوراں کی درجہ بندی';

  @override
  String get feedbackOptional =>
      'آپ کی رائے ریستوراں کو بہتر بنانے میں مدد کرتی ہے';
}
