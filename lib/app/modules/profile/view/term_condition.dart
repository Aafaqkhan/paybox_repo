import 'package:flutter/material.dart';

import '../../../services/colors/custom_colors.dart';

class TermsConditionsPage extends StatefulWidget {
  const TermsConditionsPage({super.key});
  @override
  State<TermsConditionsPage> createState() => TermsConditionsPageState();
}

class TermsConditionsPageState extends State<TermsConditionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.87,
        backgroundColor: const Color(0xff3242F6),
        title: const TextWidget(
          text: 'Terms & Conditions',
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
                  text: 'Terms & Conditions',
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 14),
              child: TextWidget(
                  text: termsAndCondition,
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

String termsAndCondition =
    'Terms and conditionTerms & ConditionsBy downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Pay Box Limited. \n\n Pay Box Limited is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for. \n\n The PayBox app stores and processes personal data that you have provided to us, in order to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the PayBox app won’t work properly or at all. \n\n The app does use third party services that declare their own Terms and Conditions. \n\n Link to Terms and Conditions of third party service providers used by the app.  \n\n Google Play Services \n Google Analytics for Firebase \n Firebase Crashlytics \n\n You should be aware that there are certain things that Pay Box Limited will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but Pay Box Limited cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left. \n\n If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.  \n\n Along the same lines, Pay Box Limited cannot always take responsibility for the way you use the app i.e. You need to make sure that your device  stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Pay Box Limited cannot accept responsibility.With respect to Pay Box Limited’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Pay Box Limited accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.At some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for both systems(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Pay Box Limited does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device. \n\n Changes to This Terms and Conditions \n\n We may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. we will notify you of any changes by posting the new Terms and Conditions on this page. \n\n These terms and conditions are effective as of 2020-05-01 \n\n Contact Us \n\n If you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at mailto:info@payboxuk.com. \n\n ';
