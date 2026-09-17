void addBeneficiary({
  required String name,
  required String accountNumber,
  required String confirmAccountNumber,
  required String ifsc,
  required String accountType,
}) {
  // GET inputs

  // IF validations
  if (name.isEmpty ||
      accountNumber.isEmpty ||
      confirmAccountNumber.isEmpty ||
      ifsc.isEmpty) {
    print("SHOW: Please enter all required details.");
    return;
  }

  if (!RegExp(r'^\d{9,18}$').hasMatch(accountNumber)) {
    print("SHOW: Invalid account number.");
    return;
  }

  if (accountNumber != confirmAccountNumber) {
    print("SHOW: Account numbers do not match.");
    return;
  }

  if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(ifsc)) {
    print("SHOW: Invalid IFSC code.");
    return;
  }

  // IF duplicate
  bool beneficiaryExists = false;

  if (beneficiaryExists) {
    print("SHOW: Beneficiary already exists.");
    return;
  }

  // SHOW confirmation
  print("SHOW: Beneficiary Details");
  print("Name: $name");
  print("Account Number: $accountNumber");
  print("IFSC: $ifsc");
  print("Account Type: $accountType");

  bool confirmed = true; // User confirmation

  if (confirmed) {
    // Security verification
    bool otpVerified = true; // OTP verification

    if (!otpVerified) {
      print("SHOW: Security verification failed.");
      return;
    }

    // SAVE beneficiary
    print("SAVE: Beneficiary details saved.");
    print("SHOW: Beneficiary added successfully.");
  }
}

void processLargeTransaction(double amount) {
  const double largeTransactionLimit = 100000;

  // GET transaction amount

  if (amount > largeTransactionLimit) {
    print("SHOW: Additional security verification required.");

    // GET OTP
    bool otpVerified = true;

    if (!otpVerified) {
      print("SHOW: OTP verification failed.");
      return;
    }

    // Security / fraud check
    bool securityCheckPassed = true;

    if (!securityCheckPassed) {
      print("SHOW: Transaction rejected.");
      return;
    }
  }

  // SAVE / Process transaction
  print("SAVE: Transaction processed successfully.");
}

class SavingsAccount {
  String accountType;
  double minimumBalance;
  double balance;

  SavingsAccount({
    required this.accountType,
    required this.minimumBalance,
    required this.balance,
  });
}

void addSavingsAccount() {
  // GET inputs
  String accountType = "SavingsAccount";
  double minimumBalance = 1000;
  double balance = 1000;

  // IF account type
  if (accountType != "SavingsAccount") {
    print("SHOW: Invalid account type.");
    return;
  }

  // IF minimum balance
  if (minimumBalance < 1000) {
    print("SHOW: Minimum balance must be ₹1000.");
    return;
  }

  // SAVE
  SavingsAccount account = SavingsAccount(
    accountType: accountType,
    minimumBalance: minimumBalance,
    balance: balance,
  );

  print("SAVE: SavingsAccount created.");

  // SHOW
  print("SHOW: Account created successfully.");

  // Balance Card 1
  print("SHOW: Available Balance: ₹${account.balance}");

  // Balance Card 2
  print("SHOW: Minimum Required Balance: ₹${account.minimumBalance}");
}