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
              padding: EdgeInsets.only(top: 23, left: 14),
              child: TextWidget(
                  text: 'Privacy Statement',
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000))),
            ),

            Padding(
              padding: EdgeInsets.only(top: 16, left: 14),
              child: TextWidget(
                  text: privacyPolicy,
                  textStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: "Mukta",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000))),
            ),

            // Padding(
            //   padding: EdgeInsets.only(top: 16, left: 14),

            //     child: TextWidget(
            //         text: 'Loremipsum',
            //         textStyle: TextStyle(
            //             fontSize: 14,
            //             fontFamily: "Montserrat",
            //             fontWeight: FontWeight.w700,
            //             color: Color(0xff000000))),
            //   ),

            // Padding(
            //   padding: EdgeInsets.only(top: 12, left: 14),

            //     child: TextWidget(
            //         text:
            //             'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
            //         textStyle: TextStyle(
            //             fontSize: 12,
            //             fontFamily: "Mukta",
            //             fontWeight: FontWeight.w400,
            //             color: Color(0xff000000))),
            //   ),

            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 14),

            //     child: TextWidget(
            //         text:
            //             'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
            //         textStyle: TextStyle(
            //             fontSize: 12,
            //             fontFamily: "Mukta",
            //             fontWeight: FontWeight.w400,
            //             color: Color(0xff000000))),
            //   ),

            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 14),

            //     child: TextWidget(
            //         text:
            //             'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. ',
            //         textStyle: TextStyle(
            //             fontSize: 12,
            //             fontFamily: "Mukta",
            //             fontWeight: FontWeight.w400,
            //             color: Color(0xff000000))),
            //   ),

            // Padding(
            //   padding: EdgeInsets.only(top: 16, left: 14),

            //     child: TextWidget(
            //         text: 'Loremipsum',
            //         textStyle: TextStyle(
            //             fontSize: 14,
            //             fontFamily: "Montserrat",
            //             fontWeight: FontWeight.w700,
            //             color: Color(0xff000000))),
            //   ),

            // Padding(
            //   padding: EdgeInsets.only(top: 12, left: 14),

            //     child: TextWidget(
            //         text:
            //             'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
            //         textStyle: TextStyle(
            //             fontSize: 12,
            //             fontFamily: "Mukta",
            //             fontWeight: FontWeight.w400,
            //             color: Color(0xff000000))),
            //   ),

            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 14),

            //     child: TextWidget(
            //         text:
            //             'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. Velit et sapien erat sapien nulla. Consectetur mauris nisl mauris etiam eget consectetur pulvinar imperdiet id. Nullam vitae suspendisse aliquet elit scelerisque nulla quam cursus arcu.',
            //         textStyle: TextStyle(
            //             fontSize: 12,
            //             fontFamily: "Mukta",
            //             fontWeight: FontWeight.w400,
            //             color: Color(0xff000000))),
            //   ),

            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 14),

            //     child: TextWidget(
            //         text:
            //             'Lorem ipsum dolor sit amet consectetur. Egestas ornare at fermentum sed ac morbi egestas mi quisque. Pellentesque nunc lobortis augue urna. Orci ut in sed orci nunc viverra. Magna varius amet scelerisque nunc mattis. ',
            //         textStyle: TextStyle(
            //             fontSize: 12,
            //             fontFamily: "Mukta",
            //             fontWeight: FontWeight.w400,
            //             color: Color(0xff000000))),

            // ),
          ],
        ),
      ),
    );
  }
}

String privacyPolicy =
    '''
Pay Box application (“App”) is provided by Pay Box Limited ("we", “us” or “our”). We are committed to protecting and respecting the privacy of users of the App (“you” or “your”). This privacy policy (“Privacy Policy”) sets out the basis on which the personal data collected from you, or that you provide to us, will be processed by us. Please read the following carefully to understand how we will use your personal data.

For the purpose of data protection legislation in the UK, the data controller is Pay Box Limited with company registration no. 12318372 and having its registered office at 40 Skipton Road, Colne, Lancashire, United Kingdom, BB8 0NH.

Information We May Collect and Process From You
We may collect and process the following information from you in accordance with data protection legislation in the UK:
- Registration details including name, email, mobile number, age, and gender; and
- Information about your use of the Loyalty Scheme including purchases and other information that you give us.

Your information may be analyzed to see how much you use the Loyalty Scheme, to understand your purchasing decisions, and to send you information and offers for the products or services which we feel are most relevant to you. We may also use your information to generate aggregate data.

We are required to comply with certain legal and regulatory requirements and may process your personal data for compliance with such legal or regulatory obligation, to which we or regulators or law enforcement agencies are subject.

Note that if any of your personal details change during your use of the App, we request that you update them by accessing the relevant section of the App or by contacting us at mailto:info@payboxuk.com.

Retention of your Personal Data
We take appropriate measures to ensure that any personal data is kept secure and kept for the duration of your use of our App and up to a further six (6) months from when you stop using the App.

Cookies and similar technology
Our App and services use cookies or similar technology to collect information about your access to the App and services.

Cookies are pieces of information that include a unique reference code that an app or a website transfers to your device to store and sometimes track information about you. A number of cookies we use last only for the duration of your web session and expire when you close your browser. Other cookies are used to remember you when you return to use our App and services and will last for longer.

We use the following categories of cookies on our App and in the provision of services to you, for the purposes set out below:

Essential session management cookies
- These cookies are essential in order to enable you to use our App and use its features. Without these cookies, services you have asked for cannot be provided to you. We use these cookies for:
  - Ensuring you receive information relating to your use of and progress within our loyalty scheme.

Functionality cookies
- These cookies allow our App to remember choices or selections you make around functionality features (such as your user name, language selections, or region within which you are located) and provide enhanced, more personal features. We also use these cookies to remember changes you make to other parts of our App which you may be able to customize from time to time. The information we collect via these cookies may be anonymized, and these cookies cannot track your browsing activity on other websites. We use these cookies for:
  - Customizing elements of the promotional layout and/or content of the pages of the App, for example, by storing a location and/or country code and providing users with content relevant to their location and/or country.

Performance and measurement cookies
- These cookies collect information about how visitors use our App and if they get error messages when using the App. These cookies do not collect information that identifies a visitor. All information these cookies collect is aggregated and therefore anonymous. It is only used to improve how our App and services work. We use performance and measurement cookies in the following ways:
  - Collecting statistical information about how our users use the App so that we can improve the App and services.
  - We employ Google analytics. You can opt-out of Google Analytics by going to https://tools.google.com/dlpage/gaoptout and following the instructions.

Some of the cookies used on our App are set by us, and some are set by third parties who are delivering services on our behalf.

Most computer and some mobile web browsers automatically accept cookies but, if you prefer, you can change your browser to prevent that or to notify you each time a cookie is set. You can also learn more about cookies by visiting https://www.allaboutcookies.org, which includes additional useful information on cookies and how to block cookies using different types of browser. Please note, however, that by blocking or deleting cookies, you may not be able to take full advantage of our App or services.

Disclosure of Information
We may disclose your personal information to any member of our group, which means our subsidiaries, our ultimate holding company, and its subsidiaries, as defined in section 1159 of the UK Companies Act 2006 (where applicable).

We may disclose your personal information to third parties:
- In the event that we sell or buy any business or assets, in which case we may disclose your personal data to the prospective seller or buyer of such business or assets;
- If we or substantially all of our assets are acquired by a third party, in which case personal data held by us about our customers will be one of the transferred assets; and
- If we are under a duty to disclose or share your personal data in order to comply with any legal or regulatory obligation.

We may disclose your personal information to third-party service providers for the purpose of operating the Loyalty Scheme.

Your Rights
As a result of us collecting and processing your information, you have the following legal rights:
- To access personal data held about you;
- To request us to make any changes to your personal data if it is inaccurate or incomplete;
- To request your personal data is erased where we do not have a compelling reason to continue to process such data in certain circumstances;
- To receive your personal data provided to us as a data controller in a structured, commonly used, and machine-readable format where our processing of the data is based on (i) your consent; (ii) our necessity for the performance of a contract to which you are a party to; or (iii) steps are taken at your request prior to entering into a contract with us and the processing is carried out by automated means;
- To object to, or restrict, our processing of your personal data in certain circumstances;
- To object to, and not be subject to a decision which is based solely on, automated processing (including profiling), which produces legal effects or could significantly affect you; and
- To lodge a complaint with a data protection supervisory body, which at present, is the Information Commissioner’s Office.

To exercise any of your rights as set out above, including to withdraw your consent where we have stated we are processing your personal data based on your consent, please contact us at mailto:info@payboxuk.com.

Changes to Our Privacy Policy
This Privacy Policy was last updated in January 2020. We reserve the right to modify this Privacy Policy at any time. Any changes we may make to this Privacy Policy will be notified and made available to you using the App, where appropriate. By continuing to use the App, you are accepting any changes made to this Privacy Policy. Please check back regularly to keep informed of updates or changes to this Privacy Policy.

Contact
All questions, comments, and requests regarding this Privacy Policy should be addressed to mailto:info@payboxuk.com.
''';
