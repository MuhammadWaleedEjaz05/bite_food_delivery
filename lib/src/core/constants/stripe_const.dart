const stripePublishableKey =
    'pk_test_51JnOylKB1mUKF8fdOp5xylpfglHJpvbVDqdQRqjWSzITmCiHB9NUdYweoxidCb8vtJ7EgF0ZuaHHjY8w9XVM2biD00mWkYpS78';

const stripeSecretKey =
    'sk_test_51JnOylKB1mUKF8fdiNIyNJN0fx6esUxFQYMqz0020x0llx4rAvQiAd7pIDaPVDBurGflK7vzYYIrLDTLuhqKzcTC00MyJPSeDj';

const stripeCreatePaymentMethodUrl =
    'https://api.stripe.com/v1/payment_methods';

const stripeCreateCustomerUrl = 'https://api.stripe.com/v1/customers';

String stripeAttachPaymentMethodUrl(String paymentMethodId) =>
    'https://api.stripe.com/v1/payment_methods/$paymentMethodId/attach';

const stripePaymentIntentsUrl = 'https://api.stripe.com/v1/payment_intents';

const stripeEphemeralKeysUrl = 'https://api.stripe.com/v1/ephemeral_keys';
