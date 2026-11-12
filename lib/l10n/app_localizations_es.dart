// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get trackOrder => 'Rastrear Pedido';

  @override
  String get locationPermissionIsRequired => 'Se requiere permiso de ubicación';

  @override
  String errorStatemessage(Object stateMessage) {
    return 'Error: $stateMessage';
  }

  @override
  String get address => 'Dirección';

  @override
  String get streetNo => 'Número de Calle';

  @override
  String get zipCode => 'Código Postal';

  @override
  String get city => 'Ciudad';

  @override
  String get country => 'País';

  @override
  String get label => 'Etiqueta';

  @override
  String get home => 'Hogar';

  @override
  String get work => 'Trabajo';

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
    return 'Error al agregar dirección: $error';
  }

  @override
  String get save => 'Guardar';

  @override
  String get addAddress => 'Agregar Dirección';

  @override
  String get failedToLoadAddresses => 'Error al cargar direcciones';

  @override
  String get noSavedAddressesYet => 'Aún no hay direcciones guardadas';

  @override
  String get pleaseSignInToViewAddresses =>
      'Por favor inicie sesión para ver direcciones';

  @override
  String get deliveryAddress2 => 'DIRECCIÓN DE ENTREGA';

  @override
  String get edit2 => 'EDITAR';

  @override
  String get selectAnAddress => 'Seleccione una dirección';

  @override
  String get total2 => 'TOTAL: ';

  @override
  String get checkout2 => 'PAGAR';

  @override
  String get yourCartIsEmpty => 'Su carrito está vacío';

  @override
  String get cart => 'Carrito';

  @override
  String get allCategories => 'Todas las Categorías';

  @override
  String get openRestaurants => 'Restaurantes Abiertos';

  @override
  String get clear2 => 'LIMPIAR';

  @override
  String get apply2 => 'APLICAR';

  @override
  String get rating2 => 'CALIFICACIÓN';

  @override
  String get deliveryTime2 => 'TIEMPO DE ENTREGA';

  @override
  String get filterYourSearch => 'Filtre su búsqueda';

  @override
  String get checkout => 'Pagar';

  @override
  String get deliveryAddress => 'Dirección de Entrega';

  @override
  String get change => 'Cambiar';

  @override
  String get noAddressSelected => 'Sin dirección seleccionada';

  @override
  String get orderItems => 'Artículos del Pedido';

  @override
  String get paymentMethod => 'Método de Pago';

  @override
  String get orderSummary => 'Resumen del Pedido';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get deliveryFee => 'Tarifa de Entrega';

  @override
  String get platformFee => 'Tarifa de Plataforma';

  @override
  String get total => 'Total';

  @override
  String get orderPlaced => '¡Pedido Realizado!';

  @override
  String get yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime =>
      'Su pedido ha sido realizado exitosamente.\\nRastreelo en tiempo real.';

  @override
  String get backToHome => 'Volver al Inicio';

  @override
  String paymentFailedPaymentstateerrormessage(Object errorMessage) {
    return 'Error en el pago: $errorMessage';
  }

  @override
  String confirmPayment(Object grandTotal) {
    return 'Confirmar Pago • PKR $grandTotal';
  }

  @override
  String get paysWhenOrderArrives => 'Paga a la Llegada del Pedido';

  @override
  String get noCardDetails => 'Sin detalles de tarjeta';

  @override
  String get faqs => 'Preguntas Frecuentes';

  @override
  String get delivery => 'Entrega';

  @override
  String get payments => 'Pagos';

  @override
  String get order => 'Pedido';

  @override
  String get chat => 'Chat';

  @override
  String get call => 'Llamar';

  @override
  String get email => 'Correo Electrónico';

  @override
  String get noFavouriteRestaurantsFound =>
      'No se encontraron restaurantes favoritos.';

  @override
  String get noFavouriteFoodsFound => 'No se encontraron comidas favoritas.';

  @override
  String get foods => 'Comidas';

  @override
  String get restaurants => 'Restaurantes';

  @override
  String get removeFromFavourites => 'Quitar de favoritos';

  @override
  String get areYouSureYouWantToRemoveThisFoodItem =>
      '¿Está seguro de que desea quitar este artículo de comida de sus favoritos?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get remove => 'Quitar';

  @override
  String get orderAgain => 'Pedir de Nuevo';

  @override
  String get areYouSureYouWantToRemoveThisRestaurantFrom =>
      '¿Está seguro de que desea quitar este restaurante de sus favoritos?';

  @override
  String get removeFromCart => 'Quitar del carrito';

  @override
  String get addToCart => 'Agregar al carrito';

  @override
  String get chooseYourFlavor => 'Elija su sabor';

  @override
  String get chooseYourSize => 'Elija su tamaño';

  @override
  String get passwordResetLinkSent =>
      'Enlace de Restablecimiento de Contraseña Enviado';

  @override
  String get checkYourEmailForAPasswordResetLink =>
      'Revise su correo electrónico para obtener un enlace de restablecimiento de contraseña. Haga clic en el enlace para restablecer su contraseña en nuestro sitio web.';

  @override
  String get passwordResetSuccessfully =>
      '¡Contraseña restablecida exitosamente! Por favor inicie sesión con su nueva contraseña.';

  @override
  String get done => 'Hecho';

  @override
  String get sendResetLink => 'Enviar Enlace de Restablecimiento';

  @override
  String get forgotPassword => 'Olvidé mi Contraseña';

  @override
  String get pleaseEnterYourEmailAddressToReceiveAPasswordReset =>
      'Por favor ingrese su dirección de correo electrónico para recibir un enlace de restablecimiento de contraseña.';

  @override
  String get or => 'O';

  @override
  String get successfullySignedInWithGoogle =>
      '¡Sesión iniciada exitosamente con Google!';

  @override
  String googleSigninErrorStatemessage(Object stateMessage) {
    return 'Error de Sign-In de Google: $stateMessage';
  }

  @override
  String get dontHaveAnAccount => '¿No tiene una cuenta? ';

  @override
  String get signUp => 'Registrarse';

  @override
  String get login => 'Iniciar Sesión';

  @override
  String get rememberMe => 'Recuérdame';

  @override
  String get password => 'Contraseña';

  @override
  String get logIn => 'Iniciar Sesión';

  @override
  String get pleaseSignInToContinue => 'Por Favor Inicie Sesión para Continuar';

  @override
  String get noNotificationsYet => 'Aún no hay notificaciones';

  @override
  String stateunreadcountUnreadNotifications(Object unreadCount) {
    return '$unreadCount notificaciones sin leer';
  }

  @override
  String allNotifications(Object totalCount) {
    return 'Todas ($totalCount)';
  }

  @override
  String unreadNotifications(Object unreadCount) {
    return 'Sin Leer ($unreadCount)';
  }

  @override
  String get notifications => 'Notificaciones';

  @override
  String get clearAllNotifications => 'Borrar Todas las Notificaciones';

  @override
  String get deleteAllNotificationsConfirmation =>
      '¿Está seguro de que desea eliminar todas las notificaciones? Esta acción no se puede deshacer.';

  @override
  String get markAllAsRead => 'Marcar todo como leído';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String get allYourFavorites => 'Todos tus favoritos';

  @override
  String get getAllYourLovedFoodsInOnePlace =>
      'Obtenga todas sus comidas favoritas en un solo lugar. Solo realice el pedido y nosotros hacemos el resto';

  @override
  String get orderFromChoosenChef => 'Pedi del chef elegido';

  @override
  String get freeDeliveryOffers => 'Ofertas de Entrega Gratuita';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get next => 'Siguiente';

  @override
  String get skip => 'Saltar';

  @override
  String get orderCancelledSuccessfully => 'Pedido cancelado exitosamente';

  @override
  String get noOngoingOrders => 'Sin pedidos en curso';

  @override
  String get noOrderHistory => 'Sin historial de pedidos';

  @override
  String get orderHistory => 'Historial de Pedidos';

  @override
  String get clearOrderHistory => 'Borrar Historial de Pedidos';

  @override
  String get areYouSureYouWantToDeleteAllOrderHistory =>
      '¿Está seguro de que desea eliminar todo el historial de pedidos? Esta acción no se puede deshacer.';

  @override
  String get noCompletedOrdersYet => 'Aún no hay pedidos completados';

  @override
  String get rate => 'Calificar';

  @override
  String get cancelOrder => 'Cancelar Pedido';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      '¿Está seguro de que desea cancelar este pedido?';

  @override
  String get yesCancel => 'Sí, Cancelar';

  @override
  String get reorder => 'Pedir de Nuevo';

  @override
  String get cardInformation => 'Información de la Tarjeta';

  @override
  String get cardNumberIsRequired => 'Se requiere número de tarjeta';

  @override
  String get cardNumberIsTooShort => 'El número de tarjeta es muy corto';

  @override
  String get required => 'Requerido';

  @override
  String get invalidMonth => 'Mes inválido';

  @override
  String get invalidCvc => 'CVC inválido';

  @override
  String get cvc => 'CVC';

  @override
  String get cardHolder => 'Titular de la Tarjeta';

  @override
  String get fullNameOnCard => 'Nombre completo en la tarjeta';

  @override
  String get yourCardDetailsAreSecurelyHandledByStripeWeNever =>
      'Sus detalles de tarjeta son manejados de forma segura por Stripe. Nunca almacenamos el número completo de su tarjeta.';

  @override
  String get adding => 'Agregando...';

  @override
  String get addCard => 'Agregar Tarjeta';

  @override
  String get selectPaymentMethod => 'Seleccione Método de Pago';

  @override
  String get cashOnDelivery => 'Pago Contra Entrega';

  @override
  String get payWhenYourOrderArrives => 'Pague cuando llegue su pedido';

  @override
  String get cashOnDeliverySelected => 'Pago Contra Entrega seleccionado';

  @override
  String get visa => 'Visa';

  @override
  String get selectFromYourSavedVisaCards =>
      'Seleccione de sus tarjetas Visa guardadas';

  @override
  String get mastercard => 'Tarjeta de Crédito';

  @override
  String get selectFromYourSavedMastercards =>
      'Seleccione de sus Tarjetas de Crédito guardadas';

  @override
  String get savedCards => 'Tarjetas Guardadas';

  @override
  String get creditCardAddedSuccessfully =>
      'Tarjeta de crédito agregada exitosamente';

  @override
  String get creditCardDeletedSuccessfully =>
      'Tarjeta de crédito eliminada exitosamente';

  @override
  String get failedToLoadCards => 'Error al cargar tarjetas';

  @override
  String get noSavedCardsYet => 'Aún no hay tarjetas guardadas';

  @override
  String get addACardBelowToGetStarted =>
      'Agregue una tarjeta a continuación para comenzar';

  @override
  String cardEndingInCreditcardlast4Selected(Object last4) {
    return 'Tarjeta terminada en $last4 seleccionada';
  }

  @override
  String get addNewCard => 'Agregar Nueva Tarjeta';

  @override
  String get personalInfo => 'Información Personal';

  @override
  String get guestUser => 'Usuario Invitado';

  @override
  String get pleaseLoginToViewYourProfile =>
      'Por favor inicie sesión para ver su perfil';

  @override
  String editTitle(Object title) {
    return 'Editar $title';
  }

  @override
  String get apply => 'Aplicar';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get signup => 'Registrarse';

  @override
  String get profile => 'Perfil';

  @override
  String get allRestaurants => 'Todos los Restaurantes';

  @override
  String get failedToLoadFoodItemsPleaseTryAgainLater =>
      'Error al cargar artículos de comida. Por favor intente más tarde.';

  @override
  String get noFoodItemsAvailableForThisCategory =>
      'No hay artículos de comida disponibles para esta categoría.';

  @override
  String get myReviews => 'Mis Reseñas';

  @override
  String get popularRestaurants => 'Restaurantes Populares';

  @override
  String get noPopularRestaurantsFound =>
      'No se encontraron restaurantes populares';

  @override
  String get recentKeywords => 'Palabras Clave Recientes';

  @override
  String addedStatesearchToRecentSearches(Object search) {
    return 'Se agregó \"$search\" a búsquedas recientes';
  }

  @override
  String removedStatesearchFromRecentSearches(Object search) {
    return 'Se removió \"$search\" de búsquedas recientes';
  }

  @override
  String get noRecentSearches => 'Sin búsquedas recientes';

  @override
  String get search => 'Buscar';

  @override
  String get preferences2 => 'PREFERENCIAS';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get themes => 'Temas';

  @override
  String get versionInfoNotAvailable => 'Información de versión no disponible';

  @override
  String get settings => 'Configuración';

  @override
  String get fullName => 'Nombre Completo';

  @override
  String get phoneNumber => 'Número de Teléfono';

  @override
  String get confirmPassword => 'Confirmar Contraseña';

  @override
  String get pleaseSignUpToGetStarted => 'Por favor Regístrese para comenzar';

  @override
  String get noActiveOrder => 'Sin pedido activo';

  @override
  String get yourOrderHasBeenDelivered => '¡Su pedido ha sido entregado!';

  @override
  String callingphonenumber(Object phoneNumber) {
    return 'Llamando a $phoneNumber...';
  }

  @override
  String get locationPermissionDenied => 'Permiso de ubicación denegado';

  @override
  String get courier => 'Mensajero';

  @override
  String get estimatedDeliveryTime2 => 'TIEMPO DE ENTREGA ESTIMADO';

  @override
  String get yourOrderHasBeenReceived => 'Su pedido ha sido recibido';

  @override
  String get theRestaurantIsPreparingYourFood =>
      'El restaurante está preparando su comida';

  @override
  String get yourOrderHasBeenPickedUpForDelivery =>
      'Su pedido ha sido recogido para entrega';

  @override
  String get orderArrivingSoon => '¡El pedido llegará pronto!';

  @override
  String get selectDeliveryAddress => 'Seleccione Dirección de Entrega';

  @override
  String get noAddressesFound => 'No se encontraron direcciones';

  @override
  String get pleaseEnterAValidAddress =>
      'Por favor ingrese una dirección válida';

  @override
  String get seeAll => 'Ver Todo';

  @override
  String get searchForRestaurantsOrDishes => 'Busque restaurantes o platos';

  @override
  String get noRestaurantsFound => 'No se encontraron restaurantes';

  @override
  String get updateDialog => 'Diálogo de Actualización';

  @override
  String get updateAvailable => 'Actualización Disponible';

  @override
  String get aNewVersionOfBiteIsReady =>
      '¡Una nueva versión de Bite está lista!';

  @override
  String get versionLatestversionIncludesNewFeatures =>
      'La versión latestVersion incluye nuevas características, ';

  @override
  String get performanceImprovementsAndBugFixes =>
      'mejoras de rendimiento y correcciones de errores.';

  @override
  String get updateNow => 'Actualizar Ahora';

  @override
  String get maybeLater => 'Quizás Más Tarde';

  @override
  String pleaseEnterWidgettitletolowercase(Object title) {
    return 'Por favor ingrese $title';
  }

  @override
  String get pleaseEnterAValidEmailAddress =>
      'Por favor ingrese una dirección de correo válida';

  @override
  String get pleaseEnterAValidPhoneNumber =>
      'Por favor ingrese un número de teléfono válido';

  @override
  String get passwordMustBeAtLeast8CharactersLong =>
      'La contraseña debe tener al menos 8 caracteres';

  @override
  String get howDoITrackMyOrder => '¿Cómo hago seguimiento a mi pedido?';

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
      '¿Puedo usar múltiples métodos de pago para un pedido?';

  @override
  String get whatShouldIDoIfAPaymentFails =>
      '¿Qué debo hacer si falla un pago?';

  @override
  String get whatAreYourDeliveryHours => '¿Cuáles son sus horarios de entrega?';

  @override
  String get doYouChargeADeliveryFee => '¿Cobran tarifa de entrega?';

  @override
  String get doYouDeliverToMyLocation => '¿Entregan en mi ubicación?';

  @override
  String get canIScheduleADeliveryForALaterTime =>
      '¿Puedo programar una entrega para más tarde?';

  @override
  String get ongoing => 'En Curso';

  @override
  String get history => 'Historial';

  @override
  String get favorites => 'Favoritos';

  @override
  String get reviews => 'Reseñas';

  @override
  String get phone => 'Teléfono';

  @override
  String get addressUpdatedSuccessfully => 'Dirección actualizada exitosamente';

  @override
  String failedToUpdateAddress(Object error) {
    return 'Error al actualizar la dirección: $error';
  }

  @override
  String get homeDeliverTo => 'Entregar en';

  @override
  String get homeHeadline => 'Algo delicioso te espera.';

  @override
  String get homeSubtitle => 'Descubre tu próximo plato favorito.';

  @override
  String get browseRestaurants => 'Explorar restaurantes';

  @override
  String get retryAction => 'Reintentar';

  @override
  String get catalogLoadFailure => 'No se pudo cargar en este momento.';

  @override
  String get catalogRefreshFailure =>
      'Mostramos los resultados guardados. Actualiza para reintentar.';

  @override
  String get noCategoriesAvailable => 'Aún no hay categorías disponibles.';

  @override
  String get noOpenRestaurants => 'No hay restaurantes abiertos ahora.';

  @override
  String deliveryMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get rememberEmail => 'Recordar correo';

  @override
  String get menuAllItems => 'Todos los platos';

  @override
  String get restaurantOpen => 'Abierto ahora';

  @override
  String get restaurantClosed => 'Cerrado';

  @override
  String get itemUnavailable => 'No disponible';

  @override
  String get itemAddedToCart => 'Añadido al carrito';

  @override
  String get cartAddFailed => 'No se pudo añadir. Inténtalo de nuevo.';

  @override
  String get signInToOrder => 'Inicia sesión para pedir';

  @override
  String get quantityLabel => 'Cantidad';

  @override
  String get increaseQuantity => 'Aumentar cantidad';

  @override
  String get decreaseQuantity => 'Reducir cantidad';

  @override
  String get catalogMissing => 'Este plato ya no está disponible.';

  @override
  String get optionalChoices => 'Opcional · elige tus favoritos';

  @override
  String get savingItem => 'Añadiendo…';

  @override
  String get viewCartAction => 'Ver carrito';

  @override
  String get discoverTab => 'Descubrir';

  @override
  String get ordersTab => 'Pedidos';

  @override
  String get accountTab => 'Cuenta';

  @override
  String get discoveryAll => 'Todo';

  @override
  String get discoveryOpen => 'Abierto ahora';

  @override
  String get discoveryCategories => 'Todas las categorías';

  @override
  String get discoveryRated => 'Mejor valorados';

  @override
  String get discoveryName => 'Nombre';

  @override
  String get discoveryDelivery => 'Entrega más rápida';

  @override
  String get discoveryReset => 'Restablecer filtros';

  @override
  String get discoveryEmpty =>
      'Sin resultados. Prueba otra búsqueda o restablece los filtros.';

  @override
  String get discoveryMore => 'Mostrar más';

  @override
  String get cartChangeFailed =>
      'No se pudo actualizar el carrito. Tus artículos siguen visibles.';

  @override
  String get cartNeedsReview =>
      'Revisa el carrito: un restaurante y artículos disponibles con cantidades válidas.';

  @override
  String get cartEstimate =>
      'Subtotal estimado. El pago confirma los precios actuales y los gastos de entrega.';

  @override
  String get checkoutChanged =>
      'El carrito, la dirección o los precios cambiaron. Revisa el total.';

  @override
  String get checkoutTryAgain =>
      'No se pudo completar el pedido. Inténtalo de nuevo.';

  @override
  String get checkoutCashNote =>
      'Paga en efectivo al recibir. Revisa el total confirmado antes de pedir.';

  @override
  String get checkoutReview => 'Revisar total';

  @override
  String get payByCard => 'Pagar con tarjeta';

  @override
  String get resumeCardPayment => 'Continuar pago con tarjeta';

  @override
  String get cancelCardPayment => 'Cancelar pago con tarjeta';

  @override
  String get cardPaymentPending =>
      'Tu pago con tarjeta está pendiente. Continúa o cancela antes de cambiar el carrito.';

  @override
  String get paymentAtCheckout =>
      'Elige el método de pago al finalizar. Stripe recoge los datos de forma segura; Bite no guarda tarjetas.';

  @override
  String get updateAddress => 'Actualizar dirección';

  @override
  String get saveAddress => 'Guardar dirección';

  @override
  String get street => 'Calle';

  @override
  String get enterStreet => 'Introduce la calle';

  @override
  String get enterCity => 'Introduce la ciudad';

  @override
  String get enterZipCode => 'Introduce el código postal';

  @override
  String get enterCountry => 'Introduce el país';

  @override
  String get orderReceived => 'Pedido recibido';

  @override
  String get orderReceivedSubtitle => 'El restaurante ha recibido tu pedido';

  @override
  String get preparing => 'Preparando comida';

  @override
  String get preparingSubtitle => 'La cocina está preparando tu comida';

  @override
  String get dispatched => 'En camino';

  @override
  String get dispatchedSubtitle => 'El repartidor ha recogido tu comida';

  @override
  String get delivered => 'Entregado';

  @override
  String get deliveredSubtitle => 'El pedido ha sido entregado con éxito';

  @override
  String get cancelled => 'Cancelado';

  @override
  String get orderStatus => 'Estado del pedido';

  @override
  String get orderDetails => 'Detalles del pedido';

  @override
  String get orderId => 'ID de pedido';

  @override
  String get orderDate => 'Fecha de pedido';

  @override
  String get totalPrice => 'Precio total';

  @override
  String estimatedDeliveryTime(String time) {
    return 'Entrega estimada: $time';
  }

  @override
  String get orderDeliveredSuccessfully =>
      '¡Tu pedido ha sido entregado con éxito!';

  @override
  String get helpAndSupport => 'Ayuda y soporte';

  @override
  String get deliveryRider => 'Repartidor';

  @override
  String get review => 'Valorar';

  @override
  String get noOrdersInHistory => 'Aún no hay pedidos anteriores';

  @override
  String get writeReview => 'Escribir reseña';

  @override
  String get rateOrder => 'Calificar pedido';

  @override
  String get rateRestaurant => 'Calificar restaurante';

  @override
  String get tellUsYourExperience => 'Cuéntanos sobre tu experiencia...';

  @override
  String get submitReview => 'Enviar reseña';

  @override
  String get reviewSubmitted => 'Reseña enviada con éxito';

  @override
  String get noReviewsYet => 'Aún no hay reseñas';

  @override
  String get orderRating => 'Calificación del pedido';

  @override
  String get restaurantRating => 'Calificación del restaurante';

  @override
  String get feedbackOptional =>
      'Tus comentarios ayudan a los restaurantes a mejorar';
}
