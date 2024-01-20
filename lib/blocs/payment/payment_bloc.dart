import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<PaymentStart>(_onPaymentStart);
    on<PaymentCreateIntent>(_onPaymentCreateIntent);
    on<PaymentConfirmIntent>(_onPaymentConfirmIntent);
  }

  void _onPaymentStart(
    PaymentStart event,
    Emitter<PaymentState> emit,
  ) {
    emit(state.copyWith(status: PaymentStatus.initial));
  }

  void _onPaymentCreateIntent(
    PaymentCreateIntent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(status: PaymentStatus.loading));

    final paymentMethod = await Stripe.instance.createPaymentMethod(
      params: PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(
          billingDetails: event.billingDetails,
        ),
      ),
    );

    final paymentIntentResult = await _callPayEndpointMethodId(
        useStripeSdk: true,
        paymentMethodId: paymentMethod.id,
        currency: 'usd',
        items: event.items,
        return_url: 'https://busticketbooking.com/ticket.dart');

    if (paymentIntentResult['error'] != null) {
      // Error creating or confirming the payment intent.
      emit(state.copyWith(status: PaymentStatus.failure));
    }

    if (paymentIntentResult['clientSecret'] != null &&
        paymentIntentResult['requiresAction'] == null) {
      // The payment succedeed / went through.
      emit(state.copyWith(status: PaymentStatus.success));
    }

    if (paymentIntentResult['clientSecret'] != null &&
        paymentIntentResult['requiresAction'] == true) {
      final String clientSecret = paymentIntentResult['clientSecret'];
      add(PaymentConfirmIntent(clientSecret: clientSecret));
    } else {}
  }

  void _onPaymentConfirmIntent(
    PaymentConfirmIntent event,
    Emitter<PaymentState> emit,
  ) async {
    // The payment requires action calling handleNextAction
    try {
      final paymentIntent =
          await Stripe.instance.handleNextAction(event.clientSecret);

      if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
        // Call API to confirm intent
        Map<String, dynamic> results =
            await _callPayEndpointIntentId(paymentIntentId: paymentIntent.id);

        if (results['error'] != null) {
          emit(state.copyWith(status: PaymentStatus.failure));
        } else {
          emit(state.copyWith(status: PaymentStatus.success));
        }
      }
    } catch (err) {
      print(err);
      emit(state.copyWith(status: PaymentStatus.failure));
    }
  }

  Future<Map<String, dynamic>> _callPayEndpointMethodId({
    required bool useStripeSdk,
    required String paymentMethodId,
    required String currency,
    List<Map<String, dynamic>>? items,
    required String return_url,
  }) async {
    final url = Uri.parse(
      'https://us-central1-busticketbooking-43c0c.cloudfunctions.net/StripePayEndpointMethodId',
    );
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'useStripeSdk': useStripeSdk,
        'paymentMethodId': paymentMethodId,
        'currency': currency,
        'items': items,
        'return_url': return_url
      }),
    );
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> _callPayEndpointIntentId({
    required String paymentIntentId,
  }) async {
    final url = Uri.parse(
      'https://us-central1-busticketbooking-43c0c.cloudfunctions.net/StripePayEndpointIntentId',
    );
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'paymentIntentId': paymentIntentId,
      }),
    );
    return json.decode(response.body);
  }
}
