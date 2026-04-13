import 'package:flutter/material.dart';
import 'package:for_global/umumiy_balance/dialog.dart';


class Transaction {
  String amount;
  String type;
  String note;
  DateTime date;

  Transaction({
    required this.amount,
    required this.type,
    required this.note,
    required this.date,
  });
}

class balancepage extends StatefulWidget {
  balancepage({super.key});

  @override
  State<balancepage> createState() => center();
}

class center extends State<balancepage> {
  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;

  List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Umumiy balans",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "$totalBalance so'm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_upward_rounded,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Daromad",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    "$totalIncome so'm",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_downward_rounded,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Xarajat",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    "$totalExpense so'm",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: transactions.isEmpty
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  size: 100,
                  color: Colors.grey.withOpacity(0.7),
                ),
                SizedBox(height: 20),
                Text(
                  "Hali tranzaksiya yo'q",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Qo'shish uchun pastdagi tugmani bosing",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 100),
              ],
            )
                : ListView.builder(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 80),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final item = transactions[index];
                bool isIncome = item.type == "Daromad";

                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text(
                            item.type,
                            style: TextStyle(
                              color:
                              isIncome ? Colors.green : Colors.red,
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Miqdor:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${item.amount} so'm",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Izoh:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                item.note.isEmpty
                                    ? "Izoh mavjud emas"
                                    : item.note,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Sana:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${item.date.day}.${item.date.month}.${item.date.year}  ${item.date.hour}:${item.date.minute.toString().padLeft(2, '0')}",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Yopish"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (isIncome
                                ? Colors.green
                                : Colors.red)
                                .withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isIncome
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: isIncome
                                ? Colors.green
                                : Colors.red,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.type,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${item.date.day}.${item.date.month}.${item.date.year}  ${item.date.hour}:${item.date.minute.toString().padLeft(2, '0')}",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${isIncome ? '+' : '-'} ${item.amount} so'm",
                              style: TextStyle(
                                color: isIncome ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 8),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  transactions.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 56,
        width: 240,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.deepPurple,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () async {
            final result = await openDialog(
              context,
              currentBalance: totalBalance,
            );

            if (result != null) {
              List<String> parts = result.split('|');

              int summa = int.tryParse(parts[0]) ?? 0;
              String turi = parts[1];
              String izoh = "";

              if (parts.length > 2) {
                izoh = parts[2];
              }

              setState(() {
                transactions.insert(
                  0,
                  Transaction(
                    amount: parts[0],
                    type: turi,
                    note: izoh,
                    date: DateTime.now(),
                  ),
                );

                if (turi == "Daromad") {
                  totalIncome = totalIncome + summa;
                  totalBalance = totalBalance + summa;
                } else {
                  totalExpense = totalExpense + summa;
                  totalBalance = totalBalance - summa;
                }
              });
            }
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: Text(
            "Yangi tranzaksiya",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}