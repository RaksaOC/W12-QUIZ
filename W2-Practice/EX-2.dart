class BankAccount {
  // TODO
  int _id;
  int _balance;
  String _ownerName;
  BankAccount(this._id, this._balance, this._ownerName);

  int get balance => _balance;

  void credit(int amount) {
    _balance += amount;
  }

  void withdraw(int amount) {
    if (amount > _balance) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
  // TODO
  String _name;
  List<int> _bankAccountIds = [];

  Bank({required String name}) : _name = name;

  BankAccount createAccount(int id, String ownerName) {
    // checking if account already exists
    if (_bankAccountIds.contains(id)) {
      throw Exception('Account with ID $id already exists!');
    }
    _bankAccountIds.add(id);
    return BankAccount(id, 0, ownerName);
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
