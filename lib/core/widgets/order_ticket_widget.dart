import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menophol/core/constants/color_constants.dart';
import 'package:menophol/core/constants/padding_constants.dart';
import 'package:menophol/core/widgets/text_widgets.dart';
import 'package:menophol/core/widgets/widgets.dart';

class OrderTicketWidget extends StatelessWidget {
  const OrderTicketWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05*255).toInt()),
            blurRadius: 8,
            offset: Offset(0, 4), // horizontal, vertical shadow
          ),
        ],
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: PaddingConstants.screenPaddingHalf,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Widgets.heightSpaceH05,
            Texts.textBold("Orden # 2414", size: 16),
            Widgets.heightSpaceH05,
            Widgets.divider(),
            Widgets.heightSpaceH1,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textNormal("Fecha", size: 14),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("12/03/2025 PM",
                        size: 14, color: ColorConstants.blackColor),
                  ],
                ),
                Expanded(child: Widgets.widthSpaceW05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textNormal("Tiempo", size: 14),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("12:00 PM",
                        size: 14, color: ColorConstants.blackColor),
                  ],
                ),
                Widgets.widthSpaceW1,
              ],
            ),
            Widgets.heightSpaceH1,
            Texts.textNormal('Ubicación', size: 14),
            Widgets.heightSpaceH05,
            Texts.textNormal("6391 Elgin St. Celina, Delaware 10299",
                textAlign: TextAlign.start,
                size: 14,
                color: ColorConstants.blackColor),
            Widgets.heightSpaceH1,
            Texts.textNormal('Cliente', size: 14),
            Widgets.heightSpaceH05,
            Texts.textNormal("Luis Perez",
                textAlign: TextAlign.start,
                size: 14,
                color: ColorConstants.blackColor),
            Widgets.heightSpaceH1,
            Widgets.customDivider(),
            Widgets.heightSpaceH1,
            Texts.textBold("Detalles del pedido", size: 16),
            Widgets.heightSpaceH05,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textNormal("Importe de la factura", size: 14),
                    Widgets.heightSpaceH05,
                    Texts.textNormal("100\$",
                        size: 14, color: ColorConstants.blackColor),
                  ],
                ),
                Expanded(child: Widgets.widthSpaceW05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.textNormal(
                      "Estado",
                      size: 14,
                    ),
                    Widgets.heightSpaceH05,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Texts.textNormal(
                          "cancelado",
                          size: 14,
                          color: ColorConstants.blackColor,
                        ),
                        Widgets.widthSpaceW1,
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstants.redColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
