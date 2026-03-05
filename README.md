# 🍔 Bite — Food Delivery App

A full-featured, production-ready **food delivery mobile application** built with **Flutter** and **Firebase**. Bite provides a seamless food ordering experience with real-time order tracking, secure payments via Stripe, push notifications, and a polished UI with dark mode support.

> **Built with:** Flutter 3.10+ · Firebase · BLoC/Cubit · Stripe · Google Maps

---

## 📋 Table of Contents

- [Features](#-features)
- [Screenshots](#-screenshots)
- [Architecture](#-architecture)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Firebase Collections](#-firebase-collections)
- [Getting Started](#-getting-started)
- [Configuration](#-configuration)
- [Dependencies](#-dependencies)
- [Contributing](#-contributing)
- [License](#-license)

---

## ✨ Features

### Authentication & User Management
- Email/Password sign-in and registration
- Google Sign-In integration
- Password reset via email
- Profile management (name, email, phone, photo)
- Onboarding flow for first-time users

### Restaurant & Food Browsing
- Browse restaurants by location and category
- Real-time restaurant search with recent search history
- Restaurant details with ratings, delivery time, and delivery fee
- Menu browsing with category-based filtering
- Food item details with size and flavor selection
- Mark restaurants and food items as favorites

### Shopping Cart & Checkout
- Add/remove items with quantity control
- Size and flavor customization per item
- Real-time price calculation
- Cart persistence via Firestore
- Delivery address selection with Google Maps integration
- Order summary review before placing

### Payment System
- **Stripe** payment integration with secure processing
- Multiple payment methods: Visa, Mastercard, PayPal, Cash on Delivery
- Save and manage credit cards
- Automatic card type detection

### Order Tracking
- Real-time order status updates: `Received → Preparing → Dispatched → Delivered`
- Active order tracking with floating action button on home screen
- Visual order timeline with courier details
- Order history with Ongoing/History tabs
- Reorder from previous orders
- Cancel orders (before dispatch)

### Notifications
- Push notifications via Firebase Cloud Messaging (FCM)
- Local notifications for order status changes
- Notification history with read/unread states
- Toggle notifications on/off from settings

### Settings & Preferences
- 🌙 Dark mode / Light mode toggle
- Language selection support (i18n ready)
- App update checking via Firebase Remote Config
- FAQ section (Orders, Payments, Delivery)

---

## 📱 Screenshots

<!-- Add your screenshots here -->
<!-- 
| Home | Restaurant | Cart | Track Order |
|:----:|:----------:|:----:|:-----------:|
| ![Home](screenshots/home.png) | ![Restaurant](screenshots/restaurant.png) | ![Cart](screenshots/cart.png) | ![Track](screenshots/track.png) |
-->

> 📸 *Screenshots coming soon — run the app to see the full UI!*

---

## 🏗 Architecture

The app follows a **clean, feature-based architecture** using the **BLoC/Cubit pattern** for state management:

```
┌──────────────────────────────────────────────┐
│                    UI Layer                   │
│          (Screens + Global Widgets)           │
├──────────────────────────────────────────────┤
│              State Management                 │
│           (Cubits / BLoC Pattern)             │
├──────────────────────────────────────────────┤
│                 Data Layer                    │
│    (Models + Firebase/Stripe Services)        │
└──────────────────────────────────────────────┘
```

### State Management — 17 Cubits

| Category | Cubits |
|----------|--------|
| **Auth** | `UserAuthCubit` |
| **Shopping** | `CartCubit`, `RestaurantsCubit`, `CategoriesCubit`, `CategorySelectionCubit`, `FoodItemCubit`, `FilterRestaurantsCubit` |
| **User Data** | `AddressCubit`, `FavouriteCubit`, `CreditCardCubit` |
| **Orders** | `OrderCubit`, `NotificationsCubit` |
| **Payments** | `PaymentCubit`, `PaymentMethodSelectorCubit`, `CreditCardTypeSelectorCubit` |
| **UI/System** | `BottomNavigationSelectorCubit`, `RecentSearchesCubit`, `SettingsCubit`, `FirstTimeLaunchCubit`, `UpdateCheckCubit` |

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|-----------|
| **Framework** | Flutter 3.10+ (Dart) |
| **State Management** | flutter_bloc / Cubit |
| **Backend & Auth** | Firebase Auth, Cloud Firestore |
| **Push Notifications** | Firebase Cloud Messaging + flutter_local_notifications |
| **Remote Config** | Firebase Remote Config |
| **Payments** | Stripe (flutter_stripe + Dio for API calls) |
| **Maps & Location** | Google Maps Flutter + Geocoding + Location |
| **Responsive UI** | flutter_screenutil (375×812 design) |
| **Typography** | Google Fonts (Sen) |
| **Image Handling** | cached_network_image, flutter_svg |
| **Local Storage** | SharedPreferences |
| **Form Validation** | form_builder_validators |
| **Theming** | Material Design 3 with Light & Dark themes |
| **Localization** | Flutter intl (l10n) |

---

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point & initialization
├── firebase_options.dart        # Firebase platform configurations
│
├── configs/
│   ├── bloc_provider_list.dart  # All Cubit/BLoC providers
│   ├── page_routes.dart         # Named route definitions (21 routes)
│   ├── screen_list.dart         # Bottom navigation screens
│   ├── stripe_const.dart        # Stripe API configuration
│   ├── firebase_auth_conn.dart  # Firebase Auth instance
│   ├── firebase_db_conn.dart    # Firestore instance
│   └── fcm_initialize.dart      # FCM & local notifications setup
│
├── Models/
│   ├── user_model.dart          # User data model
│   ├── restaurant_model.dart    # Restaurant data model
│   ├── food_item_model.dart     # Food item with sizes/flavors
│   ├── category_model.dart      # Food category model
│   ├── cart_model.dart          # Cart & CartItem models
│   ├── order_model.dart         # Order with status tracking
│   ├── address_model.dart       # Delivery address model
│   ├── credit_card_model.dart   # Payment card model
│   └── notification_model.dart  # Notification model
│
├── Cubits/                      # 17+ Cubits for state management
│   ├── UserAuthCubit/
│   ├── CartCubit/
│   ├── OrderCubit/
│   ├── RestaurantsCubit/
│   ├── PaymentCubit/
│   └── ...
│
├── Screens/                     # 21 screens in 18 feature directories
│   ├── HomePage/
│   ├── RestaurantPage/
│   ├── CartPage/
│   ├── CheckOutPage/
│   ├── TrackOrderPage/
│   ├── PaymentPage/
│   ├── OrderHistoryPage/
│   ├── SearchPage/
│   ├── LoginPage/
│   ├── SignupPage/
│   ├── ProfilePage/
│   ├── AddressPage/
│   ├── FavouritePage/
│   ├── NotificationPage/
│   ├── SettingPage/
│   ├── OnboardingPage/
│   ├── FAQPage/
│   └── SplashPage/
│
├── GlobalWidgets/               # 14 reusable widgets
│   ├── bite_app_bar.dart
│   ├── bite_bottom_navigation_bar.dart
│   ├── bite_search_bar.dart
│   ├── bite_restaurant_card.dart
│   ├── bite_category_card.dart
│   └── ...
│
├── Themes/
│   ├── bite_light_themes.dart   # Light theme variants
│   ├── bite_dark_themes.dart    # Dark theme variants
│   └── bite_text_styles.dart    # Typography system (Sen font)
│
└── l10n/                        # Localization files
    └── app_en.arb               # English translations
```

---

## 🗄 Firebase Collections

| Collection | Description | Key Fields |
|-----------|-------------|------------|
| **UsersDB** | User profiles | id, fullName, email, phoneNumber, photoUrl, token |
| **RestaurantsDB** | Restaurant listings | id, name, rating, deliveryFee, deliveryTime, isOpen, category |
| **CategoriesDB** | Food categories | id, name, image |
| **FoodItemsDB** | Menu items | id, name, price, sizes[], flavors{}, isPopular, isAvailable |
| **CartDB** | User cart (per user) | cartID, userID → *subcollection: Products* |
| **OrdersDB** | Order records | orderId, userId, orderStatus, totalPrice, paymentMethod |
| **NotificationsDB** | Push notification log | id, userId, title, body, type, isRead |

**Subcollections:** Users → `addresses` | Cart → `Products` | Orders → `Items`

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.10.7 or higher
- Dart SDK ^3.10.7
- Firebase project configured
- Stripe account (test mode)
- Google Maps API key
- Android Studio / VS Code

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/bite-food-delivery.git
   cd bite-food-delivery
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Authentication (Email/Password, Google Sign-In)
   - Enable Cloud Firestore
   - Enable Cloud Messaging
   - Enable Remote Config
   - Download and replace `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Update `lib/firebase_options.dart` with your Firebase config

4. **Configure Stripe**
   - Get your Stripe test keys from [Stripe Dashboard](https://dashboard.stripe.com/)
   - Update `lib/configs/stripe_const.dart` with your publishable and secret keys

5. **Configure Google Maps**
   - Get an API key from [Google Cloud Console](https://console.cloud.google.com/)
   - Add the key to `android/app/src/main/AndroidManifest.xml`
   - Add the key to `ios/Runner/AppDelegate.swift`

6. **Run the app**
   ```bash
   flutter run
   ```

---

## ⚙ Configuration

| Config File | Purpose |
|------------|---------|
| `lib/configs/stripe_const.dart` | Stripe API keys and endpoints |
| `lib/firebase_options.dart` | Firebase platform configurations |
| `lib/configs/fcm_initialize.dart` | FCM and local notification setup |
| `flutter_launcher_icons.yaml` | App icon configuration |
| `firebase.json` | Firebase hosting/deployment config |

---

## 📦 Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_bloc` | State management (BLoC/Cubit) |
| `firebase_core` / `firebase_auth` / `cloud_firestore` | Firebase services |
| `firebase_messaging` / `flutter_local_notifications` | Push notifications |
| `firebase_remote_config` | Remote app configuration |
| `flutter_stripe` / `dio` | Stripe payment processing |
| `google_maps_flutter` / `location` / `geocoding` | Maps and location |
| `flutter_screenutil` | Responsive design |
| `google_fonts` | Custom typography (Sen) |
| `cached_network_image` / `flutter_svg` | Image handling |
| `shared_preferences` | Local data persistence |
| `carousel_slider` | Onboarding carousel |
| `stylish_bottom_bar` | Custom bottom navigation |
| `equatable` | Value equality for states |
| `form_builder_validators` | Form validation |
| `credit_card_type_detector` | Auto-detect card type |
| `package_info_plus` | App version info |
| `url_launcher` | External link handling |
| `uuid` | Unique ID generation |

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

<p align="center">
  Made with ❤️ using Flutter & Firebase
</p>
