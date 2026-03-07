// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get allYourFavorites => 'Todos tus favoritos';

  @override
  String get getLovedFoodsDescription =>
      'Obtén todas tus comidas favoritas en un solo lugar, tú solo haz el pedido y nosotros nos encargamos del resto';

  @override
  String get orderFromChosenChef => 'Pide al chef elegido';

  @override
  String get freeDeliveryOffers => 'Ofertas de envío gratis';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get next => 'Siguiente';

  @override
  String get skip => 'Omitir';

  @override
  String get login => 'Iniciar Sesión';

  @override
  String get logIn => 'Iniciar Sesión';

  @override
  String get pleaseSignInToContinue => 'Por favor inicia sesión para continuar';

  @override
  String get or => 'O';

  @override
  String get successfullySignedInGoogle =>
      '¡Inicio de sesión exitoso con Google!';

  @override
  String get dontHaveAccount => '¿No tienes cuenta? ';

  @override
  String get signUp => 'Registrarse';

  @override
  String get rememberMe => 'Recuérdame';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get forgotPasswordTitle => 'Olvidé mi Contraseña';

  @override
  String get passwordResetLinkSent => 'Enlace de Restablecimiento Enviado';

  @override
  String get checkEmailResetLink =>
      'Revisa tu correo electrónico para el enlace de restablecimiento de contraseña. Haz clic en el enlace para restablecer tu contraseña.';

  @override
  String get done => 'Listo';

  @override
  String get passwordResetSuccess =>
      '¡Contraseña restablecida exitosamente! Por favor inicia sesión con tu nueva contraseña.';

  @override
  String get pleaseEnterEmailReset =>
      'Por favor ingresa tu correo electrónico para recibir un enlace de restablecimiento de contraseña.';

  @override
  String get sendResetLink => 'Enviar Enlace de Restablecimiento';

  @override
  String get fullName => 'Nombre Completo';

  @override
  String get phoneNumber => 'Número de Teléfono';

  @override
  String get confirmPassword => 'Confirmar Contraseña';

  @override
  String get pleaseSignUpToGetStarted => 'Por favor regístrate para comenzar';

  @override
  String get deliverTo => 'ENTREGAR EN';

  @override
  String get selectLocation => 'Seleccionar Ubicación';

  @override
  String heyUser(String userName) {
    return 'Hola $userName, ';
  }

  @override
  String get goodMorning => '¡Buenos días! 👋';

  @override
  String get heyThere => 'Hola, ';

  @override
  String get allCategories => 'Todas las Categorías';

  @override
  String get openRestaurants => 'Restaurantes Abiertos';

  @override
  String get search => 'Buscar';

  @override
  String get popularRestaurants => 'Restaurantes Populares';

  @override
  String get noPopularRestaurantsFound =>
      'No se encontraron restaurantes populares';

  @override
  String get recentKeywords => 'Búsquedas Recientes';

  @override
  String get noRecentSearches => 'No hay búsquedas recientes';

  @override
  String addedToRecentSearches(String searchTerm) {
    return '\"$searchTerm\" añadido a búsquedas recientes';
  }

  @override
  String removedFromRecentSearches(String searchTerm) {
    return '\"$searchTerm\" eliminado de búsquedas recientes';
  }

  @override
  String get searchRestaurantsOrDishes => 'Buscar restaurantes o platos';

  @override
  String get noRestaurantsFound => 'No se encontraron restaurantes';

  @override
  String get deliveryAddress => 'DIRECCIÓN DE ENTREGA';

  @override
  String get edit => 'EDITAR';

  @override
  String get selectAnAddress => 'Selecciona una dirección';

  @override
  String get totalLabel => 'TOTAL : ';

  @override
  String pkrAmount(String amount) {
    return 'PKR $amount';
  }

  @override
  String get checkoutButton => 'PAGAR';

  @override
  String get yourCartIsEmpty => 'Tu carrito está vacío';

  @override
  String get initializingCart => 'Cargando carrito...';

  @override
  String get cart => 'Carrito';

  @override
  String get checkout => 'Pagar';

  @override
  String get deliveryAddressTitle => 'Dirección de Entrega';

  @override
  String get change => 'Cambiar';

  @override
  String get noAddressSelected => 'No se seleccionó dirección';

  @override
  String get orderItems => 'Artículos del Pedido';

  @override
  String get paymentMethod => 'Método de Pago';

  @override
  String get orderSummary => 'Resumen del Pedido';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get deliveryFee => 'Costo de Envío';

  @override
  String get platformFee => 'Tarifa de Plataforma';

  @override
  String get total => 'Total';

  @override
  String get orderPlaced => '¡Pedido Realizado!';

  @override
  String get orderPlacedSuccessfully =>
      'Tu pedido ha sido realizado exitosamente.\nRastrea tu pedido en tiempo real.';

  @override
  String get trackOrder => 'Rastrear Pedido';

  @override
  String get backToHome => 'Volver al Inicio';

  @override
  String confirmPaymentAmount(String amount) {
    return 'Confirmar Pago  •  PKR $amount';
  }

  @override
  String rsPrice(String price) {
    return 'RS $price';
  }

  @override
  String get chooseYourFlavor => 'Elige tu sabor';

  @override
  String get chooseYourSize => 'Elige tu tamaño';

  @override
  String get tenInch => '10 pulgadas';

  @override
  String get sixteenInch => '16 pulgadas';

  @override
  String get twentyInch => '20 pulgadas';

  @override
  String get removeFromCart => 'Eliminar del carrito';

  @override
  String get addToCart => 'Añadir al carrito';

  @override
  String get allItems => 'Todos los Artículos';

  @override
  String get all => 'Todos';

  @override
  String get failedLoadFoodItems =>
      'Error al cargar los artículos. Por favor intenta de nuevo más tarde.';

  @override
  String get noFoodItemsCategory =>
      'No hay artículos disponibles para esta categoría.';

  @override
  String get free => 'Gratis';

  @override
  String deliveryTimeMin(String minutes) {
    return '$minutes min';
  }

  @override
  String get allRestaurants => 'Todos los Restaurantes';

  @override
  String get selectPaymentMethod => 'Seleccionar Método de Pago';

  @override
  String get cashOnDelivery => 'Pago Contra Entrega';

  @override
  String get payWhenOrderArrives => 'Paga cuando llegue tu pedido';

  @override
  String get cashOnDeliverySelected => 'Pago contra entrega seleccionado';

  @override
  String get visa => 'Visa';

  @override
  String get selectVisaCards => 'Selecciona de tus tarjetas Visa guardadas';

  @override
  String get mastercard => 'Mastercard';

  @override
  String get selectMastercardCards =>
      'Selecciona de tus tarjetas Mastercard guardadas';

  @override
  String cardEndingInSelected(String last4) {
    return 'Tarjeta terminada en $last4 seleccionada';
  }

  @override
  String noCardsSavedAddFirst(String cardType) {
    return 'No hay tarjetas $cardType guardadas. Agrega una primero.';
  }

  @override
  String get savedCards => 'Tarjetas Guardadas';

  @override
  String get creditCardAddedSuccess =>
      'Tarjeta de crédito añadida exitosamente';

  @override
  String get creditCardDeletedSuccess =>
      'Tarjeta de crédito eliminada exitosamente';

  @override
  String get noSavedCardsYet => 'Aún no hay tarjetas guardadas';

  @override
  String get addCardBelowToGetStarted =>
      'Agrega una tarjeta abajo para comenzar';

  @override
  String maskedCardNumber(String last4) {
    return '**** **** **** $last4';
  }

  @override
  String cardHolderExpiry(String holderName, String expiryDate) {
    return '$holderName  •  $expiryDate';
  }

  @override
  String get addNewCard => 'Agregar Nueva Tarjeta';

  @override
  String get cardInformation => 'Información de la Tarjeta';

  @override
  String get cardNumberPlaceholder => '4242 4242 4242 4242';

  @override
  String get cardNumberRequired => 'El número de tarjeta es obligatorio';

  @override
  String get cardNumberTooShort => 'El número de tarjeta es muy corto';

  @override
  String get mmyyPlaceholder => 'MM/AA';

  @override
  String get invalidMonth => 'Mes inválido';

  @override
  String get cvcPlaceholder => 'CVC';

  @override
  String get invalidCvc => 'CVC inválido';

  @override
  String get fullNameOnCard => 'Nombre completo en la tarjeta';

  @override
  String get cardSecurityNote =>
      'Los datos de tu tarjeta son manejados de forma segura por Stripe. Nunca almacenamos tu número de tarjeta completo.';

  @override
  String get adding => 'Agregando...';

  @override
  String get addCard => 'Agregar Tarjeta';

  @override
  String get addAddress => 'Agregar Dirección';

  @override
  String get addressNotAvailable => 'Dirección no disponible';

  @override
  String get failedLoadAddresses => 'Error al cargar las direcciones';

  @override
  String get noSavedAddresses => 'Aún no hay direcciones guardadas';

  @override
  String get pleaseSignInAddresses => 'Inicia sesión para ver las direcciones';

  @override
  String get address => 'Dirección';

  @override
  String get locationPermissionRequired => 'Se requiere permiso de ubicación';

  @override
  String get streetNo => 'N° de Calle';

  @override
  String get zipCode => 'Código Postal';

  @override
  String get city => 'Ciudad';

  @override
  String get country => 'País';

  @override
  String get label => 'Etiqueta';

  @override
  String get home => 'Casa';

  @override
  String get work => 'Trabajo';

  @override
  String get other => 'Otro';

  @override
  String get pleaseFillAllFields =>
      'Por favor completa todos los campos requeridos';

  @override
  String get userNotAuthenticated => 'Usuario no autenticado';

  @override
  String get addressAddedSuccessfully => '¡Dirección agregada exitosamente!';

  @override
  String failedToAddAddress(String error) {
    return 'Error al agregar dirección: $error';
  }

  @override
  String get save => 'Guardar';

  @override
  String get selectDeliveryAddress => 'Seleccionar Dirección de Entrega';

  @override
  String get noAddressesFound => 'No se encontraron direcciones';

  @override
  String get iLoveFastFood => 'Amo la Comida Rápida';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get profile => 'Perfil';

  @override
  String get personalInfo => 'Información Personal';

  @override
  String get guestUser => 'Usuario Invitado';

  @override
  String get pleaseLoginViewProfile => 'Inicia sesión para ver tu perfil';

  @override
  String editTitle(String title) {
    return 'Editar $title';
  }

  @override
  String enterTitle(String title) {
    return 'Ingresa $title';
  }

  @override
  String get apply => 'Aplicar';

  @override
  String get phone => 'Teléfono';

  @override
  String get favourite => 'Favorito';

  @override
  String get foods => 'Comidas';

  @override
  String get restaurants => 'Restaurantes';

  @override
  String get noFavouriteRestaurants =>
      'No se encontraron restaurantes favoritos.';

  @override
  String get noFavouriteFoods => 'No se encontraron comidas favoritas.';

  @override
  String get orderRatings => 'Calificaciones del Pedido';

  @override
  String get restaurantRatings => 'Calificaciones del Restaurante';

  @override
  String get userReviews => 'Reseñas de Usuarios';

  @override
  String get submit => 'Enviar';

  @override
  String get review => 'Reseña';

  @override
  String get myReviews => 'Mis Reseñas';

  @override
  String get orderCancelledSuccessfully => 'Pedido cancelado exitosamente';

  @override
  String get clearOrderHistory => 'Borrar Historial de Pedidos';

  @override
  String get confirmDeleteOrderHistory =>
      '¿Estás seguro de que deseas eliminar todo el historial de pedidos? Esta acción no se puede deshacer.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get clearAll => 'Borrar Todo';

  @override
  String get clearOrderHistoryMenu => 'Borrar historial de pedidos';

  @override
  String get orderHistory => 'Historial de Pedidos';

  @override
  String get noCompletedOrders => 'Aún no hay pedidos completados';

  @override
  String get noOngoingOrders => 'No hay pedidos en curso';

  @override
  String get noOrderHistory => 'No hay historial de pedidos';

  @override
  String get ongoing => 'En Curso';

  @override
  String get history => 'Historial';

  @override
  String get noActiveOrder => 'No hay pedido activo';

  @override
  String get orderDelivered => '¡Tu pedido ha sido entregado!';

  @override
  String callingNumber(String phoneNumber) {
    return 'Llamando a $phoneNumber...';
  }

  @override
  String get locationPermissionDenied => 'Permiso de ubicación denegado';

  @override
  String get orderReceived => 'Tu pedido ha sido recibido';

  @override
  String get restaurantPreparingFood =>
      'El restaurante está preparando tu comida';

  @override
  String get orderPickedUp => 'Tu pedido ha sido recogido para entrega';

  @override
  String get orderArrivingSoon => '¡El pedido llegará pronto!';

  @override
  String get estimatedDeliveryTime => 'TIEMPO ESTIMADO DE ENTREGA';

  @override
  String estimatedMinutes(String minutes) {
    return '$minutes min';
  }

  @override
  String orderedAt(String date) {
    return 'Pedido realizado el $date';
  }

  @override
  String get courier => 'Repartidor';

  @override
  String get noNotificationsYet => 'Aún no hay notificaciones';

  @override
  String unreadNotificationsCount(int count) {
    return '$count notificaciones sin leer';
  }

  @override
  String get noNotifications => 'Sin notificaciones';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get markAllAsRead => 'Marcar todo como leído';

  @override
  String get clearAllNotifications => 'Borrar todo';

  @override
  String get allTab => 'Todos';

  @override
  String get unread => 'Sin leer';

  @override
  String get preferences => 'PREFERENCIAS';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get english => 'Inglés';

  @override
  String get themes => 'Temas';

  @override
  String get settings => 'Configuración';

  @override
  String get versionInfoNotAvailable => 'Información de versión no disponible';

  @override
  String get faqs => 'Preguntas Frecuentes';

  @override
  String get orderFaq => 'Pedido';

  @override
  String get paymentsFaq => 'Pagos';

  @override
  String get deliveryFaq => 'Entrega';

  @override
  String get chat => 'Chat';

  @override
  String get call => 'Llamar';

  @override
  String get howTrackOrder => '¿Cómo rastreo mi pedido?';

  @override
  String get canCancelOrder => '¿Puedo cancelar mi pedido?';

  @override
  String get whatIfOrderDelayed => '¿Qué pasa si mi pedido se retrasa?';

  @override
  String get whatPaymentMethodsAccepted => '¿Qué métodos de pago se aceptan?';

  @override
  String get isCardSafeBite =>
      '¿Es seguro usar mi tarjeta de crédito/débito en Bite?';

  @override
  String get canUseMultiplePaymentMethods =>
      '¿Puedo usar múltiples métodos de pago en un pedido?';

  @override
  String get whatIfPaymentFails => '¿Qué debo hacer si un pago falla?';

  @override
  String get whatDeliveryHours => '¿Cuáles son sus horarios de entrega?';

  @override
  String get chargeDeliveryFee => '¿Cobran tarifa de envío?';

  @override
  String get deliverToLocation => '¿Realizan entregas en mi ubicación?';

  @override
  String get scheduleDeliveryLater =>
      '¿Puedo programar una entrega para después?';

  @override
  String get clear => 'BORRAR';

  @override
  String get applyFilter => 'APLICAR';

  @override
  String get ratingFilter => 'CALIFICACIÓN';

  @override
  String get lessThan3_5 => '< 3.5';

  @override
  String get between3_5And4_0 => '3.5 - 4.0';

  @override
  String get greaterThan4_0 => '> 4.0';

  @override
  String get deliveryTimeFilter => 'TIEMPO DE ENTREGA';

  @override
  String get lessThan15Min => '< 15 min';

  @override
  String get between15And30Min => '15 - 30 min';

  @override
  String get greaterThan30Min => '> 30 min';

  @override
  String get filterYourSearch => 'Filtra tu búsqueda';

  @override
  String get seeAll => 'Ver Todo';

  @override
  String enterField(String field) {
    return 'Ingresa $field';
  }

  @override
  String pleaseEnterField(String field) {
    return 'Por favor ingresa $field';
  }

  @override
  String get pleaseEnterValidEmail =>
      'Por favor ingresa un correo electrónico válido';

  @override
  String get pleaseEnterValidPhone =>
      'Por favor ingresa un número de teléfono válido';

  @override
  String get passwordMinimum8Chars =>
      'La contraseña debe tener al menos 8 caracteres';

  @override
  String get favorites => 'Favoritos';

  @override
  String get reviews => 'Reseñas';

  @override
  String get updateAvailable => 'Actualización Disponible';

  @override
  String get newBiteVersionReady => '¡Una nueva versión de Bite está lista!';

  @override
  String updateDescription(String version) {
    return 'La versión $version incluye nuevas funciones, mejoras de rendimiento y correcciones de errores.';
  }

  @override
  String versionPrefix(String version) {
    return 'v$version';
  }

  @override
  String get updateNow => 'Actualizar Ahora';

  @override
  String get maybeLater => 'Quizás Después';

  @override
  String errorMessage(String message) {
    return 'Error: $message';
  }
}
