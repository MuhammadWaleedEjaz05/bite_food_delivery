// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get trackOrder => 'تتبع الطلب';

  @override
  String get locationPermissionIsRequired => 'يلزم الحصول على إذن الموقع';

  @override
  String errorStatemessage(Object stateMessage) {
    return 'خطأ: $stateMessage';
  }

  @override
  String get address => 'العنوان';

  @override
  String get streetNo => 'رقم الشارع';

  @override
  String get zipCode => 'الرمز البريدي';

  @override
  String get city => 'المدينة';

  @override
  String get country => 'الدولة';

  @override
  String get label => 'التصنيف';

  @override
  String get home => 'المنزل';

  @override
  String get work => 'العمل';

  @override
  String get other => 'آخر';

  @override
  String get pleaseFillAllRequiredFields => 'يرجى ملء جميع الحقول المطلوبة';

  @override
  String get userNotAuthenticated => 'المستخدم غير مصرح';

  @override
  String get addressAddedSuccessfully => 'تم إضافة العنوان بنجاح!';

  @override
  String failedToAddAddressError(Object error) {
    return 'فشل في إضافة العنوان: $error';
  }

  @override
  String get save => 'حفظ';

  @override
  String get addAddress => 'إضافة عنوان';

  @override
  String get failedToLoadAddresses => 'فشل في تحميل العناوين';

  @override
  String get noSavedAddressesYet => 'لا توجد عناوين محفوظة حتى الآن';

  @override
  String get pleaseSignInToViewAddresses => 'يرجى تسجيل الدخول لعرض العناوين';

  @override
  String get deliveryAddress2 => 'عنوان التسليم';

  @override
  String get edit2 => 'تعديل';

  @override
  String get selectAnAddress => 'اختر عنوان';

  @override
  String get total2 => 'الإجمالي: ';

  @override
  String get checkout2 => 'الدفع';

  @override
  String get yourCartIsEmpty => 'سلتك فارغة';

  @override
  String get cart => 'السلة';

  @override
  String get allCategories => 'جميع الفئات';

  @override
  String get openRestaurants => 'المطاعم المفتوحة';

  @override
  String get clear2 => 'مسح';

  @override
  String get apply2 => 'تطبيق';

  @override
  String get rating2 => 'التقييم';

  @override
  String get deliveryTime2 => 'وقت التسليم';

  @override
  String get filterYourSearch => 'صفي بحثك';

  @override
  String get checkout => 'الدفع';

  @override
  String get deliveryAddress => 'عنوان التسليم';

  @override
  String get change => 'تغيير';

  @override
  String get noAddressSelected => 'لم يتم تحديد عنوان';

  @override
  String get orderItems => 'عناصر الطلب';

  @override
  String get paymentMethod => 'طريقة الدفع';

  @override
  String get orderSummary => 'ملخص الطلب';

  @override
  String get subtotal => 'المجموع الفرعي';

  @override
  String get deliveryFee => 'رسوم التسليم';

  @override
  String get platformFee => 'رسوم المنصة';

  @override
  String get total => 'الإجمالي';

  @override
  String get orderPlaced => 'تم وضع الطلب!';

  @override
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime =>
      'تم وضع طلبك بنجاح.\\nتابع طلبك في الوقت الفعلي.';

  @override
  String get backToHome => 'العودة إلى الرئيسية';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return 'فشل الدفع: $errorMessage';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return 'تأكيد الدفع  •  جنيه إسترليني $grandTotal';
  }

  @override
  String get paysWhenOrderArrives => 'الدفع عند وصول الطلب';

  @override
  String get noCardDetails => 'لا توجد تفاصيل بطاقة';

  @override
  String get faqs => 'الأسئلة الشائعة';

  @override
  String get delivery => 'التسليم';

  @override
  String get payments => 'الدفع';

  @override
  String get order => 'الطلب';

  @override
  String get chat => 'الدردشة';

  @override
  String get call => 'الاتصال';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get noFavouriteRestaurantsFound => 'لم يتم العثور على مطاعم المفضلة.';

  @override
  String get noFavouriteFoodsFound => 'لم يتم العثور على أطعمة المفضلة.';

  @override
  String get foods => 'الأطعمة';

  @override
  String get restaurants => 'المطاعم';

  @override
  String get removeFromFavourites => 'إزالة من المفضلة';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      'هل أنت متأكد من أنك تريد إزالة هذا الطعام من المفضلة؟';

  @override
  String get cancel => 'إلغاء';

  @override
  String get remove => 'إزالة';

  @override
  String get orderAgain => 'طلب مرة أخرى';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      'هل أنت متأكد من أنك تريد إزالة هذا المطعم من المفضلة؟';

  @override
  String get removeFromCart => 'إزالة من السلة';

  @override
  String get addToCart => 'إضافة إلى السلة';

  @override
  String get chooseYourFlavor => 'اختر النكهة';

  @override
  String get chooseYourSize => 'اختر الحجم';

  @override
  String get passwordResetLinkSent => 'تم إرسال رابط إعادة تعيين كلمة المرور';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      'تحقق من بريدك الإلكتروني للحصول على رابط إعادة تعيين كلمة المرور. انقر على الرابط لإعادة تعيين كلمة المرور على موقعنا.';

  @override
  String get passwordResetSuccessfully =>
      'تم إعادة تعيين كلمة المرور بنجاح! يرجى تسجيل الدخول باستخدام كلمة المرور الجديدة.';

  @override
  String get done => 'تم';

  @override
  String get sendResetLink => 'إرسال رابط إعادة التعيين';

  @override
  String get forgotPassword => 'نسيت كلمة المرور';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      'يرجى إدخال عنوان بريدك الإلكتروني للحصول على رابط إعادة تعيين كلمة المرور.';

  @override
  String get or => 'أو';

  @override
  String get successfullySignedInWithGoogle =>
      'تم تسجيل الدخول بنجاح باستخدام جوجل!';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'خطأ في تسجيل الدخول عبر جوجل: $stateMessage';
  }

  @override
  String get dontHaveAnAccount => 'ليس لديك حساب؟ ';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get logIn => 'تسجيل الدخول';

  @override
  String get pleaseSignInToContinue => 'يرجى تسجيل الدخول للمتابعة';

  @override
  String get noNotificationsYet => 'لا توجد إشعارات حتى الآن';

  @override
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return '$unreadCount إشعارات غير مقروءة';
  }

  @override
  String allNotifications(Object totalCount) {
    return 'الكل ($totalCount)';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return 'غير مقروءة ($unreadCount)';
  }

  @override
  String get notifications => 'الإشعارات';

  @override
  String get clearAllNotifications => 'مسح جميع الإشعارات';

  @override
  String get deleteAllNotificationsConfirmation =>
      'هل أنت متأكد من رغبتك في حذف جميع الإشعارات؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get markAllAsRead => 'تحديد الكل كمقروء';

  @override
  String get clearAll => 'مسح الكل';

  @override
  String get allYourFavorites => 'جميع المفضلة لديك';

  @override
  String get getAllYourLovedFoodsInOnePlace =>
      'احصل على جميع الأطعمة المفضلة لديك في مكان واحد، ما عليك سوى وضع الطلب ويتولى الباقي';

  @override
  String get orderFromChoosenChef => 'اطلب من الشيف المختار';

  @override
  String get freeDeliveryOffers => 'عروض التسليم المجاني';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get next => 'التالي';

  @override
  String get skip => 'تخطي';

  @override
  String get orderCancelledSuccessfully => 'تم إلغاء الطلب بنجاح';

  @override
  String get noOngoingOrders => 'لا توجد طلبات جارية';

  @override
  String get noOrderHistory => 'لا يوجد سجل طلبات';

  @override
  String get orderHistory => 'سجل الطلبات';

  @override
  String get clearOrderHistory => 'مسح سجل الطلبات';

  @override
  String get areYouSureYouWantToDeleteAllOrderHistory =>
      'هل أنت متأكد من رغبتك في حذف جميع سجل الطلبات؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get noCompletedOrdersYet => 'لا توجد طلبات مكتملة حتى الآن';

  @override
  String get rate => 'تقييم';

  @override
  String get cancelOrder => 'إلغاء الطلب';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      'هل أنت متأكد من رغبتك في إلغاء هذا الطلب؟';

  @override
  String get yesCancel => 'نعم، إلغاء';

  @override
  String get reorder => 'إعادة طلب';

  @override
  String get cardInformation => 'معلومات البطاقة';

  @override
  String get cardNumberIsRequired => 'رقم البطاقة مطلوب';

  @override
  String get cardNumberIsTooShort => 'رقم البطاقة قصير جداً';

  @override
  String get required => 'مطلوب';

  @override
  String get invalidMonth => 'شهر غير صحيح';

  @override
  String get invalidCvc => 'رمز التحقق غير صحيح';

  @override
  String get cvc => 'رمز التحقق';

  @override
  String get cardHolder => 'حامل البطاقة';

  @override
  String get fullNameOnCard => 'الاسم الكامل على البطاقة';

  @override
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever =>
      'يتم التعامل مع تفاصيل بطاقتك بشكل آمن بواسطة Stripe. لا نخزن أبداً رقم البطاقة الكامل.';

  @override
  String get adding => 'جاري الإضافة...';

  @override
  String get addCard => 'إضافة بطاقة';

  @override
  String get selectPaymentMethod => 'اختر طريقة الدفع';

  @override
  String get cashOnDelivery => 'الدفع عند الاستلام';

  @override
  String get payWhenYourOrderArrives => 'ادفع عند وصول طلبك';

  @override
  String get cashOnDeliverySelected => 'تم تحديد الدفع عند الاستلام';

  @override
  String get visa => 'فيزا';

  @override
  String get selectFromYourSavedVisaCards => 'اختر من بطاقات فيزا المحفوظة';

  @override
  String get mastercard => 'ماستركارد';

  @override
  String get selectFromYourSavedMastercards =>
      'اختر من بطاقات ماستركارد المحفوظة';

  @override
  String get savedCards => 'البطاقات المحفوظة';

  @override
  String get creditCardAddedSuccessfully => 'تمت إضافة بطاقة الائتمان بنجاح';

  @override
  String get creditCardDeletedSuccessfully => 'تم حذف بطاقة الائتمان بنجاح';

  @override
  String get failedToLoadCards => 'فشل في تحميل البطاقات';

  @override
  String get noSavedCardsYet => 'لا توجد بطاقات محفوظة حتى الآن';

  @override
  String get addACardBelowToGetStarted => 'أضف بطاقة أدناه للبدء';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return 'البطاقة المنتهية برقم $last4 محددة';
  }

  @override
  String get addNewCard => 'إضافة بطاقة جديدة';

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get guestUser => 'مستخدم ضيف';

  @override
  String get pleaseLoginToViewYourProfile =>
      'يرجى تسجيل الدخول لعرض ملفك الشخصي';

  @override
  String editTitle(Object title) {
    return 'تعديل $title';
  }

  @override
  String get apply => 'تطبيق';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get signup => 'إنشاء حساب';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get allRestaurants => 'جميع المطاعم';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      'فشل في تحميل عناصر الطعام. يرجى المحاولة لاحقاً.';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      'لا توجد عناصر طعام متاحة لهذه الفئة.';

  @override
  String get myReviews => 'تعليقاتي';

  @override
  String get popularRestaurants => 'المطاعم الشهيرة';

  @override
  String get noPopularRestaurantsFound => 'لم يتم العثور على مطاعم شهيرة';

  @override
  String get recentKeywords => 'الكلمات الأخيرة';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return 'تم إضافة \"$search\" إلى عمليات البحث الأخيرة';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return 'تم إزالة \"$search\" من عمليات البحث الأخيرة';
  }

  @override
  String get noRecentSearches => 'لا توجد عمليات بحث أخيرة';

  @override
  String get search => 'البحث';

  @override
  String get preferences2 => 'التفضيلات';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get language => 'اللغة';

  @override
  String get themes => 'المواضيع';

  @override
  String get versionInfoNotAvailable => 'معلومات الإصدار غير متاحة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get pleaseSignUpToGetStarted => 'يرجى إنشاء حساب للبدء';

  @override
  String get noActiveOrder => 'لا يوجد طلب نشط';

  @override
  String get yourOrderHasBeenDelivered => 'تم تسليم طلبك!';

  @override
  String callingphonenumber(Object phoneNumber) {
    return 'جاري الاتصال بـ $phoneNumber...';
  }

  @override
  String get locationPermissionDenied => 'تم رفض إذن الموقع';

  @override
  String get courier => 'ساعي البريد';

  @override
  String get estimatedDeliveryTime2 => 'وقت التسليم المتوقع';

  @override
  String get yourOrderHasBeenReceived => 'تم استقبال طلبك';

  @override
  String get theRestaurantIsPreparingYourFood => 'المطعم يجهز طعامك';

  @override
  String get yourOrderHasBeenPickedUpForDelivery => 'تم اختيار طلبك للتسليم';

  @override
  String get orderArrivingSoon => 'جاري وصول الطلب!';

  @override
  String get selectDeliveryAddress => 'اختر عنوان التسليم';

  @override
  String get noAddressesFound => 'لم يتم العثور على عناوين';

  @override
  String get pleaseEnterAValidAddress => 'يرجى إدخال عنوان صحيح';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get searchForRestaurantsOrDishes => 'ابحث عن مطاعم أو أطباق';

  @override
  String get noRestaurantsFound => 'لم يتم العثور على مطاعم';

  @override
  String get updateDialog => 'حوار التحديث';

  @override
  String get updateAvailable => 'تحديث متاح';

  @override
  String get aNewVersionOfBiteIsReady => 'إصدار جديد من Bite جاهز!';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      'الإصدار latestVersion يتضمن ميزات جديدة، ';

  @override
  String get performanceImprovementsAndBugFixes =>
      'تحسينات الأداء، وإصلاحات الأخطاء.';

  @override
  String get updateNow => 'تحديث الآن';

  @override
  String get maybeLater => 'ربما لاحقاً';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return 'يرجى إدخال $title';
  }

  @override
  String get pleaseEnterAValidEmailAddress =>
      'يرجى إدخال عنوان بريد إلكتروني صحيح';

  @override
  String get pleaseEnterAValidPhoneNumber => 'يرجى إدخال رقم هاتف صحيح';

  @override
  String get passwordMustBeAtLeast8CharactersLong =>
      'يجب أن تكون كلمة المرور بطول 8 أحرف على الأقل';

  @override
  String get howDoITrackMyOrder => 'كيف أتتبع طلبي؟';

  @override
  String get canICancelMyOrder => 'هل يمكنني إلغاء طلبي؟';

  @override
  String get whatIfMyOrderIsDelayed => 'الرجاء عدم تأخير الطلب؟';

  @override
  String get whatPaymentMethodsAreAccepted => 'ما طرق الدفع المقبولة؟';

  @override
  String get isItSafeToUseMyCreditdebitCardOnBite =>
      'هل من الآمن استخدام بطاقتي الائتمان أو الخصم على Bite؟';

  @override
  String get canIUseMultiplePaymentMethodsForOneOrder =>
      'هل يمكنني استخدام عدة طرق دفع لطلب واحد؟';

  @override
  String get whatShouldIDoIfAPaymentFails => 'ماذا أفعل إذا فشل الدفع؟';

  @override
  String get whatAreYourDeliveryHours => 'ما ساعات التسليم لديك؟';

  @override
  String get doYouChargeADeliveryFee => 'هل تفرضون رسوم تسليم؟';

  @override
  String get doYouDeliverToMyLocation => 'هل تسلمون إلى موقعي؟';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      'هل يمكنني جدولة تسليم لوقت لاحق؟';

  @override
  String get ongoing => 'جاري';

  @override
  String get history => 'السجل';

  @override
  String get favorites => 'المفضلة';

  @override
  String get reviews => 'التعليقات';

  @override
  String get phone => 'الهاتف';

  @override
  String get addressUpdatedSuccessfully => 'تم تحديث العنوان بنجاح';

  @override
  String failedToUpdateAddress(Object error) {
    return 'فشل في تحديث العنوان: $error';
  }

  @override
  String get homeDeliverTo => 'التوصيل إلى';

  @override
  String get homeHeadline => 'وجبة لذيذة بانتظارك.';

  @override
  String get homeSubtitle => 'اكتشف وجبتك المفضلة التالية.';

  @override
  String get browseRestaurants => 'تصفح المطاعم';

  @override
  String get retryAction => 'حاول مجدداً';

  @override
  String get catalogLoadFailure => 'تعذر التحميل الآن.';

  @override
  String get catalogRefreshFailure =>
      'نعرض النتائج المحفوظة. حدّث للمحاولة مجدداً.';

  @override
  String get noCategoriesAvailable => 'لا توجد فئات متاحة بعد.';

  @override
  String get noOpenRestaurants => 'لا توجد مطاعم مفتوحة الآن.';

  @override
  String deliveryMinutes(int minutes) {
    return '$minutes دقيقة';
  }

  @override
  String get rememberEmail => 'تذكر البريد الإلكتروني';

  @override
  String get menuAllItems => 'كل الأصناف';

  @override
  String get restaurantOpen => 'مفتوح الآن';

  @override
  String get restaurantClosed => 'مغلق';

  @override
  String get itemUnavailable => 'غير متاح حالياً';

  @override
  String get itemAddedToCart => 'تمت الإضافة إلى السلة';

  @override
  String get cartAddFailed => 'تعذرت الإضافة. حاول مجدداً.';

  @override
  String get signInToOrder => 'سجّل الدخول للطلب';

  @override
  String get quantityLabel => 'الكمية';

  @override
  String get increaseQuantity => 'زيادة الكمية';

  @override
  String get decreaseQuantity => 'تقليل الكمية';

  @override
  String get catalogMissing => 'هذا الصنف لم يعد متاحاً.';

  @override
  String get optionalChoices => 'اختياري · اختر ما تفضله';

  @override
  String get savingItem => 'جارٍ الإضافة…';

  @override
  String get viewCartAction => 'عرض السلة';

  @override
  String get discoverTab => 'استكشف';

  @override
  String get ordersTab => 'الطلبات';

  @override
  String get accountTab => 'الحساب';

  @override
  String get discoveryAll => 'الكل';

  @override
  String get discoveryOpen => 'مفتوح الآن';

  @override
  String get discoveryCategories => 'كل الفئات';

  @override
  String get discoveryRated => 'الأعلى تقييمًا';

  @override
  String get discoveryName => 'الاسم';

  @override
  String get discoveryDelivery => 'الأسرع توصيلاً';

  @override
  String get discoveryReset => 'إعادة ضبط الفلاتر';

  @override
  String get discoveryEmpty =>
      'لا توجد نتائج. جرّب بحثًا آخر أو أعد ضبط الفلاتر.';

  @override
  String get discoveryMore => 'عرض المزيد';

  @override
  String get cartChangeFailed => 'تعذر تحديث سلتك. لا تزال العناصر معروضة.';

  @override
  String get cartNeedsReview =>
      'راجع سلتك: اختر مطعمًا واحدًا وعناصر متاحة بكميات صحيحة.';

  @override
  String get cartEstimate =>
      'مجموع تقديري للعناصر. يؤكد الدفع الأسعار الحالية ورسوم التوصيل.';

  @override
  String get checkoutChanged =>
      'تغيرت السلة أو العنوان أو الأسعار. راجع المجموع مجددًا.';

  @override
  String get checkoutTryAgain => 'تعذر إكمال الطلب. حاول مجددًا.';

  @override
  String get checkoutCashNote =>
      'الدفع نقدًا عند الاستلام. راجع المجموع المؤكد قبل الطلب.';

  @override
  String get checkoutReview => 'مراجعة المجموع';

  @override
  String get payByCard => 'الدفع بالبطاقة';

  @override
  String get resumeCardPayment => 'استئناف الدفع بالبطاقة';

  @override
  String get cancelCardPayment => 'إلغاء الدفع بالبطاقة';

  @override
  String get cardPaymentPending =>
      'الدفع بالبطاقة معلق. استأنفه أو ألغِه قبل تغيير السلة.';

  @override
  String get paymentAtCheckout =>
      'اختر طريقة الدفع عند إتمام الطلب. تجمع Stripe بيانات البطاقة بأمان؛ لا يحفظ Bite البطاقات.';

  @override
  String get updateAddress => 'تحديث العنوان';

  @override
  String get saveAddress => 'حفظ العنوان';

  @override
  String get street => 'الشارع';

  @override
  String get enterStreet => 'أدخل عنوان الشارع';

  @override
  String get enterCity => 'أدخل المدينة';

  @override
  String get enterZipCode => 'أدخل الرمز البريدي';

  @override
  String get enterCountry => 'أدخل البلد';

  @override
  String get orderReceived => 'تم استلام الطلب';

  @override
  String get orderReceivedSubtitle => 'تم استلام طلبك من قِبل المطعم';

  @override
  String get preparing => 'جارٍ التحضير';

  @override
  String get preparingSubtitle => 'المطبخ يحضر وجبتك الآن';

  @override
  String get dispatched => 'في الطريق إليك';

  @override
  String get dispatchedSubtitle => 'السائق استلم طلبك وهو في الطريق';

  @override
  String get delivered => 'تم التوصيل';

  @override
  String get deliveredSubtitle => 'تم تسليم الطلب بنجاح';

  @override
  String get cancelled => 'ملغي';

  @override
  String get orderStatus => 'حالة الطلب';

  @override
  String get orderDetails => 'تفاصيل الطلب';

  @override
  String get orderId => 'رقم الطلب';

  @override
  String get orderDate => 'تاريخ الطلب';

  @override
  String get totalPrice => 'السعر الإجمالي';

  @override
  String estimatedDeliveryTime(String time) {
    return 'وقت التوصيل المتوقع: $time';
  }

  @override
  String get orderDeliveredSuccessfully => 'تم توصيل طلبك بنجاح!';

  @override
  String get helpAndSupport => 'المساعدة والدعم';

  @override
  String get deliveryRider => 'مندوب التوصيل';

  @override
  String get review => 'تقييم';

  @override
  String get noOrdersInHistory => 'لا توجد طلبات سابقة';

  @override
  String get writeReview => 'اكتب تقييماً';

  @override
  String get rateOrder => 'تقييم الطلب';

  @override
  String get rateRestaurant => 'تقييم المطعم';

  @override
  String get tellUsYourExperience => 'أخبرنا عن تجربتك...';

  @override
  String get submitReview => 'إرسال التقييم';

  @override
  String get reviewSubmitted => 'تم إرسال التقييم بنجاح';

  @override
  String get noReviewsYet => 'لم يتم كتابة أي تقييمات بعد';

  @override
  String get orderRating => 'تقييم الطلب';

  @override
  String get restaurantRating => 'تقييم المطعم';

  @override
  String get feedbackOptional => 'ملاحظاتك تساعد المطاعم على التحسين';
}
