import 'package:flutter/material.dart';

import '../../../services/colors/custom_colors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});
  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.87,
        backgroundColor: const Color(0xff3242F6),
        title: const TextWidget(
          text: 'Privacy Policy',
          textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: "Montserrat",
              color: Color(0xffFFFFFF)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 23,left:14),
              
                child: const TextWidget(
                    text: 'Privacy Statement',
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000))),
              ),
            
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 14),
            
                child: const TextWidget(
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mukta",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000))),
              ),
            
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 14),
             
                child: const TextWidget(
                    text: 'Loremipsum',
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000))),
              ),
            
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 14),
             
                child: const TextWidget(
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mukta",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000))),
              ),
            
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 14),
              
                child: const TextWidget(
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mukta",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000))),
              ),
            
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 14),
              
                child: const TextWidget(
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. ',
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mukta",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000))),
              ),
            
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 14),
             
                child: const TextWidget(
                    text: 'Loremipsum',
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000))),
              ),
            
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 14),
             
                child: const TextWidget(
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mukta",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000))),
              ),
            
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 14),
              
                child: const TextWidget(
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mukta",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000))),
              ),
            
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 14),
              
                child: const TextWidget(
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. ',
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mukta",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000))),
              
            ),
          ],
        ),
      ),
    );
  }
}
