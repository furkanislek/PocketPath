// lib/utils/localization/ko_kr.dart

const Map<String, String> koKR = {
  // Settings Page
  'settings.title': '설정',
  'settings.language': '언어',
  'settings.selectLanguage': '언어 선택',
  'settings.profile': '프로필',

  // Profile Page
  'personal_info': '개인 정보',
  'preferences': '환경설정',
  'about_app': '앱 정보',
  'app_version': '앱 버전',
  'privacy_policy': '개인정보 처리방침',
  'developer': '개발자: 푸르칸 아키프 이슬렉',
  'noEmail': '이메일이 없습니다',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': '계정 삭제',
  'profile.deleteAccountImportantText': '정말로 계정을 삭제하시겠습니까? 이 작업은 취소할 수 없습니다.',
  'profile.cancel': '취소',
  'profile.delete': '삭제',
  'profile.errorDeletingAccount': '계정 삭제 중 오류 발생',
  'profile.deleteAccountButton': '계정 삭제',

  // Profile Page
  'logout': '로그아웃',
  'account': '계정',
  "general.done": "완료",

  // Login Page
  "login.title": "계정에 로그인",
  "login.noAccount": "계정이 없으신가요?",
  "login.signUp": "회원가입",
  "login.emailLabel": "이메일",
  "login.passwordLabel": "비밀번호 입력",
  "login.loginButton": "로그인",
  "login.forgotPassword": "비밀번호를 잊으셨나요?",
  "login.resetPasswordSent": "비밀번호 재설정 이메일이 발송되었습니다!",
  "login.pleaseEnterEmail": "이메일 주소를 입력해주세요.",

  // Login Error Messages
  "login.error.invalidEmail": "유효하지 않은 이메일 주소를 입력하셨습니다.",
  "login.error.userDisabled": "사용자가 비활성화되었습니다.",
  "login.error.wrongCredentials": "입력한 정보가 올바르지 않습니다. 다시 시도해주세요.",
  "login.error.emailInUse": "이 이메일 주소는 이미 사용 중입니다.",
  "login.error.notAllowed": "이 과정은 허용되지 않았습니다.",
  "login.error.verifyEmail": "로그인하기 전에 이메일 주소를 확인해주세요.",
  "login.error.generic": "오류가 발생했습니다. 나중에 다시 시도해주세요.",

  // Register Page
  "register.title": "PocketPath 앱에 가입하기",
  "register.haveAccount": "이미 계정이 있으신가요?",
  "register.signIn": "로그인",
  "register.fullName": "이름",
  "register.surname": "성",
  "register.email": "이메일",
  "register.password": "비밀번호 입력",
  "register.confirmPassword": "비밀번호 재입력",
  "register.registerButton": "가입하기",

  // Register Error Messages
  "register.error.passwordMismatch": "비밀번호가 일치하지 않습니다.",
  "register.error.fillAllFields": "모든 항목을 입력해주세요.",
  "register.error.generic": "오류가 발생했습니다",

  // Register Confirm Page
  "register_confirm.title": "이메일을 확인하세요",
  "register_confirm.message":
      "가입이 성공적으로 완료되었습니다. 이메일 주소로 전송된 링크를 통해 계정을 확인해주세요.",
  "register_confirm.button": "확인",

  // Password Confirm Page
  "password_confirm.title": "이메일을 확인하세요",
  "password_confirm.message": "비밀번호 재설정을 위한 정보를 이메일로 발송했습니다",
  "password_confirm.button": "확인",

  // Reset Password Page
  "reset_password.title": "비밀번호 재설정",
  "reset_password.message": "이메일 주소를 입력하시면 비밀번호 재설정 방법에 대한 추가 안내를 보내드립니다.",
  "reset_password.emailLabel": "이메일",
  "reset_password.button": "재설정",
  "reset_password.error.enterEmail": "이메일 주소를 입력해주세요.",

  // Introduction Pages
  "intro.skip": "건너뛰기",
  "intro.next": "다음",
  "intro.done": "완료",

  // Introduction Page 1
  "intro.page1.text":
      "지출과 저축을 관리하기 어렵다고 느끼시나요? PocketPath를 사용하면 이 문제를 쉽게 해결할 수 있습니다.",

  // Introduction Page 2
  "intro.page2.title": "첫 번째 단계",
  "intro.page2.text": "지출 관리를 위한 목표를 설정해야 합니다. 목표가 있으면 지출을 기록할 수 있습니다.",
  "intro.page2.quote":
      "목표를 설정하고 모든 결심을 다해 그것을 추구한다면, 당신의 재능은 당신을 놀라운 곳으로 인도할 것입니다.",
  "intro.page2.author": "- 레스 브라운",

  // Introduction Page 3
  "intro.page3.title": "두 번째 단계",
  "intro.page3.text":
      "목표를 확인하고 그에 따라 지출과 수입을 설정할 수 있습니다. 정기적인 지출과 완료된 목표를 추적할 수 있습니다.",
  "intro.page3.quote": "어디로 가야 할지 모르는 선원에게는 순풍이 없다.",
  "intro.page3.author": "- 세네카",

  // Home Page Components
  "home.title.hello": "안녕하세요",
  "home.title.welcomeBack": "다시 오신 것을 환영합니다!",
  "home.budget.balance": "잔액",
  "home.budget.noTarget": "아직 목표를 입력하지 않았습니다",
  "home.budget.createNewTask": "새 작업 만들기",
  "home.budget.selectTargetPlan": "목표 계획 선택",
  "home.budget.budget": "예산:",

  // Tab Period
  "home.tab.day": "일",
  "home.tab.month": "월",
  "home.tab.yearly": "연간",

  // Cost Component
  "home.cost.expense": "지출",
  "home.cost.income": "수입",
  "home.cost.delete.title": "비용 삭제",
  "home.cost.delete.message": "이 비용을 삭제하시겠습니까?",
  "home.cost.delete.cancel": "취소",
  "home.cost.delete.confirm": "삭제",

  // Categories
  "category.shopping": "쇼핑",
  "category.healthy": "건강",
  "category.food": "음식",
  "category.school": "학교",
  "category.holiday": "휴일",
  "category.electronic": "전자제품",
  "category.other": "기타",
};
