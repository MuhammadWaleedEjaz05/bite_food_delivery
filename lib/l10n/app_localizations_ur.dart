// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get allYourFavorites => 'آپ کے تمام پسندیدہ';

  @override
  String get getLovedFoodsDescription =>
      'اپنی پسندیدہ کھانوں کو ایک جگہ پر حاصل کریں، آپ صرف آرڈر دیں باقی ہم کریں گے';

  @override
  String get orderFromChosenChef => 'اپنے پسندیدہ شیف سے آرڈر کریں';

  @override
  String get freeDeliveryOffers => 'مفت ڈیلیوری آفرز';

  @override
  String get getStarted => 'شروع کریں';

  @override
  String get next => 'اگلا';

  @override
  String get skip => 'چھوڑیں';

  @override
  String get login => 'لاگ ان';

  @override
  String get logIn => 'لاگ ان';

  @override
  String get pleaseSignInToContinue => 'جاری رکھنے کے لیے سائن ان کریں';

  @override
  String get or => 'یا';

  @override
  String get successfullySignedInGoogle => 'گوگل سے کامیابی سے سائن ان ہو گیا!';

  @override
  String get dontHaveAccount => 'اکاؤنٹ نہیں ہے؟ ';

  @override
  String get signUp => 'سائن اپ';

  @override
  String get rememberMe => 'مجھے یاد رکھیں';

  @override
  String get forgotPassword => 'پاسورڈ بھول گئے؟';

  @override
  String get email => 'ای میل';

  @override
  String get password => 'پاسورڈ';

  @override
  String get forgotPasswordTitle => 'پاسورڈ بھول گئے';

  @override
  String get passwordResetLinkSent => 'پاسورڈ ری سیٹ لنک بھیج دیا گیا';

  @override
  String get checkEmailResetLink =>
      'پاسورڈ ری سیٹ لنک کے لیے اپنا ای میل چیک کریں۔ اپنا پاسورڈ ری سیٹ کرنے کے لیے لنک پر کلک کریں۔';

  @override
  String get done => 'مکمل';

  @override
  String get passwordResetSuccess =>
      'پاسورڈ کامیابی سے ری سیٹ ہو گیا! براہ کرم اپنے نئے پاسورڈ سے لاگ ان کریں۔';

  @override
  String get pleaseEnterEmailReset =>
      'پاسورڈ ری سیٹ لنک حاصل کرنے کے لیے اپنا ای میل ایڈریس درج کریں۔';

  @override
  String get sendResetLink => 'ری سیٹ لنک بھیجیں';

  @override
  String get fullName => 'پورا نام';

  @override
  String get phoneNumber => 'فون نمبر';

  @override
  String get confirmPassword => 'پاسورڈ کی تصدیق';

  @override
  String get pleaseSignUpToGetStarted => 'شروع کرنے کے لیے سائن اپ کریں';

  @override
  String get deliverTo => 'ڈیلیوری کا پتہ';

  @override
  String get selectLocation => 'مقام منتخب کریں';

  @override
  String heyUser(String userName) {
    return 'ہیلو $userName، ';
  }

  @override
  String get goodMorning => 'صبح بخیر! 👋';

  @override
  String get heyThere => 'ہیلو، ';

  @override
  String get allCategories => 'تمام زمرے';

  @override
  String get openRestaurants => 'کھلے ریستوران';

  @override
  String get search => 'تلاش';

  @override
  String get popularRestaurants => 'مقبول ریستوران';

  @override
  String get noPopularRestaurantsFound => 'کوئی مقبول ریستوران نہیں ملا';

  @override
  String get recentKeywords => 'حالیہ تلاش';

  @override
  String get noRecentSearches => 'کوئی حالیہ تلاش نہیں';

  @override
  String addedToRecentSearches(String searchTerm) {
    return '\"$searchTerm\" حالیہ تلاش میں شامل کیا گیا';
  }

  @override
  String removedFromRecentSearches(String searchTerm) {
    return '\"$searchTerm\" حالیہ تلاش سے ہٹا دیا گیا';
  }

  @override
  String get searchRestaurantsOrDishes => 'ریستوران یا پکوان تلاش کریں';

  @override
  String get noRestaurantsFound => 'کوئی ریستوران نہیں ملا';

  @override
  String get deliveryAddress => 'ڈیلیوری کا پتہ';

  @override
  String get edit => 'ترمیم';

  @override
  String get selectAnAddress => 'پتہ منتخب کریں';

  @override
  String get totalLabel => 'کل : ';

  @override
  String pkrAmount(String amount) {
    return 'PKR $amount';
  }

  @override
  String get checkoutButton => 'چیک آؤٹ';

  @override
  String get yourCartIsEmpty => 'آپ کی ٹوکری خالی ہے';

  @override
  String get initializingCart => 'ٹوکری لوڈ ہو رہی ہے...';

  @override
  String get cart => 'ٹوکری';

  @override
  String get checkout => 'چیک آؤٹ';

  @override
  String get deliveryAddressTitle => 'ڈیلیوری کا پتہ';

  @override
  String get change => 'تبدیل کریں';

  @override
  String get noAddressSelected => 'کوئی پتہ منتخب نہیں';

  @override
  String get orderItems => 'آرڈر آئٹمز';

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
  String get orderPlaced => 'آرڈر دے دیا گیا!';

  @override
  String get orderPlacedSuccessfully =>
      'آپ کا آرڈر کامیابی سے دے دیا گیا ہے۔\nاپنے آرڈر کو ریئل ٹائم میں ٹریک کریں۔';

  @override
  String get trackOrder => 'آرڈر ٹریک کریں';

  @override
  String get backToHome => 'ہوم پر واپس جائیں';

  @override
  String confirmPaymentAmount(String amount) {
    return 'ادائیگی کی تصدیق  •  PKR $amount';
  }

  @override
  String rsPrice(String price) {
    return 'RS $price';
  }

  @override
  String get chooseYourFlavor => 'اپنا ذائقہ منتخب کریں';

  @override
  String get chooseYourSize => 'اپنا سائز منتخب کریں';

  @override
  String get tenInch => '10 انچ';

  @override
  String get sixteenInch => '16 انچ';

  @override
  String get twentyInch => '20 انچ';

  @override
  String get removeFromCart => 'ٹوکری سے ہٹائیں';

  @override
  String get addToCart => 'ٹوکری میں شامل کریں';

  @override
  String get allItems => 'تمام آئٹمز';

  @override
  String get all => 'سب';

  @override
  String get failedLoadFoodItems =>
      'کھانے کی اشیاء لوڈ کرنے میں ناکامی۔ براہ کرم بعد میں دوبارہ کوشش کریں۔';

  @override
  String get noFoodItemsCategory =>
      'اس زمرے میں کوئی کھانے کی اشیاء دستیاب نہیں ہیں۔';

  @override
  String get free => 'مفت';

  @override
  String deliveryTimeMin(String minutes) {
    return '$minutes منٹ';
  }

  @override
  String get allRestaurants => 'تمام ریستوران';

  @override
  String get selectPaymentMethod => 'ادائیگی کا طریقہ منتخب کریں';

  @override
  String get cashOnDelivery => 'کیش آن ڈیلیوری';

  @override
  String get payWhenOrderArrives => 'آرڈر آنے پر ادائیگی کریں';

  @override
  String get cashOnDeliverySelected => 'کیش آن ڈیلیوری منتخب';

  @override
  String get visa => 'ویزا';

  @override
  String get selectVisaCards => 'اپنے محفوظ ویزا کارڈز سے منتخب کریں';

  @override
  String get mastercard => 'ماسٹر کارڈ';

  @override
  String get selectMastercardCards => 'اپنے محفوظ ماسٹر کارڈز سے منتخب کریں';

  @override
  String cardEndingInSelected(String last4) {
    return '$last4 پر ختم ہونے والا کارڈ منتخب';
  }

  @override
  String noCardsSavedAddFirst(String cardType) {
    return 'کوئی $cardType کارڈ محفوظ نہیں۔ پہلے ایک شامل کریں۔';
  }

  @override
  String get savedCards => 'محفوظ کارڈز';

  @override
  String get creditCardAddedSuccess => 'کریڈٹ کارڈ کامیابی سے شامل ہو گیا';

  @override
  String get creditCardDeletedSuccess => 'کریڈٹ کارڈ کامیابی سے حذف ہو گیا';

  @override
  String get noSavedCardsYet => 'ابھی تک کوئی کارڈ محفوظ نہیں';

  @override
  String get addCardBelowToGetStarted => 'شروع کرنے کے لیے نیچے کارڈ شامل کریں';

  @override
  String maskedCardNumber(String last4) {
    return '**** **** **** $last4';
  }

  @override
  String cardHolderExpiry(String holderName, String expiryDate) {
    return '$holderName  •  $expiryDate';
  }

  @override
  String get addNewCard => 'نیا کارڈ شامل کریں';

  @override
  String get cardInformation => 'کارڈ کی معلومات';

  @override
  String get cardNumberPlaceholder => '4242 4242 4242 4242';

  @override
  String get cardNumberRequired => 'کارڈ نمبر ضروری ہے';

  @override
  String get cardNumberTooShort => 'کارڈ نمبر بہت چھوٹا ہے';

  @override
  String get mmyyPlaceholder => 'MM/YY';

  @override
  String get invalidMonth => 'غلط مہینہ';

  @override
  String get cvcPlaceholder => 'CVC';

  @override
  String get invalidCvc => 'غلط CVC';

  @override
  String get fullNameOnCard => 'کارڈ پر پورا نام';

  @override
  String get cardSecurityNote =>
      'آپ کے کارڈ کی تفصیلات Stripe کے ذریعے محفوظ طریقے سے ہینڈل کی جاتی ہیں۔ ہم آپ کا مکمل کارڈ نمبر کبھی محفوظ نہیں کرتے۔';

  @override
  String get adding => 'شامل ہو رہا ہے...';

  @override
  String get addCard => 'کارڈ شامل کریں';

  @override
  String get addAddress => 'پتہ شامل کریں';

  @override
  String get addressNotAvailable => 'پتہ دستیاب نہیں';

  @override
  String get failedLoadAddresses => 'پتے لوڈ کرنے میں ناکامی';

  @override
  String get noSavedAddresses => 'ابھی تک کوئی پتے محفوظ نہیں';

  @override
  String get pleaseSignInAddresses => 'پتے دیکھنے کے لیے سائن ان کریں';

  @override
  String get address => 'پتہ';

  @override
  String get locationPermissionRequired => 'مقام کی اجازت ضروری ہے';

  @override
  String get streetNo => 'گلی نمبر';

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
  String get work => 'دفتر';

  @override
  String get other => 'دیگر';

  @override
  String get pleaseFillAllFields => 'براہ کرم تمام ضروری فیلڈز بھریں';

  @override
  String get userNotAuthenticated => 'صارف تصدیق شدہ نہیں ہے';

  @override
  String get addressAddedSuccessfully => 'پتہ کامیابی سے شامل ہو گیا!';

  @override
  String failedToAddAddress(String error) {
    return 'پتہ شامل کرنے میں ناکامی: $error';
  }

  @override
  String get save => 'محفوظ کریں';

  @override
  String get selectDeliveryAddress => 'ڈیلیوری کا پتہ منتخب کریں';

  @override
  String get noAddressesFound => 'کوئی پتہ نہیں ملا';

  @override
  String get iLoveFastFood => 'مجھے فاسٹ فوڈ پسند ہے';

  @override
  String get logout => 'لاگ آؤٹ';

  @override
  String get profile => 'پروفائل';

  @override
  String get personalInfo => 'ذاتی معلومات';

  @override
  String get guestUser => 'مہمان صارف';

  @override
  String get pleaseLoginViewProfile => 'اپنا پروفائل دیکھنے کے لیے لاگ ان کریں';

  @override
  String editTitle(String title) {
    return '$title میں ترمیم';
  }

  @override
  String enterTitle(String title) {
    return '$title درج کریں';
  }

  @override
  String get apply => 'لاگو کریں';

  @override
  String get phone => 'فون';

  @override
  String get favourite => 'پسندیدہ';

  @override
  String get foods => 'کھانے';

  @override
  String get restaurants => 'ریستوران';

  @override
  String get noFavouriteRestaurants => 'کوئی پسندیدہ ریستوران نہیں ملا۔';

  @override
  String get noFavouriteFoods => 'کوئی پسندیدہ کھانے نہیں ملے۔';

  @override
  String get orderRatings => 'آرڈر کی درجہ بندی';

  @override
  String get restaurantRatings => 'ریستوران کی درجہ بندی';

  @override
  String get userReviews => 'صارف کے جائزے';

  @override
  String get submit => 'جمع کریں';

  @override
  String get review => 'جائزہ';

  @override
  String get myReviews => 'میرے جائزے';

  @override
  String get orderCancelledSuccessfully => 'آرڈر کامیابی سے منسوخ ہو گیا';

  @override
  String get clearOrderHistory => 'آرڈر کی تاریخ صاف کریں';

  @override
  String get confirmDeleteOrderHistory =>
      'کیا آپ واقعی تمام آرڈر کی تاریخ حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں ہو سکتا۔';

  @override
  String get cancel => 'منسوخ';

  @override
  String get clearAll => 'سب صاف کریں';

  @override
  String get clearOrderHistoryMenu => 'آرڈر کی تاریخ صاف کریں';

  @override
  String get orderHistory => 'آرڈر کی تاریخ';

  @override
  String get noCompletedOrders => 'ابھی تک کوئی مکمل آرڈر نہیں';

  @override
  String get noOngoingOrders => 'کوئی جاری آرڈر نہیں';

  @override
  String get noOrderHistory => 'آرڈر کی کوئی تاریخ نہیں';

  @override
  String get ongoing => 'جاری';

  @override
  String get history => 'تاریخ';

  @override
  String get noActiveOrder => 'کوئی فعال آرڈر نہیں';

  @override
  String get orderDelivered => 'آپ کا آرڈر پہنچا دیا گیا ہے!';

  @override
  String callingNumber(String phoneNumber) {
    return '$phoneNumber پر کال ہو رہی ہے...';
  }

  @override
  String get locationPermissionDenied => 'مقام کی اجازت سے انکار';

  @override
  String get orderReceived => 'آپ کا آرڈر موصول ہو گیا ہے';

  @override
  String get restaurantPreparingFood => 'ریستوران آپ کا کھانا تیار کر رہا ہے';

  @override
  String get orderPickedUp => 'آپ کا آرڈر ڈیلیوری کے لیے اٹھا لیا گیا ہے';

  @override
  String get orderArrivingSoon => 'آرڈر جلد پہنچنے والا ہے!';

  @override
  String get estimatedDeliveryTime => 'متوقع ڈیلیوری کا وقت';

  @override
  String estimatedMinutes(String minutes) {
    return '$minutes منٹ';
  }

  @override
  String orderedAt(String date) {
    return 'آرڈر کیا گیا $date';
  }

  @override
  String get courier => 'کوریئر';

  @override
  String get noNotificationsYet => 'ابھی تک کوئی اطلاعات نہیں';

  @override
  String unreadNotificationsCount(int count) {
    return '$count غیر پڑھی اطلاعات';
  }

  @override
  String get noNotifications => 'کوئی اطلاعات نہیں';

  @override
  String get notifications => 'اطلاعات';

  @override
  String get markAllAsRead => 'سب کو پڑھا ہوا نشان زد کریں';

  @override
  String get clearAllNotifications => 'سب صاف کریں';

  @override
  String get allTab => 'سب';

  @override
  String get unread => 'غیر پڑھی';

  @override
  String get preferences => 'ترجیحات';

  @override
  String get darkMode => 'ڈارک موڈ';

  @override
  String get language => 'زبان';

  @override
  String get english => 'انگریزی';

  @override
  String get themes => 'تھیمز';

  @override
  String get settings => 'ترتیبات';

  @override
  String get versionInfoNotAvailable => 'ورژن کی معلومات دستیاب نہیں';

  @override
  String get faqs => 'عمومی سوالات';

  @override
  String get orderFaq => 'آرڈر';

  @override
  String get paymentsFaq => 'ادائیگیاں';

  @override
  String get deliveryFaq => 'ڈیلیوری';

  @override
  String get chat => 'چیٹ';

  @override
  String get call => 'کال';

  @override
  String get howTrackOrder => 'میں اپنا آرڈر کیسے ٹریک کروں؟';

  @override
  String get canCancelOrder => 'کیا میں اپنا آرڈر منسوخ کر سکتا ہوں؟';

  @override
  String get whatIfOrderDelayed => 'اگر میرا آرڈر دیر سے آئے تو؟';

  @override
  String get whatPaymentMethodsAccepted => 'کون سے ادائیگی کے طریقے قبول ہیں؟';

  @override
  String get isCardSafeBite =>
      'کیا Bite پر اپنا کریڈٹ/ڈیبٹ کارڈ استعمال کرنا محفوظ ہے؟';

  @override
  String get canUseMultiplePaymentMethods =>
      'کیا میں ایک آرڈر کے لیے متعدد ادائیگی کے طریقے استعمال کر سکتا ہوں؟';

  @override
  String get whatIfPaymentFails =>
      'اگر ادائیگی ناکام ہو جائے تو مجھے کیا کرنا چاہیے؟';

  @override
  String get whatDeliveryHours => 'آپ کے ڈیلیوری کے اوقات کیا ہیں؟';

  @override
  String get chargeDeliveryFee => 'کیا آپ ڈیلیوری فیس لیتے ہیں؟';

  @override
  String get deliverToLocation => 'کیا آپ میرے مقام پر ڈیلیوری کرتے ہیں؟';

  @override
  String get scheduleDeliveryLater =>
      'کیا میں بعد میں ڈیلیوری شیڈول کر سکتا ہوں؟';

  @override
  String get clear => 'صاف کریں';

  @override
  String get applyFilter => 'لاگو کریں';

  @override
  String get ratingFilter => 'درجہ بندی';

  @override
  String get lessThan3_5 => '< 3.5';

  @override
  String get between3_5And4_0 => '3.5 - 4.0';

  @override
  String get greaterThan4_0 => '> 4.0';

  @override
  String get deliveryTimeFilter => 'ڈیلیوری کا وقت';

  @override
  String get lessThan15Min => '< 15 منٹ';

  @override
  String get between15And30Min => '15 - 30 منٹ';

  @override
  String get greaterThan30Min => '> 30 منٹ';

  @override
  String get filterYourSearch => 'اپنی تلاش فلٹر کریں';

  @override
  String get seeAll => 'سب دیکھیں';

  @override
  String enterField(String field) {
    return '$field درج کریں';
  }

  @override
  String pleaseEnterField(String field) {
    return 'براہ کرم $field درج کریں';
  }

  @override
  String get pleaseEnterValidEmail =>
      'براہ کرم ایک درست ای میل ایڈریس درج کریں';

  @override
  String get pleaseEnterValidPhone => 'براہ کرم ایک درست فون نمبر درج کریں';

  @override
  String get passwordMinimum8Chars => 'پاسورڈ کم از کم 8 حروف کا ہونا چاہیے';

  @override
  String get favorites => 'پسندیدہ';

  @override
  String get reviews => 'جائزے';

  @override
  String get updateAvailable => 'اپ ڈیٹ دستیاب ہے';

  @override
  String get newBiteVersionReady => 'Bite کا نیا ورژن تیار ہے!';

  @override
  String updateDescription(String version) {
    return 'ورژن $version میں نئی خصوصیات، کارکردگی میں بہتری، اور بگ فکسز شامل ہیں۔';
  }

  @override
  String versionPrefix(String version) {
    return 'v$version';
  }

  @override
  String get updateNow => 'ابھی اپ ڈیٹ کریں';

  @override
  String get maybeLater => 'شاید بعد میں';

  @override
  String errorMessage(String message) {
    return 'خرابی: $message';
  }
}
