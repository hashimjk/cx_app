class CurrencyUtils {
  // Map to get currency name, symbol, and flag code from currency code
  static const Map<String, Map<String, String>> currencyInfo = {
    'USD': {'name': 'US Dollar', 'symbol': '\$', 'flagCode': 'us'},
    'INR': {'name': 'Indian Rupee', 'symbol': '₹', 'flagCode': 'in'},
    'EUR': {'name': 'Euro', 'symbol': '€', 'flagCode': 'eu'},
    'GBP': {'name': 'British Pound', 'symbol': '£', 'flagCode': 'gb'},
    'AUD': {'name': 'Australian Dollar', 'symbol': 'A\$', 'flagCode': 'au'},
    'CAD': {'name': 'Canadian Dollar', 'symbol': 'C\$', 'flagCode': 'ca'},
    'JPY': {'name': 'Japanese Yen', 'symbol': '¥', 'flagCode': 'jp'},
    'CNY': {'name': 'Chinese Yuan', 'symbol': '¥', 'flagCode': 'cn'},
    'SGD': {'name': 'Singapore Dollar', 'symbol': '\$', 'flagCode': 'sg'},
    'MXN': {'name': 'Mexican Peso', 'symbol': '\$', 'flagCode': 'mx'},
    'CHF': {'name': 'Swiss Franc', 'symbol': 'CHF', 'flagCode': 'ch'},
    'ZAR': {'name': 'South African Rand', 'symbol': 'R', 'flagCode': 'za'},
    'NZD': {'name': 'New Zealand Dollar', 'symbol': 'NZ\$', 'flagCode': 'nz'},
    'SEK': {'name': 'Swedish Krona', 'symbol': 'kr', 'flagCode': 'se'},
    'NOK': {'name': 'Norwegian Krone', 'symbol': 'kr', 'flagCode': 'no'},
    'AED': {
      'name': 'United Arab Emirates Dirham',
      'symbol': 'د.إ',
      'flagCode': 'ae',
    },
    'AFN': {'name': 'Afghan Afghani', 'symbol': 'Af', 'flagCode': 'af'},
    'ALL': {'name': 'Albanian Lek', 'symbol': 'L', 'flagCode': 'al'},
    'AMD': {'name': 'Armenian Dram', 'symbol': '֏', 'flagCode': 'am'},
    'ANG': {
      'name': 'Netherlands Antillean Guilder',
      'symbol': 'ƒ',
      'flagCode': 'an',
    },
    'AOA': {'name': 'Angolan Kwanza', 'symbol': 'Kz', 'flagCode': 'ao'},
    'ARS': {'name': 'Argentine Peso', 'symbol': '\$', 'flagCode': 'ar'},
    'AWG': {'name': 'Aruban Florin', 'symbol': 'ƒ', 'flagCode': 'aw'},
    'AZN': {'name': 'Azerbaijani Manat', 'symbol': '₼', 'flagCode': 'az'},
    'BAM': {
      'name': 'Bosnia and Herzegovina Convertible Mark',
      'symbol': 'KM',
      'flagCode': 'ba',
    },
    'BBD': {'name': 'Barbadian Dollar', 'symbol': '\$', 'flagCode': 'bb'},
    'BDT': {'name': 'Bangladeshi Taka', 'symbol': '৳', 'flagCode': 'bd'},
    'BGN': {'name': 'Bulgarian Lev', 'symbol': 'лв', 'flagCode': 'bg'},
    'BHD': {'name': 'Bahraini Dinar', 'symbol': '.د.ب', 'flagCode': 'bh'},
    'BIF': {'name': 'Burundian Franc', 'symbol': 'FBu', 'flagCode': 'bi'},
    'BMD': {'name': 'Bermudian Dollar', 'symbol': '\$', 'flagCode': 'bm'},
    'BND': {'name': 'Brunei Dollar', 'symbol': '\$', 'flagCode': 'bn'},
    'BOB': {'name': 'Bolivian Boliviano', 'symbol': 'Bs.', 'flagCode': 'bo'},
    'BRL': {'name': 'Brazilian Real', 'symbol': 'R\$', 'flagCode': 'br'},
    'BSD': {'name': 'Bahamian Dollar', 'symbol': '\$', 'flagCode': 'bs'},
    'BTN': {'name': 'Bhutanese Ngultrum', 'symbol': 'Nu.', 'flagCode': 'bt'},
    'BWP': {'name': 'Botswana Pula', 'symbol': 'P', 'flagCode': 'bw'},
    'BYN': {'name': 'Belarusian Ruble', 'symbol': '₽', 'flagCode': 'by'},
    'BZD': {'name': 'Belize Dollar', 'symbol': 'Bz\$', 'flagCode': 'bz'},
  };

  // Function to get currency details (name, symbol, and flag code) based on currency code
  static Map<String, String>? getCurrencyDetails(String currencyCode) {
    return currencyInfo[currencyCode];
  }
}
