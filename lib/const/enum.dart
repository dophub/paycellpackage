enum PaycellMethodType {
  salesCash('Nakit Satış', 1),
  salesCashVoid('Nakit Satış İptali', -1),
  salesCard('Kartlı Satış', 2),
  salesCardVoid('Kartlı Satış İptali', -2),
  refund('İade', 3),
  refundVoid('İadenin iptali', -3);

  final String title;
  final int type;

  const PaycellMethodType(this.title, this.type);
}
