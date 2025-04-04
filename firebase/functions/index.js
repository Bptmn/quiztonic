const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("users/" + user.uid);
  await firestore
    .collection("savedQuiz")
    .where("userRef", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection savedQuiz`);
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("userStatistics")
    .where("userRef", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(
          `Deleting document ${doc.id} from collection userStatistics`,
        );
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("folders")
    .where("userRef", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection folders`);
        await doc.ref.delete();
      }
    });
});
