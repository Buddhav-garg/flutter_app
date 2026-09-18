import 'package:test_app/features/transactions/domain/txn.dart';
import 'package:test_app/features/transfer/domain/beneficiary.dart';
import 'package:test_app/features/accounts/domain/accounts.dart';


// Hard Coded Data


abstract class MockData {
  static const customerName = 'Buddhav Garg';
  static const customerId = 'CUST123456';
  
  static String get firstName => customerName.split(' ').first;

  static const List<Account> accounts = [
    Account(
      id: 'BE1001',
      type: AccountType.savings,
      holderName: customerName,
      number: '123456789012',
      ifsc: 'SBIN0001234',
      branch: 'Main Branch',
      balanceInPaise: 100000000,
    ),
    Account(
      id: 'BE2001',
      type: AccountType.current,
      holderName: customerName,
      number: '987654321098',
      ifsc: 'HDFC0005678',
      branch: 'City Branch',
      balanceInPaise: 50000000,
    ),
  ];

  static Account? accountById(String accountId) {
    for (final account in accounts) {
      if (account.id == accountId) return account;
    }
    return null;
  }

  static const List<Beneficiary> beneficiaries = [
    Beneficiary(
      id: 'BEN5201',
      name: 'Meera Traders',
      accountNumber: '111122223333',
      ifsc: 'ICIC0001234',
    ),
    Beneficiary(
      id: 'BEN1002',
      name: 'Bob Smith',
      accountNumber: '444455556666',
      ifsc: 'HDFC0005678',
    ),
    Beneficiary(
      id: 'BEN3003',
      name: 'Alice Johnson',
      accountNumber: '777788889999',
      ifsc: 'SBIN0009876',
    ),
  ]; 

  /// 500 generated transactions so that statements proves listview.builder works,
  
  static List<Txn> transactions = _generateTransactions();
  
  static List<Txn> transactionFor(String accountId) =>  transactions.where((txn) => txn.accountId == accountId).toList();

  static List<Txn> _generateTransactions() {
    const titles = ['Grocery Store', 'Electricity Bill', 'Salary Credit', 'Online Shopping - Venkata Satya Narayana Enterprises', 'Restaurant', 'ATM Withdrawal', 'Mobile Recharge', 'Insurance Premium', 'Gym Membership', 'Movie Tickets'];
    const amounts = [-20000, -15000, 650000, -30000, -12000, -5000, -10000, -25000, -8000, -6000];
    final start = DateTime(2026, 9,17,18,30);

    return List.generate(500, (i) {
      final k = i % titles.length;
      return Txn(
        txnId: 'TXN${1000 + i}',
        accountId: accounts[i % accounts.length].id,
        title: titles[k],
        amountInPaise: amounts[k],
        date: start.subtract(Duration(hours: i * 7)),
        mode: amounts[k] < 0 ? 'UPI' : 'NEFT');
    });
  }

}