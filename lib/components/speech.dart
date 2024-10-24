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
  String selectedProduct = '';
  double cardScale = 1.0;

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
      padding: EdgeInsets.all(15.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 280.h,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        String productName = widget.products[index]['name']!;
        String productImage = widget.products[index]['image']!;

        return MouseRegion(
          onEnter: (_) {
            setState(() {
              cardScale = 1.05; // Scale up slightly on hover
            });
          },
          onExit: (_) {
            setState(() {
              cardScale = 1.0; // Scale back to normal when not hovered
            });
          },
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedProduct = productName;
              });
              speak(productName);
            },
            child: AnimatedScale(
              scale: cardScale,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                shadowColor: Colors.grey.withOpacity(0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image with rounded corners
                    Container(
                      margin: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.asset(
                          productImage,
                          height: 120.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Product name with speaker icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          productName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: selectedProduct == productName
                                ? Colors.blueAccent
                                : Colors.black.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        // Speaker icon for TTS indication
                        Icon(
                          Icons.volume_up,
                          color: selectedProduct == productName
                              ? Colors.blueAccent
                              : Colors.grey,
                          size: 20.sp,
                        ),
                      ],
                    ),
                    // Speaking indicator text
                    if (selectedProduct == productName)
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Text(
                          "Speaking...",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.blueAccent.withOpacity(0.7),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
