class Txn{
  final String txnId;
  final String accountId;
  final String title;
  final int amountInPaise; // negative for debit, positive for credit
  final DateTime date;
  final String mode; // UPI, NEFT, IMPS, RTGS, CASH, CHEQUE

  const Txn({
    required this.txnId,
    required this.accountId,
    required this.title,
    required this.amountInPaise,
    required this.date,
    required this.mode
  });

  bool get isDebit => amountInPaise < 0;
}