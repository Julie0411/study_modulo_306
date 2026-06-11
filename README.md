# Study - Modulo 306

App Flutter per supportare lo studio con strumenti semplici:

- timer Pomodoro per sessioni di focus e pausa
- task per organizzare le attivita
- flashcard generate tramite AI locale

Il progetto e pensato come lavoro scolastico ed e ancora in sviluppo.

## Requisiti

Prima di installare l'app servono:

- Flutter SDK installato
- Dart incluso con Flutter
- Android Studio oppure VS Code
- un emulatore Android o un dispositivo fisico
- Xcode, solo se vuoi avviare l'app su iPhone o simulatore iOS
- CocoaPods, solo per iOS

Per controllare che Flutter sia configurato correttamente:

```bash
flutter doctor
```

Se Flutter segnala problemi, risolvili prima di continuare.

## Installazione

1. Clona o scarica il progetto.

```bash
git clone https://github.com/Julie0411/study_modulo_306.git
cd study_modulo_306
```

Se hai gia il progetto sul computer, entra semplicemente nella cartella del progetto.

2. Installa le dipendenze Flutter.

```bash
flutter pub get
```

3. Avvia un emulatore o collega un dispositivo.

Per vedere i dispositivi disponibili:

```bash
flutter devices
```

4. Avvia l'app.

```bash
flutter run
```

Se ci sono piu dispositivi collegati, puoi scegliere quello da usare:

```bash
flutter run -d <id-dispositivo>
```

## Installazione su Android

Per Android serve Android Studio con almeno un emulatore configurato, oppure un telefono Android collegato con debug USB attivo.

Comando di avvio:

```bash
flutter run
```

Per creare un file APK installabile:

```bash
flutter build apk
```

Il file generato si trova di solito in:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Installazione su iOS

Per iOS serve un Mac con Xcode installato.

Installa le dipendenze iOS:

```bash
cd ios
pod install
cd ..
```

Poi avvia l'app:

```bash
flutter run
```

Per creare una build iOS:

```bash
flutter build ios
```

## Flashcard con AI locale

La generazione delle flashcard usa un servizio locale all'indirizzo:

```text
http://localhost:11434/api/chat
```

L'app si aspetta il modello:

```text
gemma3n
```

Per usare questa funzione devi avere un server AI locale compatibile avviato sulla porta `11434`, ad esempio Ollama, e il modello richiesto disponibile.

Esempio con Ollama:

```bash
ollama pull gemma3n
ollama serve
```

Poi apri l'app e usa la sezione per generare flashcard.

## Comandi utili

Aggiornare le dipendenze:

```bash
flutter pub upgrade
```

Analizzare il codice:

```bash
flutter analyze
```

Eseguire i test:

```bash
flutter test
```

Pulire la build:

```bash
flutter clean
flutter pub get
```

## Problemi comuni

Se l'app non parte, controlla prima:

- che `flutter doctor` non segnali errori importanti
- che un emulatore o dispositivo sia acceso
- che le dipendenze siano installate con `flutter pub get`
- per iOS, che `pod install` sia stato eseguito nella cartella `ios`
- per le flashcard AI, che il servizio locale sia avviato su `localhost:11434`

## Tecnologie

- Flutter
- Dart
- Android
- iOS
- API HTTP locale per generazione flashcard
