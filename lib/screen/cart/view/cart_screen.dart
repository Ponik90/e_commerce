import 'package:advance_exam/screen/detail/provider/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: const Color(0xfff7f2ed),
      ),
      backgroundColor: const Color(0xfff7f2ed),
      body: ListView.builder(
        itemCount: context.watch<DetailProvider>().bookMark.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                context.read<DetailProvider>().bookMark[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
