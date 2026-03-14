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
      'Standortberechtigung erforderlich';

  @override
  String errorStatemessage(Object stateMessage) {
    return 'Fehler: $stateMessage';
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
  String get other => 'Sonstiges';

  @override
  String get pleaseFillAllRequiredFields =>
      'Bitte füllen Sie alle erforderlichen Felder aus';

  @override
  String get userNotAuthenticated => 'Benutzer nicht authentifiziert';

  @override
  String get addressAddedSuccessfully => 'Adresse erfolgreich hinzugefügt!';

  @override
  String failedToAddAddressError(Object error) {
    return 'Fehler beim Hinzufügen der Adresse: $error';
  }

  @override
  String get save => 'Speichern';

  @override
  String get addAddress => 'Adresse hinzufügen';

  @override
  String get failedToLoadAddresses => 'Fehler beim Laden von Adressen';

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
  String get selectAnAddress => 'Wählen Sie eine Adresse';

  @override
  String get total2 => 'GESAMT: ';

  @override
  String get checkout2 => 'BEZAHLEN';

  @override
  String get yourCartIsEmpty => 'Ihr Warenkorb ist leer';

  @override
  String get cart => 'Warenkorb';

  @override
  String get allCategories => 'Alle Kategorien';

  @override
  String get openRestaurants => 'Offene Restaurants';

  @override
  String get clear2 => 'LÖSCHEN';

  @override
  String get apply2 => 'ANWENDEN';

  @override
  String get rating2 => 'BEWERTUNG';

  @override
  String get deliveryTime2 => 'LIEFERZEIT';

  @override
  String get filterYourSearch => 'Suche filtern';

  @override
  String get checkout => 'Kasse';

  @override
  String get deliveryAddress => 'Lieferadresse';

  @override
  String get change => 'Ändern';

  @override
  String get noAddressSelected => 'Keine Adresse ausgewählt';

  @override
  String get orderItems => 'Bestellartikel';

  @override
  String get paymentMethod => 'Zahlungsmethode';

  @override
  String get orderSummary => 'Bestellzusammenfassung';

  @override
  String get subtotal => 'Zwischensumme';

  @override
  String get deliveryFee => 'Liefergebühr';

  @override
  String get platformFee => 'Plattformgebühr';

  @override
  String get total => 'Gesamt';

  @override
  String get orderPlaced => 'Bestellung aufgegeben!';

  @override
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime =>
      'Ihre Bestellung wurde erfolgreich aufgegeben.\\nVerfolgen Sie Ihre Bestellung in Echtzeit.';

  @override
  String get backToHome => 'Zurück zur Startseite';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return 'Zahlung fehlgeschlagen: $errorMessage';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return 'Zahlung bestätigen  •  PKR $grandTotal';
  }

  @override
  String get paysWhenOrderArrives => 'Bezahlung bei Lieferung';

  @override
  String get noCardDetails => 'Keine Kartendaten';

  @override
  String get faqs => 'Häufig gestellte Fragen';

  @override
  String get delivery => 'Lieferung';

  @override
  String get payments => 'Zahlungen';

  @override
  String get order => 'Bestellung';

  @override
  String get chat => 'Chat';

  @override
  String get call => 'Anruf';

  @override
  String get email => 'E-Mail';

  @override
  String get noFavouriteRestaurantsFound =>
      'Keine bevorzugten Restaurants gefunden.';

  @override
  String get noFavouriteFoodsFound => 'Keine bevorzugten Speisen gefunden.';

  @override
  String get foods => 'Speisen';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get removeFromFavourites => 'Aus Favoriten entfernen';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      'Sind Sie sicher, dass Sie diesen Artikel aus Ihren Favoriten entfernen möchten?';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get remove => 'Entfernen';

  @override
  String get orderAgain => 'Erneut bestellen';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      'Sind Sie sicher, dass Sie dieses Restaurant aus Ihren Favoriten entfernen möchten?';

  @override
  String get removeFromCart => 'Aus Warenkorb entfernen';

  @override
  String get addToCart => 'In den Warenkorb';

  @override
  String get chooseYourFlavor => 'Wählen Sie Ihren Geschmack';

  @override
  String get chooseYourSize => 'Wählen Sie Ihre Größe';

  @override
  String get passwordResetLinkSent => 'Passwort-Zurücksetzen-Link gesendet';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      'Überprüfen Sie Ihre E-Mail auf einen Passwort-Zurücksetzen-Link. Klicken Sie auf den Link, um Ihr Passwort auf unserer Website zurückzusetzen.';

  @override
  String get passwordResetSuccessfully =>
      'Passwort erfolgreich zurückgesetzt! Bitte melden Sie sich mit Ihrem neuen Passwort an.';

  @override
  String get done => 'Fertig';

  @override
  String get sendResetLink => 'Zurücksetzen-Link senden';

  @override
  String get forgotPassword => 'Passwort vergessen';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      'Bitte geben Sie Ihre E-Mail-Adresse ein, um einen Passwort-Zurücksetzen-Link zu erhalten.';

  @override
  String get or => 'Oder';

  @override
  String get successfullySignedInWithGoogle =>
      'Erfolgreich mit Google angemeldet!';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'Google-Anmeldungsfehler: $stateMessage';
  }

  @override
  String get dontHaveAnAccount => 'Noch kein Konto? ';

  @override
  String get signUp => 'Registrieren';

  @override
  String get login => 'Anmelden';

  @override
  String get rememberMe => 'An mich erinnern';

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
    return '$unreadCount ungelesene Benachrichtigungen';
  }

  @override
  String allNotifications(Object totalCount) {
    return 'Alle ($totalCount)';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return 'Ungelesen ($unreadCount)';
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
      'Erhalten Sie alle Ihre liebsten Speisen an einem Ort, Sie geben die Bestellung auf, wir machen den Rest';

  @override
  String get orderFromChoosenChef => 'Bestellen Sie vom ausgewählten Chef';

  @override
  String get freeDeliveryOffers => 'Kostenlose Lieferangebote';

  @override
  String get getStarted => 'Jetzt beginnen';

  @override
  String get next => 'Weiter';

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
  String get clearOrderHistory => 'Bestellhistorie löschen';

  @override
  String get areYouSureYouWantToDeleteAllOrderHistory =>
      'Sind Sie sicher, dass Sie die gesamte Bestellhistorie löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden.';

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
  String get yesCancel => 'Ja, stornieren';

  @override
  String get reorder => 'Erneut bestellen';

  @override
  String get cardInformation => 'Kartendaten';

  @override
  String get cardNumberIsRequired => 'Kartennummer ist erforderlich';

  @override
  String get cardNumberIsTooShort => 'Kartennummer ist zu kurz';

  @override
  String get required => 'Erforderlich';

  @override
  String get invalidMonth => 'Ungültiger Monat';

  @override
  String get invalidCvc => 'Ungültige CVC';

  @override
  String get cvc => 'CVC';

  @override
  String get cardHolder => 'Karteninhaber';

  @override
  String get fullNameOnCard => 'Vollständiger Name auf der Karte';

  @override
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever =>
      'Ihre Kartendaten werden von Stripe sicher behandelt. Wir speichern niemals Ihre vollständige Kartennummer.';

  @override
  String get adding => 'Hinzufügen...';

  @override
  String get addCard => 'Karte hinzufügen';

  @override
  String get selectPaymentMethod => 'Zahlungsmethode wählen';

  @override
  String get cashOnDelivery => 'Zahlung bei Lieferung';

  @override
  String get payWhenYourOrderArrives =>
      'Bezahlen Sie, wenn Ihre Bestellung ankommt';

  @override
  String get cashOnDeliverySelected => 'Zahlung bei Lieferung ausgewählt';

  @override
  String get visa => 'Visa';

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
  String get failedToLoadCards => 'Fehler beim Laden von Karten';

  @override
  String get noSavedCardsYet => 'Noch keine gespeicherten Karten';

  @override
  String get addACardBelowToGetStarted =>
      'Fügen Sie unten eine Karte hinzu, um zu beginnen';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return 'Karte endet auf $last4 ausgewählt';
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
    return '$title bearbeiten';
  }

  @override
  String get apply => 'Übernehmen';

  @override
  String get logout => 'Abmelden';

  @override
  String get signup => 'Registrieren';

  @override
  String get profile => 'Profil';

  @override
  String get allRestaurants => 'Alle Restaurants';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      'Fehler beim Laden von Speisen. Bitte versuchen Sie es später erneut.';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      'Für diese Kategorie sind keine Speisen verfügbar.';

  @override
  String get myReviews => 'Meine Bewertungen';

  @override
  String get popularRestaurants => 'Beliebte Restaurants';

  @override
  String get noPopularRestaurantsFound =>
      'Keine beliebten Restaurants gefunden';

  @override
  String get recentKeywords => 'Aktuelle Suchbegriffe';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return '\"$search\" zu den aktuellen Suchen hinzugefügt';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return '\"$search\" aus den aktuellen Suchen entfernt';
  }

  @override
  String get noRecentSearches => 'Keine aktuellen Suchen';

  @override
  String get search => 'Suchen';

  @override
  String get preferences2 => 'EINSTELLUNGEN';

  @override
  String get darkMode => 'Dunkler Modus';

  @override
  String get language => 'Sprache';

  @override
  String get themes => 'Designs';

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
      'Bitte registrieren Sie sich, um zu beginnen';

  @override
  String get noActiveOrder => 'Keine aktive Bestellung';

  @override
  String get yourOrderHasBeenDelivered => 'Ihre Bestellung wurde geliefert!';

  @override
  String callingphonenumber(Object phoneNumber) {
    return 'Rufe $phoneNumber an...';
  }

  @override
  String get locationPermissionDenied => 'Standortberechtigung verweigert';

  @override
  String get courier => 'Kurier';

  @override
  String get estimatedDeliveryTime2 => 'GESCHÄTZTE LIEFERZEIT';

  @override
  String get yourOrderHasBeenReceived => 'Ihre Bestellung wurde empfangen';

  @override
  String get theRestaurantIsPreparingYourFood =>
      'Das Restaurant bereitet Ihre Speisen vor';

  @override
  String get yourOrderHasBeenPickedUpForDelivery =>
      'Ihre Bestellung wurde zur Lieferung abgeholt';

  @override
  String get orderArrivingSoon => 'Bestellung kommt bald an!';

  @override
  String get selectDeliveryAddress => 'Lieferadresse wählen';

  @override
  String get noAddressesFound => 'Keine Adressen gefunden';

  @override
  String get pleaseEnterAValidAddress =>
      'Bitte geben Sie eine gültige Adresse ein';

  @override
  String get seeAll => 'Alle anzeigen';

  @override
  String get searchForRestaurantsOrDishes =>
      'Nach Restaurants oder Speisen suchen';

  @override
  String get noRestaurantsFound => 'Keine Restaurants gefunden';

  @override
  String get updateDialog => 'Aktualisierungsdialog';

  @override
  String get updateAvailable => 'Aktualisierung verfügbar';

  @override
  String get aNewVersionOfBiteIsReady =>
      'Eine neue Version von Bite ist verfügbar!';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      'Version latestVersion enthält neue Funktionen, ';

  @override
  String get performanceImprovementsAndBugFixes =>
      'Leistungsverbesserungen und Fehlerbehebungen.';

  @override
  String get updateNow => 'Jetzt aktualisieren';

  @override
  String get maybeLater => 'Vielleicht später';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return 'Bitte geben Sie $title ein';
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
      'Was ist, wenn meine Bestellung verzögert ist?';

  @override
  String get whatPaymentMethodsAreAccepted =>
      'Welche Zahlungsmethoden werden akzeptiert?';

  @override
  String get isItSafeToUseMyCreditdebitCardOnBite =>
      'Ist es sicher, meine Kredit-/Debitkarte zu verwenden?';

  @override
  String get canIUseMultiplePaymentMethodsForOneOrder =>
      'Kann ich mehrere Zahlungsmethoden für eine Bestellung verwenden?';

  @override
  String get whatShouldIDoIfAPaymentFails =>
      'Was sollte ich tun, wenn eine Zahlung fehlschlägt?';

  @override
  String get whatAreYourDeliveryHours => 'Wie lange sind Ihre Lieferzeiten?';

  @override
  String get doYouChargeADeliveryFee => 'Berechnen Sie eine Liefergebühr?';

  @override
  String get doYouDeliverToMyLocation => 'Liefern Sie an meinen Standort?';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      'Kann ich eine Lieferung für einen späteren Zeitpunkt planen?';

  @override
  String get ongoing => 'Laufend';

  @override
  String get history => 'Verlauf';

  @override
  String get favorites => 'Favoriten';

  @override
  String get reviews => 'Bewertungen';

  @override
  String get phone => 'Telefon';

  @override
  String get addressUpdatedSuccessfully => 'Adresse erfolgreich aktualisiert';

  @override
  String failedToUpdateAddress(Object error) {
    return 'Fehler beim Aktualisieren der Adresse: $error';
  }
}
