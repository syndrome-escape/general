import 'package:flutter/material.dart';

class beeline extends StatelessWidget {
  final String image;
  final String text;
  beeline({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        width: 140,
        height: 150,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(image, width: 100, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],),
      ),);
  }
}
