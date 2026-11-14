import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/payments/models/credit_card_model.dart';
import 'package:bite_food_delivery/features/reviews/bloc/rating_and_review_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_cubit.dart';
import 'package:bite_food_delivery/features/reviews/sections/review_comment_section.dart';
import 'package:bite_food_delivery/features/reviews/sections/review_header_section.dart';
import 'package:bite_food_delivery/features/reviews/sections/review_stars_section.dart';
import 'package:bite_food_delivery/features/reviews/sections/review_submit_section.dart';
import 'package:bite_food_delivery/features/reviews/sections/review_target_section.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewScreen extends StatelessWidget {
  final OrderModel? order;
  final RatingAndReviewCubit? reviewsCubit;

  const ReviewScreen({super.key, this.order, this.reviewsCubit});

  @override
  Widget build(BuildContext context) {
    final effectiveOrder =
        order ??
        ModalRoute.of(context)?.settings.arguments as OrderModel? ??
        OrderModel(
          orderId: 'preview-order',
          userId: 'preview-user',
          restaurantId: '1',
          cartID: 'preview-cart',
          totalPrice: 0.0,
          deliveryAddressId: 'preview-addr',
          paymentMethod: CreditCardType.onCash,
          orderPlacedAt: DateTime.now(),
          orderStatus: OrderStatus.delivered,
          isPaid: true,
        );

    final pageBody = Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: const PageStorageKey('review_screen'),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            const ReviewHeaderSection(),
            ReviewTargetSection(order: effectiveOrder),
            const ReviewStarsSection(),
            const ReviewCommentSection(),
            ReviewSubmitSection(order: effectiveOrder),
          ],
        ),
      ),
    );

    return MultiBlocProvider(
      providers: [
        if (reviewsCubit != null)
          BlocProvider<RatingAndReviewCubit>.value(value: reviewsCubit!)
        else
          BlocProvider<RatingAndReviewCubit>(
            create: (_) => RatingAndReviewCubit(),
          ),
        BlocProvider<ReviewEditorCubit>(create: (_) => ReviewEditorCubit()),
      ],
      child: pageBody,
    );
  }
}
