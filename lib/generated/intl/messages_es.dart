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

  static String m0(search) => "Se agregó \"${search}\" a búsquedas recientes";

  static String m1(totalCount) => "Todas (${totalCount})";

  static String m2(phoneNumber) => "Llamando a ${phoneNumber}...";

  static String m3(last4) => "Tarjeta terminada en ${last4} seleccionada";

  static String m4(grandTotal) => "Confirmar Pago • PKR ${grandTotal}";

  static String m5(title) => "Editar ${title}";

  static String m6(stateMessage) => "Error: ${stateMessage}";

  static String m7(error) => "Error al agregar dirección: ${error}";

  static String m8(error) => "Error al actualizar la dirección: ${error}";

  static String m9(stateMessage) =>
      "Error de Sign-In de Google: ${stateMessage}";

  static String m10(errorMessage) => "Error en el pago: ${errorMessage}";

  static String m11(title) => "Por favor ingrese ${title}";

  static String m12(search) =>
      "Se removió \"${search}\" de búsquedas recientes";

  static String m13(unreadCount) => "${unreadCount} notificaciones sin leer";

  static String m14(unreadCount) => "Sin Leer (${unreadCount})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aNewVersionOfBiteIsReady": MessageLookupByLibrary.simpleMessage(
      "¡Una nueva versión de Bite está lista!",
    ),
    "addACardBelowToGetStarted": MessageLookupByLibrary.simpleMessage(
      "Agregue una tarjeta a continuación para comenzar",
    ),
    "addAddress": MessageLookupByLibrary.simpleMessage("Agregar Dirección"),
    "addCard": MessageLookupByLibrary.simpleMessage("Agregar Tarjeta"),
    "addNewCard": MessageLookupByLibrary.simpleMessage("Agregar Nueva Tarjeta"),
    "addToCart": MessageLookupByLibrary.simpleMessage("Agregar al carrito"),
    "addedStatesearchToRecentSearches": m0,
    "adding": MessageLookupByLibrary.simpleMessage("Agregando..."),
    "address": MessageLookupByLibrary.simpleMessage("Dirección"),
    "addressAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "¡Dirección agregada exitosamente!",
    ),
    "addressUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Dirección actualizada exitosamente",
    ),
    "allCategories": MessageLookupByLibrary.simpleMessage(
      "Todas las Categorías",
    ),
    "allNotifications": m1,
    "allRestaurants": MessageLookupByLibrary.simpleMessage(
      "Todos los Restaurantes",
    ),
    "allYourFavorites": MessageLookupByLibrary.simpleMessage(
      "Todos tus favoritos",
    ),
    "apply": MessageLookupByLibrary.simpleMessage("Aplicar"),
    "apply2": MessageLookupByLibrary.simpleMessage("APLICAR"),
    "areYouSureYouWantToCancelThisOrder": MessageLookupByLibrary.simpleMessage(
      "¿Está seguro de que desea cancelar este pedido?",
    ),
    "areYouSureYouWantToDeleteAllOrderHistory":
        MessageLookupByLibrary.simpleMessage(
          "¿Está seguro de que desea eliminar todo el historial de pedidos? Esta acción no se puede deshacer.",
        ),
    "areYouSureYouWantToRemoveThisFoodItem": MessageLookupByLibrary.simpleMessage(
      "¿Está seguro de que desea quitar este artículo de comida de sus favoritos?",
    ),
    "areYouSureYouWantToRemoveThisRestaurantFrom":
        MessageLookupByLibrary.simpleMessage(
          "¿Está seguro de que desea quitar este restaurante de sus favoritos?",
        ),
    "backToHome": MessageLookupByLibrary.simpleMessage("Volver al Inicio"),
    "call": MessageLookupByLibrary.simpleMessage("Llamar"),
    "callingphonenumber": m2,
    "canICancelMyOrder": MessageLookupByLibrary.simpleMessage(
      "¿Puedo cancelar mi pedido?",
    ),
    "canIScheduleADeliveryForALaterTime": MessageLookupByLibrary.simpleMessage(
      "¿Puedo programar una entrega para más tarde?",
    ),
    "canIUseMultiplePaymentMethodsForOneOrder":
        MessageLookupByLibrary.simpleMessage(
          "¿Puedo usar múltiples métodos de pago para un pedido?",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cancelOrder": MessageLookupByLibrary.simpleMessage("Cancelar Pedido"),
    "cardEndingInCreditcardlast4Selected": m3,
    "cardHolder": MessageLookupByLibrary.simpleMessage("Titular de la Tarjeta"),
    "cardInformation": MessageLookupByLibrary.simpleMessage(
      "Información de la Tarjeta",
    ),
    "cardNumberIsRequired": MessageLookupByLibrary.simpleMessage(
      "Se requiere número de tarjeta",
    ),
    "cardNumberIsTooShort": MessageLookupByLibrary.simpleMessage(
      "El número de tarjeta es muy corto",
    ),
    "cart": MessageLookupByLibrary.simpleMessage("Carrito"),
    "cashOnDelivery": MessageLookupByLibrary.simpleMessage(
      "Pago Contra Entrega",
    ),
    "cashOnDeliverySelected": MessageLookupByLibrary.simpleMessage(
      "Pago Contra Entrega seleccionado",
    ),
    "change": MessageLookupByLibrary.simpleMessage("Cambiar"),
    "chat": MessageLookupByLibrary.simpleMessage("Chat"),
    "checkYourEmailForAPasswordResetLink": MessageLookupByLibrary.simpleMessage(
      "Revise su correo electrónico para obtener un enlace de restablecimiento de contraseña. Haga clic en el enlace para restablecer su contraseña en nuestro sitio web.",
    ),
    "checkout": MessageLookupByLibrary.simpleMessage("Pagar"),
    "checkout2": MessageLookupByLibrary.simpleMessage("PAGAR"),
    "chooseYourFlavor": MessageLookupByLibrary.simpleMessage("Elija su sabor"),
    "chooseYourSize": MessageLookupByLibrary.simpleMessage("Elija su tamaño"),
    "city": MessageLookupByLibrary.simpleMessage("Ciudad"),
    "clear2": MessageLookupByLibrary.simpleMessage("LIMPIAR"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Borrar todo"),
    "clearAllNotifications": MessageLookupByLibrary.simpleMessage(
      "Borrar Todas las Notificaciones",
    ),
    "clearOrderHistory": MessageLookupByLibrary.simpleMessage(
      "Borrar Historial de Pedidos",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "Confirmar Contraseña",
    ),
    "confirmPayment": m4,
    "country": MessageLookupByLibrary.simpleMessage("País"),
    "courier": MessageLookupByLibrary.simpleMessage("Mensajero"),
    "creditCardAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Tarjeta de crédito agregada exitosamente",
    ),
    "creditCardDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Tarjeta de crédito eliminada exitosamente",
    ),
    "cvc": MessageLookupByLibrary.simpleMessage("CVC"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Modo Oscuro"),
    "deleteAllNotificationsConfirmation": MessageLookupByLibrary.simpleMessage(
      "¿Está seguro de que desea eliminar todas las notificaciones? Esta acción no se puede deshacer.",
    ),
    "delivery": MessageLookupByLibrary.simpleMessage("Entrega"),
    "deliveryAddress": MessageLookupByLibrary.simpleMessage(
      "Dirección de Entrega",
    ),
    "deliveryAddress2": MessageLookupByLibrary.simpleMessage(
      "DIRECCIÓN DE ENTREGA",
    ),
    "deliveryFee": MessageLookupByLibrary.simpleMessage("Tarifa de Entrega"),
    "deliveryTime2": MessageLookupByLibrary.simpleMessage("TIEMPO DE ENTREGA"),
    "doYouChargeADeliveryFee": MessageLookupByLibrary.simpleMessage(
      "¿Cobran tarifa de entrega?",
    ),
    "doYouDeliverToMyLocation": MessageLookupByLibrary.simpleMessage(
      "¿Entregan en mi ubicación?",
    ),
    "done": MessageLookupByLibrary.simpleMessage("Hecho"),
    "dontHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "¿No tiene una cuenta? ",
    ),
    "edit2": MessageLookupByLibrary.simpleMessage("EDITAR"),
    "editTitle": m5,
    "email": MessageLookupByLibrary.simpleMessage("Correo Electrónico"),
    "errorStatemessage": m6,
    "estimatedDeliveryTime2": MessageLookupByLibrary.simpleMessage(
      "TIEMPO DE ENTREGA ESTIMADO",
    ),
    "failedToAddAddressError": m7,
    "failedToLoadAddresses": MessageLookupByLibrary.simpleMessage(
      "Error al cargar direcciones",
    ),
    "failedToLoadCards": MessageLookupByLibrary.simpleMessage(
      "Error al cargar tarjetas",
    ),
    "failedToLoadFoodItemsPleaseTryAgainLater":
        MessageLookupByLibrary.simpleMessage(
          "Error al cargar artículos de comida. Por favor intente más tarde.",
        ),
    "failedToUpdateAddress": m8,
    "faqs": MessageLookupByLibrary.simpleMessage("Preguntas Frecuentes"),
    "favorites": MessageLookupByLibrary.simpleMessage("Favoritos"),
    "filterYourSearch": MessageLookupByLibrary.simpleMessage(
      "Filtre su búsqueda",
    ),
    "foods": MessageLookupByLibrary.simpleMessage("Comidas"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "Olvidé mi Contraseña",
    ),
    "freeDeliveryOffers": MessageLookupByLibrary.simpleMessage(
      "Ofertas de Entrega Gratuita",
    ),
    "fullName": MessageLookupByLibrary.simpleMessage("Nombre Completo"),
    "fullNameOnCard": MessageLookupByLibrary.simpleMessage(
      "Nombre completo en la tarjeta",
    ),
    "getAllYourLovedFoodsInOnePlace": MessageLookupByLibrary.simpleMessage(
      "Obtenga todas sus comidas favoritas en un solo lugar. Solo realice el pedido y nosotros hacemos el resto",
    ),
    "getStarted": MessageLookupByLibrary.simpleMessage("Comenzar"),
    "googleSigninErrorStatemessage": m9,
    "guestUser": MessageLookupByLibrary.simpleMessage("Usuario Invitado"),
    "history": MessageLookupByLibrary.simpleMessage("Historial"),
    "home": MessageLookupByLibrary.simpleMessage("Hogar"),
    "howDoITrackMyOrder": MessageLookupByLibrary.simpleMessage(
      "¿Cómo hago seguimiento a mi pedido?",
    ),
    "invalidCvc": MessageLookupByLibrary.simpleMessage("CVC inválido"),
    "invalidMonth": MessageLookupByLibrary.simpleMessage("Mes inválido"),
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
    "logIn": MessageLookupByLibrary.simpleMessage("Iniciar Sesión"),
    "login": MessageLookupByLibrary.simpleMessage("Iniciar Sesión"),
    "logout": MessageLookupByLibrary.simpleMessage("Cerrar Sesión"),
    "markAllAsRead": MessageLookupByLibrary.simpleMessage(
      "Marcar todo como leído",
    ),
    "mastercard": MessageLookupByLibrary.simpleMessage("Tarjeta de Crédito"),
    "maybeLater": MessageLookupByLibrary.simpleMessage("Quizás Más Tarde"),
    "myReviews": MessageLookupByLibrary.simpleMessage("Mis Reseñas"),
    "next": MessageLookupByLibrary.simpleMessage("Siguiente"),
    "noActiveOrder": MessageLookupByLibrary.simpleMessage("Sin pedido activo"),
    "noAddressSelected": MessageLookupByLibrary.simpleMessage(
      "Sin dirección seleccionada",
    ),
    "noAddressesFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron direcciones",
    ),
    "noCardDetails": MessageLookupByLibrary.simpleMessage(
      "Sin detalles de tarjeta",
    ),
    "noCompletedOrdersYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay pedidos completados",
    ),
    "noFavouriteFoodsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron comidas favoritas.",
    ),
    "noFavouriteRestaurantsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron restaurantes favoritos.",
    ),
    "noFoodItemsAvailableForThisCategory": MessageLookupByLibrary.simpleMessage(
      "No hay artículos de comida disponibles para esta categoría.",
    ),
    "noNotificationsYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay notificaciones",
    ),
    "noOngoingOrders": MessageLookupByLibrary.simpleMessage(
      "Sin pedidos en curso",
    ),
    "noOrderHistory": MessageLookupByLibrary.simpleMessage(
      "Sin historial de pedidos",
    ),
    "noPopularRestaurantsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron restaurantes populares",
    ),
    "noRecentSearches": MessageLookupByLibrary.simpleMessage(
      "Sin búsquedas recientes",
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
    "ongoing": MessageLookupByLibrary.simpleMessage("En Curso"),
    "openRestaurants": MessageLookupByLibrary.simpleMessage(
      "Restaurantes Abiertos",
    ),
    "or": MessageLookupByLibrary.simpleMessage("O"),
    "order": MessageLookupByLibrary.simpleMessage("Pedido"),
    "orderAgain": MessageLookupByLibrary.simpleMessage("Pedir de Nuevo"),
    "orderArrivingSoon": MessageLookupByLibrary.simpleMessage(
      "¡El pedido llegará pronto!",
    ),
    "orderCancelledSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Pedido cancelado exitosamente",
    ),
    "orderFromChoosenChef": MessageLookupByLibrary.simpleMessage(
      "Pedi del chef elegido",
    ),
    "orderHistory": MessageLookupByLibrary.simpleMessage(
      "Historial de Pedidos",
    ),
    "orderItems": MessageLookupByLibrary.simpleMessage("Artículos del Pedido"),
    "orderPlaced": MessageLookupByLibrary.simpleMessage("¡Pedido Realizado!"),
    "orderSummary": MessageLookupByLibrary.simpleMessage("Resumen del Pedido"),
    "other": MessageLookupByLibrary.simpleMessage("Otro"),
    "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
    "passwordMustBeAtLeast8CharactersLong":
        MessageLookupByLibrary.simpleMessage(
          "La contraseña debe tener al menos 8 caracteres",
        ),
    "passwordResetLinkSent": MessageLookupByLibrary.simpleMessage(
      "Enlace de Restablecimiento de Contraseña Enviado",
    ),
    "passwordResetSuccessfully": MessageLookupByLibrary.simpleMessage(
      "¡Contraseña restablecida exitosamente! Por favor inicie sesión con su nueva contraseña.",
    ),
    "payWhenYourOrderArrives": MessageLookupByLibrary.simpleMessage(
      "Pague cuando llegue su pedido",
    ),
    "paymentFailedPaymentstateerrormessage": m10,
    "paymentMethod": MessageLookupByLibrary.simpleMessage("Método de Pago"),
    "payments": MessageLookupByLibrary.simpleMessage("Pagos"),
    "paysWhenOrderArrives": MessageLookupByLibrary.simpleMessage(
      "Paga a la Llegada del Pedido",
    ),
    "performanceImprovementsAndBugFixes": MessageLookupByLibrary.simpleMessage(
      "mejoras de rendimiento y correcciones de errores.",
    ),
    "personalInfo": MessageLookupByLibrary.simpleMessage(
      "Información Personal",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Teléfono"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Número de Teléfono"),
    "platformFee": MessageLookupByLibrary.simpleMessage("Tarifa de Plataforma"),
    "pleaseEnterAValidAddress": MessageLookupByLibrary.simpleMessage(
      "Por favor ingrese una dirección válida",
    ),
    "pleaseEnterAValidEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Por favor ingrese una dirección de correo válida",
    ),
    "pleaseEnterAValidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Por favor ingrese un número de teléfono válido",
    ),
    "pleaseEnterWidgettitletolowercase": m11,
    "pleaseEnterYourEmailAddressToReceiveAPasswordReset":
        MessageLookupByLibrary.simpleMessage(
          "Por favor ingrese su dirección de correo electrónico para recibir un enlace de restablecimiento de contraseña.",
        ),
    "pleaseFillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
      "Por favor complete todos los campos requeridos",
    ),
    "pleaseLoginToViewYourProfile": MessageLookupByLibrary.simpleMessage(
      "Por favor inicie sesión para ver su perfil",
    ),
    "pleaseSignInToContinue": MessageLookupByLibrary.simpleMessage(
      "Por Favor Inicie Sesión para Continuar",
    ),
    "pleaseSignInToViewAddresses": MessageLookupByLibrary.simpleMessage(
      "Por favor inicie sesión para ver direcciones",
    ),
    "pleaseSignUpToGetStarted": MessageLookupByLibrary.simpleMessage(
      "Por favor Regístrese para comenzar",
    ),
    "popularRestaurants": MessageLookupByLibrary.simpleMessage(
      "Restaurantes Populares",
    ),
    "preferences2": MessageLookupByLibrary.simpleMessage("PREFERENCIAS"),
    "profile": MessageLookupByLibrary.simpleMessage("Perfil"),
    "rate": MessageLookupByLibrary.simpleMessage("Calificar"),
    "rating2": MessageLookupByLibrary.simpleMessage("CALIFICACIÓN"),
    "recentKeywords": MessageLookupByLibrary.simpleMessage(
      "Palabras Clave Recientes",
    ),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Recuérdame"),
    "remove": MessageLookupByLibrary.simpleMessage("Quitar"),
    "removeFromCart": MessageLookupByLibrary.simpleMessage(
      "Quitar del carrito",
    ),
    "removeFromFavourites": MessageLookupByLibrary.simpleMessage(
      "Quitar de favoritos",
    ),
    "removedStatesearchFromRecentSearches": m12,
    "reorder": MessageLookupByLibrary.simpleMessage("Pedir de Nuevo"),
    "required": MessageLookupByLibrary.simpleMessage("Requerido"),
    "restaurants": MessageLookupByLibrary.simpleMessage("Restaurantes"),
    "reviews": MessageLookupByLibrary.simpleMessage("Reseñas"),
    "save": MessageLookupByLibrary.simpleMessage("Guardar"),
    "savedCards": MessageLookupByLibrary.simpleMessage("Tarjetas Guardadas"),
    "search": MessageLookupByLibrary.simpleMessage("Buscar"),
    "searchForRestaurantsOrDishes": MessageLookupByLibrary.simpleMessage(
      "Busque restaurantes o platos",
    ),
    "seeAll": MessageLookupByLibrary.simpleMessage("Ver Todo"),
    "selectAnAddress": MessageLookupByLibrary.simpleMessage(
      "Seleccione una dirección",
    ),
    "selectDeliveryAddress": MessageLookupByLibrary.simpleMessage(
      "Seleccione Dirección de Entrega",
    ),
    "selectFromYourSavedMastercards": MessageLookupByLibrary.simpleMessage(
      "Seleccione de sus Tarjetas de Crédito guardadas",
    ),
    "selectFromYourSavedVisaCards": MessageLookupByLibrary.simpleMessage(
      "Seleccione de sus tarjetas Visa guardadas",
    ),
    "selectPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Seleccione Método de Pago",
    ),
    "sendResetLink": MessageLookupByLibrary.simpleMessage(
      "Enviar Enlace de Restablecimiento",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Configuración"),
    "signUp": MessageLookupByLibrary.simpleMessage("Registrarse"),
    "signup": MessageLookupByLibrary.simpleMessage("Registrarse"),
    "skip": MessageLookupByLibrary.simpleMessage("Saltar"),
    "stateunreadcountUnreadNotifications": m13,
    "streetNo": MessageLookupByLibrary.simpleMessage("Número de Calle"),
    "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
    "successfullySignedInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "¡Sesión iniciada exitosamente con Google!",
    ),
    "theRestaurantIsPreparingYourFood": MessageLookupByLibrary.simpleMessage(
      "El restaurante está preparando su comida",
    ),
    "themes": MessageLookupByLibrary.simpleMessage("Temas"),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "total2": MessageLookupByLibrary.simpleMessage("TOTAL: "),
    "trackOrder": MessageLookupByLibrary.simpleMessage("Rastrear Pedido"),
    "unreadNotifications": m14,
    "updateAvailable": MessageLookupByLibrary.simpleMessage(
      "Actualización Disponible",
    ),
    "updateDialog": MessageLookupByLibrary.simpleMessage(
      "Diálogo de Actualización",
    ),
    "updateNow": MessageLookupByLibrary.simpleMessage("Actualizar Ahora"),
    "userNotAuthenticated": MessageLookupByLibrary.simpleMessage(
      "Usuario no autenticado",
    ),
    "versionInfoNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Información de versión no disponible",
    ),
    "versionLatestversionIncludesNewFeatures":
        MessageLookupByLibrary.simpleMessage(
          "La versión latestVersion incluye nuevas características, ",
        ),
    "visa": MessageLookupByLibrary.simpleMessage("Visa"),
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
    "work": MessageLookupByLibrary.simpleMessage("Trabajo"),
    "yesCancel": MessageLookupByLibrary.simpleMessage("Sí, Cancelar"),
    "yourCardDetailsAreSecurelyHandledByStripeWeNever":
        MessageLookupByLibrary.simpleMessage(
          "Sus detalles de tarjeta son manejados de forma segura por Stripe. Nunca almacenamos el número completo de su tarjeta.",
        ),
    "yourCartIsEmpty": MessageLookupByLibrary.simpleMessage(
      "Su carrito está vacío",
    ),
    "yourOrderHasBeenDelivered": MessageLookupByLibrary.simpleMessage(
      "¡Su pedido ha sido entregado!",
    ),
    "yourOrderHasBeenPickedUpForDelivery": MessageLookupByLibrary.simpleMessage(
      "Su pedido ha sido recogido para entrega",
    ),
    "yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime":
        MessageLookupByLibrary.simpleMessage(
          "Su pedido ha sido realizado exitosamente.\\nRastreelo en tiempo real.",
        ),
    "yourOrderHasBeenReceived": MessageLookupByLibrary.simpleMessage(
      "Su pedido ha sido recibido",
    ),
    "zipCode": MessageLookupByLibrary.simpleMessage("Código Postal"),
  };
}
