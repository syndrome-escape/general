import 'package:flutter/material.dart';

Future<String?> openDialog(BuildContext context) {
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
                  )
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
                  if (amountController.text.isNotEmpty) {
                    // format: miqdor|turi|izoh
                    Navigator.pop(
                      context,
                      "${amountController.text}|${isIncome ? "Daromad" : "Xarajat"}|${noteController.text}",
                    );
                  }
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
