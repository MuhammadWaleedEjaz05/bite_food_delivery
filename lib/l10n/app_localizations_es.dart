// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get trackOrder => 'Seguimiento del pedido';

  @override
  String get locationPermissionIsRequired => 'Se requiere permiso de ubicación';

  @override
  String errorStatemessage(Object stateMessage) {
    return 'Error: \$$stateMessage';
  }

  @override
  String get address => 'Dirección';

  @override
  String get streetNo => 'Calle No.';

  @override
  String get zipCode => 'Código postal';

  @override
  String get city => 'ciudad';

  @override
  String get country => 'País';

  @override
  String get label => 'Etiqueta';

  @override
  String get home => 'Inicio';

  @override
  String get work => 'trabajo';

  @override
  String get other => 'Otro';

  @override
  String get pleaseFillAllRequiredFields =>
      'Por favor complete todos los campos requeridos';

  @override
  String get userNotAuthenticated => 'Usuario no autenticado';

  @override
  String get addressAddedSuccessfully => '¡Dirección agregada exitosamente!';

  @override
  String failedToAddAddressError(Object error) {
    return 'No se pudo agregar la dirección: \$$error';
  }

  @override
  String get save => 'Guardar';

  @override
  String get addAddress => 'Agregar dirección';

  @override
  String get failedToLoadAddresses => 'No se pudieron cargar las direcciones';

  @override
  String get noSavedAddressesYet => 'Aún no hay direcciones guardadas';

  @override
  String get pleaseSignInToViewAddresses =>
      'Por favor inicia sesión para ver direcciones';

  @override
  String get deliveryAddress2 => 'DIRECCIÓN DE ENTREGA';

  @override
  String get edit2 => 'EDITAR';

  @override
  String get selectAnAddress => 'Seleccione una dirección';

  @override
  String get total2 => 'TOTAL :';

  @override
  String get checkout2 => 'PAGAR';

  @override
  String get yourCartIsEmpty => 'Tu carrito está vacío';

  @override
  String get cart => 'Carrito';

  @override
  String get allCategories => 'Todas las categorías';

  @override
  String get openRestaurants => 'Restaurantes abiertos';

  @override
  String get clear2 => 'CLARO';

  @override
  String get apply2 => 'APLICAR';

  @override
  String get rating2 => 'CALIFICACIÓN';

  @override
  String get deliveryTime2 => 'TIEMPO DE ENTREGA';

  @override
  String get filterYourSearch => 'Filtra tu búsqueda';

  @override
  String get checkout => 'Pagar';

  @override
  String get deliveryAddress => 'Dirección de entrega';

  @override
  String get change => 'Cambiar';

  @override
  String get noAddressSelected => 'Ninguna dirección seleccionada';

  @override
  String get orderItems => 'Ordenar artículos';

  @override
  String get paymentMethod => 'Método de pago';

  @override
  String get orderSummary => 'Resumen del pedido';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get deliveryFee => 'Tarifa de entrega';

  @override
  String get platformFee => 'Tarifa de plataforma';

  @override
  String get total => 'totales';

  @override
  String get orderPlaced => '¡Pedido realizado!';

  @override
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime =>
      'Su pedido se ha realizado correctamente.\\nRastree su pedido en tiempo real.';

  @override
  String get backToHome => 'Volver a Inicio';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return 'Pago fallido: \$$errorMessage';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return 'Confirmar pago • PKR \$$grandTotal';
  }

  @override
  String get paysWhenOrderArrives => 'Paga cuando llega el pedido';

  @override
  String get noCardDetails => 'Sin datos de tarjeta';

  @override
  String get faqs => 'Preguntas frecuentes';

  @override
  String get delivery => 'Entrega';

  @override
  String get payments => 'Pagos';

  @override
  String get order => 'Orden';

  @override
  String get chat => 'Charla';

  @override
  String get call => 'llamar';

  @override
  String get email => 'Correo electrónico';

  @override
  String get noFavouriteRestaurantsFound =>
      'No se encontraron restaurantes favoritos.';

  @override
  String get noFavouriteFoodsFound => 'No se encontraron alimentos favoritos.';

  @override
  String get foods => 'Alimentos';

  @override
  String get restaurants => 'Restaurantes';

  @override
  String get removeFromFavourites => 'Quitar de favoritos';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      '¿Está seguro de que desea eliminar este alimento de sus favoritos?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get remove => 'Quitar';

  @override
  String get orderAgain => 'Ordene nuevamente';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      '¿Estás seguro de que quieres eliminar este restaurante de tus favoritos?';

  @override
  String get removeFromCart => 'Quitar del carrito';

  @override
  String get addToCart => 'Añadir al carrito';

  @override
  String get chooseYourFlavor => 'Elige tu sabor';

  @override
  String get chooseYourSize => 'Elige tu talla';

  @override
  String get passwordResetLinkSent =>
      'Enlace de restablecimiento de contraseña enviado';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      'Revise su correo electrónico para obtener un enlace para restablecer su contraseña. Haga clic en el enlace para restablecer su contraseña en nuestro sitio web.';

  @override
  String get passwordResetSuccessfully =>
      '¡Restablecimiento de contraseña exitoso! Por favor inicie sesión con su nueva contraseña.';

  @override
  String get done => 'hecho';

  @override
  String get sendResetLink => 'Enviar enlace de reinicio';

  @override
  String get forgotPassword => 'Olvidé mi contraseña';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      'Ingrese su dirección de correo electrónico para recibir un enlace para restablecer su contraseña.';

  @override
  String get or => 'O';

  @override
  String get successfullySignedInWithGoogle =>
      '¡Iniciaste sesión exitosamente en Google!';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'Error de inicio de sesión de Google: \$$stateMessage';
  }

  @override
  String get dontHaveAnAccount => '¿No tienes una cuenta?';

  @override
  String get signUp => 'Regístrate';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get rememberMe => 'Recuérdame';

  @override
  String get password => 'Contraseña';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get pleaseSignInToContinue => 'Por favor inicie sesión para continuar';

  @override
  String get noNotificationsYet => 'Aún no hay notificaciones';

  @override
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return '\$$unreadCount notificaciones no leídas';
  }

  @override
  String allNotifications(Object totalCount) {
    return 'Todos (\$$totalCount)';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return 'No leído (\$$unreadCount)';
  }

  @override
  String get notifications => 'Notificaciones';

  @override
  String get clearAllNotifications => 'Borrar todas las notificaciones';

  @override
  String get deleteAllNotificationsConfirmation =>
      '¿Estás seguro de que deseas eliminar todas las notificaciones? Esta acción no se puede deshacer.';

  @override
  String get markAllAsRead => 'Marcar todo como leído';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String get allYourFavorites => 'Todos tus favoritos';

  @override
  String get getAllYourLovedFoodsInOnePlace =>
      'Obtenga todos sus alimentos favoritos en un solo lugar, usted simplemente coloca el resto o nosotros hacemos el resto.';

  @override
  String get orderFromChoosenChef => 'Orden del chef elegido';

  @override
  String get freeDeliveryOffers => 'Ofertas de entrega gratuita';

  @override
  String get getStarted => 'Empezar';

  @override
  String get next => 'Siguiente';

  @override
  String get skip => 'Saltar';

  @override
  String get orderCancelledSuccessfully => 'Pedido cancelado con éxito';

  @override
  String get noOngoingOrders => 'No hay pedidos en curso';

  @override
  String get noOrderHistory => 'Sin historial de pedidos';

  @override
  String get orderHistory => 'Historial de pedidos';

  @override
  String get clearOrderHistory => 'Borrar historial de pedidos';

  @override
  String get areYouSureYouWantToDeleteAllOrderHistory =>
      '¿Está seguro de que desea eliminar todo el historial de pedidos? Esta acción no se puede deshacer.';

  @override
  String get noCompletedOrdersYet => 'Aún no hay pedidos completados';

  @override
  String get rate => 'Tarifa';

  @override
  String get cancelOrder => 'Cancelar pedido';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      '¿Estás seguro de que deseas cancelar este pedido?';

  @override
  String get yesCancel => 'Sí, cancelar';

  @override
  String get reorder => 'Reordenar';

  @override
  String get cardInformation => 'Información de la tarjeta';

  @override
  String get cardNumberIsRequired => 'Se requiere el número de tarjeta';

  @override
  String get cardNumberIsTooShort => 'El número de tarjeta es demasiado corto';

  @override
  String get required => 'Requerido';

  @override
  String get invalidMonth => 'Mes no válido';

  @override
  String get invalidCvc => 'CVC no válido';

  @override
  String get cvc => 'CVC';

  @override
  String get cardHolder => 'Titular de la tarjeta';

  @override
  String get fullNameOnCard => 'Nombre completo en la tarjeta';

  @override
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever =>
      'Stripe maneja de forma segura los datos de tu tarjeta. Nunca almacenamos su número de tarjeta completo.';

  @override
  String get adding => 'Añadiendo...';

  @override
  String get addCard => 'Agregar tarjeta';

  @override
  String get selectPaymentMethod => 'Seleccione método de pago';

  @override
  String get cashOnDelivery => 'Contra reembolso';

  @override
  String get payWhenYourOrderArrives => 'Paga cuando llegue tu pedido';

  @override
  String get cashOnDeliverySelected => 'Contra reembolso seleccionado';

  @override
  String get visa => 'visa';

  @override
  String get selectFromYourSavedVisaCards =>
      'Seleccione entre sus tarjetas Visa guardadas';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get selectFromYourSavedMastercards =>
      'Selecciona entre tus Mastercards guardadas';

  @override
  String get savedCards => 'Tarjetas guardadas';

  @override
  String get creditCardAddedSuccessfully =>
      'Tarjeta de crédito agregada exitosamente';

  @override
  String get creditCardDeletedSuccessfully =>
      'Tarjeta de crédito eliminada exitosamente';

  @override
  String get failedToLoadCards => 'No se pudieron cargar las tarjetas';

  @override
  String get noSavedCardsYet => 'Aún no hay tarjetas guardadas';

  @override
  String get addACardBelowToGetStarted =>
      'Agregue una tarjeta a continuación para comenzar';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return 'Tarjeta que termina en \$$last4 seleccionada';
  }

  @override
  String get addNewCard => 'Agregar nueva tarjeta';

  @override
  String get personalInfo => 'Información personal';

  @override
  String get guestUser => 'Usuario invitado';

  @override
  String get pleaseLoginToViewYourProfile =>
      'Por favor inicia sesión para ver tu perfil';

  @override
  String editTitle(Object title) {
    return 'Editar \$$title';
  }

  @override
  String get apply => 'Aplicar';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get signup => 'Regístrate';

  @override
  String get profile => 'Perfil';

  @override
  String get allRestaurants => 'Todos los restaurantes';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      'No se pudieron cargar los alimentos. Inténtelo de nuevo más tarde.';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      'No hay alimentos disponibles para esta categoría.';

  @override
  String get myReviews => 'Mis reseñas';

  @override
  String get popularRestaurants => 'Restaurantes populares';

  @override
  String get noPopularRestaurantsFound =>
      'No se encontraron restaurantes populares';

  @override
  String get recentKeywords => 'Palabras clave recientes';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return 'Se agregó \"\$$search\" a las búsquedas recientes.';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return 'Se eliminó \"\$$search\" de búsquedas recientes.';
  }

  @override
  String get noRecentSearches => 'No hay búsquedas recientes';

  @override
  String get search => 'Buscar';

  @override
  String get preferences2 => 'PREFERENCIAS';

  @override
  String get darkMode => 'Modo oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get themes => 'Temas';

  @override
  String get versionInfoNotAvailable => 'Información de versión no disponible';

  @override
  String get settings => 'Configuración';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get phoneNumber => 'Número de teléfono';

  @override
  String get confirmPassword => 'confirmar Contraseña';

  @override
  String get pleaseSignUpToGetStarted => 'Regístrese para comenzar';

  @override
  String get noActiveOrder => 'Sin orden activa';

  @override
  String get yourOrderHasBeenDelivered => '¡Tu pedido ha sido entregado!';

  @override
  String callingphonenumber(Object phoneNumber) {
    return 'Llamando a \$$phoneNumber...';
  }

  @override
  String get locationPermissionDenied => 'Permiso de ubicación denegado';

  @override
  String get courier => 'mensajero';

  @override
  String get estimatedDeliveryTime2 => 'TIEMPO DE ENTREGA ESTIMADO';

  @override
  String get yourOrderHasBeenReceived => 'Tu pedido ha sido recibido';

  @override
  String get theRestaurantIsPreparingYourFood =>
      'El restaurante está preparando tu comida.';

  @override
  String get yourOrderHasBeenPickedUpForDelivery =>
      'Su pedido ha sido recogido para su entrega.';

  @override
  String get orderArrivingSoon => '¡El pedido llegará pronto!';

  @override
  String get selectDeliveryAddress => 'Seleccionar dirección de entrega';

  @override
  String get noAddressesFound => 'No se encontraron direcciones';

  @override
  String get pleaseEnterAValidAddress =>
      'Por favor introduce una dirección válida';

  @override
  String get seeAll => 'Ver todo';

  @override
  String get searchForRestaurantsOrDishes => 'Buscar restaurantes o platos';

  @override
  String get noRestaurantsFound => 'No se encontraron restaurantes';

  @override
  String get updateDialog => 'Actualizar cuadro de diálogo';

  @override
  String get updateAvailable => 'Actualización disponible';

  @override
  String get aNewVersionOfBiteIsReady =>
      '¡Una nueva versión de Bite está lista!';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      'La versión \$latestVersion incluye nuevas funciones,';

  @override
  String get performanceImprovementsAndBugFixes =>
      'mejoras de rendimiento y corrección de errores.';

  @override
  String get updateNow => 'Actualizar ahora';

  @override
  String get maybeLater => 'Quizás más tarde';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return 'Por favor ingresa \$$title';
  }

  @override
  String get pleaseEnterAValidEmailAddress =>
      'Por favor introduce una dirección de correo electrónico válida';

  @override
  String get pleaseEnterAValidPhoneNumber =>
      'Por favor ingresa un número de teléfono válido';

  @override
  String get passwordMustBeAtLeast8CharactersLong =>
      'La contraseña debe tener al menos 8 caracteres';

  @override
  String get howDoITrackMyOrder => '¿Cómo hago el seguimiento de mi pedido?';

  @override
  String get canICancelMyOrder => '¿Puedo cancelar mi pedido?';

  @override
  String get whatIfMyOrderIsDelayed => '¿Qué pasa si mi pedido se retrasa?';

  @override
  String get whatPaymentMethodsAreAccepted =>
      '¿Qué métodos de pago se aceptan?';

  @override
  String get isItSafeToUseMyCreditdebitCardOnBite =>
      '¿Es seguro usar mi tarjeta de crédito/débito en Bite?';

  @override
  String get canIUseMultiplePaymentMethodsForOneOrder =>
      '¿Puedo utilizar varios métodos de pago para un pedido?';

  @override
  String get whatShouldIDoIfAPaymentFails =>
      '¿Qué debo hacer si falla un pago?';

  @override
  String get whatAreYourDeliveryHours => '¿Cuáles son sus horarios de entrega?';

  @override
  String get doYouChargeADeliveryFee => '¿Cobran una tarifa de envío?';

  @override
  String get doYouDeliverToMyLocation => '¿Hacen entregas en mi ubicación?';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      '¿Puedo programar una entrega para más tarde?';

  @override
  String get ongoing => 'en curso';

  @override
  String get history => 'Historia';

  @override
  String get favorites => 'Favoritos';

  @override
  String get reviews => 'Reseñas';

  @override
  String get phone => 'Teléfono';
}
