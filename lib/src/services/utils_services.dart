import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// Classe responsável por fornecer serviços úteis para a aplicação.

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('PT_BR').add_Hm();
    return dateFormat.format(dateTime);
  }
}
