enum AccountType {
  savings('Savings'),
  current('Current');

  const AccountType(this.label);
  final String label;
}

class Account {
  final String id;
  final AccountType type;
  final String holderName;
  final String number;
  final String ifsc;
  final String branch;
  final int balanceInPaise;

  const Account({
    required this.id,
    required this.type,
    required this.holderName,
    required this.number,
    required this.ifsc,
    required this.branch,
    required this.balanceInPaise,
  });

  String get maskedNumber => '****${number.substring(number.length - 4)}';
}
