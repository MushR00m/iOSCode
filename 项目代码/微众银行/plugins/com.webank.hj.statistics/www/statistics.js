cordova.define("com.webank.hj.statistics.statistics", function(require, exports, module) { // 进入页面上报
exports.reportPageStart = function (pageName) {
    cordova.exec(function(){}, function(){}, 'Statistics', 'reportPageStart', [pageName]);
};

// 离开页面上报
exports.reportPageEnd = function (pageName) {
    cordova.exec(function(){}, function(){}, 'Statistics', 'reportPageEnd', [pageName]);
};

// 自定义事件上报（统计次数）
exports.reportEvent = function (eventID, param, reportStrategy) {
    param = param ? param : {};
    param.webVersion = (H5_Ver ? H5_Ver : "");
    console.log(eventID);
    console.log(JSON.stringify(param));
    cordova.exec(function(){}, function(){}, 'Statistics', 'reportEvent', [eventID, param, reportStrategy]);
};

//接口上报
exports.reportInterface = function (param) {
    // MTA接口上报日志拿不到, 接口上报都同时上报一份自定义事件, 待自定义事件能够替代接口上报后, 删除接口上报
    var eventID = param.cgiName;
    if (eventID && eventID.length > 0) {
        var customEventParam = {};
        // timeConsuming, 都用自定义事件上报以后, 自定义时间上报的类型需要区分, 例如此类为耗时上报
        customEventParam.eventType = 'tc';
        customEventParam.resultType = param.resultType;
        customEventParam.retMsg = param.retMsg;
        customEventParam.retCode = param.retCode;
        customEventParam.webVersion = (H5_Ver ? H5_Ver : "");
        customEventParam.timeConsuming = param.timeConsuming;

        cordova.exec(function(){}, function(){}, 'Statistics', 'reportEvent', [eventID, customEventParam, {}]);
    }

    cordova.exec(function(){}, function(){}, 'Statistics', 'reportInterface', [param]);
};

});
