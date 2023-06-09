class PaymentModel{
  int ? id;
  String ? name;
  bool ? isText;
  String ?image;

  PaymentModel(this.id, this.name, this.isText, this.image);
}
List<PaymentModel> paymentMethodList=[
  PaymentModel(1,"Direct bank transfer",true,""),
  PaymentModel(2,"Cash on Delivery",true,""),
  PaymentModel(3,"",false,"assets/images/paypal_logo.png"),
  PaymentModel(4,"",false,"assets/images/razorpay_logo.png"),
  PaymentModel(5,"",false,"assets/images/stripe_logo.png"),
];