class recieptsmodelrequest {
  final String date;
  final String amountofmoney;
  final String installment_number;
  final String amola;
  final String compenyamola;
  final String datefrom;
  final String dateto;

  recieptsmodelrequest(
      {required this.installment_number,
      required this.date,
      required this.amountofmoney,
      required this.amola,
      required this.compenyamola,
      required this.datefrom,
      required this.dateto});

  tojson() => {
        "total_amount": amountofmoney,
        "installment_number": installment_number,
        "commission_type": amola,
        "commission": compenyamola,
        "transaction_date": date,
        "contract_date_from": datefrom,
        "contract_date_to": dateto
      };
}
