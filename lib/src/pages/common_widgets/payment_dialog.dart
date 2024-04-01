import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/order_model.dart';
import '../../services/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;
  PaymentDialog({super.key, required this.order});
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Pagamento com Pix',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                QrImageView(
                  data: '1234567890',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                Text(
                  'Vencimento: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(fontSize: 12),
                ),
                Text('Total ${utilsServices.priceToCurrency(order.total)}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    )),
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.green,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5)),
                    onPressed: () {},
                    icon: const Icon(Icons.copy, size: 15),
                    label: const Text('Copiar código Pix',
                        style: TextStyle(fontSize: 15))),
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)))
        ],
      ),
    );
  }
}
