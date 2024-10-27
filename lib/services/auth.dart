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

  Future<void> saveExpense({
    required String name,
    required String category,
    required double budget,
    required bool isExpense,
  }) async {
    try {
      // Şu anki kullanıcıyı al
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found");

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
      if (user == null) throw Exception("User Not Found");

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

  Future<List<Map<String, dynamic>>> getExpenses({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("Kullanıcı bulunamadı");

      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('expenses')
          .where('date', isGreaterThanOrEqualTo: startDate)
          .where('date', isLessThanOrEqualTo: endDate)
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print("Hata oluştu: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getActiveTargets() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("Kullanıcı bulunamadı");

      DateTime now = DateTime.now();

      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('target')
          .where('endDate', isGreaterThan: now)
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print("Hata oluştu: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMonthlyExpenses() async {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
    return await getExpenses(startDate: startOfMonth, endDate: endOfMonth);
  }
}
