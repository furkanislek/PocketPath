// lib/utils/localization/ja_jp.dart

const Map<String, String> jaJP = {
  // Settings Page
  'settings.title': '設定',
  'settings.language': '言語',
  'settings.selectLanguage': '言語を選択',
  'settings.profile': 'プロフィール',
  'settings.currency': '通貨',
  'settings.selectCurrency': '通貨を選択',

  // Currency Names
  'currency.try': 'トルコリラ (₺)',
  'currency.usd': 'アメリカドル (\$)',
  'currency.eur': 'ユーロ (€)',
  'currency.gbp': 'イギリスポンド (£)',
  'currency.jpy': '日本円 (¥)',
  'currency.rub': 'ロシアルーブル (₽)',
  'currency.inr': 'インドルピー (₹)',
  'currency.cny': '中国元 (¥)',
  'currency.krw': '韓国ウォン (₩)',
  'currency.myr': 'マレーシアリンギット (RM)',
  'currency.brl': 'ブラジルレアル (R\$)',
  'currency.zar': '南アフリカランド (R)',
  'currency.sek': 'スウェーデンクローナ (kr)',
  'currency.chf': 'スイスフラン (CHF)',
  'currency.aud': 'オーストラリアドル (A\$)',
  'currency.cad': 'カナダドル (C\$)',

  // Profile Page
  'personal_info': '個人情報',
  'preferences': '設定',
  'about_app': 'アプリについて',
  'app_version': 'アプリバージョン',
  'privacy_policy': 'プライバシーポリシー',
  'privacy_policy_content': """<html>
<head>
<meta charset="UTF-8">
<title>プライバシーポリシー</title>
</head>
<body>
<h1>PocketPath プライバシーポリシー</h1>
<p>最終更新日: 15/05/2025</p>

<h2>はじめに</h2>
<p>PocketPathアプリケーションを使用する際のプライバシーを重視しています。このプライバシーポリシーでは、PocketPathがどのように個人情報を収集、使用、保護するかを説明します。</p>

<h2>収集する情報</h2>
<ul>
  <li><strong>アカウント情報：</strong> メールアドレス、名前、姓。</li>
  <li><strong>財務データ：</strong> 目標、支出、収入に関して入力された情報。</li>
  <li><strong>使用データ：</strong> アプリケーションの使用方法に関するデータ。</li>
</ul>

<h2>データの使用</h2>
<p>収集した情報は以下の目的で使用します：</p>
<ul>
  <li>サービスの提供と改善</li>
  <li>アカウントの管理</li>
  <li>パーソナライズされた体験の提供</li>
  <li>アプリケーション機能の向上</li>
</ul>

<h2>データセキュリティ</h2>
<p>個人データを保護するために業界標準のセキュリティ対策を実施しています。情報はFirebaseインフラストラクチャで安全に保管されています。</p>

<h2>データ共有</h2>
<p>明示的な同意なしに第三者と個人情報を共有することはありません。法的義務を果たすために必要な場合にのみ情報を共有することがあります。</p>

<h2>あなたの権利</h2>
<p>個人データに関して以下の権利があります：</p>
<ul>
  <li>データへのアクセス</li>
  <li>データの修正</li>
  <li>データの削除要請</li>
  <li>データ使用の制限</li>
</ul>

<h2>連絡先</h2>
<p>プライバシーポリシーに関するご質問や懸念がある場合は、お問い合わせください。</p>
</body>
</html>""",
  'developer': '開発者: Furkan Akif ISLEK',
  'noEmail': 'メールが見つかりません',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'アカウントを削除',
  'profile.deleteAccountImportantText': '本当にアカウントを削除しますか？この操作は元に戻せません。',
  'profile.cancel': 'キャンセル',
  'profile.delete': '削除',
  'profile.errorDeletingAccount': 'アカウント削除中にエラーが発生しました',
  'profile.deleteAccountButton': 'アカウントを削除',

  // Profile Page
  'logout': 'ログアウト',
  'account': 'アカウント',
  "general.done": "完了",

  // Login Page
  "login.title": "アカウントにログイン",
  "login.noAccount": "アカウントをお持ちでないですか？",
  "login.signUp": "新規登録",
  "login.emailLabel": "メールアドレス",
  "login.passwordLabel": "パスワードを入力",
  "login.loginButton": "ログイン",
  "login.forgotPassword": "パスワードをお忘れですか？",
  "login.resetPasswordSent": "パスワードリセットメールが送信されました！",
  "login.pleaseEnterEmail": "メールアドレスを入力してください。",

  // Login Error Messages
  "login.error.invalidEmail": "無効なメールアドレスが入力されました。",
  "login.error.userDisabled": "ユーザーが無効化されています。",
  "login.error.wrongCredentials": "入力された情報が正しくありません。もう一度お試しください。",
  "login.error.emailInUse": "このメールアドレスは既に使用されています。",
  "login.error.notAllowed": "このプロセスは許可されていません。",
  "login.error.verifyEmail": "ログインする前にメールアドレスを確認してください。",
  "login.error.generic": "エラーが発生しました。後でもう一度お試しください。",

  // Register Page
  "register.title": "PocketPathアプリに登録",
  "register.haveAccount": "既にアカウントをお持ちですか？",
  "register.signIn": "ログイン",
  "register.fullName": "名前",
  "register.surname": "姓",
  "register.email": "メールアドレス",
  "register.password": "パスワードを入力",
  "register.confirmPassword": "パスワードを再入力",
  "register.registerButton": "登録",

  // Register Error Messages
  "register.error.passwordMismatch": "パスワードが一致しません。",
  "register.error.fillAllFields": "すべての項目を入力してください。",
  "register.error.generic": "エラーが発生しました",

  // Register Confirm Page
  "register_confirm.title": "メールを確認してください",
  "register_confirm.message": "登録が成功しました。メールアドレスに送信されたリンクでアカウントを確認してください。",
  "register_confirm.button": "確認",

  // Password Confirm Page
  "password_confirm.title": "メールを確認してください",
  "password_confirm.message": "パスワードをリセットするための情報を送信しました",
  "password_confirm.button": "確認",

  // Reset Password Page
  "reset_password.title": "パスワードをリセット",
  "reset_password.message": "メールアドレスを入力すると、パスワードのリセット方法についての詳細な手順をお送りします。",
  "reset_password.emailLabel": "メールアドレス",
  "reset_password.button": "リセット",
  "reset_password.error.enterEmail": "メールアドレスを入力してください。",

  // Introduction Pages
  "intro.skip": "スキップ",
  "intro.next": "次へ",
  "intro.done": "完了",

  // Introduction Page 1
  "intro.page1.text": "支出と貯蓄を管理するのが難しいと感じますか？PocketPathを使えば、この問題は簡単に解決できます。",

  // Introduction Page 2
  "intro.page2.title": "最初のステップ",
  "intro.page2.text": "支出管理のために目標を設定する必要があります。目標ができたら、支出を記録できます。",
  "intro.page2.quote":
      "目標を設定し、あなたが集められるすべての決意をもってそれを追求すれば、あなたの才能はあなたを驚かせる場所へと導くでしょう。",
  "intro.page2.author": "- レス・ブラウン",

  // Introduction Page 3
  "intro.page3.title": "次のステップ",
  "intro.page3.text": "目標を確認し、それに応じて支出と収入を設定できます。定期的な支出や達成した目標を追跡できます。",
  "intro.page3.quote": "行き先を知らない船乗りには、順風は吹かない。",
  "intro.page3.author": "- セネカ",

  // Home Page Components
  "home.title.hello": "こんにちは",
  "home.title.welcomeBack": "おかえりなさい！",
  "home.budget.balance": "残高",
  "home.budget.noTarget": "まだ目標を入力していません",
  "home.budget.createNewTask": "新しいタスクを作成",
  "home.budget.selectTargetPlan": "目標計画を選択",
  "home.budget.budget": "予算：",

  // Tab Period
  "home.tab.day": "日",
  "home.tab.month": "月",
  "home.tab.yearly": "年間",

  // Cost Component
  "home.cost.expense": "支出",
  "home.cost.income": "収入",
  "home.cost.delete.title": "コストを削除",
  "home.cost.delete.message": "このコストを削除してもよろしいですか？",
  "home.cost.delete.cancel": "キャンセル",
  "home.cost.delete.confirm": "削除",

  // Categories
  "category.shopping": "ショッピング",
  "category.healthy": "健康",
  "category.food": "食品",
  "category.school": "学校",
  "category.holiday": "休日",
  "category.electronic": "電子機器",
  "category.other": "その他",

  // Add Cost Page
  "addcost.title": "コストを追加",
  "addcost.save": "保存",
  "addcost.recorded": "記録されました",
  "addcost.success": "コストが正常に記録されました！",
  "addcost.error": "エラー",
  "addcost.invalid_budget": "無効な予算額",
  "addcost.fill_fields": "すべてのフィールドに入力してください",
  "addcost.select_target": "ターゲットを選択",
  "addcost.select_target_hint": "「株式ウォレット」などのアクティブなターゲットを選択",
  "addcost.cost_type": "コストタイプ",
  "addcost.type_name_hint": "「NASDAQ ETF」のような名前を入力",
  "addcost.budget_amount": "予算額",
  "addcost.category": "カテゴリー",
  "addcost.expense": "支出",
  "addcost.income": "収入",
  "addcost.select_a_target": "ターゲットを選択",

  // Analysis Page
  "analysis.title": "分析",
  "analysis.select_target": "ターゲットを選択",
  "analysis.please_select_target": "ターゲットを選択してください",
  "analysis.expenditures": "支出",
  "analysis.savings": "貯蓄",
  "analysis.total_expenditures": "総支出",
  "analysis.total_savings": "総貯蓄",
  "analysis.target_progress": "目標進捗",
  "analysis.available": "利用可能",
  "analysis.target": "目標",

  // Menu Page
  "menu.home": "ホーム",
  "menu.analysis": "分析",
  "menu.targets": "目標",
  "menu.add_target": "目標を追加",
  "menu.profile": "プロフィール",

  // Target Pages
  "target.title": "目標",
  "target.balance": "残高",
  "target.target_type": "目標タイプ",
  "target.type_name": "タイプ名",
  "target.date_picker": "日付選択",
  "target.select_date": "日付を選択",
  "target.budget_amount": "予算額",
  "target.save": "保存",
  "target.recorded": "記録済み",
  "target.success": "目標が正常に記録されました！",
  "target.error": "エラー",
  "target.invalid_budget": "無効な予算額",
  "target.fill_fields": "すべてのフィールドに入力してください",
  "target.set_new_target": "新しい目標を設定",
  "target.passive": "非アクティブ",
  "target.active": "アクティブ",
  "target.all": "すべて"
};
