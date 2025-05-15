// lib/utils/localization/zh_cn.dart

const Map<String, String> zhCN = {
  // Settings Page
  'settings.title': '设置',
  'settings.language': '语言',
  'settings.selectLanguage': '选择语言',
  'settings.profile': '个人资料',

  // Profile Page
  'personal_info': '个人信息',
  'preferences': '偏好设置',
  'about_app': '关于应用',
  'app_version': '应用版本',
  'privacy_policy': '隐私政策',
  'developer': '开发者：福坎·阿基夫·伊斯莱克',
  'noEmail': '未找到电子邮箱',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': '删除账户',
  'profile.deleteAccountImportantText': '您确定要删除您的账户吗？此操作无法撤销。',
  'profile.cancel': '取消',
  'profile.delete': '删除',
  'profile.errorDeletingAccount': '删除账户时出错',
  'profile.deleteAccountButton': '删除账户',

  // Profile Page
  'logout': '退出登录',
  'account': '账户',
  "general.done": "完成",

  // Login Page
  "login.title": "登录到您的账户",
  "login.noAccount": "没有账户？",
  "login.signUp": "注册",
  "login.emailLabel": "您的电子邮件",
  "login.passwordLabel": "输入您的密码",
  "login.loginButton": "登录",
  "login.forgotPassword": "忘记密码？",
  "login.resetPasswordSent": "密码重置邮件已发送！",
  "login.pleaseEnterEmail": "请输入您的电子邮件地址。",

  // Login Error Messages
  "login.error.invalidEmail": "您输入了无效的电子邮件地址。",
  "login.error.userDisabled": "用户已被停用。",
  "login.error.wrongCredentials": "输入的信息不正确。请重试。",
  "login.error.emailInUse": "此电子邮件地址已被使用。",
  "login.error.notAllowed": "此过程不被允许。",
  "login.error.verifyEmail": "请在登录前验证您的电子邮件地址。",
  "login.error.generic": "发生错误。请稍后再试。",

  // Register Page
  "register.title": "注册PocketPath应用",
  "register.haveAccount": "已有账户？",
  "register.signIn": "登录",
  "register.fullName": "全名",
  "register.surname": "姓氏",
  "register.email": "您的电子邮件",
  "register.password": "输入您的密码",
  "register.confirmPassword": "重新输入您的密码",
  "register.registerButton": "注册",

  // Register Error Messages
  "register.error.passwordMismatch": "密码不匹配。",
  "register.error.fillAllFields": "填写所有字段。",
  "register.error.generic": "发生错误",

  // Register Confirm Page
  "register_confirm.title": "检查您的电子邮件",
  "register_confirm.message": "注册成功。请使用发送到您电子邮件地址的链接确认您的账户。",
  "register_confirm.button": "确认",

  // Password Confirm Page
  "password_confirm.title": "检查您的电子邮件",
  "password_confirm.message": "我们已向您发送了重置密码的信息",
  "password_confirm.button": "确认",

  // Reset Password Page
  "reset_password.title": "重置密码",
  "reset_password.message": "输入您的电子邮件地址，我们将向您发送有关如何重置密码的进一步说明。",
  "reset_password.emailLabel": "您的电子邮件",
  "reset_password.button": "重置",
  "reset_password.error.enterEmail": "请输入您的电子邮件地址。",

  // Introduction Pages
  "intro.skip": "跳过",
  "intro.next": "下一步",
  "intro.done": "完成",

  // Introduction Page 1
  "intro.page1.text": "您是否发现控制支出和储蓄很困难？使用PocketPath，这个问题很容易解决。",

  // Introduction Page 2
  "intro.page2.title": "第一步",
  "intro.page2.text": "您需要为支出控制设定一个目标。一旦您设定了目标，就可以记录您的支出。",
  "intro.page2.quote": "如果您设定目标并以全部的决心追求它们，您的天赋将带您到令您惊讶的地方。",
  "intro.page2.author": "- 莱斯·布朗",

  // Introduction Page 3
  "intro.page3.title": "第二步",
  "intro.page3.text": "您可以查看目标并相应设置支出和收入。您可以跟踪定期支出和已完成的目标。",
  "intro.page3.quote": "对于不知道去向的水手来说，没有顺风。",
  "intro.page3.author": "- 塞内卡",

  // Home Page Components
  "home.title.hello": "您好",
  "home.title.welcomeBack": "欢迎回来！",
  "home.budget.balance": "余额",
  "home.budget.noTarget": "您尚未输入目标",
  "home.budget.createNewTask": "创建新任务",
  "home.budget.selectTargetPlan": "选择目标计划",
  "home.budget.budget": "预算：",

  // Tab Period
  "home.tab.day": "日",
  "home.tab.month": "月",
  "home.tab.yearly": "年",

  // Cost Component
  "home.cost.expense": "支出",
  "home.cost.income": "收入",
  "home.cost.delete.title": "删除费用",
  "home.cost.delete.message": "您确定要删除此费用吗？",
  "home.cost.delete.cancel": "取消",
  "home.cost.delete.confirm": "删除",

  // Categories
  "category.shopping": "购物",
  "category.healthy": "健康",
  "category.food": "食品",
  "category.school": "学校",
  "category.holiday": "假期",
  "category.electronic": "电子产品",
  "category.other": "其他",

  // Add Cost Page
  "addcost.title": "添加费用",
  "addcost.save": "保存",
  "addcost.recorded": "已记录",
  "addcost.success": "费用成功记录！",
  "addcost.error": "错误",
  "addcost.invalid_budget": "无效的预算金额",
  "addcost.fill_fields": "请填写所有字段",
  "addcost.select_target": "选择目标",
  "addcost.select_target_hint": "选择一个活动目标，如\"股票钱包\"",
  "addcost.cost_type": "费用类型",
  "addcost.type_name_hint": "输入名称，如\"纳斯达克ETF\"",
  "addcost.budget_amount": "预算金额",
  "addcost.category": "类别",
  "addcost.expense": "支出",
  "addcost.income": "收入",
  "addcost.select_a_target": "选择一个目标"
};
