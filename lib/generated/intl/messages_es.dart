// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(search) =>
      "Se agregó \"\$${search}\" a las búsquedas recientes.";

  static String m1(totalCount) => "Todos (\$${totalCount})";

  static String m2(phoneNumber) => "Llamando a \$${phoneNumber}...";

  static String m3(last4) => "Tarjeta que termina en \$${last4} seleccionada";

  static String m4(grandTotal) => "Confirmar pago • PKR \$${grandTotal}";

  static String m5(title) => "Editar \$${title}";

  static String m6(stateMessage) => "Error: \$${stateMessage}";

  static String m7(error) => "No se pudo agregar la dirección: \$${error}";

  static String m8(stateMessage) =>
      "Error de inicio de sesión de Google: \$${stateMessage}";

  static String m9(errorMessage) => "Pago fallido: \$${errorMessage}";

  static String m10(title) => "Por favor ingresa \$${title}";

  static String m11(search) =>
      "Se eliminó \"\$${search}\" de búsquedas recientes.";

  static String m12(unreadCount) => "\$${unreadCount} notificaciones no leídas";

  static String m13(unreadCount) => "No leído (\$${unreadCount})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aNewVersionOfBiteIsReady": MessageLookupByLibrary.simpleMessage(
      "¡Una nueva versión de Bite está lista!",
    ),
    "addACardBelowToGetStarted": MessageLookupByLibrary.simpleMessage(
      "Agregue una tarjeta a continuación para comenzar",
    ),
    "addAddress": MessageLookupByLibrary.simpleMessage("Agregar dirección"),
    "addCard": MessageLookupByLibrary.simpleMessage("Agregar tarjeta"),
    "addNewCard": MessageLookupByLibrary.simpleMessage("Agregar nueva tarjeta"),
    "addToCart": MessageLookupByLibrary.simpleMessage("Añadir al carrito"),
    "addedStatesearchToRecentSearches": m0,
    "adding": MessageLookupByLibrary.simpleMessage("Añadiendo..."),
    "address": MessageLookupByLibrary.simpleMessage("Dirección"),
    "addressAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "¡Dirección agregada exitosamente!",
    ),
    "allCategories": MessageLookupByLibrary.simpleMessage(
      "Todas las categorías",
    ),
    "allNotifications": m1,
    "allRestaurants": MessageLookupByLibrary.simpleMessage(
      "Todos los restaurantes",
    ),
    "allYourFavorites": MessageLookupByLibrary.simpleMessage(
      "Todos tus favoritos",
    ),
    "apply": MessageLookupByLibrary.simpleMessage("Aplicar"),
    "apply2": MessageLookupByLibrary.simpleMessage("APLICAR"),
    "areYouSureYouWantToCancelThisOrder": MessageLookupByLibrary.simpleMessage(
      "¿Estás seguro de que deseas cancelar este pedido?",
    ),
    "areYouSureYouWantToDeleteAllOrderHistory":
        MessageLookupByLibrary.simpleMessage(
          "¿Está seguro de que desea eliminar todo el historial de pedidos? Esta acción no se puede deshacer.",
        ),
    "areYouSureYouWantToRemoveThisFoodItem":
        MessageLookupByLibrary.simpleMessage(
          "¿Está seguro de que desea eliminar este alimento de sus favoritos?",
        ),
    "areYouSureYouWantToRemoveThisRestaurantFrom":
        MessageLookupByLibrary.simpleMessage(
          "¿Estás seguro de que quieres eliminar este restaurante de tus favoritos?",
        ),
    "backToHome": MessageLookupByLibrary.simpleMessage("Volver a Inicio"),
    "call": MessageLookupByLibrary.simpleMessage("llamar"),
    "callingphonenumber": m2,
    "canICancelMyOrder": MessageLookupByLibrary.simpleMessage(
      "¿Puedo cancelar mi pedido?",
    ),
    "canIScheduleADeliveryForALaterTime": MessageLookupByLibrary.simpleMessage(
      "¿Puedo programar una entrega para más tarde?",
    ),
    "canIUseMultiplePaymentMethodsForOneOrder":
        MessageLookupByLibrary.simpleMessage(
          "¿Puedo utilizar varios métodos de pago para un pedido?",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cancelOrder": MessageLookupByLibrary.simpleMessage("Cancelar pedido"),
    "cardEndingInCreditcardlast4Selected": m3,
    "cardHolder": MessageLookupByLibrary.simpleMessage("Titular de la tarjeta"),
    "cardInformation": MessageLookupByLibrary.simpleMessage(
      "Información de la tarjeta",
    ),
    "cardNumberIsRequired": MessageLookupByLibrary.simpleMessage(
      "Se requiere el número de tarjeta",
    ),
    "cardNumberIsTooShort": MessageLookupByLibrary.simpleMessage(
      "El número de tarjeta es demasiado corto",
    ),
    "cart": MessageLookupByLibrary.simpleMessage("Carrito"),
    "cashOnDelivery": MessageLookupByLibrary.simpleMessage("Contra reembolso"),
    "cashOnDeliverySelected": MessageLookupByLibrary.simpleMessage(
      "Contra reembolso seleccionado",
    ),
    "change": MessageLookupByLibrary.simpleMessage("Cambiar"),
    "chat": MessageLookupByLibrary.simpleMessage("Charla"),
    "checkYourEmailForAPasswordResetLink": MessageLookupByLibrary.simpleMessage(
      "Revise su correo electrónico para obtener un enlace para restablecer su contraseña. Haga clic en el enlace para restablecer su contraseña en nuestro sitio web.",
    ),
    "checkout": MessageLookupByLibrary.simpleMessage("Pagar"),
    "checkout2": MessageLookupByLibrary.simpleMessage("PAGAR"),
    "chooseYourFlavor": MessageLookupByLibrary.simpleMessage("Elige tu sabor"),
    "chooseYourSize": MessageLookupByLibrary.simpleMessage("Elige tu talla"),
    "city": MessageLookupByLibrary.simpleMessage("ciudad"),
    "clear2": MessageLookupByLibrary.simpleMessage("CLARO"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Borrar todo"),
    "clearAllNotifications": MessageLookupByLibrary.simpleMessage(
      "Borrar todas las notificaciones",
    ),
    "clearOrderHistory": MessageLookupByLibrary.simpleMessage(
      "Borrar historial de pedidos",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "confirmar Contraseña",
    ),
    "confirmPayment": m4,
    "country": MessageLookupByLibrary.simpleMessage("País"),
    "courier": MessageLookupByLibrary.simpleMessage("mensajero"),
    "creditCardAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Tarjeta de crédito agregada exitosamente",
    ),
    "creditCardDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Tarjeta de crédito eliminada exitosamente",
    ),
    "cvc": MessageLookupByLibrary.simpleMessage("CVC"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Modo oscuro"),
    "deleteAllNotificationsConfirmation": MessageLookupByLibrary.simpleMessage(
      "¿Estás seguro de que deseas eliminar todas las notificaciones? Esta acción no se puede deshacer.",
    ),
    "delivery": MessageLookupByLibrary.simpleMessage("Entrega"),
    "deliveryAddress": MessageLookupByLibrary.simpleMessage(
      "Dirección de entrega",
    ),
    "deliveryAddress2": MessageLookupByLibrary.simpleMessage(
      "DIRECCIÓN DE ENTREGA",
    ),
    "deliveryFee": MessageLookupByLibrary.simpleMessage("Tarifa de entrega"),
    "deliveryTime2": MessageLookupByLibrary.simpleMessage("TIEMPO DE ENTREGA"),
    "doYouChargeADeliveryFee": MessageLookupByLibrary.simpleMessage(
      "¿Cobran una tarifa de envío?",
    ),
    "doYouDeliverToMyLocation": MessageLookupByLibrary.simpleMessage(
      "¿Hacen entregas en mi ubicación?",
    ),
    "done": MessageLookupByLibrary.simpleMessage("hecho"),
    "dontHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "¿No tienes una cuenta?",
    ),
    "edit2": MessageLookupByLibrary.simpleMessage("EDITAR"),
    "editTitle": m5,
    "email": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
    "errorStatemessage": m6,
    "estimatedDeliveryTime2": MessageLookupByLibrary.simpleMessage(
      "TIEMPO DE ENTREGA ESTIMADO",
    ),
    "failedToAddAddressError": m7,
    "failedToLoadAddresses": MessageLookupByLibrary.simpleMessage(
      "No se pudieron cargar las direcciones",
    ),
    "failedToLoadCards": MessageLookupByLibrary.simpleMessage(
      "No se pudieron cargar las tarjetas",
    ),
    "failedToLoadFoodItemsPleaseTryAgainLater":
        MessageLookupByLibrary.simpleMessage(
          "No se pudieron cargar los alimentos. Inténtelo de nuevo más tarde.",
        ),
    "faqs": MessageLookupByLibrary.simpleMessage("Preguntas frecuentes"),
    "favorites": MessageLookupByLibrary.simpleMessage("Favoritos"),
    "filterYourSearch": MessageLookupByLibrary.simpleMessage(
      "Filtra tu búsqueda",
    ),
    "foods": MessageLookupByLibrary.simpleMessage("Alimentos"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "Olvidé mi contraseña",
    ),
    "freeDeliveryOffers": MessageLookupByLibrary.simpleMessage(
      "Ofertas de entrega gratuita",
    ),
    "fullName": MessageLookupByLibrary.simpleMessage("Nombre completo"),
    "fullNameOnCard": MessageLookupByLibrary.simpleMessage(
      "Nombre completo en la tarjeta",
    ),
    "getAllYourLovedFoodsInOnePlace": MessageLookupByLibrary.simpleMessage(
      "Obtenga todos sus alimentos favoritos en un solo lugar, usted simplemente coloca el resto o nosotros hacemos el resto.",
    ),
    "getStarted": MessageLookupByLibrary.simpleMessage("Empezar"),
    "googleSigninErrorStatemessage": m8,
    "guestUser": MessageLookupByLibrary.simpleMessage("Usuario invitado"),
    "history": MessageLookupByLibrary.simpleMessage("Historia"),
    "home": MessageLookupByLibrary.simpleMessage("Inicio"),
    "howDoITrackMyOrder": MessageLookupByLibrary.simpleMessage(
      "¿Cómo hago el seguimiento de mi pedido?",
    ),
    "invalidCvc": MessageLookupByLibrary.simpleMessage("CVC no válido"),
    "invalidMonth": MessageLookupByLibrary.simpleMessage("Mes no válido"),
    "isItSafeToUseMyCreditdebitCardOnBite":
        MessageLookupByLibrary.simpleMessage(
          "¿Es seguro usar mi tarjeta de crédito/débito en Bite?",
        ),
    "label": MessageLookupByLibrary.simpleMessage("Etiqueta"),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "locationPermissionDenied": MessageLookupByLibrary.simpleMessage(
      "Permiso de ubicación denegado",
    ),
    "locationPermissionIsRequired": MessageLookupByLibrary.simpleMessage(
      "Se requiere permiso de ubicación",
    ),
    "logIn": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
    "login": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
    "logout": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Marcar todo como leído",
    ),
    "mastercard": MessageLookupByLibrary.simpleMessage("Mastercard"),
    "maybeLater": MessageLookupByLibrary.simpleMessage("Quizás más tarde"),
    "myReviews": MessageLookupByLibrary.simpleMessage("Mis reseñas"),
    "next": MessageLookupByLibrary.simpleMessage("Siguiente"),
    "noActiveOrder": MessageLookupByLibrary.simpleMessage("Sin orden activa"),
    "noAddressSelected": MessageLookupByLibrary.simpleMessage(
      "Ninguna dirección seleccionada",
    ),
    "noAddressesFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron direcciones",
    ),
    "noCardDetails": MessageLookupByLibrary.simpleMessage(
      "Sin datos de tarjeta",
    ),
    "noCompletedOrdersYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay pedidos completados",
    ),
    "noFavouriteFoodsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron alimentos favoritos.",
    ),
    "noFavouriteRestaurantsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron restaurantes favoritos.",
    ),
    "noFoodItemsAvailableForThisCategory": MessageLookupByLibrary.simpleMessage(
      "No hay alimentos disponibles para esta categoría.",
    ),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay notificaciones",
    ),
    "noOngoingOrders": MessageLookupByLibrary.simpleMessage(
      "No hay pedidos en curso",
    ),
    "noOrderHistory": MessageLookupByLibrary.simpleMessage(
      "Sin historial de pedidos",
    ),
    "noPopularRestaurantsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron restaurantes populares",
    ),
    "noRecentSearches": MessageLookupByLibrary.simpleMessage(
      "No hay búsquedas recientes",
    ),
    "noRestaurantsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron restaurantes",
    ),
    "noSavedAddressesYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay direcciones guardadas",
    ),
    "noSavedCardsYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay tarjetas guardadas",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notificaciones"),
    "ongoing": MessageLookupByLibrary.simpleMessage("en curso"),
    "openRestaurants": MessageLookupByLibrary.simpleMessage(
      "Restaurantes abiertos",
    ),
    "or": MessageLookupByLibrary.simpleMessage("O"),
    "order": MessageLookupByLibrary.simpleMessage("Orden"),
    "orderAgain": MessageLookupByLibrary.simpleMessage("Ordene nuevamente"),
    "orderArrivingSoon": MessageLookupByLibrary.simpleMessage(
      "¡El pedido llegará pronto!",
    ),
    "orderCancelledSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Pedido cancelado con éxito",
    ),
    "orderFromChoosenChef": MessageLookupByLibrary.simpleMessage(
      "Orden del chef elegido",
    ),
    "orderHistory": MessageLookupByLibrary.simpleMessage(
      "Historial de pedidos",
    ),
    "orderItems": MessageLookupByLibrary.simpleMessage("Ordenar artículos"),
    "orderPlaced": MessageLookupByLibrary.simpleMessage("¡Pedido realizado!"),
    "orderSummary": MessageLookupByLibrary.simpleMessage("Resumen del pedido"),
    "other": MessageLookupByLibrary.simpleMessage("Otro"),
    "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
    "passwordMustBeAtLeast8CharactersLong":
        MessageLookupByLibrary.simpleMessage(
          "La contraseña debe tener al menos 8 caracteres",
        ),
    "passwordResetLinkSent": MessageLookupByLibrary.simpleMessage(
      "Enlace de restablecimiento de contraseña enviado",
    ),
    "passwordResetSuccessfully": MessageLookupByLibrary.simpleMessage(
      "¡Restablecimiento de contraseña exitoso! Por favor inicie sesión con su nueva contraseña.",
    ),
    "payWhenYourOrderArrives": MessageLookupByLibrary.simpleMessage(
      "Paga cuando llegue tu pedido",
    ),
    "paymentFailedPaymentstateerrormessage": m9,
    "paymentMethod": MessageLookupByLibrary.simpleMessage("Método de pago"),
    "payments": MessageLookupByLibrary.simpleMessage("Pagos"),
    "paysWhenOrderArrives": MessageLookupByLibrary.simpleMessage(
      "Paga cuando llega el pedido",
    ),
    "performanceImprovementsAndBugFixes": MessageLookupByLibrary.simpleMessage(
      "mejoras de rendimiento y corrección de errores.",
    ),
    "personalInfo": MessageLookupByLibrary.simpleMessage(
      "Información personal",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Teléfono"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Número de teléfono"),
    "platformFee": MessageLookupByLibrary.simpleMessage("Tarifa de plataforma"),
    "pleaseEnterAValidAddress": MessageLookupByLibrary.simpleMessage(
      "Por favor introduce una dirección válida",
    ),
    "pleaseEnterAValidEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Por favor introduce una dirección de correo electrónico válida",
    ),
    "pleaseEnterAValidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Por favor ingresa un número de teléfono válido",
    ),
    "pleaseEnterWidgettitletolowercase": m10,
    "pleaseEnterYourEmailAddressToReceiveAPasswordReset":
        MessageLookupByLibrary.simpleMessage(
          "Ingrese su dirección de correo electrónico para recibir un enlace para restablecer su contraseña.",
        ),
    "pleaseFillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
      "Por favor complete todos los campos requeridos",
    ),
    "pleaseLoginToViewYourProfile": MessageLookupByLibrary.simpleMessage(
      "Por favor inicia sesión para ver tu perfil",
    ),
    "pleaseSignInToContinue": MessageLookupByLibrary.simpleMessage(
      "Por favor inicie sesión para continuar",
    ),
    "pleaseSignInToViewAddresses": MessageLookupByLibrary.simpleMessage(
      "Por favor inicia sesión para ver direcciones",
    ),
    "pleaseSignUpToGetStarted": MessageLookupByLibrary.simpleMessage(
      "Regístrese para comenzar",
    ),
    "popularRestaurants": MessageLookupByLibrary.simpleMessage(
      "Restaurantes populares",
    ),
    "preferences2": MessageLookupByLibrary.simpleMessage("PREFERENCIAS"),
    "profile": MessageLookupByLibrary.simpleMessage("Perfil"),
    "rate": MessageLookupByLibrary.simpleMessage("Tarifa"),
    "rating2": MessageLookupByLibrary.simpleMessage("CALIFICACIÓN"),
    "recentKeywords": MessageLookupByLibrary.simpleMessage(
      "Palabras clave recientes",
    ),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Recuérdame"),
    "remove": MessageLookupByLibrary.simpleMessage("Quitar"),
    "removeFromCart": MessageLookupByLibrary.simpleMessage(
      "Quitar del carrito",
    ),
    "removeFromFavourites": MessageLookupByLibrary.simpleMessage(
      "Quitar de favoritos",
    ),
    "removedStatesearchFromRecentSearches": m11,
    "reorder": MessageLookupByLibrary.simpleMessage("Reordenar"),
    "required": MessageLookupByLibrary.simpleMessage("Requerido"),
    "restaurants": MessageLookupByLibrary.simpleMessage("Restaurantes"),
    "reviews": MessageLookupByLibrary.simpleMessage("Reseñas"),
    "save": MessageLookupByLibrary.simpleMessage("Guardar"),
    "savedCards": MessageLookupByLibrary.simpleMessage("Tarjetas guardadas"),
    "search": MessageLookupByLibrary.simpleMessage("Buscar"),
    "searchForRestaurantsOrDishes": MessageLookupByLibrary.simpleMessage(
      "Buscar restaurantes o platos",
    ),
    "seeAll": MessageLookupByLibrary.simpleMessage("Ver todo"),
    "selectAnAddress": MessageLookupByLibrary.simpleMessage(
      "Seleccione una dirección",
    ),
    "selectDeliveryAddress": MessageLookupByLibrary.simpleMessage(
      "Seleccionar dirección de entrega",
    ),
    "selectFromYourSavedMastercards": MessageLookupByLibrary.simpleMessage(
      "Selecciona entre tus Mastercards guardadas",
    ),
    "selectFromYourSavedVisaCards": MessageLookupByLibrary.simpleMessage(
      "Seleccione entre sus tarjetas Visa guardadas",
    ),
    "selectPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Seleccione método de pago",
    ),
    "sendResetLink": MessageLookupByLibrary.simpleMessage(
      "Enviar enlace de reinicio",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Configuración"),
    "signUp": MessageLookupByLibrary.simpleMessage("Regístrate"),
    "signup": MessageLookupByLibrary.simpleMessage("Regístrate"),
    "skip": MessageLookupByLibrary.simpleMessage("Saltar"),
    "stateunreadcountUnreadNotifications": m12,
    "streetNo": MessageLookupByLibrary.simpleMessage("Calle No."),
    "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
    "successfullySignedInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "¡Iniciaste sesión exitosamente en Google!",
    ),
    "theRestaurantIsPreparingYourFood": MessageLookupByLibrary.simpleMessage(
      "El restaurante está preparando tu comida.",
    ),
    "themes": MessageLookupByLibrary.simpleMessage("Temas"),
    "total": MessageLookupByLibrary.simpleMessage("totales"),
    "total2": MessageLookupByLibrary.simpleMessage("TOTAL :"),
    "trackOrder": MessageLookupByLibrary.simpleMessage(
      "Seguimiento del pedido",
    ),
    "unreadNotifications": m13,
    "updateAvailable": MessageLookupByLibrary.simpleMessage(
      "Actualización disponible",
    ),
    "updateDialog": MessageLookupByLibrary.simpleMessage(
      "Actualizar cuadro de diálogo",
    ),
    "updateNow": MessageLookupByLibrary.simpleMessage("Actualizar ahora"),
    "userNotAuthenticated": MessageLookupByLibrary.simpleMessage(
      "Usuario no autenticado",
    ),
    "versionInfoNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Información de versión no disponible",
    ),
    "versionLatestversionIncludesNewFeatures":
        MessageLookupByLibrary.simpleMessage(
          "La versión \$latestVersion incluye nuevas funciones,",
        ),
    "visa": MessageLookupByLibrary.simpleMessage("visa"),
    "whatAreYourDeliveryHours": MessageLookupByLibrary.simpleMessage(
      "¿Cuáles son sus horarios de entrega?",
    ),
    "whatIfMyOrderIsDelayed": MessageLookupByLibrary.simpleMessage(
      "¿Qué pasa si mi pedido se retrasa?",
    ),
    "whatPaymentMethodsAreAccepted": MessageLookupByLibrary.simpleMessage(
      "¿Qué métodos de pago se aceptan?",
    ),
    "whatShouldIDoIfAPaymentFails": MessageLookupByLibrary.simpleMessage(
      "¿Qué debo hacer si falla un pago?",
    ),
    "work": MessageLookupByLibrary.simpleMessage("trabajo"),
    "yesCancel": MessageLookupByLibrary.simpleMessage("Sí, cancelar"),
    "yourCardDetailsAreSecurelyHandledByStripeWeNever":
        MessageLookupByLibrary.simpleMessage(
          "Stripe maneja de forma segura los datos de tu tarjeta. Nunca almacenamos su número de tarjeta completo.",
        ),
    "yourCartIsEmpty": MessageLookupByLibrary.simpleMessage(
      "Tu carrito está vacío",
    ),
    "yourOrderHasBeenDelivered": MessageLookupByLibrary.simpleMessage(
      "¡Tu pedido ha sido entregado!",
    ),
    "yourOrderHasBeenPickedUpForDelivery": MessageLookupByLibrary.simpleMessage(
      "Su pedido ha sido recogido para su entrega.",
    ),
    "yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime":
        MessageLookupByLibrary.simpleMessage(
          "Su pedido se ha realizado correctamente.\\nRastree su pedido en tiempo real.",
        ),
    "yourOrderHasBeenReceived": MessageLookupByLibrary.simpleMessage(
      "Tu pedido ha sido recibido",
    ),
    "zipCode": MessageLookupByLibrary.simpleMessage("Código postal"),
  };
}
