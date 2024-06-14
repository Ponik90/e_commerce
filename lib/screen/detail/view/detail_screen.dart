import 'package:advance_exam/screen/home/model/home_model.dart';
import 'package:advance_exam/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getApiData();
  }

  @override
  Widget build(BuildContext context) {
    HomeModel model = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
      ),
      backgroundColor: const Color(0xfff7f2ed),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "${model.image}",
              width: MediaQuery.sizeOf(context).width,
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${model.title}",
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${model.rating!.rate}",
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "₹ ${model.price}",
              maxLines: 2,
              style: const TextStyle(
                color: Color(0xff8A8A8A),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${model.description}",
              maxLines: 5,
              style: const TextStyle(
                color: Color(0xff8A8A8A),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff704f38),
        onPressed: () {},
        label: const Row(
          children: [
            Text(
              "Add to cart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
