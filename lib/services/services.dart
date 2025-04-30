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
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .set({"firstName": firstName, "surname": surname});

    await userCredential.user?.sendEmailVerification();

    await signOut();
  }

  Future<void> signIn({required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user?.emailVerified == false) {
      await _firebaseAuth.signOut();
      throw FirebaseAuthException(
        code: 'email-not-verified',
        message: 'Please verify your email address before logging in.',
      );
    }
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
        return null;
      }
    } catch (e) {
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
      int currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
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
        'timestamp': currentTimestamp,
        'targetId': targetId,
        'targetName': targetName,
        'expensesId': uuid.v4(),
        'uid': user.uid,
      });
    } catch (e) {
    }
  }

  Future<void> deleteCost(String docId) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      final costs =
          _firestore.collection('users').doc(user.uid).collection('expenses');
      QuerySnapshot snapshot =
          await costs.where('expensesId', isEqualTo: docId).get();

      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.delete();
      } else {
      }
    } catch (e) {
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
          'expensesId': doc['expensesId'],
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

  Future<List<Map<String, dynamic>>> getExpensesByTargetId( 
      {required String targetId}) async {
    try {
      // Firestore'dan tüm expenses verilerini çek
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('expenses')
          .where('targetId', isEqualTo: targetId)
          .get();

      // expenses listesini oluştur
      List<Map<String, dynamic>> expenses = snapshot.docs.map((doc) {
        return {
          'budget': doc['budget'],
          'category': doc['category'],
          'expensesId': doc['expensesId'],
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
    required int startDate,
  }) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('expenses')
          .where('targetId', isEqualTo: targetId)
          .get();

      List<Map<String, dynamic>> expenses = snapshot.docs
          .map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            if (data['timestamp'] * 1000 > startDate) {
              return data;
            }
            return null;
          })
          .whereType<Map<String, dynamic>>()
          .toList();
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
    DateTime startOfMonth = DateTime(now.year, now.month - 1, 0).toLocal();
    var result = await getExpensesByTargetIdWithDate(
      targetId: selectedTargetId,
      startDate: startOfMonth.millisecondsSinceEpoch,
    );

    return result;
  }

  Future<List<Map<String, dynamic>>> getDailyExpenses(
      {required String selectedTargetId}) async {
    DateTime now = DateTime.now();
    DateTime startOfDay = now.subtract(const Duration(hours: 24)).toLocal();

    return await getExpensesByTargetIdWithDate(
        targetId: selectedTargetId,
        startDate: startOfDay.millisecondsSinceEpoch);
  }

  Future<List<Map<String, dynamic>>> getYearlyExpenses(
      {required String selectedTargetId}) async {
    DateTime now = DateTime.now();
    DateTime startOfYear = DateTime(now.year - 1, now.month, now.day, now.hour,
        now.minute, now.second, now.millisecond, now.microsecond);

    return await getExpensesByTargetIdWithDate(
        targetId: selectedTargetId,
        startDate: startOfYear.millisecondsSinceEpoch);
  }
}
