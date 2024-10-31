import 'package:get/get.dart';
import 'package:xp_store/features/authentication/views/login/login.dart';
import 'package:xp_store/features/authentication/views/onboarding/onboarding.dart';
import 'package:xp_store/features/authentication/views/password_configuration/forget_password.dart';
import 'package:xp_store/features/authentication/views/signup/signup.dart';
import 'package:xp_store/features/authentication/views/signup/verify_email.dart';
import 'package:xp_store/features/personalization/views/address/address.dart';
import 'package:xp_store/features/personalization/views/profile/profile.dart';
import 'package:xp_store/features/personalization/views/settings/settings.dart';
import 'package:xp_store/features/shop/views/cart/cart.dart';
import 'package:xp_store/features/shop/views/checkout/checkout.dart';
import 'package:xp_store/features/shop/views/home/home.dart';
import 'package:xp_store/features/shop/views/order/order.dart';
import 'package:xp_store/features/shop/views/product_reviews/product_reviews.dart';
import 'package:xp_store/features/shop/views/store/store.dart';
import 'package:xp_store/features/shop/views/favourite/favourite.dart';
import 'package:xp_store/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: XPRoutes.home, page: () => const HomeScreen()),
    GetPage(name: XPRoutes.store, page: () => const StoreScreen()),
    GetPage(name: XPRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: XPRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: XPRoutes.productReviews, page: () => const ProductReviewsView()),
    GetPage(name: XPRoutes.order, page: () => const OrderView()),
    GetPage(name: XPRoutes.checkout, page: () => const CheckoutView()),
    GetPage(name: XPRoutes.cart, page: () => const CartView()),
    GetPage(name: XPRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: XPRoutes.userAddress, page: () => const UserAddressView()),
    GetPage(name: XPRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: XPRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: XPRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: XPRoutes.forgetPassword,
        page: () => const ForgetPasswordScreen()),
    GetPage(name: XPRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
