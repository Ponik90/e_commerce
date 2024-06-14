import 'package:advance_exam/screen/home/model/home_model.dart';
import 'package:advance_exam/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getApiData();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xfff7f2ed),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xfff7f2ed),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton(
              value: providerW!.search,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: "all",
                  child: Text("All"),
                ),
                DropdownMenuItem(
                  value: "men's clothing",
                  child: Text("Men's clothing"),
                ),
                DropdownMenuItem(
                  value: "women's clothing",
                  child: Text("Women's clothing"),
                ),
                DropdownMenuItem(
                  value: "jewellery",
                  child: Text("jewellery"),
                ),
                DropdownMenuItem(
                  value: "electronics",
                  child: Text("Electronics"),
                ),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: providerW!.model,
              builder: (context, snapshot) {
                List<HomeModel?>? model = snapshot.data;
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Check Network"),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: model!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "detail",
                                arguments: model[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              "${model[index]!.image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/vector/image.png",
                height: 300,
                width: 300,
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'cart');
                },
                child: const Row(
                  children: [
                    Text(
                      "Cart detail ",
                    ),
                    Spacer(),
                    Icon(Icons.shopping_cart),
                  ],
                ),
              ),
              const Divider(),
              const Row(
                children: [
                  Text(
                    "Share App",
                  ),
                  Spacer(),
                  Icon(Icons.share),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
