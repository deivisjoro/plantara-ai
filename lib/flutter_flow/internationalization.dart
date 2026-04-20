import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Onboarding
  {
    'fu3cblqm': {
      'es': 'Plantas saludables',
      'en': 'Healthy',
    },
    '4pirmo12': {
      'es': 'Healthy Plants \nHealthier You',
      'en': 'Healthy Plants\nHealthier You',
    },
    'zum4ipbu': {
      'es': 'Una vida mas saludable',
      'en': 'Plants\nHealthier',
    },
    'xd7f7kzo': {
      'es': 'Healthy Plants \nHealthier You',
      'en': 'Healthy Plants\nHealthier You',
    },
    '5pd59saw': {
      'es':
          'Aire más limpio. Menos estrés. Más belleza en casa: todo gracias a las plantas bien cuidadas.',
      'en':
          'Cleaner air. Less stress. More beauty at home — \nall from well-cared-for plants.',
    },
    'biz7hp3z': {
      'es': 'Pero las plantas pueden ',
      'en': 'But Plants Can Get',
    },
    '574fmgjf': {
      'es': 'enfermarse',
      'en': 'Sick',
    },
    '93csh1ns': {
      'es': ' o ',
      'en': 'or',
    },
    '7qupltdt': {
      'es': 'morir ',
      'en': 'Die',
    },
    'qz6sqcjc': {
      'es': ' sin  ',
      'en': 'Without',
    },
    'q7jsp5qv': {
      'es': 'advertencia',
      'en': 'Warning',
    },
    '5uy73x4n': {
      'es': 'Healthy Plants \nHealthier You',
      'en': 'Healthy Plants\nHealthier You',
    },
    'qtk2duq9': {
      'es':
          'No dejes que las hojas amarillas o enfermedades desconocidas arruinen tu espacio verde.',
      'en':
          'Don\'t let yellow leaves or unknown diseases \nruin your green space',
    },
    'qs7l9xbb': {
      'es': 'Te ayudaremos a \n',
      'en': 'We\'ll Help You',
    },
    'mqbugj4u': {
      'es': 'Identificar, diagnosticar, ',
      'en': 'Identify, Diagnose,',
    },
    'jq06s0n2': {
      'es': 'y cuidar ',
      'en': 'and Care',
    },
    'f04wayvp': {
      'es': 'como un profesional',
      'en': 'Like a Pro',
    },
    'jkfxs7hz': {
      'es': 'Healthy Plants \nHealthier You',
      'en': 'Healthy Plants\nHealthier You',
    },
    'v8w2rzov': {
      'es': 'Escanea tu primera planta ahora: ¡cultivemos algo hermoso!',
      'en': 'Scan your first plant now — let\'s grow \nsomething beautiful.',
    },
    'mx5iofpn': {
      'es': 'Get Started',
      'en': 'Get Started',
    },
    '0idiuq9l': {
      'es': '¿Ya tienes una cuenta? ',
      'en': 'Do you already have an account?',
    },
    'u02j4nhh': {
      'es': 'Iniciar sesión',
      'en': 'Sign In',
    },
    '67hgyxre': {
      'es': 'By using Grapho, you agree to our',
      'en': 'By using Grapho, you agree to our',
    },
    'v9r9rsea': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Signin
  {
    'psqy7xne': {
      'es': 'Bienvenido de nuevo',
      'en': 'Welcome Back',
    },
    'plwbcrgq': {
      'es': 'Correo electrónico',
      'en': 'E-mail',
    },
    'laxqzoox': {
      'es': 'Enter your email',
      'en': 'Enter your email',
    },
    '7vbeoct7': {
      'es': 'correo@dominio.com',
      'en': 'example@domain.com',
    },
    '5gr42pow': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '8dxmhu1l': {
      'es': 'Enter your password',
      'en': 'Enter your password',
    },
    '1p903d0v': {
      'es': 'example',
      'en': 'example',
    },
    '2s4g9bm3': {
      'es': 'Recuerdame',
      'en': 'Remember me',
    },
    'itmf9ds1': {
      'es': '¿Has olvidado tu contraseña?',
      'en': 'Forgot Password?',
    },
    'z1qe0u61': {
      'es': 'Forgot Password?',
      'en': 'Forgot Password?',
    },
    'jxzxaaxr': {
      'es': 'Iniciar sesion',
      'en': 'Log In',
    },
    '1g7cpfko': {
      'es': '¿No tienes una cuenta? ',
      'en': 'Don\'t have an account?',
    },
    '0u5hq9el': {
      'es': 'Registrate',
      'en': 'Sign Up',
    },
    'e7uppewf': {
      'es': 'By using Grapho, you agree to our',
      'en': 'By using Grapho, you agree to our',
    },
    'smrxudth': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Home
  {
    'astran9p': {
      'es': '°C',
      'en': '',
    },
    'zjlvthb2': {
      'es': ' (',
      'en': '',
    },
    't0z3z2pl': {
      'es': '°C • ',
      'en': '',
    },
    'yjvasp4c': {
      'es': '°C)',
      'en': '',
    },
    'cgc2rcof': {
      'es': '9°C (0°C • 14°C)',
      'en': '',
    },
    'b332ohfi': {
      'es': 'Buscar plantas, flores, árboles',
      'en': '',
    },
    '0v7t8yb9': {
      'es': 'Premium gratuito disponible',
      'en': '',
    },
    '7rdxabfe': {
      'es': 'Toca para reclamar',
      'en': '',
    },
    '5e3nh9i8': {
      'es': 'Herramientas de planta',
      'en': '',
    },
    'x41mqw5h': {
      'es': 'Flowers',
      'en': '',
    },
    'qg00tdyy': {
      'es': 'See all',
      'en': '',
    },
    '3c4y7lh5': {
      'es': 'All',
      'en': '',
    },
    'ronv5tsm': {
      'es': 'Trending',
      'en': '',
    },
    '5daohg2p': {
      'es': 'Browse by Category',
      'en': '',
    },
    'mqw2m0yy': {
      'es': 'Suggestions',
      'en': '',
    },
    '111r91qk': {
      'es': 'Go to learn',
      'en': '',
    },
    '8umah2fx': {
      'es': 'Home',
      'en': '',
    },
  },
  // Settings
  {
    '8lb7alnt': {
      'es': 'Settings',
      'en': '',
    },
    'tu5hjyh8': {
      'es': 'Sign Up',
      'en': '',
    },
    'fuoxi8bk': {
      'es': 'Sign Up or Log In if you\nalready have an account',
      'en': '',
    },
    'otm1nwjq': {
      'es': 'Account',
      'en': '',
    },
    'm8fyzvwu': {
      'es': 'Legal',
      'en': '',
    },
    'mepza457': {
      'es': 'Home',
      'en': '',
    },
  },
  // Profile
  {
    '697xipby': {
      'es': 'Profile',
      'en': '',
    },
    'b1nxa67f': {
      'es': 'CHANGE PICTURE',
      'en': '',
    },
    'cndi28k2': {
      'es': 'Full Name',
      'en': '',
    },
    'hvpoghoe': {
      'es': 'Enter Name',
      'en': '',
    },
    'pi6nfdsx': {
      'es': 'Email',
      'en': '',
    },
    '2r6inoki': {
      'es': 'Enter Email',
      'en': '',
    },
    'cmjjxui9': {
      'es': 'Save',
      'en': '',
    },
    'qesl3r98': {
      'es': 'Home',
      'en': '',
    },
  },
  // FAQ
  {
    'zb2oro5u': {
      'es': 'Help Center',
      'en': '',
    },
    '8352qtak': {
      'es': 'Home',
      'en': '',
    },
  },
  // Privacy
  {
    'puq90lgp': {
      'es': 'Privacy Policy',
      'en': '',
    },
    'gdocybfu': {
      'es': 'How we collect, use, and protect your data.',
      'en': '',
    },
    'etoh4fsv': {
      'es':
          'We value your privacy. This policy explains how we collect, use, store, and protect your personal information when you use our app.',
      'en': '',
    },
    'gqr0kc38': {
      'es': '1. Information We Collect',
      'en': '',
    },
    '5k9ytsfs': {
      'es':
          ' •  Personal information you provide (name,    \n     email, account data).\n •  Usage data (books read, reading \n     progress, bookmarks, app preferences).',
      'en': '',
    },
    'p04x7rus': {
      'es': '2. How We Use Your Data',
      'en': '',
    },
    'tisfqysd': {
      'es':
          ' •  To provide and improve the App \n     features.\n •  To personalize your reading experience.\n •  To communicate updates or promotional \n     content (with your consent).',
      'en': '',
    },
    '7ad7kl32': {
      'es': '3. Data Security',
      'en': '',
    },
    '4gpqcjrt': {
      'es':
          ' •  We do not sell your personal information.\n •  We may share data with trusted service \n     providers to operate the App.',
      'en': '',
    },
    'z1cgob4r': {
      'es': '4. Security',
      'en': '',
    },
    '183mopjh': {
      'es':
          ' •  We use reasonable measures to protect \n     your data.\n •  However, no system is completely \n     secure, so we cannot guarantee \n     absolute protection.',
      'en': '',
    },
    'i7qzcjzh': {
      'es': 'Home',
      'en': '',
    },
  },
  // Terms
  {
    's5ec3ezs': {
      'es': 'Terms & Conditions',
      'en': 'Terms & Conditions',
    },
    'pf19klo6': {
      'es': 'Please read these terms carefully before using our service',
      'en': 'Please read these terms carefully before using our service',
    },
    '8iwotfhl': {
      'es': 'By using our app, you agree to the following terms:',
      'en': 'By using our app, you agree to the following terms:',
    },
    'vpx1t0nx': {
      'es': '1. Acceptance of Terms',
      'en': '1. Acceptance of Terms',
    },
    '4nx79qnq': {
      'es':
          'By using the Book Reader App (“App”), you agree to these Terms & Conditions. If you do not agree, please do not use the App.',
      'en':
          'By using the Book Reader App (“App”), you agree to these Terms & Conditions. If you do not agree, please do not use the App.',
    },
    'adgwqxzh': {
      'es': '2. Use of the App',
      'en': '2. Use of the App',
    },
    'zqxnc1ah': {
      'es':
          ' •  The App is for personal, non-commercial \n     use only.\n •  You agree not to modify, distribute, or \n     resell content from the App without \n     permission.',
      'en':
          '• The App is for personal, non-commercial \n     use only.\n • You agree not to modify, distribute, or \n     resell content from the App without \n     permission.',
    },
    'nf0rvr8r': {
      'es': '3. User Accounts',
      'en': '3. User Accounts',
    },
    'pchp17u0': {
      'es':
          ' •  Some features require creating an \n     account.\n •  You are responsible for maintaining the \n     confidentiality of your account and \n     password.',
      'en':
          '• Some features require creating an \n     account.\n • You are responsible for maintaining the \n     confidentiality of your account and \n     password.',
    },
    'mnigajzj': {
      'es': '4. Intellectual Property',
      'en': '4. Intellectual Property',
    },
    'y6twhwqg': {
      'es':
          ' •  All content, design, and software in the \n     App are owned by [Your Company] or \n     its licensors.\n •  Unauthorized copying or distribution is \n     prohibited.',
      'en':
          '• All content, design, and software in the \n     App are owned by [Your Company] or \n     its licensors.\n • Unauthorized copying or distribution is \n     prohibited.',
    },
    'r1lo3yxy': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Subscription
  {
    'murcxa72': {
      'es': 'Restore',
      'en': '',
    },
    '6m2m4uof': {
      'es': 'Try for free',
      'en': '',
    },
    '27n4lo2p': {
      'es': 'Lifetime',
      'en': '',
    },
    '96mk87e1': {
      'es': 'US\$199.99',
      'en': '',
    },
    '8a9xbu3z': {
      'es': ' ',
      'en': '',
    },
    'qh1p2dbj': {
      'es': 'US\$49.99',
      'en': '',
    },
    'ubjgvt6n': {
      'es': 'US\$199.99',
      'en': '',
    },
    'oam2qaa8': {
      'es': 'Save -76%',
      'en': '',
    },
    'p2f2jy9n': {
      'es': '3 days free trial',
      'en': '',
    },
    'dw50jo0d': {
      'es': 'then US\$9.99/week auto-renewable',
      'en': '',
    },
    'nv2nulfq': {
      'es': 'US\$199.99',
      'en': '',
    },
    'a1sa6tso': {
      'es': 'Continue',
      'en': '',
    },
    'otcnkhx5': {
      'es': 'Home',
      'en': '',
    },
  },
  // Signup
  {
    'hwsn3ebf': {
      'es': 'Crear una cuenta',
      'en': '',
    },
    'bf36ht21': {
      'es': 'Correo electrónico',
      'en': '',
    },
    'gg7rbuqn': {
      'es': 'Introduce tu correo electrónico',
      'en': '',
    },
    '55nric5n': {
      'es': 'Contraseña',
      'en': '',
    },
    'phyepm65': {
      'es': 'Introduce tu contraseña',
      'en': '',
    },
    'wk51jlxg': {
      'es': 'Estoy de acuerdo con PlantAI',
      'en': '',
    },
    'lfxch771': {
      'es': 'I agree to Grapho Terms & Conditions',
      'en': '',
    },
    '3tmnwvgy': {
      'es': 'Términos y condiciones',
      'en': '',
    },
    'tekjwngi': {
      'es': 'I agree to Grapho Terms & Conditions',
      'en': '',
    },
    '6i1nep2a': {
      'es': 'Regístrate ahora',
      'en': '',
    },
    't49eu4t7': {
      'es': 'O',
      'en': '',
    },
    'nn2o7vqx': {
      'es': 'Regístrate con Google',
      'en': '',
    },
    'udz6xh78': {
      'es': 'Regístrate con Apple',
      'en': '',
    },
    'w3fgyyuo': {
      'es': '¿Ya tienes una cuenta? ',
      'en': '',
    },
    'mrrfx148': {
      'es': 'Iniciar sesión',
      'en': '',
    },
    '6zr419ti': {
      'es': 'By using Grapho, you agree to our',
      'en': '',
    },
    'sg872vgy': {
      'es': 'Home',
      'en': '',
    },
  },
  // Personalizing
  {
    'p2g6k5k6': {
      'es': '¡Mantén sanas tus plantas!',
      'en': '',
    },
    'v3mjo0w8': {
      'es': 'Healthy Plants \nHealthier You',
      'en': '',
    },
    'deelemsc': {
      'es':
          'Te brindamos el conocimiento necesario para que tus plantas prosperen.',
      'en': '',
    },
    '09l6lcin': {
      'es': '¿Cuántas plantas tienes?',
      'en': '',
    },
    'q7ew8x5j': {
      'es': 'Healthy Plants \nHealthier You',
      'en': '',
    },
    '3tt813ri': {
      'es': 'Todavía no tengo una planta.',
      'en': '',
    },
    'aqphvo8k': {
      'es': '1 - 10',
      'en': '',
    },
    '7g4qx9c2': {
      'es': 'Más de 10',
      'en': '',
    },
    'iiaizcw0': {
      'es': '¿Cuánta experiencia tienes con las plantas?',
      'en': '',
    },
    'r52d8dkv': {
      'es': 'Healthy Plants \nHealthier You',
      'en': '',
    },
    'xagls4p4': {
      'es': 'Principiante',
      'en': '',
    },
    '2qf8pivi': {
      'es': 'Algo de experiencia',
      'en': '',
    },
    'ssv6lvnl': {
      'es': 'Muy experimentado',
      'en': '',
    },
    'o7dj8bzc': {
      'es': '¿Cuánto tiempo le dedicas a tus plantas?',
      'en': '',
    },
    'jojclx49': {
      'es': 'Healthy Plants \nHealthier You',
      'en': '',
    },
    '1mji86ep': {
      'es': 'Un poco',
      'en': '',
    },
    'qe89cfl0': {
      'es': 'Unas pocas horas a la semana',
      'en': '',
    },
    'hbeoo3s8': {
      'es': 'Todo el tiempo',
      'en': '',
    },
    'qq4lxowq': {
      'es': '¡Grandes noticias!',
      'en': '',
    },
    '4bphlui0': {
      'es': 'Healthy Plants \nHealthier You',
      'en': '',
    },
    'grheermk': {
      'es': 'Jardines comunes para ti',
      'en': '',
    },
    '0d3lw777': {
      'es': 'Healthy Plants \nHealthier You',
      'en': '',
    },
    'vnvl91jy': {
      'es': 'Sincronizando tu perfil de plantas...',
      'en': '',
    },
    'c6to5zcm': {
      'es': 'Configurando tus preferencias de jardín...',
      'en': '',
    },
    'rxwkw1xg': {
      'es': 'Finalizando tu experiencia personalizada...',
      'en': '',
    },
    'p4sec5lf': {
      'es': '¡Todo listo! Ya puedes explorar tus plantas.',
      'en': '',
    },
    'kxwry3kq': {
      'es': 'Empecemos',
      'en': '',
    },
    '5ag74x3l': {
      'es': 'Saltar',
      'en': '',
    },
    '0sqyqcwf': {
      'es': 'Siguiente',
      'en': '',
    },
    'kpayvm4r': {
      'es': 'Home',
      'en': '',
    },
  },
  // Flowers
  {
    'k5sh5n34': {
      'es': 'Flores',
      'en': '',
    },
    'yslz2jl4': {
      'es': 'Buscar plantas, flores, árboles',
      'en': '',
    },
    'djdkbfiq': {
      'es': 'Explorar por categoría',
      'en': '',
    },
    'y5oqj9it': {
      'es': 'Flores de moda',
      'en': '',
    },
    'v1zt6qtz': {
      'es': 'Home',
      'en': '',
    },
  },
  // Garden
  {
    '60d7kzcs': {
      'es': 'Todas mis plantas',
      'en': '',
    },
    '3w4cit9r': {
      'es': 'Snaps',
      'en': '',
    },
    'cdubdevm': {
      'es': ' Identification is expiring',
      'en': '',
    },
    '0tms4x5j': {
      'es': '2 Identification is expiring',
      'en': '',
    },
    'tf5mhen7': {
      'es': 'Tap to keep history',
      'en': '',
    },
    'rc90n2i2': {
      'es': 'Create Flowers',
      'en': '',
    },
    '0gkwxu8g': {
      'es': 'Add',
      'en': '',
    },
    'p1lsw6de': {
      'es': 'Home',
      'en': '',
    },
  },
  // Search
  {
    '3akyt4pw': {
      'es': 'Search plants, flowers, trees',
      'en': '',
    },
    'j89vr1cv': {
      'es': 'Trending',
      'en': '',
    },
    'rgjujezd': {
      'es': 'Trending',
      'en': '',
    },
    'ukzne84x': {
      'es': 'Flowers',
      'en': '',
    },
    'gbi9gdeh': {
      'es': 'Home',
      'en': '',
    },
  },
  // Camera
  {
    'jqp7vw01': {
      'es': 'Home',
      'en': '',
    },
  },
  // Flower
  {
    'hiw62ghf': {
      'es': 'Free Premium Available',
      'en': '',
    },
    'rx2769rt': {
      'es': 'Tap to claim',
      'en': '',
    },
    'top3sgl0': {
      'es': 'Overview',
      'en': '',
    },
    '7o0locxp': {
      'es': 'Care Requirements',
      'en': '',
    },
    'w5zh6gcv': {
      'es': 'Temperature',
      'en': '',
    },
    'rs7r4oy7': {
      'es': '-',
      'en': '',
    },
    'wqsdpvh2': {
      'es': '° C',
      'en': '',
    },
    'zobku6r6': {
      'es': '18-24° C',
      'en': '',
    },
    '641gdd7f': {
      'es': 'Hardiness Zone',
      'en': '',
    },
    'bttc6jgp': {
      'es': ' to ',
      'en': '',
    },
    '1hpw2ior': {
      'es': '10 to 11',
      'en': '',
    },
    'g94714c8': {
      'es': 'Sunlight',
      'en': '',
    },
    'aqzvvqzc': {
      'es': 'Soil',
      'en': '',
    },
    'td022n95': {
      'es': 'Location',
      'en': '',
    },
    'qbs0pjtb': {
      'es': 'Scientific Classifications',
      'en': '',
    },
    'd9knx2w9': {
      'es': 'Our Tools',
      'en': '',
    },
    '51unvsqi': {
      'es': 'Care tools\nfor your plant',
      'en': '',
    },
    '6chxmeln': {
      'es': 'Water Calculator',
      'en': '',
    },
    'ydpjfcle': {
      'es': 'Calculate your plants\nwater needs',
      'en': '',
    },
    '9xviz9e4': {
      'es': 'Use',
      'en': '',
    },
    'q5n44xds': {
      'es': 'Light Meter',
      'en': '',
    },
    'guxqxzx9': {
      'es': 'Measure the light amount',
      'en': '',
    },
    '2r44pfdu': {
      'es': 'Use',
      'en': '',
    },
    'jwr1dlaz': {
      'es': 'Save to my Garden',
      'en': '',
    },
    '3fizkegl': {
      'es': 'Home',
      'en': '',
    },
  },
  // Suggestion
  {
    'ahz55gn0': {
      'es': 'Overview',
      'en': '',
    },
    'pnagwhjx': {
      'es': 'How to Identify a Plant',
      'en': '',
    },
    'm6vl2ua6': {
      'es': '.',
      'en': '',
    },
    'b1f0n68u': {
      'es': '1.',
      'en': '',
    },
    'h3or1ej5': {
      'es': 'Home',
      'en': '',
    },
  },
  // Category
  {
    'bbmi96sf': {
      'es': 'Home',
      'en': '',
    },
  },
  // Snaps
  {
    '845ez09u': {
      'es': 'Free Premium Available',
      'en': '',
    },
    'vmx8n4rv': {
      'es': 'Tap to claim',
      'en': '',
    },
    '86b4fq5e': {
      'es': 'Overview',
      'en': '',
    },
    '9pu7bnoj': {
      'es': 'Care Requirements',
      'en': '',
    },
    'pihmfjwt': {
      'es': 'Temperature',
      'en': '',
    },
    'bmpzc17k': {
      'es': '-',
      'en': '',
    },
    'th43eanw': {
      'es': '° C',
      'en': '',
    },
    's51yjiuv': {
      'es': '18-24° C',
      'en': '',
    },
    'ghw3i5ss': {
      'es': 'Hardiness Zone',
      'en': '',
    },
    'ulaeyf3m': {
      'es': ' to ',
      'en': '',
    },
    '08nlgtjg': {
      'es': '10 to 11',
      'en': '',
    },
    'g00zb3f2': {
      'es': 'Sunlight',
      'en': '',
    },
    'i9hu77ug': {
      'es': 'Soil',
      'en': '',
    },
    '6cmvr5l9': {
      'es': 'Location',
      'en': '',
    },
    'gg54a9iv': {
      'es': 'Scientific Classifications',
      'en': '',
    },
    '4o6fhtll': {
      'es': 'Our Tools',
      'en': '',
    },
    'txw733ed': {
      'es': 'Care tools\nfor your plant',
      'en': '',
    },
    'qa7mt3yz': {
      'es': 'Water Calculator',
      'en': '',
    },
    'hi3zh35r': {
      'es': 'Calculate your plants\nwater needs',
      'en': '',
    },
    'atjnhiy1': {
      'es': 'Use',
      'en': '',
    },
    'v8gmdbba': {
      'es': 'Light Meter',
      'en': '',
    },
    'b3ycl7ft': {
      'es': 'Measure the light amount',
      'en': '',
    },
    'yv589j4o': {
      'es': 'Use',
      'en': '',
    },
    'j55zijvx': {
      'es': 'Home',
      'en': '',
    },
  },
  // Notification
  {
    '5bqjwyz1': {
      'es': 'Notification',
      'en': '',
    },
    'ao2win22': {
      'es': 'Order updates',
      'en': '',
    },
    'fytdd1gc': {
      'es': 'Get updates about your orders',
      'en': '',
    },
    'r9nzbbh2': {
      'es': 'Promotions & offers',
      'en': '',
    },
    'y1apkhp1': {
      'es': 'Receive special deals and discounts',
      'en': '',
    },
    '66i3sjpq': {
      'es': 'App updates',
      'en': '',
    },
    'evqke76p': {
      'es': 'Stay informed about new features or changes',
      'en': '',
    },
    'se2zve67': {
      'es': 'Recommendations',
      'en': '',
    },
    '5lf339bu': {
      'es': 'Get personalized product suggestions',
      'en': '',
    },
    'rj1mq2vf': {
      'es': 'Email notifications',
      'en': '',
    },
    'wqjp55k1': {
      'es': 'Receive updates via email',
      'en': '',
    },
    'vmklj0j4': {
      'es': 'Push notifications',
      'en': '',
    },
    'bnagdjqm': {
      'es': 'Instant alerts on your device',
      'en': '',
    },
    'dxp22sxq': {
      'es': 'Home',
      'en': '',
    },
  },
  // Logout
  {
    'mislhi0l': {
      'es': 'Confirm Log out?',
      'en': 'Confirm Log out?',
    },
    'krvdt3vf': {
      'es': 'Are you sure you want to log out?',
      'en': 'Are you sure you want to log out?',
    },
    '34ovmate': {
      'es': 'Cancel',
      'en': 'Cancel',
    },
    '4ejsmcea': {
      'es': 'Log Out',
      'en': 'Log Out',
    },
  },
  // Appearance
  {
    '8l2ug6zz': {
      'es': 'Appearance',
      'en': 'Appearance',
    },
    'h2v6sw9q': {
      'es': 'Light',
      'en': 'Light',
    },
    '8cy3zo9o': {
      'es': 'Dark',
      'en': 'Dark',
    },
    'zxsxbq13': {
      'es': 'System',
      'en': 'System',
    },
  },
  // Language
  {
    'v4xm34kj': {
      'es': 'Language',
      'en': 'Language',
    },
    'k48shgfu': {
      'es': 'English',
      'en': 'English',
    },
    '4oshkh5v': {
      'es': 'Deutsch',
      'en': 'German',
    },
    'afkv6zhz': {
      'es': 'French',
      'en': 'French',
    },
    'j7mtk5oe': {
      'es': 'Korean',
      'en': 'Korean',
    },
  },
  // Gender
  {
    '5aw3vv2k': {
      'es': 'Gender',
      'en': '',
    },
    'hiqhtmq0': {
      'es': 'Male',
      'en': '',
    },
    '5n6gfn5p': {
      'es': 'Female',
      'en': '',
    },
    'cyqnmmqg': {
      'es': 'Secret',
      'en': '',
    },
  },
  // Avatar
  {
    'nb7ib54t': {
      'es': 'Change Avatar',
      'en': '',
    },
    'vaa19r31': {
      'es': 'Save',
      'en': '',
    },
  },
  // Navigation
  {
    'wiq3gqcf': {
      'es': 'Home',
      'en': '',
    },
    'x03ctn5f': {
      'es': 'Flowers',
      'en': '',
    },
    'brnpq5h3': {
      'es': 'Garden',
      'en': '',
    },
    'ioo1vw5t': {
      'es': 'Setting',
      'en': '',
    },
  },
  // EmptyGarden
  {
    '7dfb9zcl': {
      'es': 'Your Garden is Empty',
      'en': '',
    },
    'mlqvbqg6': {
      'es':
          'Manage your plant family, view care tips, and \ntrack plant growth here.',
      'en': '',
    },
  },
  // WebNotWorking
  {
    'kx7lzytr': {
      'es': 'Web Access Failed',
      'en': '',
    },
    'agf4lg0t': {
      'es': 'These packages do not work on the web, try downloading the apk.',
      'en': '',
    },
    'pgmp6gfa': {
      'es': 'Download APK',
      'en': '',
    },
    'mw0re0bd': {
      'es': 'Close',
      'en': '',
    },
  },
  // SnapHistory
  {
    '0b8xu9wp': {
      'es': 'Never lose your all snap\nhistory',
      'en': '',
    },
    '8dec1ryk': {
      'es': 'Due to high maintenance costs identifications are kept 90 days.',
      'en': '',
    },
    'bavuejgz': {
      'es':
          '2 identifications in your snap history will be deleted upgrade to premium to keep them.',
      'en': '',
    },
    'eiotrg7w': {
      'es': 'Upgrade to premium',
      'en': '',
    },
  },
  // DeleteSnap
  {
    'n6f2ry2x': {
      'es': 'Confirm Delete?',
      'en': '',
    },
    '9ongxw3i': {
      'es': 'Are you sure you want to delete identification?',
      'en': '',
    },
    'ljdyx5q9': {
      'es': 'Cancel',
      'en': '',
    },
    'r586j26l': {
      'es': 'Delete',
      'en': '',
    },
  },
  // InfoCamera
  {
    'dc96ps22': {
      'es': 'Identification Tips',
      'en': '',
    },
    '6c0kpr22': {
      'es': 'Create spaces where you can position and grow your plants',
      'en': '',
    },
    '6fyj8x8i': {
      'es': 'Too Close',
      'en': '',
    },
    'jinz7p28': {
      'es': 'Too Far',
      'en': '',
    },
    'n8bqfv3i': {
      'es': 'Multi-species',
      'en': '',
    },
    '2j5qnfvw': {
      'es': 'Done',
      'en': '',
    },
  },
  // DeletePlants
  {
    'qn19vspj': {
      'es': 'Confirm Delete?',
      'en': '',
    },
    'eirnr6qc': {
      'es': 'Are you sure you want to delete identification?',
      'en': '',
    },
    'nh9k11ku': {
      'es': 'Cancel',
      'en': '',
    },
    'qadz6z6l': {
      'es': 'Delete',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'pd60pmy9': {
      'es': '',
      'en': '',
    },
    'le4244f8': {
      'es': '',
      'en': '',
    },
    '4ghyfe7b': {
      'es': '',
      'en': '',
    },
    'ma7mz7pp': {
      'es': '',
      'en': '',
    },
    'nx61uh0k': {
      'es': '',
      'en': '',
    },
    '4a1r3ytv': {
      'es': '',
      'en': '',
    },
    'twzivrc9': {
      'es': '',
      'en': '',
    },
    '256y6rq1': {
      'es': '',
      'en': '',
    },
    '7ydfy1gi': {
      'es': '',
      'en': '',
    },
    '0x71vg62': {
      'es': '',
      'en': '',
    },
    'ww1h2bi8': {
      'es': '',
      'en': '',
    },
    'daiyik5w': {
      'es': '',
      'en': '',
    },
    'kzpb64z8': {
      'es': '',
      'en': '',
    },
    'yv2yjsyd': {
      'es': '',
      'en': '',
    },
    '7gykgc5p': {
      'es': '',
      'en': '',
    },
    'b8pktrw1': {
      'es': '',
      'en': '',
    },
    'j52e2zp0': {
      'es': '',
      'en': '',
    },
    'zjlki4qf': {
      'es': '',
      'en': '',
    },
    '20zu6u6j': {
      'es': '',
      'en': '',
    },
    '0o5xy3sk': {
      'es': '',
      'en': '',
    },
    '74yj2xyf': {
      'es': '',
      'en': '',
    },
    'm1gaoyjc': {
      'es': '',
      'en': '',
    },
    'q2xip0tw': {
      'es': '',
      'en': '',
    },
    '86qzxii7': {
      'es': '',
      'en': '',
    },
    'x30umcnm': {
      'es': '',
      'en': '',
    },
    'e653u8fa': {
      'es': '',
      'en': '',
    },
    'tneg152e': {
      'es': '',
      'en': '',
    },
    '0j3x290p': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
