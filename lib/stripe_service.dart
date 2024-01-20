import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:stripe_checkout/stripe_checkout.dart';

class StripeService {
  static String secretKey =
      "sk_test_51OZRYhHXdyJ63GGlmb20Ku4ZBoj0juw0wmufE0BrzhqKbjflWgjaFKFQ0Jd8dKv6MJRxPuT4k6GbDTMS4QZNs6tM00KXUmVku1";
  static String publishableKey =
      "pk_test_51OZRYhHXdyJ63GGl6pcdnqf7ULWpjL1xprP4Fn5bzOWD0xRxI6C0lghNeyaYbK0PKnLrQtYCt320z84ezMOjXTv500Wk5kfDdt";

  static Future<dynamic> createCheckoutSession(
    List<dynamic> productItems,
    totalAmount,
  ) async {
    final url = Uri.parse("https://api.stripe.com/v1/checkout/sessions");

    String lineItems = "";
    int index = 0;
    productItems.forEach(
      (val) {
        var productPrice = (val["productPrice"] * 100).round().toString();
        lineItems +=
            "&line_items[$index][price_data][product_data][name]=${val['productName']}";
        lineItems +=
            "&line_items[$index][price_data][unit_amount]=$productPrice";
        lineItems += "&line_items[$index][price_data][currency]=EUR";
        lineItems += "&line_items[$index][quantity]=${val['qty'].toString()}";

        index++;
      },
    );

    final response = await http.post(
      url,
      body:
          'success_url=https://checkout.stripe.dev/sucess&mode=payment$lineItems',
      headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );
    return json.decode(response.body)["id"];
  }

  static Future<dynamic> stripePaymentCheckout(
    productItems,
    subTotal,
    context,
    mounted, {
    onSuccess,
    onCancel,
    onError,
  }) async {
    final String sessionId = await createCheckoutSession(
      productItems,
      subTotal,
    );
    final result = await redirectToCheckout(
        context: context,
        sessionId: sessionId,
        publishableKey: publishableKey,
        successUrl: "https://checkout.stripe.dev/success",
        canceledUrl: "https://checkout.stripe.dev/cancel");

    if (mounted) {
      final text = result.when(
        redirected: () => 'Redirected Successfully',
        success: () => onSuccess(),
        canceled: () => onCancel(),
        error: (e) => onError(e),
      );

      return text;
    }
  }
}
