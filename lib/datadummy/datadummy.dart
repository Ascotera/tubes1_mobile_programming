class CardInfo {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final double balance;

  CardInfo({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.balance,
  });
}

class UserTransaction {
  final String name;
  final String type; 
  final double amount;
  final String imagePath;

  UserTransaction({
    required this.name,
    required this.type,
    required this.amount,
    required this.imagePath,
  });
}

CardInfo dummyCardInfo = CardInfo(
  cardNumber: '1234 1234 1234 1214',
  cardHolder: 'Trianando M.',
  expiryDate: '02/12',
  balance: 2505.50,
);


List<UserTransaction> dummyTransactions = [
  UserTransaction(
    name: 'Husain',
    type: 'Expense',
    amount: 400.50,
    imagePath: 'assets/images/husain.png',
  ),
  UserTransaction(
    name: 'Emma',
    type: 'Income',
    amount: 110.50,
    imagePath: 'assets/images/emma.png',
  ),
];
