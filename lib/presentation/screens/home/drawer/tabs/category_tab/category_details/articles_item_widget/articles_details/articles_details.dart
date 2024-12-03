import 'package:flutter/material.dart';

class ArticlesDetails extends StatelessWidget {
  const ArticlesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back , color: Colors.white,),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
