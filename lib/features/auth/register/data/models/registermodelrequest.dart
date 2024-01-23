class registerrequest{
  final String name;
  final String shop_name;
  final String shop_address;
  final String password;
  final String phone;
  final  String privacy_and_policy;
 String? tax_number;

  registerrequest({required this.name, required this.shop_name, required this.shop_address, required this.password, required this.phone, required this.privacy_and_policy,this.tax_number});
  Map<String,dynamic>tojson()=>{
    "name":name,
    "shop_name":shop_name,
    "shop_address":shop_address,
    "password":password,
    "phone":phone,
    "privacy_and_policy":privacy_and_policy,
    " tax_number": tax_number,





  };
}