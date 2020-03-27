import {CHECK_PATTERN,CHECK_MESSAGE} from './util/constant.js';
import {getElement,getAllElements} from './util/util.js';
import {signupData} from '../../data/signupData.js';


const form = getElement('.form-wrap')
function handleChangeEvent () {
}

function handleInputEvent ({target}) {
    const id  = target.id;
    switch (id) {
        case 'user-id':
            let id = target.value
            checkId(id,target);
            break;
        case 'password1':
            let password=target.value;
            checkPassword(password,target);
            break;
        case 'password2':
            let currentPwd=target.value;
            let originalPwd =getElement('#password1').value;
            recheckPassword(currentPwd,originalPwd,target);
        case 'name':
            setName(target.value);
            break;
    }
}
    
function init () {
    form.addEventListener('input',handleInputEvent);
    form.addEventListener('change',handleChangeEvent);
}

function checkId (id,target) {
    const messageEl = target.nextElementSibling;
    const checkIdCondition = CHECK_PATTERN.userID.test(id)
    if (checkIdCondition) {
        messageEl.classList.remove('errorId');
        messageEl.innerText = CHECK_MESSAGE.userID.successMsg
        return;
    }
    messageEl.classList.add('errorId');
    messageEl.innerText = CHECK_MESSAGE.userID.errorMsg;
}

function checkPassword (pwd,target) {
    const messageEl = target.nextElementSibling;
    const checkMessage= CHECK_MESSAGE.password;
    
    const checkPwdLength = CHECK_PATTERN.password.limit.test(pwd);
    if(!checkPwdLength) {
        return messageEl.innerText=checkMessage.errorMsg.lengthLimit;
    }
    
    const checkPwdUpperCase = CHECK_PATTERN.password.case.test(pwd);
    if (!checkPwdUpperCase) {
        return messageEl.innerText=checkMessage.errorMsg.upperCase;
    }

    const checkPwdNumber = CHECK_PATTERN.password.number.test(pwd);
    if (!checkPwdNumber) {
        return messageEl.innerText=checkMessage.errorMsg.number;
    }
    const checkPwdSymbol = CHECK_PATTERN.password.symbol.test(pwd);
    if (!checkPwdSymbol) {
        return messageEl.innerText=checkMessage.errorMsg.symbol;
    }
    messageEl.innerText= checkMessage.successMsg;
}

function recheckPassword (currentPwd,originalPwd,target) {
    const messageEl =target.nextElementSibling
    if (currentPwd!==originalPwd) return messageEl.innerText=CHECK_MESSAGE.password_check.errorMsg;
    messageEl.innerText=CHECK_MESSAGE.password_check.successMsg;
}
function setName (name) {
    signupData.name=null;
    if (name) signupData.name = name;
}

window.addEventListener('DOMContentLoaded',init);
// 로그인 후 세션 부여해서 개인정보 조회까지요청
// 프론트에서 설정된 포트로 오는 요청을 가로채서 서버쪽으로 전달