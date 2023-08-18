import 'package:flutter/material.dart';
import 'package:paybox/app/models/media_model.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';
import 'package:paybox/commonWidget/block_button_widget.dart';

class DealsDetails extends StatelessWidget {
  final String? image;
  final String? buisnessName;
  final String? address;
  final String? saleValue;
  final String? subHeading;
  final String? endDate;
  final String? startPrice;
  final String? dealPrice;
  final String? description;
  final String? about;

  DealsDetails({
    super.key,
    this.image,
    this.buisnessName,
    this.address,
    this.saleValue,
    this.subHeading,
    this.endDate,
    this.startPrice,
    this.dealPrice,
    this.description,
    this.about,
  });

  @override
  Widget build(BuildContext context) {
    print(buisnessName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deals'),
        backgroundColor: const Color(0xff3242F6),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 133,
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        height: 133,
                        color: Colors.black,
                        width: double.infinity,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.network(
                            "https://paybox.jzmaxx.com/" + image!,
                            fit: BoxFit.cover,
                          ),
                          //               Image.network(
                          //       "https://paybox.jzmaxx.com/" + widget.avatarpath!),
                          // ),
                        ),
                      ),
                      Positioned(
                        top: 14,
                        right: 1,
                        child: Container(
                          height: 31,
                          width: 83,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              // color: Color(0xff3242F6),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: TextWidget(
                              text: saleValue ?? "",
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff3242F6))),
                        ),
                      ),
                      Positioned(
                          width: 290,
                          left: 16,
                          top: 32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                buisnessName ?? "",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat"),
                              ),
                              Text(
                                address ?? "",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    // fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat"),
                              ),
                            ],
                          )),
                    ]),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Text('asd,'),
                    // SizedBox(
                    //   height: 60,
                    //   width: 263,
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding:
                    //              EdgeInsets.only(top: 16, left: 8, right: 27),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             TextWidget(
                    //                 text: 'Tea for two',
                    //                 textStyle:  TextStyle(
                    //                     color: Color(0xff000000),
                    //                     fontSize: 14,
                    //                     fontFamily: "Montserrat",
                    //                     fontWeight: FontWeight.w700)),
                    //             TextWidget(
                    //                 text: '10',
                    //                 textStyle:  TextStyle(
                    //                     color: Color(0xff000000),
                    //                     fontSize: 10,
                    //                     fontFamily: "Montserrat",
                    //                     fontWeight: FontWeight.w500,
                    //                     decoration: TextDecoration.lineThrough)),
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding:  EdgeInsets.only(left: 8, right: 27),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             TextWidget(
                    //                 text: '2 cup tea',
                    //                 textStyle:  TextStyle(
                    //                     color: Color(0xff000000),
                    //                     fontSize: 12,
                    //                     fontFamily: "Montserrat",
                    //                     fontWeight: FontWeight.w400)),
                    //             TextWidget(
                    //                 text: '4.5',
                    //                 textStyle:  TextStyle(
                    //                   color: Color(0xff3242F6),
                    //                   fontSize: 14,
                    //                   fontFamily: "Montserrat",
                    //                   fontWeight: FontWeight.w700,
                    //                 )),
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(subHeading ?? "",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w700)),
                        ),
                        Column(
                          children: [
                            Text(startPrice ?? "",
                                style: TextStyle(
                                    fontSize: 13,
                                    decoration: TextDecoration.lineThrough)),
                            Text(
                              dealPrice ?? "",
                              style: TextStyle(
                                  color: Color(0xff3242F6),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text('Ends on $endDate',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Montserrat",
                        )),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text('Description',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(description ?? ""),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text('About Range Desserts',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(about ?? ""),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: 330,
                        height: 40,
                        child: BlockButtonWidget(
                          color: const Color(0xff3242F6),
                          text: const Text(
                            'Purchase',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
