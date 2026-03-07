// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get allYourFavorites => 'Tüm favorileriniz';

  @override
  String get getLovedFoodsDescription =>
      'Sevdiğiniz tüm yemekleri tek bir yerde bulun, siz sadece sipariş verin gerisini biz halledelim';

  @override
  String get orderFromChosenChef => 'Seçtiğiniz şeften sipariş verin';

  @override
  String get freeDeliveryOffers => 'Ücretsiz teslimat fırsatları';

  @override
  String get getStarted => 'Başlayın';

  @override
  String get next => 'İleri';

  @override
  String get skip => 'Atla';

  @override
  String get login => 'Giriş Yap';

  @override
  String get logIn => 'Giriş Yap';

  @override
  String get pleaseSignInToContinue => 'Devam etmek için lütfen giriş yapın';

  @override
  String get or => 'Veya';

  @override
  String get successfullySignedInGoogle =>
      'Google ile başarıyla giriş yapıldı!';

  @override
  String get dontHaveAccount => 'Hesabınız yok mu? ';

  @override
  String get signUp => 'Kayıt Ol';

  @override
  String get rememberMe => 'Beni hatırla';

  @override
  String get forgotPassword => 'Şifrenizi mi unuttunuz?';

  @override
  String get email => 'E-posta';

  @override
  String get password => 'Şifre';

  @override
  String get forgotPasswordTitle => 'Şifremi Unuttum';

  @override
  String get passwordResetLinkSent => 'Şifre Sıfırlama Bağlantısı Gönderildi';

  @override
  String get checkEmailResetLink =>
      'Şifre sıfırlama bağlantısı için e-postanızı kontrol edin. Şifrenizi sıfırlamak için bağlantıya tıklayın.';

  @override
  String get done => 'Tamam';

  @override
  String get passwordResetSuccess =>
      'Şifre başarıyla sıfırlandı! Lütfen yeni şifrenizle giriş yapın.';

  @override
  String get pleaseEnterEmailReset =>
      'Şifre sıfırlama bağlantısı almak için lütfen e-posta adresinizi girin.';

  @override
  String get sendResetLink => 'Sıfırlama Bağlantısı Gönder';

  @override
  String get fullName => 'Ad Soyad';

  @override
  String get phoneNumber => 'Telefon Numarası';

  @override
  String get confirmPassword => 'Şifre Onayı';

  @override
  String get pleaseSignUpToGetStarted => 'Başlamak için lütfen kayıt olun';

  @override
  String get deliverTo => 'TESLİMAT ADRESİ';

  @override
  String get selectLocation => 'Konum Seçin';

  @override
  String heyUser(String userName) {
    return 'Merhaba $userName, ';
  }

  @override
  String get goodMorning => 'Günaydın! 👋';

  @override
  String get heyThere => 'Merhaba, ';

  @override
  String get allCategories => 'Tüm Kategoriler';

  @override
  String get openRestaurants => 'Açık Restoranlar';

  @override
  String get search => 'Ara';

  @override
  String get popularRestaurants => 'Popüler Restoranlar';

  @override
  String get noPopularRestaurantsFound => 'Popüler restoran bulunamadı';

  @override
  String get recentKeywords => 'Son Aramalar';

  @override
  String get noRecentSearches => 'Son arama yok';

  @override
  String addedToRecentSearches(String searchTerm) {
    return '\"$searchTerm\" son aramalara eklendi';
  }

  @override
  String removedFromRecentSearches(String searchTerm) {
    return '\"$searchTerm\" son aramalardan kaldırıldı';
  }

  @override
  String get searchRestaurantsOrDishes => 'Restoran veya yemek arayın';

  @override
  String get noRestaurantsFound => 'Restoran bulunamadı';

  @override
  String get deliveryAddress => 'TESLİMAT ADRESİ';

  @override
  String get edit => 'DÜZENLE';

  @override
  String get selectAnAddress => 'Bir adres seçin';

  @override
  String get totalLabel => 'TOPLAM : ';

  @override
  String pkrAmount(String amount) {
    return 'PKR $amount';
  }

  @override
  String get checkoutButton => 'ÖDEME YAP';

  @override
  String get yourCartIsEmpty => 'Sepetiniz boş';

  @override
  String get initializingCart => 'Sepet yükleniyor...';

  @override
  String get cart => 'Sepet';

  @override
  String get checkout => 'Ödeme';

  @override
  String get deliveryAddressTitle => 'Teslimat Adresi';

  @override
  String get change => 'Değiştir';

  @override
  String get noAddressSelected => 'Adres seçilmedi';

  @override
  String get orderItems => 'Sipariş Kalemleri';

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
  String get orderPlacedSuccessfully =>
      'Siparişiniz başarıyla verildi.\nSiparişinizi gerçek zamanlı takip edin.';

  @override
  String get trackOrder => 'Siparişi Takip Et';

  @override
  String get backToHome => 'Ana Sayfaya Dön';

  @override
  String confirmPaymentAmount(String amount) {
    return 'Ödemeyi Onayla  •  PKR $amount';
  }

  @override
  String rsPrice(String price) {
    return 'RS $price';
  }

  @override
  String get chooseYourFlavor => 'Lezzetinizi seçin';

  @override
  String get chooseYourSize => 'Boyutunuzu seçin';

  @override
  String get tenInch => '10 inç';

  @override
  String get sixteenInch => '16 inç';

  @override
  String get twentyInch => '20 inç';

  @override
  String get removeFromCart => 'Sepetten çıkar';

  @override
  String get addToCart => 'Sepete ekle';

  @override
  String get allItems => 'Tüm Ürünler';

  @override
  String get all => 'Tümü';

  @override
  String get failedLoadFoodItems =>
      'Yemekler yüklenemedi. Lütfen daha sonra tekrar deneyin.';

  @override
  String get noFoodItemsCategory => 'Bu kategoride yemek bulunamadı.';

  @override
  String get free => 'Ücretsiz';

  @override
  String deliveryTimeMin(String minutes) {
    return '$minutes dk';
  }

  @override
  String get allRestaurants => 'Tüm Restoranlar';

  @override
  String get selectPaymentMethod => 'Ödeme Yöntemi Seçin';

  @override
  String get cashOnDelivery => 'Kapıda Ödeme';

  @override
  String get payWhenOrderArrives => 'Siparişiniz geldiğinde ödeyin';

  @override
  String get cashOnDeliverySelected => 'Kapıda ödeme seçildi';

  @override
  String get visa => 'Visa';

  @override
  String get selectVisaCards => 'Kayıtlı Visa kartlarınızdan seçin';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get selectMastercardCards => 'Kayıtlı Mastercard kartlarınızdan seçin';

  @override
  String cardEndingInSelected(String last4) {
    return '$last4 ile biten kart seçildi';
  }

  @override
  String noCardsSavedAddFirst(String cardType) {
    return 'Kayıtlı $cardType kartı yok. Önce bir tane ekleyin.';
  }

  @override
  String get savedCards => 'Kayıtlı Kartlar';

  @override
  String get creditCardAddedSuccess => 'Kredi kartı başarıyla eklendi';

  @override
  String get creditCardDeletedSuccess => 'Kredi kartı başarıyla silindi';

  @override
  String get noSavedCardsYet => 'Henüz kayıtlı kart yok';

  @override
  String get addCardBelowToGetStarted => 'Başlamak için aşağıdan kart ekleyin';

  @override
  String maskedCardNumber(String last4) {
    return '**** **** **** $last4';
  }

  @override
  String cardHolderExpiry(String holderName, String expiryDate) {
    return '$holderName  •  $expiryDate';
  }

  @override
  String get addNewCard => 'Yeni Kart Ekle';

  @override
  String get cardInformation => 'Kart Bilgileri';

  @override
  String get cardNumberPlaceholder => '4242 4242 4242 4242';

  @override
  String get cardNumberRequired => 'Kart numarası gerekli';

  @override
  String get cardNumberTooShort => 'Kart numarası çok kısa';

  @override
  String get mmyyPlaceholder => 'AA/YY';

  @override
  String get invalidMonth => 'Geçersiz ay';

  @override
  String get cvcPlaceholder => 'CVC';

  @override
  String get invalidCvc => 'Geçersiz CVC';

  @override
  String get fullNameOnCard => 'Kart üzerindeki ad soyad';

  @override
  String get cardSecurityNote =>
      'Kart bilgileriniz Stripe tarafından güvenli bir şekilde işlenir. Tam kart numaranızı asla saklamayız.';

  @override
  String get adding => 'Ekleniyor...';

  @override
  String get addCard => 'Kart Ekle';

  @override
  String get addAddress => 'Adres Ekle';

  @override
  String get addressNotAvailable => 'Adres mevcut değil';

  @override
  String get failedLoadAddresses => 'Adresler yüklenemedi';

  @override
  String get noSavedAddresses => 'Henüz kayıtlı adres yok';

  @override
  String get pleaseSignInAddresses => 'Adresleri görüntülemek için giriş yapın';

  @override
  String get address => 'Adres';

  @override
  String get locationPermissionRequired => 'Konum izni gerekli';

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
  String get pleaseFillAllFields => 'Lütfen tüm gerekli alanları doldurun';

  @override
  String get userNotAuthenticated => 'Kullanıcı doğrulanmamış';

  @override
  String get addressAddedSuccessfully => 'Adres başarıyla eklendi!';

  @override
  String failedToAddAddress(String error) {
    return 'Adres eklenemedi: $error';
  }

  @override
  String get save => 'Kaydet';

  @override
  String get selectDeliveryAddress => 'Teslimat Adresi Seçin';

  @override
  String get noAddressesFound => 'Adres bulunamadı';

  @override
  String get iLoveFastFood => 'Fast Food Seviyorum';

  @override
  String get logout => 'Çıkış Yap';

  @override
  String get profile => 'Profil';

  @override
  String get personalInfo => 'Kişisel Bilgiler';

  @override
  String get guestUser => 'Misafir Kullanıcı';

  @override
  String get pleaseLoginViewProfile =>
      'Profilinizi görüntülemek için giriş yapın';

  @override
  String editTitle(String title) {
    return '$title Düzenle';
  }

  @override
  String enterTitle(String title) {
    return '$title girin';
  }

  @override
  String get apply => 'Uygula';

  @override
  String get phone => 'Telefon';

  @override
  String get favourite => 'Favori';

  @override
  String get foods => 'Yemekler';

  @override
  String get restaurants => 'Restoranlar';

  @override
  String get noFavouriteRestaurants => 'Favori restoran bulunamadı.';

  @override
  String get noFavouriteFoods => 'Favori yemek bulunamadı.';

  @override
  String get orderRatings => 'Sipariş Değerlendirmeleri';

  @override
  String get restaurantRatings => 'Restoran Değerlendirmeleri';

  @override
  String get userReviews => 'Kullanıcı Yorumları';

  @override
  String get submit => 'Gönder';

  @override
  String get review => 'Yorum';

  @override
  String get myReviews => 'Yorumlarım';

  @override
  String get orderCancelledSuccessfully => 'Sipariş başarıyla iptal edildi';

  @override
  String get clearOrderHistory => 'Sipariş Geçmişini Temizle';

  @override
  String get confirmDeleteOrderHistory =>
      'Tüm sipariş geçmişini silmek istediğinizden emin misiniz? Bu işlem geri alınamaz.';

  @override
  String get cancel => 'İptal';

  @override
  String get clearAll => 'Tümünü Temizle';

  @override
  String get clearOrderHistoryMenu => 'Sipariş geçmişini temizle';

  @override
  String get orderHistory => 'Sipariş Geçmişi';

  @override
  String get noCompletedOrders => 'Henüz tamamlanmış sipariş yok';

  @override
  String get noOngoingOrders => 'Devam eden sipariş yok';

  @override
  String get noOrderHistory => 'Sipariş geçmişi yok';

  @override
  String get ongoing => 'Devam Eden';

  @override
  String get history => 'Geçmiş';

  @override
  String get noActiveOrder => 'Aktif sipariş yok';

  @override
  String get orderDelivered => 'Siparişiniz teslim edildi!';

  @override
  String callingNumber(String phoneNumber) {
    return '$phoneNumber aranıyor...';
  }

  @override
  String get locationPermissionDenied => 'Konum izni reddedildi';

  @override
  String get orderReceived => 'Siparişiniz alındı';

  @override
  String get restaurantPreparingFood => 'Restoran yemeğinizi hazırlıyor';

  @override
  String get orderPickedUp => 'Siparişiniz teslimata çıktı';

  @override
  String get orderArrivingSoon => 'Sipariş yakında geliyor!';

  @override
  String get estimatedDeliveryTime => 'TAHMİNİ TESLİMAT SÜRESİ';

  @override
  String estimatedMinutes(String minutes) {
    return '$minutes dk';
  }

  @override
  String orderedAt(String date) {
    return '$date tarihinde sipariş verildi';
  }

  @override
  String get courier => 'Kurye';

  @override
  String get noNotificationsYet => 'Henüz bildirim yok';

  @override
  String unreadNotificationsCount(int count) {
    return '$count okunmamış bildirim';
  }

  @override
  String get noNotifications => 'Bildirim yok';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get markAllAsRead => 'Tümünü okundu işaretle';

  @override
  String get clearAllNotifications => 'Tümünü temizle';

  @override
  String get allTab => 'Tümü';

  @override
  String get unread => 'Okunmamış';

  @override
  String get preferences => 'TERCİHLER';

  @override
  String get darkMode => 'Karanlık Mod';

  @override
  String get language => 'Dil';

  @override
  String get english => 'İngilizce';

  @override
  String get themes => 'Temalar';

  @override
  String get settings => 'Ayarlar';

  @override
  String get versionInfoNotAvailable => 'Sürüm bilgisi mevcut değil';

  @override
  String get faqs => 'SSS';

  @override
  String get orderFaq => 'Sipariş';

  @override
  String get paymentsFaq => 'Ödemeler';

  @override
  String get deliveryFaq => 'Teslimat';

  @override
  String get chat => 'Sohbet';

  @override
  String get call => 'Ara';

  @override
  String get howTrackOrder => 'Siparişimi nasıl takip edebilirim?';

  @override
  String get canCancelOrder => 'Siparişimi iptal edebilir miyim?';

  @override
  String get whatIfOrderDelayed => 'Siparişim gecikirse ne olur?';

  @override
  String get whatPaymentMethodsAccepted =>
      'Hangi ödeme yöntemleri kabul ediliyor?';

  @override
  String get isCardSafeBite =>
      'Bite\'ta kredi/banka kartımı kullanmak güvenli mi?';

  @override
  String get canUseMultiplePaymentMethods =>
      'Bir sipariş için birden fazla ödeme yöntemi kullanabilir miyim?';

  @override
  String get whatIfPaymentFails => 'Ödeme başarısız olursa ne yapmalıyım?';

  @override
  String get whatDeliveryHours => 'Teslimat saatleriniz nedir?';

  @override
  String get chargeDeliveryFee => 'Teslimat ücreti alıyor musunuz?';

  @override
  String get deliverToLocation => 'Benim konumuma teslimat yapıyor musunuz?';

  @override
  String get scheduleDeliveryLater =>
      'Daha sonrası için teslimat planlayabilir miyim?';

  @override
  String get clear => 'TEMİZLE';

  @override
  String get applyFilter => 'UYGULA';

  @override
  String get ratingFilter => 'DEĞERLENDİRME';

  @override
  String get lessThan3_5 => '< 3.5';

  @override
  String get between3_5And4_0 => '3.5 - 4.0';

  @override
  String get greaterThan4_0 => '> 4.0';

  @override
  String get deliveryTimeFilter => 'TESLİMAT SÜRESİ';

  @override
  String get lessThan15Min => '< 15 dk';

  @override
  String get between15And30Min => '15 - 30 dk';

  @override
  String get greaterThan30Min => '> 30 dk';

  @override
  String get filterYourSearch => 'Aramanızı filtreleyin';

  @override
  String get seeAll => 'Tümünü Gör';

  @override
  String enterField(String field) {
    return '$field girin';
  }

  @override
  String pleaseEnterField(String field) {
    return 'Lütfen $field girin';
  }

  @override
  String get pleaseEnterValidEmail => 'Lütfen geçerli bir e-posta adresi girin';

  @override
  String get pleaseEnterValidPhone =>
      'Lütfen geçerli bir telefon numarası girin';

  @override
  String get passwordMinimum8Chars => 'Şifre en az 8 karakter olmalıdır';

  @override
  String get favorites => 'Favoriler';

  @override
  String get reviews => 'Yorumlar';

  @override
  String get updateAvailable => 'Güncelleme Mevcut';

  @override
  String get newBiteVersionReady => 'Bite\'ın yeni sürümü hazır!';

  @override
  String updateDescription(String version) {
    return 'Sürüm $version yeni özellikler, performans iyileştirmeleri ve hata düzeltmeleri içerir.';
  }

  @override
  String versionPrefix(String version) {
    return 'v$version';
  }

  @override
  String get updateNow => 'Şimdi Güncelle';

  @override
  String get maybeLater => 'Belki Daha Sonra';

  @override
  String errorMessage(String message) {
    return 'Hata: $message';
  }
}
