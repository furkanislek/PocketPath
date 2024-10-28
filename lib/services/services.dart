import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var uuid = Uuid();

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> registerUser(
      {required String email,
      required String password,
      required String firstName,
      required String surname}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .set({"firstName": firstName, "surname": surname});
  }

  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<Map<String, dynamic>?> fetchUser() async {
    final currentUserID = Auth().currentUser!.uid;

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .get();

      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        print("User document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }

  Future<void> saveExpense(
      {required String name,
      required String category,
      required double budget,
      required bool isExpense,
      required String targetId,
      required String targetName}) async {
    try {
      // Şu anki kullanıcıyı al
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      // Veriyi Firestore'a kaydet
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('expenses')
          .add({
        'name': name,
        'category': category,
        'budget': budget,
        'isExpense': isExpense,
        'date': DateTime.now(),
        'targetId': targetId,
        'targetName': targetName,
        'uid': user.uid,
      });
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }

  Future<void> saveNewTarget({
    required String name,
    required DateTime endDate,
    required double budget,
  }) async {
    try {
      // Şu anki kullanıcıyı al
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      // Veriyi Firestore'a kaydet
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('target')
          .add({
        'name': name,
        "id": uuid.v4(),
        'endDate': endDate,
        'budget': budget,
        'date': DateTime.now(),
        'uid': user.uid,
      });
    } catch (e) {}
  }

  Future<List<Map<String, dynamic>>> getExpenses() async {
    try {
      // Firestore'dan tüm expenses verilerini çek
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('expenses')
          .get();

      // expenses listesini oluştur
      List<Map<String, dynamic>> expenses = snapshot.docs.map((doc) {
        return {
          'budget': doc['budget'],
          'category': doc['category'],
          'date': doc['date'],
          'isExpense': doc['isExpense'],
          'name': doc['name'],
          'targetId': doc['targetId'],
          'targetName': doc['targetName'],
          'uid': doc['uid'],
        };
      }).toList();

      return expenses;
    } catch (e) {
      print("Error fetching expenses: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getExpensesByTargetIdWithDate({
    required String targetId,
    required DateTime nowdate,
    required DateTime startDate,
  }) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      // Step 1: Fetch expenses only by targetId
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('expenses')
          .where('targetId', isEqualTo: targetId)
          .get();

      // Step 2: Filter the documents by date within the code
      List<Map<String, dynamic>> expenses = snapshot.docs
          .map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final expenseDate = (data['date'] as Timestamp).toDate();

            // Apply date filter in code
            if (expenseDate.isAfter(startDate) &&
                expenseDate.isBefore(nowdate)) {
              return data;
            }
            return null; // Return null for items outside date range
          })
          .whereType<Map<String, dynamic>>() // Remove null entries
          .toList();

      print("Expenses :   ${expenses.toString()}");
      return expenses;
    } catch (e) {
      print("Error fetching expenses: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getActiveTargets() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      DateTime now = DateTime.now();

      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('target')
          .where('endDate', isGreaterThan: now)
          .get();

      var result = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      result.sort((a, b) => b['date'].compareTo(a['date']));

      return result;
    } catch (e) {
      print("Hata oluştu: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getPassiveTargets() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      DateTime now = DateTime.now();

      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('target')
          .where('endDate', isLessThan: now)
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print("Hata oluştu: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getAllTargets() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('target')
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getTargetById(String targetId) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('target')
          .where('id', isEqualTo: targetId)
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMonthlyExpenses(
      {required String selectedTargetId}) async {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month - 1, 0);
    DateTime endOfMonth = DateTime.now();
    var result = await getExpensesByTargetIdWithDate(
        targetId: selectedTargetId,
        startDate: startOfMonth,
        nowdate: endOfMonth);

    return result;
  }

  Future<List<Map<String, dynamic>>> getDailyExpenses(
      {required String selectedTargetId}) async {
    DateTime now = DateTime.now();
    DateTime startOfMonth = now.subtract(Duration(days: 1));
    DateTime endOfMonth = now;

    return await getExpensesByTargetIdWithDate(
        targetId: selectedTargetId,
        startDate: startOfMonth,
        nowdate: endOfMonth);
  }

  Future<List<Map<String, dynamic>>> getYearlyExpenses(
      {required String selectedTargetId}) async {
    DateTime now = DateTime.now();
    DateTime startOfYear = DateTime(now.year - 1, now.month, now.day, now.hour,
        now.minute, now.second, now.millisecond, now.microsecond);
    DateTime endOfYear = now;

    return await getExpensesByTargetIdWithDate(
        targetId: selectedTargetId, startDate: startOfYear, nowdate: endOfYear);
  }
}
