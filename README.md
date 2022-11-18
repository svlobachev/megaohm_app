Настройка темы:
https://rydmike.com/flexcolorscheme/themesplayground-v6/#/

Комманды генерации:

splash screen сгенерировать из flutter_native_splash.yaml файла;
flutter pub run flutter_native_splash:create

Полный перечень доступных параметров для Dart представлен здесь. 
А для любого другого генератора список этих параметров можно узнать, выполнив следующую консольную команду:

openapi-generator config-help -g dart-dio

Пример генерации из официальной докуменетации:
openapi-generator generate -i https://petstore.swagger.io/v2/swagger.yaml -g dart-dio -o .pet_api --additional-properties pubName=pet_api

Генерируем наш API авторизации:
openapi-generator generate -i app-auth-api-swagger.yaml -g dart-dio -o .megaohm_app_api --additional-properties pubName=megaohm_app_api



cd .megaohm_app
flutter pub get  
flutter pub run build_runner build --delete-conflicting-outputs
