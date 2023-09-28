/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendNotification = functions.firestore
    .document('forum/{postId}/comments/{commentId}')
    .onCreate(async (snapshot, context) => {
        const postId = context.params.postId;
        const commentData = snapshot.data();

        // Post sahibinin bilgilerini al
        const postDocument = await admin.firestore().doc(`forum/${postId}`).get();
        const postOwnerUid = postDocument.data().ownerUid;

        // Post sahibinin FCM tokenini al
        const tokenSnapshot = await admin.firestore().collection('users').doc(postOwnerUid).collection('tokens').limit(1).get();
        
        if (!tokenSnapshot.empty) {
            const postOwnerToken = tokenSnapshot.docs[0].id;

            // Bildirim mesajını tanımla
            const message = {
                token: postOwnerToken,
                notification: {
                    title: 'Yeni Yorum',
                    body: `${commentData.username} adlı kullanıcı bir yorum bıraktı.`,
                },
                webpush: {
                    fcmOptions: {
                        link: 'YOUR_APP_LINK_HERE' // Uygulamanızın linkini buraya ekleyin
                    }
                },
                android: {
                    notification: {
                        clickAction: 'FLUTTER_NOTIFICATION_CLICK',
                        tag: 'forumbildirim'
                    },
                },
            };
            

            // Bildirimi gönder
            return admin.messaging().send(message);
        } else {
            console.log(`No token for user: ${postOwnerUid}`);
            return null;
        }
    });


