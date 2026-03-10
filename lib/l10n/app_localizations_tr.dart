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
    return 'Hata: \$$stateMessage';
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
  String get home => 'Ana sayfa';

  @override
  String get work => 'iş';

  @override
  String get other => 'Diğer';

  @override
  String get pleaseFillAllRequiredFields =>
      'Lütfen gerekli tüm alanları doldurun';

  @override
  String get userNotAuthenticated => 'Kullanıcının kimliği doğrulanmadı';

  @override
  String get addressAddedSuccessfully => 'Adres başarıyla eklendi!';

  @override
  String failedToAddAddressError(Object error) {
    return 'Adres eklenemedi: \$$error';
  }

  @override
  String get save => 'Kaydet';

  @override
  String get addAddress => 'Adres Ekle';

  @override
  String get failedToLoadAddresses => 'Adresler yüklenemedi';

  @override
  String get noSavedAddressesYet => 'Henüz kayıtlı adres yok';

  @override
  String get pleaseSignInToViewAddresses =>
      'Adresleri görüntülemek için lütfen oturum açın';

  @override
  String get deliveryAddress2 => 'TESLİMAT ADRESİ';

  @override
  String get edit2 => 'DÜZENLE';

  @override
  String get selectAnAddress => 'Bir adres seçin';

  @override
  String get total2 => 'TOPLAM :';

  @override
  String get checkout2 => 'ÖDEME';

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
  String get apply2 => 'BAŞVUR';

  @override
  String get rating2 => 'DERECELENDİRME';

  @override
  String get deliveryTime2 => 'TESLİMAT SÜRESİ';

  @override
  String get filterYourSearch => 'Aramanızı filtreleyin';

  @override
  String get checkout => 'Ödeme';

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
  String get subtotal => 'Ara toplam';

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
      'Siparişiniz başarıyla verildi.\\nSiparişinizi gerçek zamanlı olarak takip edin.';

  @override
  String get backToHome => 'Ana Sayfaya Geri Dön';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return 'Ödeme başarısız oldu: \$$errorMessage';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return 'Ödemeyi Onayla • PKR \$$grandTotal';
  }

  @override
  String get paysWhenOrderArrives => 'Sipariş Geldiğinde Öder';

  @override
  String get noCardDetails => 'Kart detayı yok';

  @override
  String get faqs => 'SSS';

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
  String get noFavouriteRestaurantsFound => 'Favori restoran bulunamadı.';

  @override
  String get noFavouriteFoodsFound => 'Favori yiyecek bulunamadı.';

  @override
  String get foods => 'Gıdalar';

  @override
  String get restaurants => 'Restoranlar';

  @override
  String get removeFromFavourites => 'Favorilerden kaldır';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      'Bu yiyecek öğesini favorilerinizden çıkarmak istediğinizden emin misiniz?';

  @override
  String get cancel => 'İptal';

  @override
  String get remove => 'Kaldır';

  @override
  String get orderAgain => 'Tekrar Sipariş Ver';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      'Bu restoranı favorilerinizden çıkarmak istediğinizden emin misiniz?';

  @override
  String get removeFromCart => 'Sepetten kaldır';

  @override
  String get addToCart => 'Sepete ekle';

  @override
  String get chooseYourFlavor => 'Lezzetinizi seçin';

  @override
  String get chooseYourSize => 'Bedeninizi seçin';

  @override
  String get passwordResetLinkSent => 'Şifre Sıfırlama Bağlantısı Gönderildi';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      'Parola sıfırlama bağlantısı için e-postanızı kontrol edin. Web sitemizdeki şifrenizi sıfırlamak için bağlantıya tıklayın.';

  @override
  String get passwordResetSuccessfully =>
      'Şifre başarıyla sıfırlandı! Lütfen yeni şifrenizle giriş yapınız.';

  @override
  String get done => 'Bitti';

  @override
  String get sendResetLink => 'Sıfırlama Bağlantısını Gönder';

  @override
  String get forgotPassword => 'Şifremi Unuttum';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      'Şifre sıfırlama bağlantısı almak için lütfen e-posta adresinizi girin.';

  @override
  String get or => 'veya';

  @override
  String get successfullySignedInWithGoogle =>
      'Google\'da başarıyla oturum açıldı!';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'Google Oturum Açma Hatası: \$$stateMessage';
  }

  @override
  String get dontHaveAnAccount => 'Hesabınız yok mu?';

  @override
  String get signUp => 'Kaydol';

  @override
  String get login => 'Giriş yap';

  @override
  String get rememberMe => 'Beni hatırla';

  @override
  String get password => 'Şifre';

  @override
  String get logIn => 'Giriş Yap';

  @override
  String get pleaseSignInToContinue => 'Devam etmek için lütfen oturum açın';

  @override
  String get noNotificationsYet => 'Henüz bildirim yok';

  @override
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return '\$$unreadCount okunmamış bildirimler';
  }

  @override
  String allNotifications(Object totalCount) {
    return 'Hepsi (\$$totalCount)';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return 'Okunmamış (\$$unreadCount)';
  }

  @override
  String get notifications => 'Bildirimler';

  @override
  String get clearAllNotifications => 'Tüm Bildirimleri Temizle';

  @override
  String get deleteAllNotificationsConfirmation =>
      'Tüm bildirimleri silmek istediğinizden emin misiniz? Bu eylem geri alınamaz.';

  @override
  String get markAllAsRead => 'Tümünü okundu olarak işaretle';

  @override
  String get clearAll => 'Tümünü temizle';

  @override
  String get allYourFavorites => 'Tüm favorileriniz';

  @override
  String get getAllYourLovedFoodsInOnePlace =>
      'Sevdiğiniz tüm yiyecekleri tek bir yerde toplayın, siz sadece siparişi verin gerisini biz hallederiz';

  @override
  String get orderFromChoosenChef => 'Seçilen şeften sipariş verin';

  @override
  String get freeDeliveryOffers => 'Ücretsiz teslimat teklifleri';

  @override
  String get getStarted => 'Başlayın';

  @override
  String get next => 'Sonraki';

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
      'Tüm sipariş geçmişini silmek istediğinizden emin misiniz? Bu eylem geri alınamaz.';

  @override
  String get noCompletedOrdersYet => 'Henüz tamamlanmış sipariş yok';

  @override
  String get rate => 'Oran';

  @override
  String get cancelOrder => 'Siparişi İptal Et';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      'Bu siparişi iptal etmek istediğinizden emin misiniz?';

  @override
  String get yesCancel => 'Evet, İptal';

  @override
  String get reorder => 'Yeniden sırala';

  @override
  String get cardInformation => 'Kart Bilgileri';

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
      'Kart bilgileriniz Stripe tarafından güvenli bir şekilde işlenir. Kart numaranızın tamamını asla saklamayız.';

  @override
  String get adding => 'Ekleniyor...';

  @override
  String get addCard => 'Kart Ekle';

  @override
  String get selectPaymentMethod => 'Ödeme Yöntemini Seçin';

  @override
  String get cashOnDelivery => 'Kapıda Ödeme';

  @override
  String get payWhenYourOrderArrives => 'Siparişiniz geldiğinde ödeme yapın';

  @override
  String get cashOnDeliverySelected => 'Kapıda Ödeme seçildi';

  @override
  String get visa => 'Vize';

  @override
  String get selectFromYourSavedVisaCards =>
      'Kayıtlı Visa kartlarınızdan seçim yapın';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get selectFromYourSavedMastercards =>
      'Kayıtlı Mastercard\'larınız arasından seçim yapın';

  @override
  String get savedCards => 'Kayıtlı Kartlar';

  @override
  String get creditCardAddedSuccessfully => 'Kredi kartı başarıyla eklendi';

  @override
  String get creditCardDeletedSuccessfully => 'Kredi kartı başarıyla silindi';

  @override
  String get failedToLoadCards => 'Kartlar yüklenemedi';

  @override
  String get noSavedCardsYet => 'Henüz kayıtlı kart yok';

  @override
  String get addACardBelowToGetStarted =>
      'Başlamak için aşağıya bir kart ekleyin';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return '\$$last4 ile biten kart seçildi';
  }

  @override
  String get addNewCard => 'Yeni Kart Ekle';

  @override
  String get personalInfo => 'Kişisel Bilgiler';

  @override
  String get guestUser => 'Misafir Kullanıcı';

  @override
  String get pleaseLoginToViewYourProfile =>
      'Profilinizi görüntülemek için lütfen giriş yapın';

  @override
  String editTitle(Object title) {
    return '\$$title\'yi düzenle';
  }

  @override
  String get apply => 'Uygula';

  @override
  String get logout => 'Oturumu kapat';

  @override
  String get signup => 'Kayıt Ol';

  @override
  String get profile => 'Profil';

  @override
  String get allRestaurants => 'Tüm Restoranlar';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      'Yiyecek öğeleri yüklenemedi. Lütfen daha sonra tekrar deneyin.';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      'Bu kategoriye ait gıda maddesi mevcut değil.';

  @override
  String get myReviews => 'İncelemelerim';

  @override
  String get popularRestaurants => 'Popüler Restoranlar';

  @override
  String get noPopularRestaurantsFound => 'Popüler restoran bulunamadı';

  @override
  String get recentKeywords => 'Son Anahtar Kelimeler';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return 'Son aramalara \"\$$search\" eklendi';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return '\"\$$search\" son aramalardan kaldırıldı';
  }

  @override
  String get noRecentSearches => 'Yeni arama yok';

  @override
  String get search => 'Ara';

  @override
  String get preferences2 => 'TERCİHLER';

  @override
  String get darkMode => 'Karanlık Mod';

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
  String get pleaseSignUpToGetStarted => 'Başlamak için lütfen Kaydolun';

  @override
  String get noActiveOrder => 'Aktif sipariş yok';

  @override
  String get yourOrderHasBeenDelivered => 'Siparişiniz teslim edildi!';

  @override
  String callingphonenumber(Object phoneNumber) {
    return '\$$phoneNumber aranıyor...';
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
      'Siparişiniz teslim edilmek üzere alınmıştır';

  @override
  String get orderArrivingSoon => 'Sipariş yakında geliyor!';

  @override
  String get selectDeliveryAddress => 'Teslimat Adresini Seçin';

  @override
  String get noAddressesFound => 'Adres bulunamadı';

  @override
  String get pleaseEnterAValidAddress => 'Lütfen geçerli bir adres girin';

  @override
  String get seeAll => 'Tümünü Gör';

  @override
  String get searchForRestaurantsOrDishes => 'Restoran veya yemek arayın';

  @override
  String get noRestaurantsFound => 'Restoran bulunamadı';

  @override
  String get updateDialog => 'İletişim Kutusunu Güncelle';

  @override
  String get updateAvailable => 'Güncelleme Mevcut';

  @override
  String get aNewVersionOfBiteIsReady => 'Bite\'ın yeni versiyonu hazır!';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      'Sürüm \$latestVersion yeni özellikler içerir,';

  @override
  String get performanceImprovementsAndBugFixes =>
      'performans iyileştirmeleri ve hata düzeltmeleri.';

  @override
  String get updateNow => 'Şimdi Güncelle';

  @override
  String get maybeLater => 'Belki Daha Sonra';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return 'Lütfen \$$title girin';
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
  String get whatIfMyOrderIsDelayed => 'Siparişim gecikirse ne olur?';

  @override
  String get whatPaymentMethodsAreAccepted =>
      'Hangi ödeme yöntemleri kabul ediliyor?';

  @override
  String get isItSafeToUseMyCreditdebitCardOnBite =>
      'Kredi/banka kartımı Bite\'ta kullanmak güvenli mi?';

  @override
  String get canIUseMultiplePaymentMethodsForOneOrder =>
      'Bir sipariş için birden fazla ödeme yöntemi kullanabilir miyim?';

  @override
  String get whatShouldIDoIfAPaymentFails =>
      'Bir ödeme başarısız olursa ne yapmalıyım?';

  @override
  String get whatAreYourDeliveryHours => 'Teslimat saatleriniz nedir?';

  @override
  String get doYouChargeADeliveryFee => 'Teslimat ücreti alıyor musunuz?';

  @override
  String get doYouDeliverToMyLocation =>
      'Bulunduğum yere teslimat yapıyor musunuz?';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      'Teslimatı daha sonraki bir zamana planlayabilir miyim?';

  @override
  String get ongoing => 'devam ediyor';

  @override
  String get history => 'Tarih';

  @override
  String get favorites => 'Favoriler';

  @override
  String get reviews => 'Yorumlar';

  @override
  String get phone => 'Telefon';
}
