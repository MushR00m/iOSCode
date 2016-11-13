cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
    {
        "file": "plugins/com.webank.hj.token/www/webanktoken.js",
        "id": "com.webank.hj.token.webanktoken",
        "clobbers": [
            "WebankToken"
        ]
    },
    {
        "file": "plugins/org.apache.cordova.device/www/device.js",
        "id": "org.apache.cordova.device.device",
        "clobbers": [
            "device"
        ]
    },
    {
        "file": "plugins/com.webank.hj.appinfo/www/appinfo.js",
        "id": "com.webank.hj.appinfo.appinfo",
        "clobbers": [
            "AppInfo"
        ]
    },
    {
        "file": "plugins/com.webank.hj.statistics/www/statistics.js",
        "id": "com.webank.hj.statistics.statistics",
        "clobbers": [
            "Statistics"
        ]
    },
    {
        "file": "plugins/com.webank.hj.commandchannel/www/cmdchannel.js",
        "id": "com.webank.hj.commandchannel.cmdchannel",
        "clobbers": [
            "CommandChannel"
        ]
    },
    {
        "file": "plugins/cordova-plugin-console/www/console-via-logger.js",
        "id": "cordova-plugin-console.console",
        "clobbers": [
            "console"
        ]
    },
    {
        "file": "plugins/cordova-plugin-console/www/logger.js",
        "id": "cordova-plugin-console.logger",
        "clobbers": [
            "cordova.logger"
        ]
    },
    {
        "file": "plugins/com.plugin.datepicker/www/ios/DatePicker.js",
        "id": "com.plugin.datepicker.DatePicker",
        "clobbers": [
            "datePicker"
        ]
    },
    {
        "file": "plugins/cordova-plugin-splashscreen/www/splashscreen.js",
        "id": "cordova-plugin-splashscreen.SplashScreen",
        "clobbers": [
            "navigator.splashscreen"
        ]
    },
    {
        "file": "plugins/cordova-plugin-inappbrowser/www/inappbrowser.js",
        "id": "cordova-plugin-inappbrowser.inappbrowser",
        "clobbers": [
            "cordova.InAppBrowser.open",
            "window.open"
        ]
    },
    {
        "file": "plugins/mobi.roshka.cordova.callphone/www/callphone.js",
        "id": "mobi.roshka.cordova.callphone.CallPhone",
        "clobbers": [
            "navigator.callphone"
        ]
    },
    {
        "file": "plugins/com.webank.wemoney.keyboard/www/nativekeyboard.js",
        "id": "com.webank.wemoney.keyboard.WBNumberPadPlugin",
        "clobbers": [
            "navigator.WBNumberPadPlugin"
        ]
    },
    {
        "file": "plugins/com.ionic.keyboard/www/keyboard.js",
        "id": "com.ionic.keyboard.keyboard",
        "clobbers": [
            "cordova.plugins.Keyboard"
        ]
    },
    {
        "file": "plugins/cordova-plugin-geolocation/www/Coordinates.js",
        "id": "cordova-plugin-geolocation.Coordinates",
        "clobbers": [
            "Coordinates"
        ]
    },
    {
        "file": "plugins/cordova-plugin-geolocation/www/PositionError.js",
        "id": "cordova-plugin-geolocation.PositionError",
        "clobbers": [
            "PositionError"
        ]
    },
    {
        "file": "plugins/cordova-plugin-geolocation/www/Position.js",
        "id": "cordova-plugin-geolocation.Position",
        "clobbers": [
            "Position"
        ]
    },
    {
        "file": "plugins/cordova-plugin-geolocation/www/geolocation.js",
        "id": "cordova-plugin-geolocation.geolocation",
        "clobbers": [
            "navigator.geolocation"
        ]
    },
    {
        "file": "plugins/cordova-plugin-calendar/www/Calendar.js",
        "id": "cordova-plugin-calendar.Calendar",
        "clobbers": [
            "Calendar"
        ]
    },
    {
        "file": "plugins/cordova-plugin-calendar/test/tests.js",
        "id": "cordova-plugin-calendar.tests"
    },
    {
        "file": "plugins/org.apache.cordova.network-information/www/network.js",
        "id": "org.apache.cordova.network-information.network",
        "clobbers": [
            "navigator.connection",
            "navigator.network.connection"
        ]
    },
    {
        "file": "plugins/org.apache.cordova.network-information/www/Connection.js",
        "id": "org.apache.cordova.network-information.Connection",
        "clobbers": [
            "Connection"
        ]
    },
    {
        "file": "plugins/cordova-plugin-x-toast/www/Toast.js",
        "id": "cordova-plugin-x-toast.Toast",
        "clobbers": [
            "window.plugins.toast"
        ]
    },
    {
        "file": "plugins/cordova-plugin-x-toast/test/tests.js",
        "id": "cordova-plugin-x-toast.tests"
    }
];
module.exports.metadata = 
// TOP OF METADATA
{
    "com.webank.hj.token": "0.1.0",
    "org.apache.cordova.device": "0.2.11",
    "com.webank.hj.appinfo": "0.1.0",
    "com.webank.hj.statistics": "0.1.0",
    "com.webank.hj.commandchannel": "0.1.0",
    "cordova-plugin-whitelist": "1.0.1-dev",
    "cordova-plugin-console": "1.0.1-dev",
    "com.plugin.datepicker": "0.6.0",
    "cordova-plugin-splashscreen": "2.0.0",
    "cordova-plugin-inappbrowser": "1.0.1-dev",
    "mobi.roshka.cordova.callphone": "0.0.1",
    "com.webank.wemoney.keyboard": "0.1.0",
    "com.ionic.keyboard": "1.0.5",
    "cordova-plugin-geolocation": "1.0.1",
    "cordova-plugin-calendar": "4.4.4",
    "org.apache.cordova.network-information": "0.2.15",
    "cordova-plugin-x-toast": "2.3.1"
}
// BOTTOM OF METADATA
});