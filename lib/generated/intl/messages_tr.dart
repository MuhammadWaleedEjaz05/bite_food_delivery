// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'tr';

  static String m0(search) => "Son aramalara \"\$${search}\" eklendi";

  static String m1(totalCount) => "Hepsi (\$${totalCount})";

  static String m2(phoneNumber) => "\$${phoneNumber} aranıyor...";

  static String m3(last4) => "\$${last4} ile biten kart seçildi";

  static String m4(grandTotal) => "Ödemeyi Onayla • PKR \$${grandTotal}";

  static String m5(title) => "\$${title}\'yi düzenle";

  static String m6(stateMessage) => "Hata: \$${stateMessage}";

  static String m7(error) => "Adres eklenemedi: \$${error}";

  static String m8(stateMessage) =>
      "Google Oturum Açma Hatası: \$${stateMessage}";

  static String m9(errorMessage) => "Ödeme başarısız oldu: \$${errorMessage}";

  static String m10(title) => "Lütfen \$${title} girin";

  static String m11(search) => "\"\$${search}\" son aramalardan kaldırıldı";

  static String m12(unreadCount) => "\$${unreadCount} okunmamış bildirimler";

  static String m13(unreadCount) => "Okunmamış (\$${unreadCount})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aNewVersionOfBiteIsReady": MessageLookupByLibrary.simpleMessage(
      "Bite\'ın yeni versiyonu hazır!",
    ),
    "addACardBelowToGetStarted": MessageLookupByLibrary.simpleMessage(
      "Başlamak için aşağıya bir kart ekleyin",
    ),
    "addAddress": MessageLookupByLibrary.simpleMessage("Adres Ekle"),
    "addCard": MessageLookupByLibrary.simpleMessage("Kart Ekle"),
    "addNewCard": MessageLookupByLibrary.simpleMessage("Yeni Kart Ekle"),
    "addToCart": MessageLookupByLibrary.simpleMessage("Sepete ekle"),
    "addedStatesearchToRecentSearches": m0,
    "adding": MessageLookupByLibrary.simpleMessage("Ekleniyor..."),
    "address": MessageLookupByLibrary.simpleMessage("Adres"),
    "addressAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Adres başarıyla eklendi!",
    ),
    "allCategories": MessageLookupByLibrary.simpleMessage("Tüm Kategoriler"),
    "allNotifications": m1,
    "allRestaurants": MessageLookupByLibrary.simpleMessage("Tüm Restoranlar"),
    "allYourFavorites": MessageLookupByLibrary.simpleMessage(
      "Tüm favorileriniz",
    ),
    "apply": MessageLookupByLibrary.simpleMessage("Uygula"),
    "apply2": MessageLookupByLibrary.simpleMessage("BAŞVUR"),
    "areYouSureYouWantToCancelThisOrder": MessageLookupByLibrary.simpleMessage(
      "Bu siparişi iptal etmek istediğinizden emin misiniz?",
    ),
    "areYouSureYouWantToDeleteAllOrderHistory":
        MessageLookupByLibrary.simpleMessage(
          "Tüm sipariş geçmişini silmek istediğinizden emin misiniz? Bu eylem geri alınamaz.",
        ),
    "areYouSureYouWantToRemoveThisFoodItem": MessageLookupByLibrary.simpleMessage(
      "Bu yiyecek öğesini favorilerinizden çıkarmak istediğinizden emin misiniz?",
    ),
    "areYouSureYouWantToRemoveThisRestaurantFrom":
        MessageLookupByLibrary.simpleMessage(
          "Bu restoranı favorilerinizden çıkarmak istediğinizden emin misiniz?",
        ),
    "backToHome": MessageLookupByLibrary.simpleMessage("Ana Sayfaya Geri Dön"),
    "call": MessageLookupByLibrary.simpleMessage("Ara"),
    "callingphonenumber": m2,
    "canICancelMyOrder": MessageLookupByLibrary.simpleMessage(
      "Siparişimi iptal edebilir miyim?",
    ),
    "canIScheduleADeliveryForALaterTime": MessageLookupByLibrary.simpleMessage(
      "Teslimatı daha sonraki bir zamana planlayabilir miyim?",
    ),
    "canIUseMultiplePaymentMethodsForOneOrder":
        MessageLookupByLibrary.simpleMessage(
          "Bir sipariş için birden fazla ödeme yöntemi kullanabilir miyim?",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("İptal"),
    "cancelOrder": MessageLookupByLibrary.simpleMessage("Siparişi İptal Et"),
    "cardEndingInCreditcardlast4Selected": m3,
    "cardHolder": MessageLookupByLibrary.simpleMessage("Kart Sahibi"),
    "cardInformation": MessageLookupByLibrary.simpleMessage("Kart Bilgileri"),
    "cardNumberIsRequired": MessageLookupByLibrary.simpleMessage(
      "Kart numarası gerekli",
    ),
    "cardNumberIsTooShort": MessageLookupByLibrary.simpleMessage(
      "Kart numarası çok kısa",
    ),
    "cart": MessageLookupByLibrary.simpleMessage("Sepet"),
    "cashOnDelivery": MessageLookupByLibrary.simpleMessage("Kapıda Ödeme"),
    "cashOnDeliverySelected": MessageLookupByLibrary.simpleMessage(
      "Kapıda Ödeme seçildi",
    ),
    "change": MessageLookupByLibrary.simpleMessage("Değiştir"),
    "chat": MessageLookupByLibrary.simpleMessage("Sohbet"),
    "checkYourEmailForAPasswordResetLink": MessageLookupByLibrary.simpleMessage(
      "Parola sıfırlama bağlantısı için e-postanızı kontrol edin. Web sitemizdeki şifrenizi sıfırlamak için bağlantıya tıklayın.",
    ),
    "checkout": MessageLookupByLibrary.simpleMessage("Ödeme"),
    "checkout2": MessageLookupByLibrary.simpleMessage("ÖDEME"),
    "chooseYourFlavor": MessageLookupByLibrary.simpleMessage(
      "Lezzetinizi seçin",
    ),
    "chooseYourSize": MessageLookupByLibrary.simpleMessage("Bedeninizi seçin"),
    "city": MessageLookupByLibrary.simpleMessage("Şehir"),
    "clear2": MessageLookupByLibrary.simpleMessage("TEMİZLE"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Tümünü temizle"),
    "clearAllNotifications": MessageLookupByLibrary.simpleMessage(
      "Tüm Bildirimleri Temizle",
    ),
    "clearOrderHistory": MessageLookupByLibrary.simpleMessage(
      "Sipariş Geçmişini Temizle",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Şifreyi Onayla"),
    "confirmPayment": m4,
    "country": MessageLookupByLibrary.simpleMessage("Ülke"),
    "courier": MessageLookupByLibrary.simpleMessage("Kurye"),
    "creditCardAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Kredi kartı başarıyla eklendi",
    ),
    "creditCardDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Kredi kartı başarıyla silindi",
    ),
    "cvc": MessageLookupByLibrary.simpleMessage("CVC"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Karanlık Mod"),
    "deleteAllNotificationsConfirmation": MessageLookupByLibrary.simpleMessage(
      "Tüm bildirimleri silmek istediğinizden emin misiniz? Bu eylem geri alınamaz.",
    ),
    "delivery": MessageLookupByLibrary.simpleMessage("Teslimat"),
    "deliveryAddress": MessageLookupByLibrary.simpleMessage("Teslimat Adresi"),
    "deliveryAddress2": MessageLookupByLibrary.simpleMessage("TESLİMAT ADRESİ"),
    "deliveryFee": MessageLookupByLibrary.simpleMessage("Teslimat Ücreti"),
    "deliveryTime2": MessageLookupByLibrary.simpleMessage("TESLİMAT SÜRESİ"),
    "doYouChargeADeliveryFee": MessageLookupByLibrary.simpleMessage(
      "Teslimat ücreti alıyor musunuz?",
    ),
    "doYouDeliverToMyLocation": MessageLookupByLibrary.simpleMessage(
      "Bulunduğum yere teslimat yapıyor musunuz?",
    ),
    "done": MessageLookupByLibrary.simpleMessage("Bitti"),
    "dontHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Hesabınız yok mu?",
    ),
    "edit2": MessageLookupByLibrary.simpleMessage("DÜZENLE"),
    "editTitle": m5,
    "email": MessageLookupByLibrary.simpleMessage("E-posta"),
    "errorStatemessage": m6,
    "estimatedDeliveryTime2": MessageLookupByLibrary.simpleMessage(
      "TAHMİNİ TESLİMAT SÜRESİ",
    ),
    "failedToAddAddressError": m7,
    "failedToLoadAddresses": MessageLookupByLibrary.simpleMessage(
      "Adresler yüklenemedi",
    ),
    "failedToLoadCards": MessageLookupByLibrary.simpleMessage(
      "Kartlar yüklenemedi",
    ),
    "failedToLoadFoodItemsPleaseTryAgainLater":
        MessageLookupByLibrary.simpleMessage(
          "Yiyecek öğeleri yüklenemedi. Lütfen daha sonra tekrar deneyin.",
        ),
    "faqs": MessageLookupByLibrary.simpleMessage("SSS"),
    "favorites": MessageLookupByLibrary.simpleMessage("Favoriler"),
    "filterYourSearch": MessageLookupByLibrary.simpleMessage(
      "Aramanızı filtreleyin",
    ),
    "foods": MessageLookupByLibrary.simpleMessage("Gıdalar"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Şifremi Unuttum"),
    "freeDeliveryOffers": MessageLookupByLibrary.simpleMessage(
      "Ücretsiz teslimat teklifleri",
    ),
    "fullName": MessageLookupByLibrary.simpleMessage("Tam Ad"),
    "fullNameOnCard": MessageLookupByLibrary.simpleMessage("Karttaki tam ad"),
    "getAllYourLovedFoodsInOnePlace": MessageLookupByLibrary.simpleMessage(
      "Sevdiğiniz tüm yiyecekleri tek bir yerde toplayın, siz sadece siparişi verin gerisini biz hallederiz",
    ),
    "getStarted": MessageLookupByLibrary.simpleMessage("Başlayın"),
    "googleSigninErrorStatemessage": m8,
    "guestUser": MessageLookupByLibrary.simpleMessage("Misafir Kullanıcı"),
    "history": MessageLookupByLibrary.simpleMessage("Tarih"),
    "home": MessageLookupByLibrary.simpleMessage("Ana sayfa"),
    "howDoITrackMyOrder": MessageLookupByLibrary.simpleMessage(
      "Siparişimi nasıl takip ederim?",
    ),
    "invalidCvc": MessageLookupByLibrary.simpleMessage("Geçersiz CVC"),
    "invalidMonth": MessageLookupByLibrary.simpleMessage("Geçersiz ay"),
    "isItSafeToUseMyCreditdebitCardOnBite":
        MessageLookupByLibrary.simpleMessage(
          "Kredi/banka kartımı Bite\'ta kullanmak güvenli mi?",
        ),
    "label": MessageLookupByLibrary.simpleMessage("Etiket"),
    "language": MessageLookupByLibrary.simpleMessage("Dil"),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Konum izni reddedildi",
    ),
    "locationPermissionIsRequired": MessageLookupByLibrary.simpleMessage(
      "Konum izni gerekli",
    ),
    "logIn": MessageLookupByLibrary.simpleMessage("Giriş Yap"),
    "login": MessageLookupByLibrary.simpleMessage("Giriş yap"),
    "logout": MessageLookupByLibrary.simpleMessage("Oturumu kapat"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Tümünü okundu olarak işaretle",
    ),
    "mastercard": MessageLookupByLibrary.simpleMessage("Mastercard"),
    "maybeLater": MessageLookupByLibrary.simpleMessage("Belki Daha Sonra"),
    "myReviews": MessageLookupByLibrary.simpleMessage("İncelemelerim"),
    "next": MessageLookupByLibrary.simpleMessage("Sonraki"),
    "noActiveOrder": MessageLookupByLibrary.simpleMessage("Aktif sipariş yok"),
    "noAddressSelected": MessageLookupByLibrary.simpleMessage(
      "Adres seçilmedi",
    ),
    "noAddressesFound": MessageLookupByLibrary.simpleMessage(
      "Adres bulunamadı",
    ),
    "noCardDetails": MessageLookupByLibrary.simpleMessage("Kart detayı yok"),
    "noCompletedOrdersYet": MessageLookupByLibrary.simpleMessage(
      "Henüz tamamlanmış sipariş yok",
    ),
    "noFavouriteFoodsFound": MessageLookupByLibrary.simpleMessage(
      "Favori yiyecek bulunamadı.",
    ),
    "noFavouriteRestaurantsFound": MessageLookupByLibrary.simpleMessage(
      "Favori restoran bulunamadı.",
    ),
    "noFoodItemsAvailableForThisCategory": MessageLookupByLibrary.simpleMessage(
      "Bu kategoriye ait gıda maddesi mevcut değil.",
    ),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "Henüz bildirim yok",
    ),
    "noOngoingOrders": MessageLookupByLibrary.simpleMessage(
      "Devam eden sipariş yok",
    ),
    "noOrderHistory": MessageLookupByLibrary.simpleMessage(
      "Sipariş geçmişi yok",
    ),
    "noPopularRestaurantsFound": MessageLookupByLibrary.simpleMessage(
      "Popüler restoran bulunamadı",
    ),
    "noRecentSearches": MessageLookupByLibrary.simpleMessage("Yeni arama yok"),
    "noRestaurantsFound": MessageLookupByLibrary.simpleMessage(
      "Restoran bulunamadı",
    ),
    "noSavedAddressesYet": MessageLookupByLibrary.simpleMessage(
      "Henüz kayıtlı adres yok",
    ),
    "noSavedCardsYet": MessageLookupByLibrary.simpleMessage(
      "Henüz kayıtlı kart yok",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Bildirimler"),
    "ongoing": MessageLookupByLibrary.simpleMessage("devam ediyor"),
    "openRestaurants": MessageLookupByLibrary.simpleMessage("Açık Restoranlar"),
    "or": MessageLookupByLibrary.simpleMessage("veya"),
    "order": MessageLookupByLibrary.simpleMessage("Sipariş"),
    "orderAgain": MessageLookupByLibrary.simpleMessage("Tekrar Sipariş Ver"),
    "orderArrivingSoon": MessageLookupByLibrary.simpleMessage(
      "Sipariş yakında geliyor!",
    ),
    "orderCancelledSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Sipariş başarıyla iptal edildi",
    ),
    "orderFromChoosenChef": MessageLookupByLibrary.simpleMessage(
      "Seçilen şeften sipariş verin",
    ),
    "orderHistory": MessageLookupByLibrary.simpleMessage("Sipariş Geçmişi"),
    "orderItems": MessageLookupByLibrary.simpleMessage("Sipariş Öğeleri"),
    "orderPlaced": MessageLookupByLibrary.simpleMessage("Sipariş Verildi!"),
    "orderSummary": MessageLookupByLibrary.simpleMessage("Sipariş Özeti"),
    "other": MessageLookupByLibrary.simpleMessage("Diğer"),
    "password": MessageLookupByLibrary.simpleMessage("Şifre"),
    "passwordMustBeAtLeast8CharactersLong":
        MessageLookupByLibrary.simpleMessage(
          "Şifre en az 8 karakter uzunluğunda olmalıdır",
        ),
    "passwordResetLinkSent": MessageLookupByLibrary.simpleMessage(
      "Şifre Sıfırlama Bağlantısı Gönderildi",
    ),
    "passwordResetSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Şifre başarıyla sıfırlandı! Lütfen yeni şifrenizle giriş yapınız.",
    ),
    "payWhenYourOrderArrives": MessageLookupByLibrary.simpleMessage(
      "Siparişiniz geldiğinde ödeme yapın",
    ),
    "paymentFailedPaymentstateerrormessage": m9,
    "paymentMethod": MessageLookupByLibrary.simpleMessage("Ödeme Yöntemi"),
    "payments": MessageLookupByLibrary.simpleMessage("Ödemeler"),
    "paysWhenOrderArrives": MessageLookupByLibrary.simpleMessage(
      "Sipariş Geldiğinde Öder",
    ),
    "performanceImprovementsAndBugFixes": MessageLookupByLibrary.simpleMessage(
      "performans iyileştirmeleri ve hata düzeltmeleri.",
    ),
    "personalInfo": MessageLookupByLibrary.simpleMessage("Kişisel Bilgiler"),
    "phone": MessageLookupByLibrary.simpleMessage("Telefon"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Telefon Numarası"),
    "platformFee": MessageLookupByLibrary.simpleMessage("Platform Ücreti"),
    "pleaseEnterAValidAddress": MessageLookupByLibrary.simpleMessage(
      "Lütfen geçerli bir adres girin",
    ),
    "pleaseEnterAValidEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Lütfen geçerli bir e-posta adresi girin",
    ),
    "pleaseEnterAValidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Lütfen geçerli bir telefon numarası girin",
    ),
    "pleaseEnterWidgettitletolowercase": m10,
    "pleaseEnterYourEmailAddressToReceiveAPasswordReset":
        MessageLookupByLibrary.simpleMessage(
          "Şifre sıfırlama bağlantısı almak için lütfen e-posta adresinizi girin.",
        ),
    "pleaseFillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
      "Lütfen gerekli tüm alanları doldurun",
    ),
    "pleaseLoginToViewYourProfile": MessageLookupByLibrary.simpleMessage(
      "Profilinizi görüntülemek için lütfen giriş yapın",
    ),
    "pleaseSignInToContinue": MessageLookupByLibrary.simpleMessage(
      "Devam etmek için lütfen oturum açın",
    ),
    "pleaseSignInToViewAddresses": MessageLookupByLibrary.simpleMessage(
      "Adresleri görüntülemek için lütfen oturum açın",
    ),
    "pleaseSignUpToGetStarted": MessageLookupByLibrary.simpleMessage(
      "Başlamak için lütfen Kaydolun",
    ),
    "popularRestaurants": MessageLookupByLibrary.simpleMessage(
      "Popüler Restoranlar",
    ),
    "preferences2": MessageLookupByLibrary.simpleMessage("TERCİHLER"),
    "profile": MessageLookupByLibrary.simpleMessage("Profil"),
    "rate": MessageLookupByLibrary.simpleMessage("Oran"),
    "rating2": MessageLookupByLibrary.simpleMessage("DERECELENDİRME"),
    "recentKeywords": MessageLookupByLibrary.simpleMessage(
      "Son Anahtar Kelimeler",
    ),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Beni hatırla"),
    "remove": MessageLookupByLibrary.simpleMessage("Kaldır"),
    "removeFromCart": MessageLookupByLibrary.simpleMessage("Sepetten kaldır"),
    "removeFromFavourites": MessageLookupByLibrary.simpleMessage(
      "Favorilerden kaldır",
    ),
    "removedStatesearchFromRecentSearches": m11,
    "reorder": MessageLookupByLibrary.simpleMessage("Yeniden sırala"),
    "required": MessageLookupByLibrary.simpleMessage("Gerekli"),
    "restaurants": MessageLookupByLibrary.simpleMessage("Restoranlar"),
    "reviews": MessageLookupByLibrary.simpleMessage("Yorumlar"),
    "save": MessageLookupByLibrary.simpleMessage("Kaydet"),
    "savedCards": MessageLookupByLibrary.simpleMessage("Kayıtlı Kartlar"),
    "search": MessageLookupByLibrary.simpleMessage("Ara"),
    "searchForRestaurantsOrDishes": MessageLookupByLibrary.simpleMessage(
      "Restoran veya yemek arayın",
    ),
    "seeAll": MessageLookupByLibrary.simpleMessage("Tümünü Gör"),
    "selectAnAddress": MessageLookupByLibrary.simpleMessage("Bir adres seçin"),
    "selectDeliveryAddress": MessageLookupByLibrary.simpleMessage(
      "Teslimat Adresini Seçin",
    ),
    "selectFromYourSavedMastercards": MessageLookupByLibrary.simpleMessage(
      "Kayıtlı Mastercard\'larınız arasından seçim yapın",
    ),
    "selectFromYourSavedVisaCards": MessageLookupByLibrary.simpleMessage(
      "Kayıtlı Visa kartlarınızdan seçim yapın",
    ),
    "selectPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Ödeme Yöntemini Seçin",
    ),
    "sendResetLink": MessageLookupByLibrary.simpleMessage(
      "Sıfırlama Bağlantısını Gönder",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Ayarlar"),
    "signUp": MessageLookupByLibrary.simpleMessage("Kaydol"),
    "signup": MessageLookupByLibrary.simpleMessage("Kayıt Ol"),
    "skip": MessageLookupByLibrary.simpleMessage("Atla"),
    "stateunreadcountUnreadNotifications": m12,
    "streetNo": MessageLookupByLibrary.simpleMessage("Sokak No."),
    "subtotal": MessageLookupByLibrary.simpleMessage("Ara toplam"),
    "successfullySignedInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Google\'da başarıyla oturum açıldı!",
    ),
    "theRestaurantIsPreparingYourFood": MessageLookupByLibrary.simpleMessage(
      "Restoran yemeğinizi hazırlıyor",
    ),
    "themes": MessageLookupByLibrary.simpleMessage("Temalar"),
    "total": MessageLookupByLibrary.simpleMessage("Toplam"),
    "total2": MessageLookupByLibrary.simpleMessage("TOPLAM :"),
    "trackOrder": MessageLookupByLibrary.simpleMessage("Siparişi Takip Et"),
    "unreadNotifications": m13,
    "updateAvailable": MessageLookupByLibrary.simpleMessage(
      "Güncelleme Mevcut",
    ),
    "updateDialog": MessageLookupByLibrary.simpleMessage(
      "İletişim Kutusunu Güncelle",
    ),
    "updateNow": MessageLookupByLibrary.simpleMessage("Şimdi Güncelle"),
    "userNotAuthenticated": MessageLookupByLibrary.simpleMessage(
      "Kullanıcının kimliği doğrulanmadı",
    ),
    "versionInfoNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Sürüm bilgisi mevcut değil",
    ),
    "versionLatestversionIncludesNewFeatures":
        MessageLookupByLibrary.simpleMessage(
          "Sürüm \$latestVersion yeni özellikler içerir,",
        ),
    "visa": MessageLookupByLibrary.simpleMessage("Vize"),
    "whatAreYourDeliveryHours": MessageLookupByLibrary.simpleMessage(
      "Teslimat saatleriniz nedir?",
    ),
    "whatIfMyOrderIsDelayed": MessageLookupByLibrary.simpleMessage(
      "Siparişim gecikirse ne olur?",
    ),
    "whatPaymentMethodsAreAccepted": MessageLookupByLibrary.simpleMessage(
      "Hangi ödeme yöntemleri kabul ediliyor?",
    ),
    "whatShouldIDoIfAPaymentFails": MessageLookupByLibrary.simpleMessage(
      "Bir ödeme başarısız olursa ne yapmalıyım?",
    ),
    "work": MessageLookupByLibrary.simpleMessage("iş"),
    "yesCancel": MessageLookupByLibrary.simpleMessage("Evet, İptal"),
    "yourCardDetailsAreSecurelyHandledByStripeWeNever":
        MessageLookupByLibrary.simpleMessage(
          "Kart bilgileriniz Stripe tarafından güvenli bir şekilde işlenir. Kart numaranızın tamamını asla saklamayız.",
        ),
    "yourCartIsEmpty": MessageLookupByLibrary.simpleMessage("Sepetiniz boş"),
    "yourOrderHasBeenDelivered": MessageLookupByLibrary.simpleMessage(
      "Siparişiniz teslim edildi!",
    ),
    "yourOrderHasBeenPickedUpForDelivery": MessageLookupByLibrary.simpleMessage(
      "Siparişiniz teslim edilmek üzere alınmıştır",
    ),
    "yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime":
        MessageLookupByLibrary.simpleMessage(
          "Siparişiniz başarıyla verildi.\\nSiparişinizi gerçek zamanlı olarak takip edin.",
        ),
    "yourOrderHasBeenReceived": MessageLookupByLibrary.simpleMessage(
      "Siparişiniz alındı",
    ),
    "zipCode": MessageLookupByLibrary.simpleMessage("Posta Kodu"),
  };
}
