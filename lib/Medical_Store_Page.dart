import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medical_Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: Stack(
        children: [
          Positioned(
            top: 0,
              left: 0,
              child: Container(
                child: Image.network(
                  "https://images.ctfassets.net/pdf29us7flmy/1bCg1fg7vOsGDxYN2mSAPh/1c90033612f7e70e08ade8d2e4798346/Healthcare_pharmacist_looking_for_medication_in_a_pharmacy_-getty19-.jpeg?w=720&q=100&fm=jpg",
                  fit: BoxFit.cover,
                  height: 800,
                  width: 1545,
                ),
              )
          )
        ],
      ),
    );
  }
}