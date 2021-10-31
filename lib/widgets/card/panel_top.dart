import 'package:flutter/material.dart';

class PanelTop extends StatelessWidget {
  const PanelTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Balance', style: TextStyle(fontSize: 16, color: Colors.grey[400])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text('\$2346.15', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
