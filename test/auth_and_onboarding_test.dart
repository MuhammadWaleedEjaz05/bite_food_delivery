import 'dart:io';
import 'dart:ui' as ui;
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/features/authentication/bloc/forgot_password_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/login_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/remember_me_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/signup_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/authentication/models/user_model.dart';
import 'package:bite_food_delivery/features/authentication/pages/forgot_password_screen.dart';
import 'package:bite_food_delivery/features/authentication/pages/login_screen.dart';
import 'package:bite_food_delivery/features/authentication/pages/signup_screen.dart';
import 'package:bite_food_delivery/features/authentication/widgets/auth_social_button.dart';
import 'package:bite_food_delivery/features/authentication/widgets/auth_text_field.dart';
import 'package:bite_food_delivery/features/onboarding/bloc/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/features/onboarding/pages/onboarding_screen.dart';
import 'package:bite_food_delivery/features/onboarding/pages/splash_screen.dart';
import 'package:bite_food_delivery/features/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:bite_food_delivery/features/onboarding/widgets/onboarding_slide.dart';
import 'package:bite_food_delivery/features/onboarding/widgets/splash_logo.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bite_food_delivery/core/utils/shared_preference_functions.dart';

class TestUserAuthCubit extends UserAuthCubit {
  TestUserAuthCubit() : super(autoCheck: false);

  String? lastLoginEmail;
  String? lastLoginPassword;
  UserModel? lastRegisteredUser;
  String? lastResetEmail;

  @override
  Future<void> login(String email, String password) async {
    lastLoginEmail = email;
    lastLoginPassword = password;
    emit(UserLoggedIn(UserModel(fullName: 'Test User', email: email)));
  }

  @override
  Future<void> register(UserModel user) async {
    lastRegisteredUser = user;
    emit(const UserCreated());
  }

  @override
  Future<void> resetPassword(String email) async {
    lastResetEmail = email;
    emit(const UserAuthInitial());
  }
}

late SharedPreferences testPrefs;

Widget buildAuthHarness({
  required Widget child,
  ThemeData? theme,
  Locale locale = const Locale('en'),
  TextScaler textScaler = const TextScaler.linear(1.0),
  Size size = const Size(390, 844),
  UserAuthCubit? authCubit,
  RememberMeCubit? rememberMeCubit,
  FirstTimeLaunchCubit? firstTimeCubit,
}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, _) => MultiBlocProvider(
      providers: [
        BlocProvider<UserAuthCubit>.value(
          value: authCubit ?? TestUserAuthCubit(),
        ),
        BlocProvider<RememberMeCubit>.value(
          value: rememberMeCubit ?? RememberMeCubit(testPrefs),
        ),
        BlocProvider<FirstTimeLaunchCubit>.value(
          value: firstTimeCubit ?? FirstTimeLaunchCubit(),
        ),
      ],
      child: MediaQuery(
        data: MediaQueryData(
          size: size,
          textScaler: textScaler,
          padding: const EdgeInsets.only(top: 44, bottom: 34),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme ?? AppTheme.lightTheme(),
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: child,
        ),
      ),
    ),
  );
}

Future<void> capturePng(WidgetTester tester, String path) async {
  final boundary =
      tester.renderObject(find.byType(RepaintBoundary).first)
          as RenderRepaintBoundary;
  await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 2.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();
    final file = File(path);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(bytes);
    image.dispose();
  });
}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'isFirstTimeLaunched': true,
      'isRememberMe': false,
    });
    testPrefs = await SharedPreferences.getInstance();
    await initSharedPreferences();
  });

  group('Onboarding & Splash Screens', () {
    testWidgets(
      'OnboardingScreen renders slides, indicator, and advances on next',
      (tester) async {
        await tester.pumpWidget(
          buildAuthHarness(child: const OnboardingScreen()),
        );
        await tester.pumpAndSettle();

        expect(find.byType(OnboardingScreen), findsOneWidget);
        expect(find.byType(OnboardingSlide), findsWidgets);
        expect(find.byType(OnboardingPageIndicator), findsOneWidget);
        expect(find.byType(AppPrimaryButton), findsOneWidget);

        final nextBtn = find.widgetWithText(AppPrimaryButton, 'Next');
        expect(nextBtn, findsOneWidget);

        await tester.tap(nextBtn);
        await tester.pumpAndSettle();
      },
    );

    testWidgets('SplashScreen renders animated logo and background', (
      tester,
    ) async {
      await tester.pumpWidget(buildAuthHarness(child: const SplashScreen()));
      await tester.pump();

      expect(find.byType(SplashScreen), findsOneWidget);
      expect(find.byType(SplashLogo), findsOneWidget);
    });

    testWidgets('capture onboarding light and dark previews', (tester) async {
      await tester.pumpWidget(
        buildAuthHarness(
          theme: AppTheme.lightTheme(),
          child: const RepaintBoundary(child: OnboardingScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/onboarding-light.png');

      await tester.pumpWidget(
        buildAuthHarness(
          theme: AppTheme.darkTheme(),
          child: const RepaintBoundary(child: OnboardingScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/onboarding-dark.png');
    });
  });

  group('Authentication Form Cubits Validation', () {
    test(
      'LoginFormCubit validates empty, invalid email, and short password',
      () {
        final cubit = LoginFormCubit();

        expect(cubit.validate(), isFalse);
        expect(cubit.state.emailError, isNotNull);
        expect(cubit.state.passwordError, isNotNull);

        cubit.setEmail('invalid-email');
        cubit.setPassword('123');
        expect(cubit.validate(), isFalse);

        cubit.setEmail('user@bite.com');
        cubit.setPassword('securepassword123');
        expect(cubit.validate(), isTrue);
        expect(cubit.state.emailError, isNull);
        expect(cubit.state.passwordError, isNull);
      },
    );

    test(
      'SignupFormCubit validates matching passwords and complete fields',
      () {
        final cubit = SignupFormCubit();

        expect(cubit.validate(), isFalse);

        cubit.setFullName('Alex Mercer');
        cubit.setEmail('alex@bite.com');
        cubit.setPhoneNumber('+1234567890');
        cubit.setPassword('password123');
        cubit.setConfirmPassword('passwordmismatch');
        expect(cubit.validate(), isFalse);
        expect(cubit.state.confirmPasswordError, 'Passwords do not match');

        cubit.setConfirmPassword('password123');
        expect(cubit.validate(), isTrue);
      },
    );

    test('ForgotPasswordFormCubit validates email address', () {
      final cubit = ForgotPasswordFormCubit();

      expect(cubit.validate(), isFalse);
      expect(cubit.state.emailError, isNotNull);

      cubit.setEmail('reset@bite.com');
      expect(cubit.validate(), isTrue);
      expect(cubit.state.emailError, isNull);
    });
  });

  group('Authentication Screens Rendering', () {
    testWidgets('LoginScreen renders fields, remember me, and social login', (
      tester,
    ) async {
      await tester.pumpWidget(buildAuthHarness(child: const LoginScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.byType(AuthTextField), findsNWidgets(2));
      expect(find.text('Log In'), findsWidgets);
      expect(find.text('Remember email'), findsOneWidget);
      expect(find.text('Forgot Password'), findsOneWidget);

      await tester.drag(find.byType(CustomScrollView), const Offset(0, -250));
      await tester.pumpAndSettle();
      expect(find.byType(AuthSocialButton), findsOneWidget);
    });

    testWidgets('SignupScreen renders fields and registers new user', (
      tester,
    ) async {
      final authCubit = TestUserAuthCubit();

      await tester.pumpWidget(
        buildAuthHarness(authCubit: authCubit, child: const SignupScreen()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SignupScreen), findsOneWidget);
      expect(find.byType(AuthTextField), findsNWidgets(5));
      expect(find.text('Sign Up'), findsWidgets);
    });

    testWidgets('ForgotPasswordScreen renders input and action button', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildAuthHarness(child: const ForgotPasswordScreen()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ForgotPasswordScreen), findsOneWidget);
      expect(find.byType(AuthTextField), findsOneWidget);

      await tester.drag(find.byType(CustomScrollView), const Offset(0, -200));
      await tester.pumpAndSettle();
      expect(find.text('Send Reset Link'), findsOneWidget);
    });

    testWidgets(
      'LoginScreen handles narrow 320px with 200% text scale in en, ar, ur, de',
      (tester) async {
        for (final locale in [
          const Locale('en'),
          const Locale('ar'),
          const Locale('ur'),
          const Locale('de'),
        ]) {
          await tester.pumpWidget(
            buildAuthHarness(
              size: const Size(320, 640),
              textScaler: const TextScaler.linear(2.0),
              locale: locale,
              child: const LoginScreen(),
            ),
          );
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
        }
      },
    );

    testWidgets('capture login light and dark previews', (tester) async {
      await tester.pumpWidget(
        buildAuthHarness(
          theme: AppTheme.lightTheme(),
          child: const RepaintBoundary(child: LoginScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/login-light.png');

      await tester.pumpWidget(
        buildAuthHarness(
          theme: AppTheme.darkTheme(),
          child: const RepaintBoundary(child: LoginScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/login-dark.png');
    });
  });
}
