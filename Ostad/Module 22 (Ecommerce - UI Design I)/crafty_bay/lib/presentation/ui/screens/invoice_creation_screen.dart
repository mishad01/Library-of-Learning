import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InvoiceCreationScreen extends StatefulWidget {
  const InvoiceCreationScreen({super.key});

  @override
  State<InvoiceCreationScreen> createState() => _InvoiceCreationScreenState();
}

class _InvoiceCreationScreenState extends State<InvoiceCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      AssetsPath.appLogo,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  _invoiceHelpSection(),
                  Container(
                    color: AppColors.themeColor.withOpacity(0.2),
                    child: TabBar(
                      //indicator: ShapeDecoration(coshape: Border.all()),
                      indicatorColor: Theme.of(context).primaryColor,
                      indicatorWeight: 1,
                      dividerColor: Colors.grey.shade200,
                      automaticIndicatorColorAdjustment: true,
                      labelColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Colors.black54,
                      labelStyle: TextStyle(fontSize: 14),
                      overlayColor:
                          WidgetStateProperty.resolveWith<Color>((state) {
                        return AppColors.themeColor;
                      }),
                      labelPadding: const EdgeInsets.all(2),
                      splashBorderRadius: BorderRadius.circular(5),
                      unselectedLabelStyle: const TextStyle(fontSize: 14),
                      tabs: [
                        Tab(text: "CARD"),
                        Tab(text: "MOBILE BANKING"),
                        Tab(text: "NET BANKING"),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  Center(child: Text("Card Payment Section")),
                  Center(child: Text("Mobile Banking Payment Section")),
                  Center(child: Text("Net Banking Payment Section")),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Center _invoiceHelpSection() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _InvoiceTextWithIcon("Support", Icons.support_agent),
          _InvoiceTextWithIcon("FAQ", Icons.question_mark_rounded),
          _InvoiceTextWithIcon("Offer", Icons.card_giftcard),
          _InvoiceTextWithIcon("Login", Icons.login)
        ],
      ),
    );
  }

  Widget _InvoiceTextWithIcon(String text, IconData icon) {
    return TextButton(
      onPressed: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            height: 40,
            width: 40,
            child: Icon(
              icon,
              size: 25,
              color: Colors.black,
            ),
          ),
          Text(text, style: TextStyle(color: Colors.black))
        ],
      ),
    );
  }
}
