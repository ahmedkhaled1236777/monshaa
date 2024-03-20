class financialmodelrequest {
  final String date;
  final String amountofmoney;
  final String installment_number;
  final String datefrom;
  final String dateto;

  financialmodelrequest(
      {required this.installment_number,
      required this.date,
      required this.amountofmoney,
      required this.datefrom,
      required this.dateto});

  tojson() => {
        "total_amount": amountofmoney,
        "installment_number": installment_number,
        "transaction_date": date,
        "contract_date_from": datefrom,
        "contract_date_to": dateto
      };
}
