import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';
import 'package:paybox/app/services/global_loyalityoints_img.dart';

<<<<<<< HEAD
import '../../../models/loyalty_model.dart';

class CollectPointsPanel extends StatelessWidget {
  final Data? loyalty;

  const CollectPointsPanel({
    super.key,
    this.loyalty,
    // this.userPoints,
    // this.description,
    // this.redeemPoints,
    // this.
  });
=======
class CollectPointsPanel extends StatelessWidget {
  final String? pinCode;
  final String? description;
  final String? name;
  final int? userPoints;
  final int? redeemPoints;

  const CollectPointsPanel(
      {super.key,
      this.pinCode,
      this.userPoints,
      this.description,
      this.redeemPoints,
      this.name});
>>>>>>> c931483518b3abff07e356e13cda4a3dea0c28e8

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 340,
        width: 331,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(27),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
              )
            ]),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 19),
                  child: SizedBox(
                    height: 60,
                    width: 193,
                    child: TextWidget(
                        text:
                            'Give your paybox pin code to The merchant to collect points or redeem reward',
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: "Mukta",
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000))),
                  ),
                ),
                Icon(
                  Icons.cancel,
                )
              ],
            ),
            TextWidget(
                text: '${loyalty?.pinCode}',
                textStyle: const TextStyle(
                    fontSize: 28,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    color: Color(0xff3242F6))),
            Padding(
              padding: const EdgeInsets.only(left: 21, top: 33),
              child: SizedBox(
                height: 23,
                width: 316,
                child: Row(
                  children: [
                    TextWidget(
                        text: '${loyalty?.userPoints} points',
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000))),
                    const Padding(
                      padding: EdgeInsets.only(left: 4, right: 33, top: 4),
                      child: TextWidget(
                          text: 'Collected',
                          textStyle: TextStyle(
                              fontSize: 10,
                              fontFamily: "Mukta",
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000))),
                    ),
                    Container(
                      width: 138,
                      height: 22,
                      color: const Color(0xff000000),
                      alignment: Alignment.center,
                      child: const TextWidget(
                          text: 'View my transaction history',
                          textStyle: TextStyle(
                              fontSize: 10,
                              fontFamily: "Mukta",
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF))),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21, top: 0),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: loyalty?.services?.length ?? 0,
                        itemBuilder: (context, index) {
                          Services services = loyalty!.services![index];
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                LoyalityPointsImages(
                                  path: services.logo?.path,
                                  avatarpath: services.logo?.name,
                                  // path: 'storage/delivery-services/logo/',
                                  // avatarpath:
                                  //     "ar8TNLg0x33loEka2uuT7Syi8Bwl4GRsrM8jgrm4.png",
                                ),

                                // LoyalityPointsImages(
                                //   avatarpath: "assets/images/delievery (3).png",
                                // ),
                                // LoyalityPointsImages(
                                //   avatarpath: "assets/images/delievery (4).png",
                                // ),
                                // LoyalityPointsImages(
                                //   avatarpath: "assets/images/delievery (5).png",
                                // ),
                                // LoyalityPointsImages(
                                //   avatarpath: "assets/images/delievery (2).png",
                                // ),
                              ]);
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      height: 15,
                      width: 150,
                      child: TextWidget(
                          text: 'Collect points on delivery orders ',
                          textStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Mukta",
                              color: Color(0xff000000))),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 14, left: 20),
              child: Container(
<<<<<<< HEAD
                  child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: loyalty?.loyaltyRedeemRules?.length ?? 0,
                itemBuilder: (context, index) {
                  LoyaltyRedeemRules offer =
                      loyalty!.loyaltyRedeemRules![index];
                  return Row(
                    children: [
                      TextWidget(
                          text: '${offer.points} points = ',
                          textStyle: const TextStyle(
                              fontSize: 10,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000))),
                      TextWidget(
                          text: '${offer.name}',
                          textStyle: const TextStyle(
                              fontSize: 10,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000))),
                    ],
                  );
                },
              )),
=======
                child: Row(
                  children: [
                    TextWidget(
                        text: '$redeemPoints points = ',
                        textStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000))),
                    TextWidget(
                        text: '$name',
                        textStyle: TextStyle(
                            fontSize: 10,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000))),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                child: const Row(
                  children: [
                    TextWidget(
                        text: '100 points = ',
                        textStyle: TextStyle(
                            fontSize: 10,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000))),
                    TextWidget(
                        text: 'Free Sandwich, Burrito or Smoothie  ',
                        textStyle: TextStyle(
                            fontSize: 10,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000))),
                  ],
                ),
              ),
>>>>>>> c931483518b3abff07e356e13cda4a3dea0c28e8
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20),
            //   child: Container(
            //     child: const Row(
            //       children: [
            //         TextWidget(
            //             text: '100 points = ',
            //             textStyle: TextStyle(
            //                 fontSize: 10,
            //                 fontFamily: "Montserrat",
            //                 fontWeight: FontWeight.w700,
            //                 color: Color(0xff000000))),
            //         TextWidget(
            //             text: 'Free Sandwich, Burrito or Smoothie  ',
            //             textStyle: TextStyle(
            //                 fontSize: 10,
            //                 fontFamily: "Montserrat",
            //                 fontWeight: FontWeight.w700,
            //                 color: Color(0xff000000))),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 24),
              child: SizedBox(
                height: 30,
                width: 265,
                child: TextWidget(
                    text: '${loyalty?.description ?? ''}',
                    textStyle: const TextStyle(
                        fontSize: 10,
                        fontFamily: "Mukta",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000))),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Container(
            //       height: 159,
            //       width: 335,
            //       decoration: BoxDecoration(
            //           color: const Color(0xffF3F3F3),
            //           borderRadius: BorderRadius.circular(17)),
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 17, top: 18),
            //         child: Row(
            //           children: [
            //             Container(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   const TextWidget(
            //                       text: 'BOXCO',
            //                       textStyle: TextStyle(
            //                           fontSize: 28,
            //                           fontFamily: "Montserrat",
            //                           fontWeight: FontWeight.w700,
            //                           color: Color(0xff000000))),
            //                   const TextWidget(
            //                       text: 'SUBSCRIPTION',
            //                       textStyle: TextStyle(
            //                           fontSize: 24,
            //                           fontFamily: "Montserrat",
            //                           fontWeight: FontWeight.w700,
            //                           color: Color(0xff3242F6))),
            //                   const TextWidget(
            //                       text: 'Unlimited Hot Drinks ',
            //                       textStyle: TextStyle(
            //                           fontSize: 10,
            //                           fontStyle: FontStyle.italic,
            //                           fontFamily: "Montserrat",
            //                           fontWeight: FontWeight.w700,
            //                           color: Color(0xff000000))),
            //                   const TextWidget(
            //                       text: '10% off all food',
            //                       textStyle: TextStyle(
            //                           fontSize: 10,
            //                           fontWeight: FontWeight.w700,
            //                           fontStyle: FontStyle.italic,
            //                           fontFamily: "Montserrat",
            //                           color: Color(0xff000000))),
            //                   Padding(
            //                     padding: const EdgeInsets.only(top: 21),
            //                     child: Row(
            //                       children: [
            //                         const TextWidget(
            //                             text: '£ 39',
            //                             textStyle: TextStyle(
            //                                 fontSize: 19,
            //                                 fontFamily: "Montserrat",
            //                                 fontStyle: FontStyle.italic,
            //                                 fontWeight: FontWeight.w700,
            //                                 color: Color(0xff3242F6))),
            //                         const TextWidget(
            //                             text: '/month',
            //                             textStyle: TextStyle(
            //                                 fontSize: 19,
            //                                 fontFamily: "Montserrat",
            //                                 fontWeight: FontWeight.w700,
            //                                 color: Color(0xff000000))),
            //                         Padding(
            //                           padding: const EdgeInsets.only(left: 58),
            //                           child: InkWell(
            //                             onTap: () {},
            //                             child: Container(
            //                               height: 23,
            //                               width: 74,
            //                               alignment: Alignment.center,
            //                               decoration: BoxDecoration(
            //                                 color: const Color(0xff3242F6),
            //                                 borderRadius:
            //                                     BorderRadius.circular(4),
            //                               ),
            //                               child: const TextWidget(
            //                                   text: 'Subscribe',
            //                                   textStyle: TextStyle(
            //                                       fontSize: 10,
            //                                       fontFamily: "Montserrat",
            //                                       fontWeight: FontWeight.w700,
            //                                       color: Color(0xffFFFFFF))),
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(
            //                 bottom: 21,
            //               ),
            //               child: SizedBox(
            //                 height: 122,
            //                 width: 65,
            //                 child: Image.asset('assets/images/drin 1.png'),
            //               ),
            //             ),
            //           ],
            //         ),
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}
