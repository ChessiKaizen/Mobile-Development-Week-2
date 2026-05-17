class BankAccount {
  //TODO
  final String _accountNumber;
  final String _holderName;
  double _balance;
  final String _accountType;
  final String _currency;

  BankAccount(this._accountNumber, this._holderName, this._balance, this._accountType, this._currency);

  // Getters
  String get accountNumber => _accountNumber;
  String get holderName => _holderName;
  double get balance => _balance;
  String get accountType => _accountType;
  String get currency => _currency;

  // Q2 methods
  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
    } 
    else {
      print("Insufficient funds");
    }
  }
  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  //TODO
  final String _name;
  final List<BankAccount> _accounts = [];

  Bank({required String name}) : _name = name;

  String get name => _name;
  List<BankAccount> get accounts => _accounts;


  BankAccount createAccount(int accountId, String accountOwner) {

    for (var acc in _accounts) {
      if (acc.accountNumber == accountId.toString()) {
        throw Exception("Account ID $accountId already exists!");
      }
    }

    var newAccount = BankAccount(accountId.toString(),accountOwner,0.0,"Savings","USD",);

    _accounts.add(newAccount);
    return newAccount;
  }
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
