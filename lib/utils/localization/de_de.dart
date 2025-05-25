// lib/utils/localization/de_de.dart

const Map<String, String> deDE = {
  // Settings Page
  "settings.title": "Einstellungen",
  "settings.language": "Sprache",
  "settings.selectLanguage": "Sprache auswählen",
  "settings.profile": "Profil",
  "settings.currency": "Währung",
  "settings.selectCurrency": "Währung auswählen",

  // Currency Names
  "currency.try": "Türkische Lira (₺)",
  "currency.usd": "US-Dollar (\$)",
  "currency.eur": "Euro (€)",
  "currency.gbp": "Britisches Pfund (£)",
  "currency.jpy": "Japanischer Yen (¥)",
  "currency.rub": "Russischer Rubel (₽)",
  "currency.inr": "Indische Rupie (₹)",
  "currency.cny": "Chinesischer Yuan (¥)",
  "currency.krw": "Südkoreanischer Won (₩)",
  "currency.myr": "Malaysischer Ringgit (RM)",
  "currency.brl": "Brasilianischer Real (R\$)",
  "currency.zar": "Südafrikanischer Rand (R)",
  "currency.sek": "Schwedische Krone (kr)",
  "currency.chf": "Schweizer Franken (CHF)",
  "currency.aud": "Australischer Dollar (A\$)",
  "currency.cad": "Kanadischer Dollar (C\$)",

  // Profile Page
  "personal_info": "Persönliche Informationen",
  "preferences": "Präferenzen",
  "about_app": "Über die App",
  "app_version": "App-Version",
  "privacy_policy": "Datenschutzrichtlinie",
  "privacy_policy_content": """<html>
<head>
<meta charset="UTF-8">
<title>Datenschutzrichtlinie</title>
</head>
<body>
<h1>PocketPath Datenschutzrichtlinie</h1>
<p>Zuletzt aktualisiert: 24.05.2025</p>

<h2>Einleitung</h2>
<p>Wir legen großen Wert auf Ihre Privatsphäre bei der Nutzung der PocketPath-Anwendung. Diese Datenschutzrichtlinie erklärt, wie PocketPath Ihre persönlichen Daten sammelt, verwendet und schützt.</p>

<h2>Informationen, die wir sammeln</h2>
<ul>
  <li><strong>Kontoinformationen:</strong> Ihre E-Mail-Adresse, Vorname und Nachname.</li>
  <li><strong>Finanzdaten:</strong> Informationen, die Sie über Ihre Ziele, Ausgaben und Einnahmen eingeben.</li>
  <li><strong>Nutzungsdaten:</strong> Daten darüber, wie Sie die Anwendung nutzen.</li>
</ul>

<h2>Verwendung der Daten</h2>
<p>Wir verwenden die gesammelten Informationen für folgende Zwecke:</p>
<ul>
  <li>Um unseren Service bereitzustellen und zu verbessern</li>
  <li>Um Ihr Konto zu verwalten</li>
  <li>Um personalisierte Erfahrungen zu bieten</li>
  <li>Um die Funktionalität der Anwendung zu verbessern</li>
</ul>

<h2>Datensicherheit</h2>
<p>Wir implementieren branchenübliche Sicherheitsmaßnahmen zum Schutz Ihrer persönlichen Daten. Ihre Informationen werden sicher in der Firebase-Infrastruktur gespeichert.</p>

<h2>Datenweitergabe</h2>
<p>Wir teilen Ihre persönlichen Daten nicht ohne Ihre ausdrückliche Zustimmung mit Dritten. Wir geben Informationen nur weiter, wenn dies zur Erfüllung unserer gesetzlichen Verpflichtungen erforderlich ist.</p>

<h2>Ihre Rechte</h2>
<p>Sie haben folgende Rechte bezüglich Ihrer persönlichen Daten:</p>
<ul>
  <li>Zugriff auf Ihre Daten</li>
  <li>Korrektur Ihrer Daten</li>
  <li>Anfrage zur Löschung Ihrer Daten</li>
  <li>Einschränkung der Nutzung Ihrer Daten</li>
</ul>

<h2>Kontakt</h2>
<p>Wenn Sie Fragen oder Bedenken zu unserer Datenschutzrichtlinie haben, kontaktieren Sie uns bitte.</p>
</body>
</html>""",
  "developer": "Entwickler: Furkan Akif ISLEK",
  "noEmail": "Keine E-Mail gefunden",
  "version.number": "1.0.0",
  "profile.deleteAccountImportant": "Konto löschen",
  "profile.deleteAccountImportantText":
      "Sind Sie sicher, dass Sie Ihr Konto löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden.",
  "profile.cancel": "Abbrechen",
  "profile.delete": "Löschen",
  "profile.errorDeletingAccount": "Fehler beim Löschen des Kontos",
  "profile.deleteAccountButton": "Konto löschen",

  // Profile Page
  "logout": "Abmelden",
  "account": "Konto",
  "general.done": "Fertig",

  // Login Page
  "login.title": "In Ihr Konto einloggen",
  "login.noAccount": "Haben Sie kein Konto?",
  "login.signUp": "Registrieren",
  "login.emailLabel": "Ihre E-Mail",
  "login.passwordLabel": "Geben Sie Ihr Passwort ein",
  "login.loginButton": "Einloggen",
  "login.forgotPassword": "Passwort vergessen?",
  "login.resetPasswordSent": "E-Mail zum Zurücksetzen des Passworts gesendet!",
  "login.pleaseEnterEmail": "Bitte geben Sie Ihre E-Mail-Adresse ein.",

  // Login Error Messages
  "login.error.invalidEmail":
      "Sie haben eine ungültige E-Mail-Adresse eingegeben.",
  "login.error.userDisabled": "Der Benutzer wurde deaktiviert.",
  "login.error.wrongCredentials":
      "Die eingegebenen Informationen sind falsch. Bitte versuchen Sie es erneut.",
  "login.error.emailInUse": "Diese E-Mail-Adresse wird bereits verwendet.",
  "login.error.notAllowed": "Dieser Vorgang wurde nicht erlaubt.",
  "login.error.verifyEmail":
      "Bitte bestätigen Sie Ihre E-Mail-Adresse, bevor Sie sich anmelden.",
  "login.error.generic":
      "Es ist ein Fehler aufgetreten. Bitte versuchen Sie es später noch einmal.",

  // Register Page
  "register.title": "Registrieren Sie sich für die PocketPath-App",
  "register.haveAccount": "Haben Sie bereits ein Konto?",
  "register.signIn": "Einloggen",
  "register.fullName": "Vollständiger Name",
  "register.surname": "Nachname",
  "register.email": "Ihre E-Mail",
  "register.password": "Geben Sie Ihr Passwort ein",
  "register.confirmPassword": "Geben Sie Ihr Passwort erneut ein",
  "register.registerButton": "Registrieren",

  // Register Error Messages
  "register.error.passwordMismatch": "Passwörter stimmen nicht überein.",
  "register.error.fillAllFields": "Füllen Sie alle Felder aus.",
  "register.error.generic": "Ein Fehler ist aufgetreten",

  // Register Confirm Page
  "register_confirm.title": "Überprüfen Sie Ihre E-Mail",
  "register_confirm.message":
      "Registrierung erfolgreich. Bitte bestätigen Sie Ihr Konto mit dem Link, der an Ihre E-Mail-Adresse gesendet wurde.",
  "register_confirm.button": "Bestätigen",

  // Password Confirm Page
  "password_confirm.title": "Überprüfen Sie Ihre E-Mail",
  "password_confirm.message":
      "Wir haben Ihnen Informationen zum Zurücksetzen Ihres Passworts gesendet",
  "password_confirm.button": "Bestätigen",

  // Reset Password Page
  "reset_password.title": "Passwort zurücksetzen",
  "reset_password.message":
      "Geben Sie Ihre E-Mail-Adresse ein, und wir senden Ihnen weitere Anweisungen zum Zurücksetzen des Passworts.",
  "reset_password.emailLabel": "Ihre E-Mail",
  "reset_password.button": "Zurücksetzen",
  "reset_password.error.enterEmail": "Bitte geben Sie Ihre E-Mail-Adresse ein.",

  // Introduction Pages
  "intro.skip": "Überspringen",
  "intro.next": "Weiter",
  "intro.done": "Fertig",

  // Introduction Page 1
  "intro.page1.text":
      "Finden Sie es schwierig, Ihre Ausgaben und Ersparnisse zu kontrollieren? Mit PocketPath ist dieses Problem leicht zu lösen.",

  // Introduction Page 2
  "intro.page2.title": "Erster Schritt",
  "intro.page2.text":
      "Sie müssen ein Ziel für die Ausgabenkontrolle festlegen. Sobald Sie ein Ziel haben, können Sie Ihre Ausgaben aufzeichnen.",
  "intro.page2.quote":
      "Wenn Sie sich Ziele setzen und diese mit aller Entschlossenheit verfolgen, werden Ihre Talente Sie an Orte führen, die Sie erstaunen werden.",
  "intro.page2.author": "- Les Brown",

  // Introduction Page 3
  "intro.page3.title": "Zweiter Schritt",
  "intro.page3.text":
      "Sie können Ziele einsehen und entsprechend Ausgaben und Einnahmen festlegen. Sie können Ihre regelmäßigen Ausgaben und Ihre erreichten Ziele verfolgen.",
  "intro.page3.quote":
      "Es gibt keinen günstigen Wind für den Seemann, der nicht weiß, wohin er segeln will.",
  "intro.page3.author": "- Seneca",

  // Home Page Components
  "home.title.hello": "Hallo",
  "home.title.welcomeBack": "Willkommen zurück!",
  "home.budget.balance": "Saldo",
  "home.budget.noTarget": "Sie haben noch kein Ziel eingegeben",
  "home.budget.createNewTask": "Neue Aufgabe erstellen",
  "home.budget.selectTargetPlan": "Zielplan auswählen",
  "home.budget.budget": "Budget:",

  // Tab Period
  "home.tab.day": "Tag",
  "home.tab.month": "Monat",
  "home.tab.yearly": "Jährlich",

  // Cost Component
  "home.cost.expense": "Ausgabe",
  "home.cost.income": "Einnahme",
  "home.cost.delete.title": "Kosten löschen",
  "home.cost.delete.message":
      "Sind Sie sicher, dass Sie diese Kosten löschen möchten?",
  "home.cost.delete.cancel": "Abbrechen",
  "home.cost.delete.confirm": "Löschen",

  // Categories
  "category.shopping": "Einkaufen",
  "category.healthy": "Gesundheit",
  "category.food": "Lebensmittel",
  "category.school": "Schule",
  "category.holiday": "Urlaub",
  "category.electronic": "Elektronik",
  "category.other": "Sonstiges",

  // Add Cost Page
  "addcost.title": "Kosten hinzufügen",
  "addcost.save": "Speichern",
  "addcost.recorded": "Aufgezeichnet",
  "addcost.success": "Kosten erfolgreich aufgezeichnet!",
  "addcost.error": "Fehler",
  "addcost.invalid_budget": "Ungültiger Budgetbetrag",
  "addcost.fill_fields": "Bitte füllen Sie alle Felder aus",
  "addcost.select_target": "Ziel auswählen",
  "addcost.select_target_hint":
      "Wählen Sie ein aktives Ziel wie \"Aktienportfolio\"",
  "addcost.cost_type": "Kostenart",
  "addcost.type_name_hint": "Geben Sie einen Namen ein wie \"NASDAQ ETF\"",
  "addcost.budget_amount": "Budgetbetrag",
  "addcost.category": "Kategorie",
  "addcost.expense": "Ausgabe",
  "addcost.income": "Einnahme",
  "addcost.select_a_target": "Wählen Sie ein Ziel",

  // Analysis Page
  "analysis.title": "Analyse",
  "analysis.select_target": "Ziel auswählen",
  "analysis.please_select_target": "Bitte Ziel auswählen",
  "analysis.expenditures": "Ausgaben",
  "analysis.savings": "Ersparnisse",
  "analysis.total_expenditures": "Gesamtausgaben",
  "analysis.total_savings": "Gesamtersparnisse",
  "analysis.target_progress": "Zielfortschritt",
  "analysis.available": "Verfügbar",
  "analysis.target": "Ziel",

  // Menu Page
  "menu.home": "Startseite",
  "menu.analysis": "Analyse",
  "menu.targets": "Ziele",
  "menu.add_target": "Ziel hinzufügen",
  "menu.profile": "Profil",

  // Target Pages
  "target.title": "Ziel",
  "target.balance": "Saldo",
  "target.target_type": "Zieltyp",
  "target.type_name": "Typname",
  "target.date_picker": "Datumsauswahl",
  "target.select_date": "Datum auswählen",
  "target.budget_amount": "Budgetbetrag",
  "target.save": "Speichern",
  "target.recorded": "Aufgezeichnet",
  "target.success": "Ziel erfolgreich aufgezeichnet!",
  "target.error": "Fehler",
  "target.invalid_budget": "Ungültiger Budgetbetrag",
  "target.fill_fields": "Bitte füllen Sie alle Felder aus",
  "target.set_new_target": "Neues Ziel festlegen",
  "target.passive": "Passiv",
  "target.active": "Aktiv",
  "target.all": "Alle"
};
