import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'deviceNotNound': 'Device not found.',
          'deviceFound': 'Device found! Now you can go to settings.',
          'delete': 'Delete',
          'toRemoveTheDevice': 'Are you sure you want to remove the device?',
          'addingADevice': 'Adding a device',
          'enterSSIDAndPSWRDFromLabel': 'Enter the SSID and PSWRD from the label:',
          'youNeedToEnterDetails': 'you need to enter details!',
          'toConnectToFlora': 'To connect to Flora',
          'connect': 'СONNECT',
          'deviceNotAdded': 'You have not added any devices yet.',
          'myDevices': 'My devices',
          'cancel': 'Cancel',
          'logOut': 'Are you sure you want to log out of your account?',
          'goOut': 'Go out',
          'aboutTheApp': 'About the app',
          'myDevices': 'My devices',
          'tryLater': 'try later',
          '400': 'Invalid request',
          '401': 'Incorrect token',
          '404': 'Invalid input, please try again',
          '408': 'Previous code is not expired',
          '422': 'Re-entry of the same data',
          '429': 'Too many request',
          '500': 'Server error',
          'change': 'Edit',
          'yourData': 'Your data:',
          'serviceNotReady': 'Service unavailable, please try again later',
          'searchCountry': 'Search country',
          'allClear': 'Clear',
          'code': 'Code',
          'EnterCode': 'Enter code (sent to email)',
          'confirm': 'CONFIRM',
          'validPhone': 'Enter a valid phone number please',
          'validName': 'Enter a valid name please',
          'validEmail': 'Enter a valid e-mail please',
          'yourName': 'Your name',
          'agreeToTheTerms': 'Agree to the terms of the user agreement please',
          'userAgreementTerms': 'User Agreement Terms',
          'iHaveReadAndAccept': 'I have read and accept ',
          'emptyField': 'Fill in the empty field(s) please',
          'language': 'English',
          'noInternet': 'Turn on the Internet please!',
          'invalidMobileNumber': 'Invalid Mobile Number',
          'get': 'Get the code again',
          'PhoneNumber': 'Your phone Number',
          'enterСodeText':
              'Enter the last 4 digits of the number from which we will call you. For example:\n +1_123_456_XXXX ⬅',
          "pinIsIncorrect": "Incorrect code, please try again",
          'welcome': 'Welcome',
          'Email': 'Your email',
          'password': 'Your password',
          'enter': 'Enter',
          'registration': 'Registration',
          'doRegistration': 'REGISTER ONESELF',
          'doRegistrationLowerCase': 'Register',
          'toComeIn': 'INPUT',
          'profile': 'profile',
          'lightDarkModes': 'Light/Dark modes',
          'languages': 'Languages',
          'instruction': 'Instruction',
          'contactWithDevelopers': 'Contact with developers',
          'settings': 'Settings',
          'appBarTitle': 'Megaohm'
        },
        'ru_RU': {
          'deviceNotNound': 'Устройство не найдено.',
          'deviceFound': 'Устройство найдено! Теперь вы можете перейти к настройкам.',
          'delete': 'Удалить',
          'toRemoveTheDevice': 'Вы действительно хотите удалить устройство?',
          'addingADevice': 'Добавление устройства',
          'enterSSIDFromLabel': 'Введите SSID и ',
          'enterPSWRDFromLabel': 'PSWRD с этикетки:',
          'youNeedToEnterDetails': 'необходимо ввести её данные!',
          'toConnectToFlora': 'Для подключения к Флоре',
          'connect': 'ПОДКЛЮЧИТЬСЯ',
          'deviceNotAdded': 'Вы ещё не добавили ни одного устройства.',
          'myDevices': 'Мои устройства',
          'cancel': 'Отмена',
          'logOut': 'Вы действительно хотите выйти из аккаунта?',
          'goOut': 'Выйти',
          'aboutTheApp': 'О приложении',
          'myDevices': 'Мои устройства',
          'tryLater': 'попробуйте позже',
          '400': 'Неверный запрос',
          '401': 'Неправильный токен',
          '404': 'Не верный ввод, попробуйте еще раз',
          '408': 'Срок действия предыдущего кода не истек',
          '422': 'Повторный ввод одинаковых данных',
          '429': 'Слишком много запросов',
          '500': 'Ошибка сервера',
          'change': 'Редактировать',
          'yourData': 'Ваши данные:',
          'serviceNotReady': 'Сервис недоступен, сделайте попытку позже',
          'searchCountry': 'Поиск страны:',
          'allClear': 'Понятно',
          'code': 'Код',
          'EnterCode': 'Введите код (отправлен на е-маил)',
          'confirm': 'ПОДТВЕРДИТЬ',
          'validPhone': 'Пожалуйста, введите корректный номер телефона',
          'validEmail': 'Пожалуйста, введите корректный e-mail',
          'validName': 'Пожалуйста, введите корректное имя',
          'yourName': 'Имя',
          'agreeToTheTerms':
              'Пожалуйста, согласитесь с условиями пользовательского соглашения',
          'userAgreementTerms': 'Условия пользовательского соглашения',
          'iHaveReadAndAccept': 'Я ознакомлен(а) и принимаю ',
          'emptyField': 'Пожалуйста, заполните пустое поле(я)',
          'language': 'Русский',
          'noInternet': 'Включите пожалуйста интернет!',
          'invalidMobileNumber': 'Некорректный номер телефона',
          'get': 'Получить код повторно',
          'welcome': 'Добро пожаловать!',
          'PhoneNumber': 'Номер телефона',
          'enterСodeText':
              'Введите последние 4 цифры номера с которого мы вам позвоним. Например:\n +7_123_456_XXXX ⬅',
          "pinIsIncorrect": "Некорректный код, попробуйте ещё раз.",
          'Email': 'Почта',
          'password': 'Ваш пароль',
          'enter': 'Вход',
          'registration': 'Регистрация',
          'doRegistration': 'ЗАРЕГИСТРИРОВАТЬСЯ',
          'doRegistrationLowerCase': 'Зарегистрироваться',
          'toComeIn': 'ВОЙТИ',
          'profile': 'Профиль',
          'lightDarkModes': 'Ночной/Дневной режимы',
          'languages': 'Языки',
          'instruction': 'Инструкция',
          'contactWithDevelopers': 'Связь с разработчиками',
          'settings': 'Настройки',
          'appBarTitle': 'Мегаом'
        }
      };
}
