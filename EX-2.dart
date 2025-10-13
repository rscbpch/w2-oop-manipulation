class BankAccount {
  // TODO
  String id;
  String name;
  double _balance;

  BankAccount(this.id, this.name, double balance) : _balance = balance;

  double get balance => _balance;

  double getBalance() => _balance;

  double withdraw(double withdrawAmount) {
    if (withdrawAmount <= 0) {
      print('Withdraw amount must be positive.');
      return _balance;
    }

    if (_balance - withdrawAmount < 0) {
      print('You have insufficient balance');
      return _balance;
    } else {
      _balance -= withdrawAmount;
      print('Withdrawn \$${withdrawAmount}. New balance: \$$_balance');
      return _balance;
    }
  }

  double credit(double creditAmount) {
    if (creditAmount <= 0) {
      print('Credit amount must be positive.');
      return _balance;
    }
    return _balance + creditAmount;
  }
}

class Bank {
  // TODO
  String name;
  List<BankAccount> _accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountName) {
    for (var account in _accounts) {
      if (account.id == accountId.toString()) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }

    var newAccount = BankAccount(accountId.toString(), accountName, 0.0);
    _accounts.add(newAccount);
    print('Account created: ID=${newAccount.id}, Name=${newAccount.name}');
    return newAccount;
  }

  List<BankAccount> get accounts => _accounts;
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
