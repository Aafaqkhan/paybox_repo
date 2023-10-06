import 'package:flutter/material.dart';

import '../../../services/colors/custom_colors.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.87,
        backgroundColor: const Color(0xff3242F6),
        title: const TextWidget(
          text: 'About Us',
          textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xffFFFFFF)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 23, left: 14),
              child: TextWidget(
                  text: 'About',
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 14),
              child: TextWidget(
                  text: about,
                  // 'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
                  textStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: "Mukta",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000))),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 16, left: 14),
            //   child: TextWidget(
            //       text: 'Loremipsum',
            //       textStyle: TextStyle(
            //           fontSize: 14,
            //           fontFamily: "Montserrat",
            //           fontWeight: FontWeight.w700,
            //           color: Color(0xff000000))),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 12, left: 14),
            //   child: TextWidget(
            //       text:
            //           'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
            //       textStyle: TextStyle(
            //           fontSize: 12,
            //           fontFamily: "Mukta",
            //           fontWeight: FontWeight.w400,
            //           color: Color(0xff000000))),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 14),
            //   child: TextWidget(
            //       text:
            //           'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
            //       textStyle: TextStyle(
            //           fontSize: 12,
            //           fontFamily: "Mukta",
            //           fontWeight: FontWeight.w400,
            //           color: Color(0xff000000))),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 14),
            //   child: TextWidget(
            //       text:
            //           'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. ',
            //       textStyle: TextStyle(
            //           fontSize: 12,
            //           fontFamily: "Mukta",
            //           fontWeight: FontWeight.w400,
            //           color: Color(0xff000000))),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 16, left: 14),
            //   child: TextWidget(
            //       text: 'Loremipsum',
            //       textStyle: TextStyle(
            //           fontSize: 14,
            //           fontFamily: "Montserrat",
            //           fontWeight: FontWeight.w700,
            //           color: Color(0xff000000))),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 12, left: 14),
            //   child: TextWidget(
            //       text:
            //           'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
            //       textStyle: TextStyle(
            //           fontSize: 12,
            //           fontFamily: "Mukta",
            //           fontWeight: FontWeight.w400,
            //           color: Color(0xff000000))),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 14),
            //   child: TextWidget(
            //       text:
            //           'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
            //       textStyle: TextStyle(
            //           fontSize: 12,
            //           fontFamily: "Mukta",
            //           fontWeight: FontWeight.w400,
            //           color: Color(0xff000000))),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 14),
            //   child: TextWidget(
            //       text:
            //           'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. ',
            //       textStyle: TextStyle(
            //           fontSize: 12,
            //           fontFamily: "Mukta",
            //           fontWeight: FontWeight.w400,
            //           color: Color(0xff000000))),
            // ),
          ],
        ),
      ),
    );
  }
}

String about =
    'We make purchases everyday. We spend money at our favourite places, and we have different loyalty cards for each one. But loyalty cards are almost always bad for the environment, and if you lose or forget your card, you loose all the points you have worked hard to collect. That\'s why Paybox is the easiest and most efficient way to collect loyalty and get rewarded for your every day spending. \n\n Simply ask the vednor for a 6 digit code to add into \'add points\' on the loyalty card, and your points will get add to the card. Alternatively, you can upload a picture of your receipt or screenshot of your delivery order onto \'reques\' on the loyalty card and your vendor will receive your request. They will then allocate your points within 72 hours. To redeem your reward, when you have enough points, simply generate a code under \'redeem\' on the loyalty card and give that code to the vendor. \n\n Each vendor has its own rules for points and rewards, so just click on \'rules\' on each card to see what the reward system is for that particular vendor. \n\n Can\'t find your favourite place? Send us a message on our \'customer support\' section and we will do our best to fast track them on to the app. If you have any additional queries or feedback, or on the rare occasion that there is a technical issue with the app, please contact us under the \'customer support\' section or on 0800  009 6645. \n\n From all the team at Paybox, we hope you enjoy using our app.';
