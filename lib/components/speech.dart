import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ProductGrid extends StatefulWidget {
  final List<Map<String, String>> products; // Dynamic products list

  const ProductGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 270.h,
        // childAspectRatio: 3 / 4,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        String productName = widget.products[index]['name']!;
        String productImage = widget.products[index]['image']!;

        return MouseRegion(
          onEnter: (_) {
            // Handle hover effect if required
          },
          child: GestureDetector(
            onTap: () {
              speak(productName);
            },
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    productImage,
                    height: 100.h,
                    width: 115.w,
                    fit: BoxFit.cover,
                  ),
                  10.h.verticalSpace,
                  Text(
                    productName,
                    style: const TextStyle(color: Colors.transparent),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
