const { setGlobalOptions } = require("firebase-functions/v2");
const { onValueCreated } = require("firebase-functions/v2/database");
const admin = require("firebase-admin");

admin.initializeApp();

setGlobalOptions({ maxInstances: 10 });

exports.sendAlert = onValueCreated(
  "/incidents/{incidentId}",
  async (event) => {
    const incident = event.data.val();

    const message = {
      topic: "emergency",
      notification: {
        title: "🚨 Emergency Alert",
        body: `New ${incident.type} incident`,
      },
      data: {
        screen: "alert",
      },
    };

    await admin.messaging().send(message);

    console.log("Notification sent!");
  }
);