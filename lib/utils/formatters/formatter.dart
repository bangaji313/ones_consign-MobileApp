import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 2,
    ).format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Jika nomor dimulai dengan kode internasional "+62"
    if (phoneNumber.startsWith('+62')) {
      return '+62 ${phoneNumber.substring(3, 5)}-${phoneNumber.substring(5, 9)}-${phoneNumber.substring(9)}';
    }
    // Jika nomor dimulai dengan "08" (nomor HP lokal)
    if (phoneNumber.startsWith('08')) {
      return '${phoneNumber.substring(0, 4)}-${phoneNumber.substring(4, 8)}-${phoneNumber.substring(8)}';
    }
    // Jika format tidak dikenal, kembalikan nomor asli
    return phoneNumber;
  }

  // Not fully tested
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Menghapus semua karakter non-digit dari nomor telepon
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Cek jika nomor menggunakan kode negara Indonesia (+62)
    if (digitsOnly.startsWith('62')) {
      String countryCode = '+62';
      digitsOnly = digitsOnly.substring(2); // Hilangkan kode negara dari nomor

      // Format menjadi +62 XX-XXXX-XXXX
      final formattedNumber = StringBuffer(countryCode);
      formattedNumber.write(' ${digitsOnly.substring(0, 2)}-${digitsOnly.substring(2, 6)}-${digitsOnly.substring(6)}');
      return formattedNumber.toString();
    }

    // Cek jika nomor lokal dimulai dengan "08" (nomor HP)
    if (digitsOnly.startsWith('08')) {
      return '${digitsOnly.substring(0, 4)}-${digitsOnly.substring(4, 8)}-${digitsOnly.substring(8)}';
    }

    // Jika format tidak dikenali, kembalikan nomor asli
    return phoneNumber;
  }

}