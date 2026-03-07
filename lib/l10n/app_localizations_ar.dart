// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get allYourFavorites => 'جميع مفضلاتك';

  @override
  String get getLovedFoodsDescription =>
      'احصل على جميع أطعمتك المفضلة في مكان واحد، فقط قم بتقديم الطلب ونحن نتكفل بالباقي';

  @override
  String get orderFromChosenChef => 'اطلب من الشيف المختار';

  @override
  String get freeDeliveryOffers => 'عروض توصيل مجانية';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get next => 'التالي';

  @override
  String get skip => 'تخطي';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get logIn => 'تسجيل الدخول';

  @override
  String get pleaseSignInToContinue => 'يرجى تسجيل الدخول للمتابعة';

  @override
  String get or => 'أو';

  @override
  String get successfullySignedInGoogle => 'تم تسجيل الدخول بنجاح عبر Google!';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ ';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgotPasswordTitle => 'نسيت كلمة المرور';

  @override
  String get passwordResetLinkSent => 'تم إرسال رابط إعادة تعيين كلمة المرور';

  @override
  String get checkEmailResetLink =>
      'تحقق من بريدك الإلكتروني للحصول على رابط إعادة تعيين كلمة المرور. انقر على الرابط لإعادة تعيين كلمة المرور.';

  @override
  String get done => 'تم';

  @override
  String get passwordResetSuccess =>
      'تم إعادة تعيين كلمة المرور بنجاح! يرجى تسجيل الدخول بكلمة المرور الجديدة.';

  @override
  String get pleaseEnterEmailReset =>
      'يرجى إدخال بريدك الإلكتروني لاستلام رابط إعادة تعيين كلمة المرور.';

  @override
  String get sendResetLink => 'إرسال رابط إعادة التعيين';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get pleaseSignUpToGetStarted => 'يرجى إنشاء حساب للبدء';

  @override
  String get deliverTo => 'التوصيل إلى';

  @override
  String get selectLocation => 'اختر الموقع';

  @override
  String heyUser(String userName) {
    return 'مرحباً $userName، ';
  }

  @override
  String get goodMorning => 'صباح الخير! 👋';

  @override
  String get heyThere => 'مرحباً، ';

  @override
  String get allCategories => 'جميع الفئات';

  @override
  String get openRestaurants => 'المطاعم المفتوحة';

  @override
  String get search => 'بحث';

  @override
  String get popularRestaurants => 'المطاعم الشائعة';

  @override
  String get noPopularRestaurantsFound => 'لم يتم العثور على مطاعم شائعة';

  @override
  String get recentKeywords => 'كلمات البحث الأخيرة';

  @override
  String get noRecentSearches => 'لا توجد عمليات بحث حديثة';

  @override
  String addedToRecentSearches(String searchTerm) {
    return 'تمت إضافة \"$searchTerm\" إلى عمليات البحث الأخيرة';
  }

  @override
  String removedFromRecentSearches(String searchTerm) {
    return 'تمت إزالة \"$searchTerm\" من عمليات البحث الأخيرة';
  }

  @override
  String get searchRestaurantsOrDishes => 'ابحث عن مطاعم أو أطباق';

  @override
  String get noRestaurantsFound => 'لم يتم العثور على مطاعم';

  @override
  String get deliveryAddress => 'عنوان التوصيل';

  @override
  String get edit => 'تعديل';

  @override
  String get selectAnAddress => 'اختر عنواناً';

  @override
  String get totalLabel => 'المجموع : ';

  @override
  String pkrAmount(String amount) {
    return 'PKR $amount';
  }

  @override
  String get checkoutButton => 'الدفع';

  @override
  String get yourCartIsEmpty => 'سلة التسوق فارغة';

  @override
  String get initializingCart => 'جاري تحميل السلة...';

  @override
  String get cart => 'السلة';

  @override
  String get checkout => 'الدفع';

  @override
  String get deliveryAddressTitle => 'عنوان التوصيل';

  @override
  String get change => 'تغيير';

  @override
  String get noAddressSelected => 'لم يتم اختيار عنوان';

  @override
  String get orderItems => 'عناصر الطلب';

  @override
  String get paymentMethod => 'طريقة الدفع';

  @override
  String get orderSummary => 'ملخص الطلب';

  @override
  String get subtotal => 'المجموع الفرعي';

  @override
  String get deliveryFee => 'رسوم التوصيل';

  @override
  String get platformFee => 'رسوم المنصة';

  @override
  String get total => 'المجموع';

  @override
  String get orderPlaced => 'تم تقديم الطلب!';

  @override
  String get orderPlacedSuccessfully =>
      'تم تقديم طلبك بنجاح.\nتتبع طلبك في الوقت الفعلي.';

  @override
  String get trackOrder => 'تتبع الطلب';

  @override
  String get backToHome => 'العودة للرئيسية';

  @override
  String confirmPaymentAmount(String amount) {
    return 'تأكيد الدفع  •  PKR $amount';
  }

  @override
  String rsPrice(String price) {
    return 'RS $price';
  }

  @override
  String get chooseYourFlavor => 'اختر النكهة';

  @override
  String get chooseYourSize => 'اختر الحجم';

  @override
  String get tenInch => '10 بوصة';

  @override
  String get sixteenInch => '16 بوصة';

  @override
  String get twentyInch => '20 بوصة';

  @override
  String get removeFromCart => 'إزالة من السلة';

  @override
  String get addToCart => 'أضف إلى السلة';

  @override
  String get allItems => 'جميع العناصر';

  @override
  String get all => 'الكل';

  @override
  String get failedLoadFoodItems =>
      'فشل في تحميل عناصر الطعام. يرجى المحاولة مرة أخرى لاحقاً.';

  @override
  String get noFoodItemsCategory => 'لا توجد عناصر طعام متاحة لهذه الفئة.';

  @override
  String get free => 'مجاني';

  @override
  String deliveryTimeMin(String minutes) {
    return '$minutes دقيقة';
  }

  @override
  String get allRestaurants => 'جميع المطاعم';

  @override
  String get selectPaymentMethod => 'اختر طريقة الدفع';

  @override
  String get cashOnDelivery => 'الدفع عند الاستلام';

  @override
  String get payWhenOrderArrives => 'ادفع عند وصول طلبك';

  @override
  String get cashOnDeliverySelected => 'تم اختيار الدفع عند الاستلام';

  @override
  String get visa => 'فيزا';

  @override
  String get selectVisaCards => 'اختر من بطاقات فيزا المحفوظة';

  @override
  String get mastercard => 'ماستركارد';

  @override
  String get selectMastercardCards => 'اختر من بطاقات ماستركارد المحفوظة';

  @override
  String cardEndingInSelected(String last4) {
    return 'تم اختيار البطاقة المنتهية بـ $last4';
  }

  @override
  String noCardsSavedAddFirst(String cardType) {
    return 'لا توجد بطاقات $cardType محفوظة. أضف واحدة أولاً.';
  }

  @override
  String get savedCards => 'البطاقات المحفوظة';

  @override
  String get creditCardAddedSuccess => 'تمت إضافة بطاقة الائتمان بنجاح';

  @override
  String get creditCardDeletedSuccess => 'تم حذف بطاقة الائتمان بنجاح';

  @override
  String get noSavedCardsYet => 'لا توجد بطاقات محفوظة بعد';

  @override
  String get addCardBelowToGetStarted => 'أضف بطاقة أدناه للبدء';

  @override
  String maskedCardNumber(String last4) {
    return '**** **** **** $last4';
  }

  @override
  String cardHolderExpiry(String holderName, String expiryDate) {
    return '$holderName  •  $expiryDate';
  }

  @override
  String get addNewCard => 'إضافة بطاقة جديدة';

  @override
  String get cardInformation => 'معلومات البطاقة';

  @override
  String get cardNumberPlaceholder => '4242 4242 4242 4242';

  @override
  String get cardNumberRequired => 'رقم البطاقة مطلوب';

  @override
  String get cardNumberTooShort => 'رقم البطاقة قصير جداً';

  @override
  String get mmyyPlaceholder => 'MM/YY';

  @override
  String get invalidMonth => 'شهر غير صالح';

  @override
  String get cvcPlaceholder => 'CVC';

  @override
  String get invalidCvc => 'CVC غير صالح';

  @override
  String get fullNameOnCard => 'الاسم الكامل على البطاقة';

  @override
  String get cardSecurityNote =>
      'يتم التعامل مع تفاصيل بطاقتك بشكل آمن عبر Stripe. لا نقوم بتخزين رقم بطاقتك الكامل أبداً.';

  @override
  String get adding => 'جاري الإضافة...';

  @override
  String get addCard => 'إضافة بطاقة';

  @override
  String get addAddress => 'إضافة عنوان';

  @override
  String get addressNotAvailable => 'العنوان غير متاح';

  @override
  String get failedLoadAddresses => 'فشل في تحميل العناوين';

  @override
  String get noSavedAddresses => 'لا توجد عناوين محفوظة بعد';

  @override
  String get pleaseSignInAddresses => 'يرجى تسجيل الدخول لعرض العناوين';

  @override
  String get address => 'العنوان';

  @override
  String get locationPermissionRequired => 'إذن الموقع مطلوب';

  @override
  String get streetNo => 'رقم الشارع';

  @override
  String get zipCode => 'الرمز البريدي';

  @override
  String get city => 'المدينة';

  @override
  String get country => 'البلد';

  @override
  String get label => 'التصنيف';

  @override
  String get home => 'المنزل';

  @override
  String get work => 'العمل';

  @override
  String get other => 'أخرى';

  @override
  String get pleaseFillAllFields => 'يرجى ملء جميع الحقول المطلوبة';

  @override
  String get userNotAuthenticated => 'المستخدم غير مصادق عليه';

  @override
  String get addressAddedSuccessfully => 'تمت إضافة العنوان بنجاح!';

  @override
  String failedToAddAddress(String error) {
    return 'فشل في إضافة العنوان: $error';
  }

  @override
  String get save => 'حفظ';

  @override
  String get selectDeliveryAddress => 'اختر عنوان التوصيل';

  @override
  String get noAddressesFound => 'لم يتم العثور على عناوين';

  @override
  String get iLoveFastFood => 'أحب الوجبات السريعة';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get guestUser => 'مستخدم ضيف';

  @override
  String get pleaseLoginViewProfile => 'يرجى تسجيل الدخول لعرض ملفك الشخصي';

  @override
  String editTitle(String title) {
    return 'تعديل $title';
  }

  @override
  String enterTitle(String title) {
    return 'أدخل $title';
  }

  @override
  String get apply => 'تطبيق';

  @override
  String get phone => 'الهاتف';

  @override
  String get favourite => 'المفضلة';

  @override
  String get foods => 'الأطعمة';

  @override
  String get restaurants => 'المطاعم';

  @override
  String get noFavouriteRestaurants => 'لم يتم العثور على مطاعم مفضلة.';

  @override
  String get noFavouriteFoods => 'لم يتم العثور على أطعمة مفضلة.';

  @override
  String get orderRatings => 'تقييمات الطلب';

  @override
  String get restaurantRatings => 'تقييمات المطعم';

  @override
  String get userReviews => 'مراجعات المستخدمين';

  @override
  String get submit => 'إرسال';

  @override
  String get review => 'مراجعة';

  @override
  String get myReviews => 'مراجعاتي';

  @override
  String get orderCancelledSuccessfully => 'تم إلغاء الطلب بنجاح';

  @override
  String get clearOrderHistory => 'مسح سجل الطلبات';

  @override
  String get confirmDeleteOrderHistory =>
      'هل أنت متأكد من حذف جميع سجل الطلبات؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get clearAll => 'مسح الكل';

  @override
  String get clearOrderHistoryMenu => 'مسح سجل الطلبات';

  @override
  String get orderHistory => 'سجل الطلبات';

  @override
  String get noCompletedOrders => 'لا توجد طلبات مكتملة بعد';

  @override
  String get noOngoingOrders => 'لا توجد طلبات جارية';

  @override
  String get noOrderHistory => 'لا يوجد سجل طلبات';

  @override
  String get ongoing => 'جارية';

  @override
  String get history => 'السجل';

  @override
  String get noActiveOrder => 'لا يوجد طلب نشط';

  @override
  String get orderDelivered => 'تم توصيل طلبك!';

  @override
  String callingNumber(String phoneNumber) {
    return 'جاري الاتصال بـ $phoneNumber...';
  }

  @override
  String get locationPermissionDenied => 'تم رفض إذن الموقع';

  @override
  String get orderReceived => 'تم استلام طلبك';

  @override
  String get restaurantPreparingFood => 'المطعم يحضر طعامك';

  @override
  String get orderPickedUp => 'تم استلام طلبك للتوصيل';

  @override
  String get orderArrivingSoon => 'الطلب سيصل قريباً!';

  @override
  String get estimatedDeliveryTime => 'وقت التوصيل المتوقع';

  @override
  String estimatedMinutes(String minutes) {
    return '$minutes دقيقة';
  }

  @override
  String orderedAt(String date) {
    return 'تم الطلب في $date';
  }

  @override
  String get courier => 'السائق';

  @override
  String get noNotificationsYet => 'لا توجد إشعارات بعد';

  @override
  String unreadNotificationsCount(int count) {
    return '$count إشعارات غير مقروءة';
  }

  @override
  String get noNotifications => 'لا توجد إشعارات';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get markAllAsRead => 'تعيين الكل كمقروء';

  @override
  String get clearAllNotifications => 'مسح الكل';

  @override
  String get allTab => 'الكل';

  @override
  String get unread => 'غير مقروءة';

  @override
  String get preferences => 'التفضيلات';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'الإنجليزية';

  @override
  String get themes => 'السمات';

  @override
  String get settings => 'الإعدادات';

  @override
  String get versionInfoNotAvailable => 'معلومات الإصدار غير متاحة';

  @override
  String get faqs => 'الأسئلة الشائعة';

  @override
  String get orderFaq => 'الطلب';

  @override
  String get paymentsFaq => 'المدفوعات';

  @override
  String get deliveryFaq => 'التوصيل';

  @override
  String get chat => 'محادثة';

  @override
  String get call => 'اتصال';

  @override
  String get howTrackOrder => 'كيف أتتبع طلبي؟';

  @override
  String get canCancelOrder => 'هل يمكنني إلغاء طلبي؟';

  @override
  String get whatIfOrderDelayed => 'ماذا لو تأخر طلبي؟';

  @override
  String get whatPaymentMethodsAccepted => 'ما هي طرق الدفع المقبولة؟';

  @override
  String get isCardSafeBite =>
      'هل استخدام بطاقتي الائتمانية/الخصم آمن على Bite؟';

  @override
  String get canUseMultiplePaymentMethods =>
      'هل يمكنني استخدام عدة طرق دفع لطلب واحد؟';

  @override
  String get whatIfPaymentFails => 'ماذا أفعل إذا فشلت عملية الدفع؟';

  @override
  String get whatDeliveryHours => 'ما هي ساعات التوصيل لديكم؟';

  @override
  String get chargeDeliveryFee => 'هل تفرضون رسوم توصيل؟';

  @override
  String get deliverToLocation => 'هل تقومون بالتوصيل إلى موقعي؟';

  @override
  String get scheduleDeliveryLater => 'هل يمكنني جدولة التوصيل لوقت لاحق؟';

  @override
  String get clear => 'مسح';

  @override
  String get applyFilter => 'تطبيق';

  @override
  String get ratingFilter => 'التقييم';

  @override
  String get lessThan3_5 => '< 3.5';

  @override
  String get between3_5And4_0 => '3.5 - 4.0';

  @override
  String get greaterThan4_0 => '> 4.0';

  @override
  String get deliveryTimeFilter => 'وقت التوصيل';

  @override
  String get lessThan15Min => '< 15 دقيقة';

  @override
  String get between15And30Min => '15 - 30 دقيقة';

  @override
  String get greaterThan30Min => '> 30 دقيقة';

  @override
  String get filterYourSearch => 'فلتر بحثك';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String enterField(String field) {
    return 'أدخل $field';
  }

  @override
  String pleaseEnterField(String field) {
    return 'يرجى إدخال $field';
  }

  @override
  String get pleaseEnterValidEmail => 'يرجى إدخال بريد إلكتروني صالح';

  @override
  String get pleaseEnterValidPhone => 'يرجى إدخال رقم هاتف صالح';

  @override
  String get passwordMinimum8Chars =>
      'يجب أن تكون كلمة المرور 8 أحرف على الأقل';

  @override
  String get favorites => 'المفضلة';

  @override
  String get reviews => 'المراجعات';

  @override
  String get updateAvailable => 'تحديث متاح';

  @override
  String get newBiteVersionReady => 'إصدار جديد من Bite جاهز!';

  @override
  String updateDescription(String version) {
    return 'الإصدار $version يتضمن ميزات جديدة وتحسينات في الأداء وإصلاحات أخطاء.';
  }

  @override
  String versionPrefix(String version) {
    return 'v$version';
  }

  @override
  String get updateNow => 'التحديث الآن';

  @override
  String get maybeLater => 'ربما لاحقاً';

  @override
  String errorMessage(String message) {
    return 'خطأ: $message';
  }
}
