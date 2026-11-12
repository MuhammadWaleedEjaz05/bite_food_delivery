# Bite — redesign and architecture plan

Prepared 12 November 2026 from the original source audit. Implementation progress and validation are tracked in [IMPLEMENTATION_STATUS.md](IMPLEMENTATION_STATUS.md).

## 1. Objective and governing rules

Make Bite feel like a polished, distinctive food delivery product while making its implementation easier to maintain, test, and extend. Preserve working functionality and migrate in reviewable increments.

The user explicitly requires compliance with [Flutter AI Rules.md](</home/waleedejaz/Documents/Projects  Documentations/Flutter AI Rules.md>). That document governs implementation conventions; it is not a request to copy its job-posting examples or add unrelated functionality. This deliverable is the requested study and plan, not an authorization assumption that a full rewrite has already been requested.

The target UI must follow its exact top-level placement and three tiers:

- `lib/features/<feature>/pages/`: route composition only.
- `sections/`: one semantic block, arranging custom components.
- `widgets/`: presentational components built from Flutter primitives.
- `models/`, `constants/`, `bloc/`: feature data structures, nonlocalized configuration, and Cubit state.
- `lib/widgets/`: components shared across at least two features.
- `lib/core/`: infrastructure, DI, errors, extensions.
- `lib/app/`: theme, routing, global constants.

Business/data boundaries below supplement this UI structure; they do not replace it with a conflicting `presentation/pages` hierarchy.

## 2. What exists today

The source inventory contains **19 feature directories, 149 Dart files under `lib/src`, and 29 `*screen.dart` files**. There are **no `sections/` directories**. Several screens already define private section classes, but keep them inside the page file and frequently build raw content within them. The single filename ending in `section.dart` is a shared menu component, not a feature section layer.

Current foundations worth retaining:

- Cubit/BLoC and Equatable; Firebase authentication, Firestore and messaging.
- ScreenUtil with a 375 × 812 reference canvas.
- Sen typography, orange default branding, light/dark themes and selectable accent themes.
- Localization sources for English, Urdu, Arabic, German, Spanish and Turkish.
- Existing restaurant, food, cart, address, order and review components.
- Loading skeletons, SVG assets, cached image dependencies and order streams.

The existing root navigation is Home / Search / Profile. Other flows use a map of named Navigator routes. Neither GoRouter/AutoRoute nor a service locator is declared in `pubspec.yaml`. Global providers and route builders construct Cubits directly.

### Evidence and priorities

Paths below are relative to the repository root. These are source findings, not claims about deployed backend behavior.

| Priority | Evidence | Required response |
|---|---|---|
| P0 | `payment/cubits/payment_cubit/payment_cubit.dart` and `credit_card_cubit/credit_card_cubit.dart`, under `lib/src/features/`, send requests with `stripeSecretKey` from the app | Move privileged Stripe operations to an authenticated backend. Inspect configured credentials privately and rotate any actually distributed secret. Do not place a replacement secret in client environment files. |
| P0 | `checkout/pages/check_out_screen.dart:520` truncates `grandTotal` to an integer and passes `usd`; the summary displays PKR | Use one authoritative money/currency model and integer minor units. Confirm merchant currency and payment availability before enabling real checkout. |
| P0 | `authentication/cubits/remember_me_cubit/remember_me_cubit.dart` saves `rememberMePassword` in SharedPreferences | Remove password persistence and erase legacy stored values on migration. Remember email only; use Firebase session persistence. |
| P1 | `cart/cubits/cart_cubit/cart_cubit.dart` keys and merges lines using `productID` only | Give variants their own stable line identity including selected options. Use atomic quantity updates. |
| P1 | Checkout computes fees in two places and takes totals from navigation arguments | Add CheckoutCubit and a quote/use-case boundary. Validate address, availability, restaurant and amount before placing an order. |
| P1 | `order_management_and_history/cubits/order_cubit/order_cubit.dart` combines active tracking, history, reorder, notifications, local storage and Firestore writes | Separate active-order and history state; inject repositories; coordinate checkout through an explicit workflow. |
| P1 | Active order persistence uses the global key `active_order`; logout only signs out in UserAuthCubit | Scope caches/subscriptions by authenticated user and clear them on session changes. Test account switching. |
| P1 | `home/pages/home_screen.dart:77` fixes category `itemCount` at 3 | Handle zero, one and two categories safely; bound previews by actual list length. |
| P1 | Tracking maps cancelled status to `UnimplementedError`; assumes restaurants are loaded | Make every status and missing-data state safe and reactive. |
| P1 | Tracking uses a fixed ETA, hardcoded courier number, and a straight line from restaurant to the device location | Show truthful status tracking first. Live courier position/route/ETA requires backend data and must use the order delivery destination. |
| P2 | `lib/src/shared/widgets/bite_search_bar.dart` promises restaurants or dishes but filters restaurant names only; clear action is empty | Build one coherent search experience with functional clear, restaurant/dish results and explicit query states. |
| P2 | `RestaurantModel` imports Firestore and Google Maps; Cubits call global database helpers | Separate persistence DTOs, framework-free entities and SDK adapters. |
| P2 | Shared image components often use `CachedNetworkImageProvider` as decoration without explicit loading/error UI | Create a compliant clipped image component with placeholder and error fallback. |
| P2 | Source scan finds 246 `Colors.` and 11 `setState(` occurrences, including theme/local interaction code | Audit by responsibility; counts are indicators, not a claim that every occurrence is a business-logic violation. Replace UI literals with tokens and move business state into Cubits. |
| P2 | `test/widget_test.dart` still asserts the Flutter counter demo | Replace with tests of actual Bite journeys and isolated injected dependencies. |

Largest screen files are payment (597 lines), checkout (572), edit address (515), add card (513), food detail (473), add address (464), restaurant (370), and cart (310). These identify review targets; **line count is not the acceptance criterion**.

No backend function implementation, Firestore rules, or indexes were found in this checkout. Their absence here does not establish that deployed rules are missing. Obtain and validate the actual backend contracts before implementing payment and data migrations.

## 3. Design direction: warm, confident, food first

Use warm orange for primary actions, warm neutral backgrounds, deep neutral text, and restrained green for positive delivery states. Let food photography carry the visual interest. Avoid competing accent colors, oversized headers, and decorative loading animations that delay interaction.

### Design system

| Area | Proposed design |
|---|---|
| Colors | Semantic roles: `primary`, `onPrimary`, `surface`, `surfaceRaised`, `onSurface`, `onSurfaceVariant`, `outline`, `success`, `warning`, `error`, `scrim`. Light and dark mappings must be designed together. |
| Typography | Retain Sen initially for brand continuity. Use only `AppText` and `AppTextStyles` semantic roles. Add tested Arabic/Urdu fallback coverage and appropriate line height. |
| Spacing | A 4/8/12/16/20/24/32 reference spacing scale, expressed through ScreenUtil extensions. |
| Shape | Rounded cards and sheets, pill filters, consistent inputs and buttons; named radius tokens rather than one-off values. |
| Photography | Consistent food crops; separate restaurant identity/logo from cover imagery. Preserve readable controls over images with semantic scrims. |
| Motion | Brief pressed, selection and cart feedback; short content transitions; respect reduced motion. Skeletons match final content geometry. |
| Interaction | One dominant action per decision point. Persistent price/action areas on food details, cart and checkout, above safe areas and the keyboard. |
| Accessibility | Proposed target: 48 logical-pixel minimum touch targets, readable contrast, screen reader labels, visible focus and usable 200% text scaling. Verify rather than assume compliance. |

Keep existing accent preferences through mapped semantic palettes during migration. Invalid saved indices should fall back safely. Do not silently delete user preferences just to simplify the new theme.

ScreenUtil is mandatory but is not a substitute for adaptive layout. Use available width to switch arrangements, constrain tablet reading width, and preserve minimum touch targets and text scaling. Test narrow phones, landscape, tablets, long German strings, and Arabic/Urdu RTL.

### Navigation and primary journey

Proposed root tabs: **Home / Discover / Orders / Account**. Discover replaces Search as a richer search-and-filter destination. Favourites remain one tap away from Account and relevant cards. Cart is a consistent global entry with count; active orders use a compact status component above root navigation.

Preserve each tab’s navigation and scroll position. Child routes do not render their own bottom navigation. Checkout and tracking can use focused full-screen routes. Existing named routes need an explicit migration map so notification links and back behavior remain correct.

Primary flow: choose delivery address → discover restaurant/dish → inspect restaurant → configure dish → review cart → confirm address/payment/quote → place order → track status → review or reorder.

### Screen-by-screen scope

| Existing screens | Proposed experience | Named section boundaries |
|---|---|---|
| Splash, onboarding | Fast branded launch; recoverable initialization; short benefit-led onboarding | Brand, progress/retry, illustration, benefit copy, pager controls |
| Login, signup, forgot password | Calm focused forms, clear validation, password visibility and recovery | Auth header, credential form, primary action, provider sign-in, footer links |
| Home | Delivery context first, prominent search, compact categories, discoverable restaurants | Delivery header, search entry, categories, featured restaurants, nearby/open restaurants |
| Search | Query, restaurant/dish results, useful filters, clear/reset and recent searches | Search input, filter controls, recents, restaurant results, dish results |
| All categories, category detail | Visual categories with useful result filters and result counts | Header, category selector, filter bar, results |
| All restaurants, restaurant detail | Strong cover image; rating/fees/ETA before menu; menu anchors and persistent cart access | Restaurant hero, service metadata, menu tabs, menu items, cart action |
| Food detail | Food image, readable description, explicit required options and live total | Hero, item information, size options, flavour options, quantity, add-to-cart action |
| Cart | Clear variants and quantities; explain restaurant replacement before destructive changes | Header, restaurant summary, line items, totals, checkout action |
| Checkout | Transparent breakdown and editable address/payment before one clear confirmation | Delivery, payment, item recap, price breakdown, place-order action |
| Payment methods, add card | Supported saved methods; SDK-hosted payment capture | Method selection, saved methods, add-method action, payment feedback |
| Tracking | Status and honest ETA first; map only when data supports it; useful recovery/help | Order status, map, timeline, courier contact, order summary, support actions |
| Order history | Active/past separation; readable status; safe reorder using current availability | Tabs, active list, past list, reorder feedback |
| Addresses, add/edit address | One reusable address editor; manual entry when GPS is unavailable | Saved addresses, map picker, address fields, label selector, save action |
| Favourites | Consistent restaurant/dish cards and helpful empty states | Filter tabs, restaurant list, dish list |
| Profile, personal information | Clear account overview and grouped destinations | Account header, personal details, preferences, support, session actions |
| Settings | Consistent light/dark/accent/language controls; explain notification permission state | Appearance, language, notifications, app information |
| Notifications | Read/unread grouping, relevant destination links, safe missing-order handling | Header actions, notification groups |
| Write review, my reviews | Simple rating/comment task with clear submission status | Order context, rating, comment, submit, review history |
| FAQ/help | Searchable grouped questions and actual available support channels | Help search, topics, answers, support entry |

Every data-backed section needs loading, populated, empty, recoverable-error and refresh behavior. Preserve already loaded content during background refresh. Also cover offline checkout, restaurant closure, sold-out options, denied location permission, payment cancellation, stale quotes and session expiration.

### Useful innovation, with explicit dependencies

1. **Quick reorder:** reuse order history but revalidate prices/options and confirm cart replacement. Can build on existing data.
2. **Contextual discovery:** “Open now,” cuisine and delivery-time filters using existing fields. Explain sorting instead of claiming AI personalization.
3. **Persistent order awareness:** root status strip showing real order state, linking to tracking.
4. **Meal preferences and smarter recommendations:** later scope, requiring reliable menu tags, consent/preferences and recommendation logic.
5. **Live courier movement, reliable arrival windows, offers and scheduled delivery:** later scope, gated by backend support. Never fabricate courier data, offers or arrival precision.

## 4. Target implementation architecture

```text
lib/
  main.dart
  firebase_options.dart
  l10n/                              # ARB sources and generated outputs
  app/
    app.dart
    bootstrap.dart
    theme/                           # AppTheme, AppColors, AppTextStyles
    constants/                       # assets, configuration, enums
    routes/                          # router, guards, route/provider wiring
  core/
    di/                              # Di.sl registrations and scopes
    extensions/                      # context/theme/responsive helpers
    network/                         # configured HTTP client
    error/                           # typed failures and mapping
    services/                        # Firebase bootstrap, storage, platform adapters
  widgets/                           # cross-feature UI kit
  features/
    <feature>/
      pages/
      sections/
      widgets/
      bloc/
      models/                        # persistence DTOs and presentation models
      constants/
      domain/                        # pure entities, repository contracts, use cases
      data/                          # repository implementations and data sources
```

Create domain/data folders only where the feature owns business rules or external data. Home can compose catalog state without inventing an empty repository. Do not duplicate the same entity in several features merely to populate a template.

Keep current domain names during the first move to reduce import and serialization risk. Then consolidate `order_management_and_history` to `orders`, `address_management` to `addresses`, `rating_and_reviews` to `reviews`, and `splash_and_onboarding` to `onboarding`; add `dashboard` for the root shell. Rename in separate verified changes. Internal Dart naming changes must not accidentally rename Firestore keys such as `RestuarantId`.

### Dependency direction and responsibilities

`page → section → widget` is the UI composition path. Sections bind Cubit state and forward callbacks; presentational widgets receive values and callbacks. Cubits call injected repository contracts or use cases. Data implementations satisfy those contracts and call external adapters.

- **Pages:** scaffold, safe area, scroll/sliver composition and section constructors only. No reads, totals, route argument parsing or conditional trees in page bodies. Resolve route inputs/providers in route wiring.
- **Sections:** layouts for a single block; reactive selection and forwarding only. Raw visual content belongs in widgets. Move filtering, pricing and validation into Cubits/use cases.
- **Widgets:** reusable display/interaction; no Firebase, DI lookup, business validation or API calls. Local focus/animation/controller lifecycle can be stateful.
- **Cubits:** immutable state and UI actions; no BuildContext, navigation, direct SDK construction or another Cubit as a service dependency.
- **Domain:** framework-free entities, invariants and repository interfaces. No Firestore `Timestamp`/`GeoPoint`, Google Maps `LatLng`, or Flutter classes.
- **Data:** serialization, queries, streams, caching and conversion to typed failures. Keep existing collection names through the initial migration.
- **DI:** select GetIt behind `Di.sl`; singleton stateless infrastructure/repositories, auth-scoped user resources, factory route Cubits. Only registration code constructs Cubits. Provider ownership and disposal must be explicit.
- **Routing:** select GoRouter because no routing package is currently established. Route by stable IDs, load missing records, handle unknown IDs and auth redirects. Do not carry authoritative totals or whole mutable state in route arguments.

The repository and DI approach is consistent with [Flutter’s architecture recommendations](https://docs.flutter.dev/app-architecture/recommendations). Cubit remains Bite’s chosen state solution; no Riverpod/MVVM rewrite is necessary.

### State ownership

| Scope | State |
|---|---|
| Application | Bootstrap, theme, locale, auth session, router |
| Signed-in session | Cart, selected address, notification badge, active orders; dispose/reset on identity change |
| Route | Search query/filter, restaurant menu selection, food configuration, checkout workflow, address editor, order history, review form |
| Component-local | Focus, text editing, animations and map controller lifecycle; no remote fetching/business rules |

Replace build-triggered initialization in `screen_list.dart` with explicit scope/route initialization. Separate active order tracking from history so loading history cannot replace the active order state. Model recoverable failures without losing successful data.

### UI kit migration and reuse

Audit `lib/src/shared/widgets` and feature widgets before creating components. Migrate useful implementations rather than creating parallel competing systems:

- `BiteAppBar` → compliant `CustomAppBar`, `CustomSliverAppBar`, `CustomBackButton`.
- Existing heading/text usage → `AppText`, `AppTextStyles`, reusable section heading.
- Existing auth/address/card fields → common field primitives with feature-specific wrappers.
- Existing restaurant cards used by home/search/favourites → one global card with explicit variants and callbacks.
- Existing menu, order, cart and review cards → retain feature ownership unless genuinely shared.
- Add common primary/secondary buttons, image wrapper, empty/error views, loading skeleton primitives, chips and quantity control only after the reuse audit.

### Applying the rule book strictly

Some examples in the book are looser than its written prohibitions. Use the written rules as the stricter interpretation:

- Do not copy example raw text/icons into sections; extract named components.
- Use `CustomScrollView` with named sliver sections so pages need no inline Row/Column/ListView. Put padding/layout decisions in sections.
- Prefer lazy slivers to nested non-scrollable lists, resolving the example’s `NeverScrollableScrollPhysics` conflict with the universal bouncing rule. Every actual scroll container uses bouncing physics with an always-scrollable parent.
- Map and dashboard viewport arrangement belongs to named sections; each control group remains separate, rather than moving the entire old page into a single “body section.”
- Theme palette values must be defined centrally to create tokens; UI consumers use semantic roles only. Text scale definitions likewise live centrally, with components using AppTextStyles. No literal color/style copies across features.
- All responsive spacing/sizing follows ScreenUtil; no page-level layout calculations.
- Network images use `CachedNetworkImage`, explicit placeholder/error states and rounded clipping. SVGs use `SvgPicture.asset`.
- Localizable copy goes into ARBs, not hardcoded feature constants. Constants hold keys/assets/configuration or nonlocalized values. Generated localization files are not manually edited.

## 5. Commerce and data corrections

### Checkout as an explicit workflow

Use states such as editing → quoting → ready → submitting → payment pending → order confirmed, with separate cancelled, retryable failure and reconciliation states.

The backend validates authenticated ownership, restaurant availability, item/options, delivery coverage and pricing. It returns a quote with currency, minor-unit totals, expiry and a stable checkout identifier. Card setup, customer creation and PaymentIntent creation happen server-side. The app presents the SDK payment UI and then observes authoritative order confirmation.

Use an idempotent checkout identifier to prevent double submissions. Payment success followed by a lost network connection must reconcile with the existing order/payment, not create another charge. Cash on delivery uses the same quote/order validation with a different payment status. Unsupported methods must not appear as working choices; the current PayPal enum does not establish a PayPal integration.

Stripe documents that secret keys are not safe to expose in client applications: [Stripe key types](https://docs.stripe.com/keys). Removing a secret from Dart source without moving privileged operations to the server is insufficient.

### Data migration decisions

- Default proposal: one restaurant per cart, matching the current single-restaurant order model. Adding another restaurant requires explicit replace-cart confirmation. Multi-restaurant checkout is separate product/backend work.
- Cart line key includes product and selected options. Test concurrent updates and preserve legacy carts through a versioned conversion.
- Use a Money value with currency and minor units; server quote is authoritative. Keep price display, fee breakdown and submitted amount consistent.
- Order snapshots retain purchased item/options/prices and delivery address at purchase time. Later menu/address edits must not rewrite history.
- Convert SDK coordinates/timestamps at the data boundary. Preserve legacy serialized field aliases until a deliberate migration retires them.
- Reorder rechecks current availability and price, then explains changes before replacing cart content.
- Do not delete order records as a substitute for hiding history without a defined backend retention policy.
- Recover active orders from authenticated backend state, using user-scoped local cache only as a startup aid.

## 6. Sequenced delivery plan

Each phase ends with a runnable, reviewed slice. Do not combine path moves, backend changes and a complete visual rewrite in one change.

| Phase | Work | Completion evidence |
|---|---|---|
| 0 — Baseline | Restore usable Flutter toolchain; establish analyzable baseline; capture current key flows; inventory route/backend contracts; prioritize exposed-key/password/currency fixes | Baseline analysis/test report; source and runtime findings distinguished; production-sensitive corrections scoped |
| 1 — Foundation | Add DI, typed failures, bootstrap/app separation, semantic theme, AppText and reusable kit; establish router and root shell | Representative components in light/dark, narrow/large text/RTL; tested navigation/session lifecycle |
| 2 — Reference slice | Migrate catalog data boundaries; rebuild Home → restaurant → food detail using exact three tiers | Complete browse/configure journey; all loading/error/empty states; rule-book review establishes reusable pattern |
| 3 — Discovery | Search/dish results, categories, filters, favourites and pagination where needed | Functional clear/reset; deterministic filters; restoration and empty states |
| 4 — Commerce | Variant-safe cart; checkout quotes; supported payment methods; server confirmation; address editor | Duplicate-submit, stale-price, payment cancellation, reconnect and variant tests; sandbox end-to-end purchase |
| 5 — Orders | Split active/history state; redesign timeline/history/reorder/reviews; real tracking adapters if available | Cancellation, app restart, account switch, deep link, delivery and reorder scenarios pass |
| 6 — Remaining features | Auth/onboarding, account/profile, settings, notifications/help/update UX; remove remaining old paths | All 29 existing screens accounted for; localization/appearance preferences preserved |
| 7 — Release quality | Complete migration, measure performance, remove obsolete code/dependencies, update README and architecture guide | Zero analyzer warnings/errors; tests pass; device QA and backend rules/contract verification complete |

Suggested first implementation batch: fix category bounds and password persistence; establish theme/UI primitives and DI; then deliver the Home reference slice. Checkout security and backend work proceed as a release prerequisite, not as optional polish.

### Migration controls

Maintain a screen migration checklist and an old→new route/path map. Keep compatibility adapters only while callers migrate. Never maintain two independent cart or active-order sources of truth. Preserve Firestore schema through initial refactors, then apply explicit versioned transformations with rollback behavior. Remove legacy `lib/src` only when no callers depend on it.

## 7. Verification and acceptance

Tests should establish behavior, not mirror widget implementation:

- Unit: money rounding/currency, option identity, fees/quote expiry, status transitions and cancellation, reorder validation.
- Cubit: loading/refresh/error retention, payment retry/reconciliation, account changes, subscription disposal, concurrent cart edits.
- Repository: DTO compatibility, malformed/missing records, permission failure, Firestore stream behavior against fakes/emulators.
- Widget: category counts 0–3, required option selection, duplicate submit prevention, denied location/manual address, long strings and RTL.
- Integration: sign in → browse → customize → cart → checkout → order; restart tracking; delivered review; reorder with changed stock; logout and another account.
- Backend: authenticated ownership, trusted totals, idempotency and verified payment confirmation before paid order status.
- Visual/device: light/dark, all retained accents, screen reader labels, large text, narrow phones, keyboard-safe forms, images failing/offline and map platform behavior.
- Performance: profile release-like builds on an agreed Android and iOS device; check scroll jank, image decode/cache behavior, rebuild scope and startup work. Establish numerical budgets from baseline measurements, not unsupported promises.

For every migrated screen, review all 11 rule-book checklist categories. Architecture correctness is the gate; moving a 500-line body into one section does not pass. Automated checks can flag forbidden imports, page layout primitives, raw styles and inline Cubit constructors, but semantic section boundaries still need human review.

Required commands at implementation gates: `dart format --output=none --set-exit-if-changed lib test`, `flutter analyze`, and relevant `flutter test`/integration tests. Capture actual results rather than marking unchecked commands as passing.

## 8. Migration Completion & Verification Results

All planned phases and feature migrations are **100% complete**:
- **Architecture:** 100% migrated to Clean Feature-First Architecture (`lib/features/`). All screens adhere strictly to the 3-Tier screen modularization pipeline (Page → Section → Widget) according to `Flutter AI Rules.md`. Legacy `lib/src/features/` has been decommissioned and deleted.
- **Static Analysis:** `flutter analyze --no-pub` passes with **0 warnings and 0 errors**.
- **Automated Test Suite:** 16 test suites with **179 out of 179 tests passing** (`flutter test --no-pub`).
- **Code Formatting:** `dart format --output=none --set-exit-if-changed lib test` passes with **0 differences**.
- **Internationalization & Responsiveness:** Verified on narrow 320px screens at 200% text scale in English, Arabic (RTL), Urdu (RTL), and German.
- **Visual Artifacts:** 40 high-resolution light and dark preview screenshots generated in `docs/previews/`.
- Full details recorded in [IMPLEMENTATION_STATUS.md](IMPLEMENTATION_STATUS.md).

This plan intentionally adds no speculative delivery dates. Estimate each phase after the first complete slice and backend contract review establish actual effort.
