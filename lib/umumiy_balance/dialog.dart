import 'package:flutter/material.dart';

Future<String?> openDialog(BuildContext context, {required int currentBalance}) {
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  bool isIncome = true;

  return showDialog<String>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Kiritish"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Summani kiriting",
                      labelText: "Miqdor",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: noteController,
                    decoration: const InputDecoration(
                      hintText: "Izoh (ixtiyoriy)",
                      labelText: "Izoh",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChoiceChip(
                        label: const Text("Daromad"),
                        selected: isIncome,
                        onSelected: (selected) {
                          setState(() {
                            isIncome = true;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text("Xarajat"),
                        selected: !isIncome,
                        onSelected: (selected) {
                          setState(() {
                            isIncome = false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Bekor"),
              ),
              ElevatedButton(
                onPressed: () {
                  final int summa =
                      int.tryParse(amountController.text.trim()) ?? 0;

                  if (summa < 1000) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Minimal summa 1000 so'm bo'lishi kerak"),
                      ),
                    );
                    return;
                  }

                  if (!isIncome && summa > currentBalance) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Xarajat umumiy summadan katta bo'lmasligi kerak",
                        ),
                      ),
                    );
                    return;
                  }

                  Navigator.pop(
                    context,
                    "$summa|${isIncome ? "Daromad" : "Xarajat"}|${noteController.text.trim()}",
                  );
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    },
  );
}