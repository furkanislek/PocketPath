// lib/utils/localization/en_us.dart

const Map<String, String> enUS = {
  // Settings Page
  'settings.title': 'Settings',
  'settings.language': 'Language',
  'settings.selectLanguage': 'Select Language',
  'settings.profile': 'Profile',
  'settings.currency': 'Currency',
  'settings.selectCurrency': 'Select Currency',

  // Currency Names
  'currency.try': 'Turkish Lira (₺)',
  'currency.usd': 'US Dollar (\$)',
  'currency.eur': 'Euro (€)',
  'currency.gbp': 'British Pound (£)',
  'currency.jpy': 'Japanese Yen (¥)',
  'currency.rub': 'Russian Ruble (₽)',
  'currency.inr': 'Indian Rupee (₹)',
  'currency.cny': 'Chinese Yuan (¥)',
  'currency.krw': 'Korean Won (₩)',
  'currency.myr': 'Malaysian Ringgit (RM)',
  'currency.brl': 'Brazilian Real (R\$)',
  'currency.zar': 'South African Rand (R)',
  'currency.sek': 'Swedish Krona (kr)',
  'currency.chf': 'Swiss Franc (CHF)',
  'currency.aud': 'Australian Dollar (A\$)',
  'currency.cad': 'Canadian Dollar (C\$)',

  // Profile Page
  "personal_info": "Personal Information",
  "preferences": "Preferences",
  "about_app": "About App",
  "app_version": "App Version",
  "privacy_policy": "Privacy Policy",
  "privacy_policy_content": """<html>
<head>
<meta charset="UTF-8">
<title>Privacy Policy</title>
</head>
<body>
<h1>PocketPath Privacy Policy</h1>
<p>Last updated: 15/05/2025</p>

<h2>Introduction</h2>
<p>We value your privacy while using the PocketPath application. This Privacy Policy explains how PocketPath collects, uses, and protects your personal information.</p>

<h2>Information We Collect</h2>
<ul>
  <li><strong>Account Information:</strong> Your email address, first name, and surname.</li>
  <li><strong>Financial Data:</strong> Information you enter about your targets, expenses, and income.</li>
  <li><strong>Usage Data:</strong> Data about how you use the application.</li>
</ul>

<h2>Use of Data</h2>
<p>We use the information we collect for the following purposes:</p>
<ul>
  <li>To provide and improve our service</li>
  <li>To manage your account</li>
  <li>To provide personalized experience</li>
  <li>To enhance application functionality</li>
</ul>

<h2>Data Security</h2>
<p>We implement industry-standard security measures to protect your personal data. Your information is securely stored in Firebase infrastructure.</p>

<h2>Data Sharing</h2>
<p>We do not share your personal information with third parties without your explicit consent. We may only share information when required to fulfill our legal obligations.</p>

<h2>Your Rights</h2>
<p>You have the following rights regarding your personal data:</p>
<ul>
  <li>Access to your data</li>
  <li>Correction of your data</li>
  <li>Request deletion of your data</li>
  <li>Restriction of the use of your data</li>
</ul>

<h2>Contact</h2>
<p>If you have any questions or concerns about our privacy policy, please contact us.</p>
</body>
</html>""",
  "developer": "Developer: Furkan Akif ISLEK",
  "noEmail": "No email found",
  "version.number": "1.0.0",
  "profile.deleteAccountImportant": "Delete Account",
  "profile.deleteAccountImportantText":
      "Are you sure you want to delete your account? This action cannot be undone.",
  "profile.cancel": "Cancel",
  "profile.delete": "Delete",
  "profile.errorDeletingAccount": "Error deleting account",
  "profile.deleteAccountButton": "Delete Account",

  // Profile Page
  "logout": "Logout",
  "account": "Account",
  "general.done": "Done",
  "addMedicine.durationPickerTitle": "Select Duration",
  "addMedicine.durationPickerItemText": "{count} days",

  // Login Page
  "login.title": "Login into your account",
  "login.noAccount": "Don't have an account?",
  "login.signUp": "Sign Up",
  "login.emailLabel": "Your e-mail",
  "login.passwordLabel": "Type your password",
  "login.loginButton": "Login",
  "login.forgotPassword": "Forgot Password?",
  "login.resetPasswordSent": "Password reset email sent!",
  "login.pleaseEnterEmail": "Please enter your email address.",

  // Login Error Messages
  "login.error.invalidEmail": "You entered an invalid e-mail address.",
  "login.error.userDisabled": "The user has been deactivated.",
  "login.error.wrongCredentials":
      "The information entered is incorrect. Please try again.",
  "login.error.emailInUse": "This email address is already in use.",
  "login.error.notAllowed": "This process was not allowed.",
  "login.error.verifyEmail":
      "Please verify your email address before logging in.",
  "login.error.generic": "An error has occurred. Please try again later.",

  // Register Page
  "register.title": "Register to PocketPath app",
  "register.haveAccount": "Already have an account?",
  "register.signIn": "Sign In",
  "register.fullName": "Full name",
  "register.surname": "Surname",
  "register.email": "Your e-mail",
  "register.password": "Type your password",
  "register.confirmPassword": "Re-type your password",
  "register.registerButton": "Register",

  // Register Error Messages
  "register.error.passwordMismatch": "Passwords do not match.",
  "register.error.fillAllFields": "Fill all fields.",
  "register.error.generic": "An error occurred",

  // Register Confirm Page
  "register_confirm.title": "Check your e-mail",
  "register_confirm.message":
      "Registration successful. Please confirm your account with the link sent to your e-mail address.",
  "register_confirm.button": "Confirm",

  // Password Confirm Page
  "password_confirm.title": "Check your e-mail",
  "password_confirm.message":
      "We have sent you information to reset your password",
  "password_confirm.button": "Confirm",

  // Reset Password Page
  "reset_password.title": "Reset password",
  "reset_password.message":
      "Enter your e-mail address and we will send you further instructions on how to reset the password.",
  "reset_password.emailLabel": "Your e-mail",
  "reset_password.button": "Reset",
  "reset_password.error.enterEmail": "Please enter your e-mail address.",

  // Introduction Pages
  "intro.skip": "Skip",
  "intro.next": "Next",
  "intro.done": "Done",

  // Introduction Page 1
  "intro.page1.text":
      "Do you find it difficult to control your spending and savings? With Pocketpath, this problem is easy to solve.",

  // Introduction Page 2
  "intro.page2.title": "First Step",
  "intro.page2.text":
      "You need to set a target for spending control. Once you have a target, you can record your spending.",
  "intro.page2.quote":
      "If you set goals and go after them with all the determination you can muster, your gifts will take you places that will amaze you.",
  "intro.page2.author": "- Les Brown",

  // Introduction Page 3
  "intro.page3.title": "Second step",
  "intro.page3.text":
      "You can see goals and set expenses and income accordingly. You can track your periodic expenses, and your completed goals.",
  "intro.page3.quote":
      "There is no favorable wind for the sailor who doesn't know where to go.",
  "intro.page3.author": "- Seneca",

  // Home Page Components
  "home.title.hello": "Hello",
  "home.title.welcomeBack": "Welcome Back!",
  "home.budget.balance": "Balance",
  "home.budget.noTarget": "You Have Not Entered A Target Yet",
  "home.budget.createNewTask": "Create New Task",
  "home.budget.selectTargetPlan": "Select Target Plan",
  "home.budget.budget": "Budget:",

  // Tab Period
  "home.tab.day": "Day",
  "home.tab.month": "Month",
  "home.tab.yearly": "Yearly",

  // Cost Component
  "home.cost.expense": "Expense",
  "home.cost.income": "Income",
  "home.cost.delete.title": "Delete Cost",
  "home.cost.delete.message": "Are you sure you want to delete this cost?",
  "home.cost.delete.cancel": "Cancel",
  "home.cost.delete.confirm": "Delete",

  // Categories
  "category.shopping": "Shopping",
  "category.healthy": "Healthy",
  "category.food": "Food",
  "category.school": "School",
  "category.holiday": "Holiday",
  "category.electronic": "Electronic",
  "category.other": "Other",

  // Add Cost Page
  "addcost.title": "Add Cost",
  "addcost.save": "Save",
  "addcost.recorded": "Recorded",
  "addcost.success": "Cost successfully recorded!",
  "addcost.error": "Error",
  "addcost.invalid_budget": "Invalid budget amount",
  "addcost.fill_fields": "Please fill all fields",
  "addcost.select_target": "Select Target",
  "addcost.select_target_hint": "Select an active target like \"Stock Wallet\"",
  "addcost.cost_type": "Cost Type",
  "addcost.type_name_hint": "Type Name Like \"NASDAQ ETF\"",
  "addcost.budget_amount": "Budget Amount",
  "addcost.category": "Category",
  "addcost.expense": "Expense",
  "addcost.income": "Income",
  "addcost.select_a_target": "Select a Target",

  // Analysis Page
  "analysis.title": "Analysis",
  "analysis.select_target": "Select Target",
  "analysis.please_select_target": "Please Select Target",
  "analysis.expenditures": "Expenditures",
  "analysis.savings": "Savings",
  "analysis.total_expenditures": "Total Expenditures",
  "analysis.total_savings": "Total Savings",
  "analysis.target_progress": "Target Progress",
  "analysis.available": "Available",
  "analysis.target": "Target",

  // Menu Page
  "menu.home": "Home",
  "menu.analysis": "Analysis",
  "menu.targets": "Targets",
  "menu.add_target": "Add Target",
  "menu.profile": "Profile",

  // Target Pages
  "target.title": "Target",
  "target.balance": "Balance",
  "target.target_type": "Target Type",
  "target.type_name": "Type Name",
  "target.date_picker": "Date Picker",
  "target.select_date": "Select Date",
  "target.budget_amount": "Budget Amount",
  "target.save": "Save",
  "target.recorded": "Recorded",
  "target.success": "Target successfully recorded!",
  "target.error": "Error",
  "target.invalid_budget": "Invalid budget amount",
  "target.fill_fields": "Please fill all fields",
  "target.set_new_target": "Set New Target",
  "target.passive": "Passive",
  "target.active": "Active",
  "target.all": "All"
};
