class clientmodelrequest {
  final String name;
  final String phone;
  final String code;
  final String departement;
  final String inspectiondate;
  final String notes;
  final String status;

  clientmodelrequest(
      {required this.name,
      required this.phone,
      required this.code,
      required this.departement,
      required this.inspectiondate,
      required this.notes,
      required this.status});
  tojson() => { 
        "name": this.name,
        "phone": this.phone,
        "notes": this.notes,
        "code": this.code,
        "department": this.departement,
        "inspection_date": this.inspectiondate,
        "inspection_date": this.inspectiondate,
        "status": this.status,
      };
}
