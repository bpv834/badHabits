// Firebase Functions와 Admin SDK를 가져옵니다.
const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Admin SDK를 초기화합니다.
admin.initializeApp();

// Firestore 문서 상태 업데이트 함수
// 파이어 스토어 서버 시간은 LA 시간이고
exports.updateRoomStatus = functions.region("asia-northeast3").pubsub.schedule("every day 07:00").onRun(async (context) => {
    const db = admin.firestore();
    const roomsRef = db.collection("rooms");
    const snapshot = await roomsRef.get();
    const batch = db.batch();

    // 현재 UTC 시간을 가져옵니다.
    const currentTimeUTC = admin.firestore.Timestamp.now(); // 현재 UTC 시간
    // UTC 시간을 KST로 변환
    const currentTimeKST = new Date(currentTimeUTC.toMillis() + 17 * 60 * 60 * 1000); // 17시간 추가

 snapshot.forEach((doc) => {
     const data = doc.data();
     const targetDate = data.targetDate;

     console.log("현재 확인중인 rooms 의 문서 Id:", doc.id);
     console.log("문서의 상태:", data.status);
     console.log("현재 한국 서버의 시간:", currentTimeKST);
     console.log("문서의 타겟 데이트 :", targetDate ? targetDate.toDate() : "Invalid");

     if (data.status === "running" && currentTimeKST.getTime() > targetDate.toMillis()) {
         console.log("문서 업데이트 완료!!:", doc.id);
         batch.update(doc.ref, {status: "complete"});
     } else {
         console.log("조건이 맞지 않아 업데이트 보류:", doc.id);
     }
 });

    await batch.commit();
    console.log("Room status updated successfully@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.");
});


