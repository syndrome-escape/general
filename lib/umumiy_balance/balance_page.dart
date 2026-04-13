import 'package:flutter/material.dart';
import 'dialog.dart';

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
            padding:  EdgeInsets.all(20),
            margin:  EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Umumiy balans",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                 SizedBox(height: 8),
                Text(
                  "$totalBalance so'm",
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: cardcheck(
                        title: "Daromad",
                        amount: "$totalIncome so'm",
                        icon: Icons.arrow_upward_rounded,
                        iconColor: Colors.green,
                      ),
                    ),
                     SizedBox(width: 12),
                    Expanded(
                      child: cardcheck(
                        title: "Xarajat",
                        amount: "$totalExpense so'm",
                        icon: Icons.arrow_downward_rounded,
                        iconColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: transactions.isEmpty ? empty() : centerList(),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 56,
        width: 240,
        child: FloatingActionButton.extended(
          onPressed: () async {
            final result = await openDialog(context);

            if (result != null) {
              final parts = result.split('|');
              final int summa = int.tryParse(parts[0]) ?? 0;
              final String turi = parts[1];
              final String izoh = parts.length > 2 ? parts[2] : "";

              setState(() {

                transactions.insert(0, Transaction(
                  amount: parts[0],
                  type: turi,
                  note: izoh,
                  date: DateTime.now(),
                ));

                if (turi == "Daromad") {
                  totalIncome += summa;
                  totalBalance += summa;
                } else {
                  totalExpense += summa;
                  totalBalance -= summa;
                }
              });
            }
          },
          backgroundColor: Colors.deepPurple,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          label:  Text(
            "Yangi tranzaksiya",
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          icon:  Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget empty() {
    return Column(
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
    );
  }

  Widget centerList() {
    return ListView.builder(
      padding:  EdgeInsets.fromLTRB(20, 0, 20, 80),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final item = transactions[index];
        bool isIncome = item.type == "Daromad";

        return GestureDetector(
          onTap: () {

            showtransferdetail(item);
          },
          child: Container(
            margin:  EdgeInsets.only(bottom: 12),
            padding:  EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  padding:  EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (isIncome ? Colors.green : Colors.red).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                    color: isIncome ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ),
                 SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.type,
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${item.date.day}.${item.date.month}.${item.date.year}  ${item.date.hour}:${item.date.minute}",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${isIncome ? '+' : '-'} ${item.amount} so'm",
                  style: TextStyle(
                    color: isIncome ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showtransferdetail(Transaction item) {
    showDialog(
      context: context,
      builder: (context) {
        bool isIncome = item.type == "Daromad";
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            item.type,
            style: TextStyle(color: isIncome ? Colors.green : Colors.red),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Miqdor:",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                "${item.amount} so'm",
                style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 15),
               Text(
                "Izoh:",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                item.note.isEmpty ? "Izoh mavjud emas" : item.note,
                style:  TextStyle(fontSize: 16),
              ),
               SizedBox(height: 15),
               Text(
                "Sana:",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                "${item.date.day}.${item.date.month}.${item.date.year}  ${item.date.hour}:${item.date.minute}",
                style:  TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:  Text("Yopish"),
            ),
          ],
        );
      },
    );
  }

  Widget cardcheck({
    required String title,
    required String amount,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding:  EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
           SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style:  TextStyle(color: Colors.white70, fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  amount,
                  style:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
