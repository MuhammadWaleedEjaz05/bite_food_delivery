// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get trackOrder => 'Siparişi Takip Et';

  @override
  String get locationPermissionIsRequired => 'Konum izni gerekli';

  @override
  String errorStatemessage(Object stateMessage) {
    return 'Hata: $stateMessage';
  }

  @override
  String get address => 'Adres';

  @override
  String get streetNo => 'Sokak No.';

  @override
  String get zipCode => 'Posta Kodu';

  @override
  String get city => 'Şehir';

  @override
  String get country => 'Ülke';

  @override
  String get label => 'Etiket';

  @override
  String get home => 'Ev';

  @override
  String get work => 'İş';

  @override
  String get other => 'Diğer';

  @override
  String get pleaseFillAllRequiredFields =>
      'Lütfen tüm gerekli alanları doldurun';

  @override
  String get userNotAuthenticated => 'Kullanıcı kimliği doğrulanmadı';

  @override
  String get addressAddedSuccessfully => 'Adres başarıyla eklendi!';

  @override
  String failedToAddAddressError(Object error) {
    return 'Adres ekleme başarısız: $error';
  }

  @override
  String get save => 'Kaydet';

  @override
  String get addAddress => 'Adres Ekle';

  @override
  String get failedToLoadAddresses => 'Adresler yüklenemedi';

  @override
  String get noSavedAddressesYet => 'Henüz kaydedilmiş adres yok';

  @override
  String get pleaseSignInToViewAddresses =>
      'Adresleri görmek için lütfen giriş yapın';

  @override
  String get deliveryAddress2 => 'TESLİMAT ADRESİ';

  @override
  String get edit2 => 'DÜZENLE';

  @override
  String get selectAnAddress => 'Bir adres seçin';

  @override
  String get total2 => 'TOPLAM: ';

  @override
  String get checkout2 => 'ÖDEMEYE GEÇ';

  @override
  String get yourCartIsEmpty => 'Sepetiniz boş';

  @override
  String get cart => 'Sepet';

  @override
  String get allCategories => 'Tüm Kategoriler';

  @override
  String get openRestaurants => 'Açık Restoranlar';

  @override
  String get clear2 => 'TEMİZLE';

  @override
  String get apply2 => 'UYGULA';

  @override
  String get rating2 => 'PUAN';

  @override
  String get deliveryTime2 => 'TESLİMAT SÜRESİ';

  @override
  String get filterYourSearch => 'Aramanızı filtreleyin';

  @override
  String get checkout => 'Ödemeye Geç';

  @override
  String get deliveryAddress => 'Teslimat Adresi';

  @override
  String get change => 'Değiştir';

  @override
  String get noAddressSelected => 'Adres seçilmedi';

  @override
  String get orderItems => 'Sipariş Öğeleri';

  @override
  String get paymentMethod => 'Ödeme Yöntemi';

  @override
  String get orderSummary => 'Sipariş Özeti';

  @override
  String get subtotal => 'Ara Toplam';

  @override
  String get deliveryFee => 'Teslimat Ücreti';

  @override
  String get platformFee => 'Platform Ücreti';

  @override
  String get total => 'Toplam';

  @override
  String get orderPlaced => 'Sipariş Verildi!';

  @override
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime =>
      'Siparişiniz başarıyla verilmiştir.\\nSiparişinizi gerçek zamanlı olarak takip edin.';

  @override
  String get backToHome => 'Ana Sayfaya Dön';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return 'Ödeme başarısız: $errorMessage';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return 'Ödemeyi Onayla • PKR $grandTotal';
  }

  @override
  String get paysWhenOrderArrives => 'Sipariş Geldiğinde Ödeme Yapılır';

  @override
  String get noCardDetails => 'Kart detayı yok';

  @override
  String get faqs => 'Sıkça Sorulan Sorular';

  @override
  String get delivery => 'Teslimat';

  @override
  String get payments => 'Ödemeler';

  @override
  String get order => 'Sipariş';

  @override
  String get chat => 'Sohbet';

  @override
  String get call => 'Ara';

  @override
  String get email => 'E-posta';

  @override
  String get noFavouriteRestaurantsFound => 'Favori restorana bulunamadı.';

  @override
  String get noFavouriteFoodsFound => 'Favori yiyecek bulunamadı.';

  @override
  String get foods => 'Yiyecekler';

  @override
  String get restaurants => 'Restoranlar';

  @override
  String get removeFromFavourites => 'Favorilerden kaldır';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      'Bu yiyeceği favorilerden kaldırmak istediğinizden emin misiniz?';

  @override
  String get cancel => 'İptal';

  @override
  String get remove => 'Kaldır';

  @override
  String get orderAgain => 'Tekrar Sipariş Ver';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      'Bu restoranı favorilerinden kaldırmak istediğinizden emin misiniz?';

  @override
  String get removeFromCart => 'Sepetten kaldır';

  @override
  String get addToCart => 'Sepete ekle';

  @override
  String get chooseYourFlavor => 'Lezzet seçin';

  @override
  String get chooseYourSize => 'Boyut seçin';

  @override
  String get passwordResetLinkSent => 'Şifre Sıfırlama Bağlantısı Gönderildi';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      'Şifre sıfırlama bağlantısı için e-postanızı kontrol edin. Web sitemizde şifrenizi sıfırlamak için bağlantıya tıklayın.';

  @override
  String get passwordResetSuccessfully =>
      'Şifre başarıyla sıfırlandı! Lütfen yeni şifrenizle giriş yapın.';

  @override
  String get done => 'Bitti';

  @override
  String get sendResetLink => 'Sıfırlama Bağlantısı Gönder';

  @override
  String get forgotPassword => 'Şifremi Unuttum';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      'Şifre sıfırlama bağlantısı almak için lütfen e-posta adresinizi girin.';

  @override
  String get or => 'Veya';

  @override
  String get successfullySignedInWithGoogle =>
      'Google ile başarıyla giriş yapıldı!';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'Google Oturum Açma Hatası: $stateMessage';
  }

  @override
  String get dontHaveAnAccount => 'Hesabınız yok mu? ';

  @override
  String get signUp => 'Kaydol';

  @override
  String get login => 'Giriş Yap';

  @override
  String get rememberMe => 'Beni hatırla';

  @override
  String get password => 'Şifre';

  @override
  String get logIn => 'Giriş Yap';

  @override
  String get pleaseSignInToContinue => 'Devam Etmek İçin Lütfen Giriş Yapın';

  @override
  String get noNotificationsYet => 'Henüz bildirim yok';

  @override
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return '$unreadCount okunmamış bildirim';
  }

  @override
  String allNotifications(Object totalCount) {
    return 'Tümü ($totalCount)';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return 'Okunmamış ($unreadCount)';
  }

  @override
  String get notifications => 'Bildirimler';

  @override
  String get clearAllNotifications => 'Tüm Bildirimleri Temizle';

  @override
  String get deleteAllNotificationsConfirmation =>
      'Tüm bildirimleri silmek istediğinizden emin misiniz? Bu işlem geri alınamaz.';

  @override
  String get markAllAsRead => 'Tümünü okundu olarak işaretle';

  @override
  String get clearAll => 'Tümünü temizle';

  @override
  String get allYourFavorites => 'Tüm favorileriniz';

  @override
  String get getAllYourLovedFoodsInOnePlace =>
      'Tüm sevdiğiniz yiyecekleri bir yerde alın, siz sipariş edin biz kalanını yapalım';

  @override
  String get orderFromChoosenChef => 'Seçili şeften sipariş verin';

  @override
  String get freeDeliveryOffers => 'Ücretsiz teslimat teklifleri';

  @override
  String get getStarted => 'Başla';

  @override
  String get next => 'İleri';

  @override
  String get skip => 'Atla';

  @override
  String get orderCancelledSuccessfully => 'Sipariş başarıyla iptal edildi';

  @override
  String get noOngoingOrders => 'Devam eden sipariş yok';

  @override
  String get noOrderHistory => 'Sipariş geçmişi yok';

  @override
  String get orderHistory => 'Sipariş Geçmişi';

  @override
  String get clearOrderHistory => 'Sipariş Geçmişini Temizle';

  @override
  String get areYouSureYouWantToDeleteAllOrderHistory =>
      'Tüm sipariş geçmişini silmek istediğinizden emin misiniz? Bu işlem geri alınamaz.';

  @override
  String get noCompletedOrdersYet => 'Henüz tamamlanan sipariş yok';

  @override
  String get rate => 'Değerlendir';

  @override
  String get cancelOrder => 'Siparişi İptal Et';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      'Bu siparişi iptal etmek istediğinizden emin misiniz?';

  @override
  String get yesCancel => 'Evet, İptal Et';

  @override
  String get reorder => 'Yeniden Sipariş Ver';

  @override
  String get cardInformation => 'Kart Bilgisi';

  @override
  String get cardNumberIsRequired => 'Kart numarası gerekli';

  @override
  String get cardNumberIsTooShort => 'Kart numarası çok kısa';

  @override
  String get required => 'Gerekli';

  @override
  String get invalidMonth => 'Geçersiz ay';

  @override
  String get invalidCvc => 'Geçersiz CVC';

  @override
  String get cvc => 'CVC';

  @override
  String get cardHolder => 'Kart Sahibi';

  @override
  String get fullNameOnCard => 'Karttaki tam ad';

  @override
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever =>
      'Kart bilgileriniz Stripe tarafından güvenli şekilde işlenir. Tam kart numaranızı asla saklamayız.';

  @override
  String get adding => 'Ekleniyor...';

  @override
  String get addCard => 'Kart Ekle';

  @override
  String get selectPaymentMethod => 'Ödeme Yöntemi Seçin';

  @override
  String get cashOnDelivery => 'Kapıda Ödeme';

  @override
  String get payWhenYourOrderArrives => 'Siparişiniz geldiğinde öde';

  @override
  String get cashOnDeliverySelected => 'Kapıda Ödeme seçildi';

  @override
  String get visa => 'Visa';

  @override
  String get selectFromYourSavedVisaCards =>
      'Kaydedilmiş Visa kartlarınızdan seçin';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get selectFromYourSavedMastercards =>
      'Kaydedilmiş Mastercard kartlarınızdan seçin';

  @override
  String get savedCards => 'Kaydedilmiş Kartlar';

  @override
  String get creditCardAddedSuccessfully => 'Kredi kartı başarıyla eklendi';

  @override
  String get creditCardDeletedSuccessfully => 'Kredi kartı başarıyla silindi';

  @override
  String get failedToLoadCards => 'Kartlar yüklenemedi';

  @override
  String get noSavedCardsYet => 'Henüz kaydedilmiş kart yok';

  @override
  String get addACardBelowToGetStarted => 'Başlamak için aşağıya kart ekleyin';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return 'Son 4 rakamı $last4 olan kart seçildi';
  }

  @override
  String get addNewCard => 'Yeni Kart Ekle';

  @override
  String get personalInfo => 'Kişisel Bilgiler';

  @override
  String get guestUser => 'Misafir Kullanıcı';

  @override
  String get pleaseLoginToViewYourProfile =>
      'Profilinizi görmek için lütfen giriş yapın';

  @override
  String editTitle(Object title) {
    return '$title Düzenle';
  }

  @override
  String get apply => 'Uygula';

  @override
  String get logout => 'Çıkış Yap';

  @override
  String get signup => 'Kaydol';

  @override
  String get profile => 'Profil';

  @override
  String get allRestaurants => 'Tüm Restoranlar';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      'Yiyecek öğeleri yüklenemedi. Lütfen daha sonra tekrar deneyin.';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      'Bu kategori için yiyecek öğesi yok.';

  @override
  String get myReviews => 'Benim Değerlendirmelerim';

  @override
  String get popularRestaurants => 'Popüler Restoranlar';

  @override
  String get noPopularRestaurantsFound => 'Popüler restoran bulunamadı';

  @override
  String get recentKeywords => 'Son Aramalar';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return '\"$search\" son aramalara eklendi';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return '\"$search\" son aramalardan kaldırıldı';
  }

  @override
  String get noRecentSearches => 'Son arama yok';

  @override
  String get search => 'Ara';

  @override
  String get preferences2 => 'TERCIHLER';

  @override
  String get darkMode => 'Koyu Mod';

  @override
  String get language => 'Dil';

  @override
  String get themes => 'Temalar';

  @override
  String get versionInfoNotAvailable => 'Sürüm bilgisi mevcut değil';

  @override
  String get settings => 'Ayarlar';

  @override
  String get fullName => 'Tam Ad';

  @override
  String get phoneNumber => 'Telefon Numarası';

  @override
  String get confirmPassword => 'Şifreyi Onayla';

  @override
  String get pleaseSignUpToGetStarted => 'Başlamak için lütfen kaydolun';

  @override
  String get noActiveOrder => 'Aktif sipariş yok';

  @override
  String get yourOrderHasBeenDelivered => 'Siparişiniz teslim edildi!';

  @override
  String callingphonenumber(Object phoneNumber) {
    return '$phoneNumber aranıyor...';
  }

  @override
  String get locationPermissionDenied => 'Konum izni reddedildi';

  @override
  String get courier => 'Kurye';

  @override
  String get estimatedDeliveryTime2 => 'TAHMİNİ TESLİMAT SÜRESİ';

  @override
  String get yourOrderHasBeenReceived => 'Siparişiniz alındı';

  @override
  String get theRestaurantIsPreparingYourFood =>
      'Restoran yemeğinizi hazırlıyor';

  @override
  String get yourOrderHasBeenPickedUpForDelivery =>
      'Siparişiniz teslimat için kaldırıldı';

  @override
  String get orderArrivingSoon => 'Sipariş yakında gelecek!';

  @override
  String get selectDeliveryAddress => 'Teslimat Adresi Seçin';

  @override
  String get noAddressesFound => 'Adres bulunamadı';

  @override
  String get pleaseEnterAValidAddress => 'Lütfen geçerli bir adres girin';

  @override
  String get seeAll => 'Tümünü Gör';

  @override
  String get searchForRestaurantsOrDishes => 'Restoran veya yiyecek arayın';

  @override
  String get noRestaurantsFound => 'Restoran bulunamadı';

  @override
  String get updateDialog => 'Güncelleme Diyaloğu';

  @override
  String get updateAvailable => 'Güncelleme Mevcut';

  @override
  String get aNewVersionOfBiteIsReady => 'Bite\'ın yeni sürümü hazır!';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      'Sürüm latestVersion yeni özellikler, ';

  @override
  String get performanceImprovementsAndBugFixes =>
      'performans iyileştirmeleri ve hata düzeltmeleri içerir.';

  @override
  String get updateNow => 'Şimdi Güncelle';

  @override
  String get maybeLater => 'Belki Daha Sonra';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return 'Lütfen $title girin';
  }

  @override
  String get pleaseEnterAValidEmailAddress =>
      'Lütfen geçerli bir e-posta adresi girin';

  @override
  String get pleaseEnterAValidPhoneNumber =>
      'Lütfen geçerli bir telefon numarası girin';

  @override
  String get passwordMustBeAtLeast8CharactersLong =>
      'Şifre en az 8 karakter uzunluğunda olmalıdır';

  @override
  String get howDoITrackMyOrder => 'Siparişimi nasıl takip ederim?';

  @override
  String get canICancelMyOrder => 'Siparişimi iptal edebilir miyim?';

  @override
  String get whatIfMyOrderIsDelayed => 'Siparişim gecikirse ne yapmalıyım?';

  @override
  String get whatPaymentMethodsAreAccepted =>
      'Hangi ödeme yöntemleri kabul edilir?';

  @override
  String get isItSafeToUseMyCreditdebitCardOnBite =>
      'Bite\'te kredi/banka kartımı kullanmak güvenli mi?';

  @override
  String get canIUseMultiplePaymentMethodsForOneOrder =>
      'Bir sipariş için birden fazla ödeme yöntemi kullanabilir miyim?';

  @override
  String get whatShouldIDoIfAPaymentFails =>
      'Ödeme başarısız olursa ne yapmalıyım?';

  @override
  String get whatAreYourDeliveryHours => 'Teslimat saatleriniz nelerdir?';

  @override
  String get doYouChargeADeliveryFee => 'Teslimat ücreti talep ediyor musunuz?';

  @override
  String get doYouDeliverToMyLocation =>
      'Benim konumuma teslimat yapıyor musunuz?';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      'Teslimatı daha sonra için planlayabilir miyim?';

  @override
  String get ongoing => 'Devam Ediyor';

  @override
  String get history => 'Geçmiş';

  @override
  String get favorites => 'Favoriler';

  @override
  String get reviews => 'Değerlendirmeler';

  @override
  String get phone => 'Telefon';

  @override
  String get addressUpdatedSuccessfully => 'Adres başarıyla güncellendi';

  @override
  String failedToUpdateAddress(Object error) {
    return 'Adres güncellenemedi: $error';
  }
}
