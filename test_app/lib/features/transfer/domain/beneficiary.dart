class Beneficiary {
  final String id;
  final String name;
  final String accountNumber;
  final String ifsc;
  
  const Beneficiary({
    required this.id,
    required this.name,
    required this.accountNumber,
    required this.ifsc,
  });

  String get maskedNumber => '****${accountNumber.substring(accountNumber.length - 4)}';

  String get initials => name.trim().split(RegExp(r'\s+')).take(2).map((part) => part[0].toUpperCase()).join();  
}