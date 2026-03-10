// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get trackOrder => 'Bestellung verfolgen';

  @override
  String get locationPermissionIsRequired =>
      'Eine Standortgenehmigung ist erforderlich';

  @override
  String errorStatemessage(Object stateMessage) {
    return 'Fehler: \$$stateMessage';
  }

  @override
  String get address => 'Adresse';

  @override
  String get streetNo => 'Straße Nr.';

  @override
  String get zipCode => 'Postleitzahl';

  @override
  String get city => 'Stadt';

  @override
  String get country => 'Land';

  @override
  String get label => 'Etikett';

  @override
  String get home => 'Zuhause';

  @override
  String get work => 'Arbeit';

  @override
  String get other => 'Andere';

  @override
  String get pleaseFillAllRequiredFields =>
      'Bitte füllen Sie alle erforderlichen Felder aus';

  @override
  String get userNotAuthenticated => 'Benutzer nicht authentifiziert';

  @override
  String get addressAddedSuccessfully => 'Adresse erfolgreich hinzugefügt!';

  @override
  String failedToAddAddressError(Object error) {
    return 'Adresse konnte nicht hinzugefügt werden: \$$error';
  }

  @override
  String get save => 'Speichern';

  @override
  String get addAddress => 'Adresse hinzufügen';

  @override
  String get failedToLoadAddresses => 'Adressen konnten nicht geladen werden';

  @override
  String get noSavedAddressesYet => 'Noch keine gespeicherten Adressen';

  @override
  String get pleaseSignInToViewAddresses =>
      'Bitte melden Sie sich an, um Adressen anzuzeigen';

  @override
  String get deliveryAddress2 => 'LIEFERADRESSE';

  @override
  String get edit2 => 'BEARBEITEN';

  @override
  String get selectAnAddress => 'Wählen Sie eine Adresse aus';

  @override
  String get total2 => 'GESAMT:';

  @override
  String get checkout2 => 'Zur Kasse';

  @override
  String get yourCartIsEmpty => 'Ihr Warenkorb ist leer';

  @override
  String get cart => 'Warenkorb';

  @override
  String get allCategories => 'Alle Kategorien';

  @override
  String get openRestaurants => 'Offene Restaurants';

  @override
  String get clear2 => 'KLAR';

  @override
  String get apply2 => 'BEWERBEN';

  @override
  String get rating2 => 'BEWERTUNG';

  @override
  String get deliveryTime2 => 'LIEFERZEIT';

  @override
  String get filterYourSearch => 'Filtern Sie Ihre Suche';

  @override
  String get checkout => 'Kasse';

  @override
  String get deliveryAddress => 'Lieferadresse';

  @override
  String get change => 'Veränderung';

  @override
  String get noAddressSelected => 'Keine Adresse ausgewählt';

  @override
  String get orderItems => 'Artikel bestellen';

  @override
  String get paymentMethod => 'Zahlungsmethode';

  @override
  String get orderSummary => 'Bestellübersicht';

  @override
  String get subtotal => 'Zwischensumme';

  @override
  String get deliveryFee => 'Liefergebühr';

  @override
  String get platformFee => 'Plattformgebühr';

  @override
  String get total => 'Insgesamt';

  @override
  String get orderPlaced => 'Bestellung aufgegeben!';

  @override
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime =>
      'Ihre Bestellung wurde erfolgreich aufgegeben.\\nVerfolgen Sie Ihre Bestellung in Echtzeit.';

  @override
  String get backToHome => 'Zurück nach Hause';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return 'Zahlung fehlgeschlagen: \$$errorMessage';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return 'Zahlung bestätigen • PKR \$$grandTotal';
  }

  @override
  String get paysWhenOrderArrives => 'Zahlt, wenn die Bestellung eintrifft';

  @override
  String get noCardDetails => 'Keine Kartendetails';

  @override
  String get faqs => 'FAQs';

  @override
  String get delivery => 'Lieferung';

  @override
  String get payments => 'Zahlungen';

  @override
  String get order => 'Bestellen';

  @override
  String get chat => 'Chatten';

  @override
  String get call => 'Rufen Sie an';

  @override
  String get email => 'E-Mail';

  @override
  String get noFavouriteRestaurantsFound =>
      'Keine Lieblingsrestaurants gefunden.';

  @override
  String get noFavouriteFoodsFound => 'Keine Lieblingsspeisen gefunden.';

  @override
  String get foods => 'Lebensmittel';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get removeFromFavourites => 'Aus Favoriten entfernen';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      'Möchten Sie dieses Lebensmittel wirklich aus Ihren Favoriten entfernen?';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get remove => 'Entfernen';

  @override
  String get orderAgain => 'Bestellen Sie erneut';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      'Möchten Sie dieses Restaurant wirklich aus Ihren Favoriten entfernen?';

  @override
  String get removeFromCart => 'Aus dem Warenkorb entfernen';

  @override
  String get addToCart => 'In den Warenkorb legen';

  @override
  String get chooseYourFlavor => 'Wählen Sie Ihren Geschmack';

  @override
  String get chooseYourSize => 'Wählen Sie Ihre Größe';

  @override
  String get passwordResetLinkSent =>
      'Link zum Zurücksetzen des Passworts gesendet';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      'Suchen Sie in Ihren E-Mails nach einem Link zum Zurücksetzen des Passworts. Klicken Sie auf den Link, um Ihr Passwort auf unserer Website zurückzusetzen.';

  @override
  String get passwordResetSuccessfully =>
      'Passwort erfolgreich zurückgesetzt! Bitte melden Sie sich mit Ihrem neuen Passwort an.';

  @override
  String get done => 'Fertig';

  @override
  String get sendResetLink => 'Link zum Zurücksetzen senden';

  @override
  String get forgotPassword => 'Passwort vergessen';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      'Bitte geben Sie Ihre E-Mail-Adresse ein, um einen Link zum Zurücksetzen des Passworts zu erhalten.';

  @override
  String get or => 'Oder';

  @override
  String get successfullySignedInWithGoogle =>
      'Erfolgreich bei Google angemeldet!';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'Google-Anmeldefehler: \$$stateMessage';
  }

  @override
  String get dontHaveAnAccount => 'Sie haben noch kein Konto?';

  @override
  String get signUp => 'Melden Sie sich an';

  @override
  String get login => 'Anmelden';

  @override
  String get rememberMe => 'Erinnere dich an mich';

  @override
  String get password => 'Passwort';

  @override
  String get logIn => 'Anmelden';

  @override
  String get pleaseSignInToContinue =>
      'Bitte melden Sie sich an, um fortzufahren';

  @override
  String get noNotificationsYet => 'Noch keine Benachrichtigungen';

  @override
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return '\$$unreadCount ungelesene Benachrichtigungen';
  }

  @override
  String allNotifications(Object totalCount) {
    return 'Alle (\$$totalCount)';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return 'Ungelesen (\$$unreadCount)';
  }

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get clearAllNotifications => 'Alle Benachrichtigungen löschen';

  @override
  String get deleteAllNotificationsConfirmation =>
      'Sind Sie sicher, dass Sie alle Benachrichtigungen löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get markAllAsRead => 'Alle als gelesen markieren';

  @override
  String get clearAll => 'Alles löschen';

  @override
  String get allYourFavorites => 'Alle Ihre Favoriten';

  @override
  String get getAllYourLovedFoodsInOnePlace =>
      'Holen Sie sich alle Ihre Lieblingsspeisen an einem einzigen Ort, Sie geben sie einfach auf, oder wir erledigen den Rest';

  @override
  String get orderFromChoosenChef => 'Bestellen Sie beim ausgewählten Koch';

  @override
  String get freeDeliveryOffers => 'Kostenlose Lieferangebote';

  @override
  String get getStarted => 'Legen Sie los';

  @override
  String get next => 'Als nächstes';

  @override
  String get skip => 'Überspringen';

  @override
  String get orderCancelledSuccessfully => 'Bestellung erfolgreich storniert';

  @override
  String get noOngoingOrders => 'Keine laufenden Bestellungen';

  @override
  String get noOrderHistory => 'Keine Bestellhistorie';

  @override
  String get orderHistory => 'Bestellhistorie';

  @override
  String get clearOrderHistory => 'Bestellverlauf löschen';

  @override
  String get areYouSureYouWantToDeleteAllOrderHistory =>
      'Sind Sie sicher, dass Sie den gesamten Bestellverlauf löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get noCompletedOrdersYet => 'Noch keine abgeschlossenen Bestellungen';

  @override
  String get rate => 'Bewerten';

  @override
  String get cancelOrder => 'Bestellung stornieren';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      'Sind Sie sicher, dass Sie diese Bestellung stornieren möchten?';

  @override
  String get yesCancel => 'Ja, Abbrechen';

  @override
  String get reorder => 'Neu anordnen';

  @override
  String get cardInformation => 'Karteninformationen';

  @override
  String get cardNumberIsRequired => 'Kartennummer ist erforderlich';

  @override
  String get cardNumberIsTooShort => 'Kartennummer ist zu kurz';

  @override
  String get required => 'Erforderlich';

  @override
  String get invalidMonth => 'Ungültiger Monat';

  @override
  String get invalidCvc => 'Ungültiger CVC';

  @override
  String get cvc => 'CVC';

  @override
  String get cardHolder => 'Kartenhalter';

  @override
  String get fullNameOnCard => 'Vollständiger Name auf der Karte';

  @override
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever =>
      'Ihre Kartendaten werden von Stripe sicher verarbeitet. Wir speichern niemals Ihre vollständige Kartennummer.';

  @override
  String get adding => 'Hinzufügen...';

  @override
  String get addCard => 'Karte hinzufügen';

  @override
  String get selectPaymentMethod => 'Wählen Sie Zahlungsmethode';

  @override
  String get cashOnDelivery => 'Nachnahme';

  @override
  String get payWhenYourOrderArrives =>
      'Bezahlen Sie, wenn Ihre Bestellung eintrifft';

  @override
  String get cashOnDeliverySelected => 'Nachnahme ausgewählt';

  @override
  String get visa => 'Visum';

  @override
  String get selectFromYourSavedVisaCards =>
      'Wählen Sie aus Ihren gespeicherten Visa-Karten';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get selectFromYourSavedMastercards =>
      'Wählen Sie aus Ihren gespeicherten Mastercards';

  @override
  String get savedCards => 'Gespeicherte Karten';

  @override
  String get creditCardAddedSuccessfully =>
      'Kreditkarte erfolgreich hinzugefügt';

  @override
  String get creditCardDeletedSuccessfully =>
      'Kreditkarte erfolgreich gelöscht';

  @override
  String get failedToLoadCards => 'Karten konnten nicht geladen werden';

  @override
  String get noSavedCardsYet => 'Noch keine gespeicherten Karten';

  @override
  String get addACardBelowToGetStarted =>
      'Fügen Sie unten eine Karte hinzu, um zu beginnen';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return 'Karte mit der Endung \$$last4 ausgewählt';
  }

  @override
  String get addNewCard => 'Neue Karte hinzufügen';

  @override
  String get personalInfo => 'Persönliche Informationen';

  @override
  String get guestUser => 'Gastbenutzer';

  @override
  String get pleaseLoginToViewYourProfile =>
      'Bitte melden Sie sich an, um Ihr Profil anzuzeigen';

  @override
  String editTitle(Object title) {
    return 'Bearbeiten \$$title';
  }

  @override
  String get apply => 'Bewerben';

  @override
  String get logout => 'Abmelden';

  @override
  String get signup => 'Anmelden';

  @override
  String get profile => 'Profil';

  @override
  String get allRestaurants => 'Alle Restaurants';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      'Lebensmittel konnten nicht geladen werden. Bitte versuchen Sie es später noch einmal.';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      'Für diese Kategorie sind keine Lebensmittel verfügbar.';

  @override
  String get myReviews => 'Meine Bewertungen';

  @override
  String get popularRestaurants => 'Beliebte Restaurants';

  @override
  String get noPopularRestaurantsFound =>
      'Keine beliebten Restaurants gefunden';

  @override
  String get recentKeywords => 'Aktuelle Schlüsselwörter';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return '„\$$search“ zu den letzten Suchanfragen hinzugefügt';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return '„\$$search“ aus den letzten Suchanfragen entfernt';
  }

  @override
  String get noRecentSearches => 'Keine aktuellen Suchanfragen';

  @override
  String get search => 'Suchen';

  @override
  String get preferences2 => 'EINSTELLUNGEN';

  @override
  String get darkMode => 'Dunkler Modus';

  @override
  String get language => 'Sprache';

  @override
  String get themes => 'Themen';

  @override
  String get versionInfoNotAvailable => 'Versionsinformationen nicht verfügbar';

  @override
  String get settings => 'Einstellungen';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get phoneNumber => 'Telefonnummer';

  @override
  String get confirmPassword => 'Passwort bestätigen';

  @override
  String get pleaseSignUpToGetStarted =>
      'Bitte melden Sie sich an, um loszulegen';

  @override
  String get noActiveOrder => 'Keine aktive Bestellung';

  @override
  String get yourOrderHasBeenDelivered => 'Ihre Bestellung wurde geliefert!';

  @override
  String callingphonenumber(Object phoneNumber) {
    return 'Rufe \$$phoneNumber an...';
  }

  @override
  String get locationPermissionDenied => 'Standortberechtigung verweigert';

  @override
  String get courier => 'Kurier';

  @override
  String get estimatedDeliveryTime2 => 'GESCHÄTZTE LIEFERZEIT';

  @override
  String get yourOrderHasBeenReceived => 'Ihre Bestellung ist eingegangen';

  @override
  String get theRestaurantIsPreparingYourFood =>
      'Das Restaurant bereitet Ihr Essen zu';

  @override
  String get yourOrderHasBeenPickedUpForDelivery =>
      'Ihre Bestellung wurde zur Lieferung abgeholt';

  @override
  String get orderArrivingSoon => 'Die Bestellung kommt bald an!';

  @override
  String get selectDeliveryAddress => 'Wählen Sie Lieferadresse';

  @override
  String get noAddressesFound => 'Keine Adressen gefunden';

  @override
  String get pleaseEnterAValidAddress =>
      'Bitte geben Sie eine gültige Adresse ein';

  @override
  String get seeAll => 'Alle anzeigen';

  @override
  String get searchForRestaurantsOrDishes =>
      'Suchen Sie nach Restaurants oder Gerichten';

  @override
  String get noRestaurantsFound => 'Keine Restaurants gefunden';

  @override
  String get updateDialog => 'Update-Dialog';

  @override
  String get updateAvailable => 'Update verfügbar';

  @override
  String get aNewVersionOfBiteIsReady =>
      'Eine neue Version von Bite ist fertig!';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      'Version \$latestVersion enthält neue Funktionen,';

  @override
  String get performanceImprovementsAndBugFixes =>
      'Leistungsverbesserungen und Fehlerbehebungen.';

  @override
  String get updateNow => 'Jetzt aktualisieren';

  @override
  String get maybeLater => 'Vielleicht später';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return 'Bitte geben Sie \$$title ein.';
  }

  @override
  String get pleaseEnterAValidEmailAddress =>
      'Bitte geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get pleaseEnterAValidPhoneNumber =>
      'Bitte geben Sie eine gültige Telefonnummer ein';

  @override
  String get passwordMustBeAtLeast8CharactersLong =>
      'Das Passwort muss mindestens 8 Zeichen lang sein';

  @override
  String get howDoITrackMyOrder => 'Wie kann ich meine Bestellung verfolgen?';

  @override
  String get canICancelMyOrder => 'Kann ich meine Bestellung stornieren?';

  @override
  String get whatIfMyOrderIsDelayed =>
      'Was passiert, wenn sich meine Bestellung verzögert?';

  @override
  String get whatPaymentMethodsAreAccepted =>
      'Welche Zahlungsmethoden werden akzeptiert?';

  @override
  String get isItSafeToUseMyCreditdebitCardOnBite =>
      'Ist es sicher, meine Kredit-/Debitkarte bei Bite zu verwenden?';

  @override
  String get canIUseMultiplePaymentMethodsForOneOrder =>
      'Kann ich für eine Bestellung mehrere Zahlungsarten nutzen?';

  @override
  String get whatShouldIDoIfAPaymentFails =>
      'Was soll ich tun, wenn eine Zahlung fehlschlägt?';

  @override
  String get whatAreYourDeliveryHours => 'Wie sind Ihre Lieferzeiten?';

  @override
  String get doYouChargeADeliveryFee => 'Erheben Sie eine Liefergebühr?';

  @override
  String get doYouDeliverToMyLocation => 'Liefern Sie an meinen Standort?';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      'Kann ich eine Lieferung für einen späteren Zeitpunkt vereinbaren?';

  @override
  String get ongoing => 'Laufend';

  @override
  String get history => 'Geschichte';

  @override
  String get favorites => 'Favoriten';

  @override
  String get reviews => 'Rezensionen';

  @override
  String get phone => 'Telefon';
}
