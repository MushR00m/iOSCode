cordova.define("com.webank.wemoney.keyboard.WBNumberPadPlugin", function(require, exports, module) { var exec = require('cordova/exec');

var WBNumberPadPlugin = {
    input:null,
    backspace:null,
    longbackspace:null,
    blur:null,

    showKeyboard:function(type, func1, func2 ,fun3,fun4){
        this.input = func1;
        this.backspace = func2;
        this.blur = fun3;
        this.longbackspace = fun4;

        var keyboard = '';
        if(type == 'sfz'){
            keyboard = 'WBNumberPadTypeIdentity';
        }else if(type == 'je'){//带小数点
            keyboard = 'WBNumberPadTypeDecimal';
        }else if(type == 'sz'){//没有小数点
            keyboard = 'WBNumberPadTypeTelphone';
        }else if(type == 'yhk'){
            keyboard = 'WBNumberPadTypeTelphone';
        }

        exec(this.successCallBack, this.failCallBack, 'WBNumberPadPlugin', 'show', [keyboard]);
    },

    hideKeyboardWithAnimation:function(){
        exec(this.successCallBack, this.failCallBack, 'WBNumberPadPlugin', 'hideWithAnimation', []);
    },

    hideKeyboard:function(){
        exec(this.successCallBack, this.failCallBack, 'WBNumberPadPlugin', 'hide', []);
    },

    getEncryptInputData:function(){
        exec(this.successCallBack, this.failCallBack, 'WBNumberPadPlugin', 'getEncryptInputData', []);
    },

    successCallBack:function(){
        //console.log('success');
    },

    failCallBack:function(){
        //console.log('fail');
    },

    onClickButton:function(text){
        if(this.input){
            this.input(text);
        }
    },

    onClickBackSpace:function(){
        if(this.backspace){
            this.backspace();
        }
    },

    onLongClickBackSpace:function(){
        if(this.backspace){
            this.backspace(true);
        }
    },

    onBlur:function(){
        if(this.blur){
            this.blur();
        }
    },

    onGetEncryptData:function(data){
        alert(data);
    },
};

module.exports = WBNumberPadPlugin;
});
