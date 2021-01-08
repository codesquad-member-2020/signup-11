import {
    CHECK_PATTERN,
    CHECK_MESSAGE
} from '../util/constant.js';
import {
    getElement,
    getAllElements
} from '../util/util.js';



const form = getElement('.form-wrap')

function handleInputEvent({
    target
}) {
    const id = target.id;
    switch (id) {
        case 'user-id':
            let id = target.value
            checkId(id, target);
            break;
        case 'password1':
            let password = target.value;
            checkPassword(password, target);
            break;
        case 'password2':
            let currentPwd = target.value;
            let originalPwd = getElement('#password1').value;
            recheckPassword(currentPwd, originalPwd, target);
            break;
        case 'email':
            let email = target.value;
            checkEmail(email, target);
            break;
        case 'phone':
            let phoneNum = target.value;
            checkPhoneNumber(phoneNum, target);
    }
}

function handleChangeEvent({
    target
}) {
    const id = target.id
    switch (id) {
        case 'birth1':
            const birthYear = target.value;
            checkBirthYear(birthYear);
            break;
        case 'birth2':
            const birthDay = target.value;
            checkBirthDay(birthDay);
            break;
        case 'mm':
            const birthMonth = target.value;
            checkMonth(birthMonth)
    }
}

function init() {
    form.addEventListener('input', handleInputEvent);
    form.addEventListener('change', handleChangeEvent);
}

function checkBirthYear(birthYear) {
    const currentYear = new Date().getFullYear();
    const minAge = 19;
    const MaxAge = 85;
    const outOfYearRange = currentYear - birthYear < minAge ||
        currentYear - birthYear > MaxAge;
    const messageEl = getElement('.birth-group .message');
    if (outOfYearRange) {
        messageEl.innerText = CHECK_MESSAGE.birthYY.errorMsg;
        return;
    }
    messageEl.innerText = CHECK_MESSAGE.birthYY.suceesMsg;
}

function checkMonth(birthMonth) {
    console.log(birthMonth)
    if (!!birthMonth) {
        const messageEl = getElement('.birth-contents').nextElementSibling;
        messageEl.innerText = CHECK_MESSAGE.birthDD.errorMsg;
        return;
    }
}

function checkBirthDay(birthDay) {
    const messageEl = getElement('.birth-contents').nextElementSibling;
    const outOfDayRange = !CHECK_PATTERN.birthDay.test(birthDay);
    console.log(outOfDayRange);
    if (!outOfDayRange) {
        return messageEl.innerText = '';
    }
}


function checkId(id, target) {
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

function checkPassword(pwd, target) {
    const messageEl = target.nextElementSibling;
    const checkMessage = CHECK_MESSAGE.password;

    const checkPwdLength = CHECK_PATTERN.password.limit.test(pwd);
    if (!checkPwdLength) {
        return messageEl.innerText = checkMessage.errorMsg.lengthLimit;
    }

    const checkPwdUpperCase = CHECK_PATTERN.password.case.test(pwd);
    if (!checkPwdUpperCase) {
        return messageEl.innerText = checkMessage.errorMsg.upperCase;
    }

    const checkPwdNumber = CHECK_PATTERN.password.number.test(pwd);
    if (!checkPwdNumber) {
        return messageEl.innerText = checkMessage.errorMsg.number;
    }
    const checkPwdSymbol = CHECK_PATTERN.password.symbol.test(pwd);
    if (!checkPwdSymbol) {
        return messageEl.innerText = checkMessage.errorMsg.symbol;
    }
    messageEl.innerText = checkMessage.successMsg;
}

function recheckPassword(currentPwd, originalPwd, target) {
    const messageEl = target.nextElementSibling
    if (currentPwd !== originalPwd) return messageEl.innerText = CHECK_MESSAGE.password_check.errorMsg;
    messageEl.innerText = CHECK_MESSAGE.password_check.successMsg;
}

function checkEmail(value, target) {
    const messageEl = target.nextElementSibling;
    console.log(target, messageEl)
    const checkIdCondition = CHECK_PATTERN.email.test(value);
    if (checkIdCondition) {
        messageEl.classList.remove('errorId');
        messageEl.innerText = CHECK_MESSAGE.email.successMsg;
        return;
    }
    messageEl.classList.add('errorId');
    messageEl.innerText = CHECK_MESSAGE.email.errorMsg;
}

function checkPhoneNumber(value, target) {
    const messageEl = target.nextElementSibling;
    console.log(target, messageEl)
    const checkIdCondition = CHECK_PATTERN.mobile.test(value);
    if (checkIdCondition) {
        messageEl.classList.remove('errorId');
        messageEl.innerText = CHECK_MESSAGE.mobile.successMsg;
        return;
    }
    messageEl.classList.add('errorId');
    messageEl.innerText = CHECK_MESSAGE.mobile.errorMsg;
}



window.addEventListener('DOMContentLoaded', init);
// 로그인 후 세션 부여해서 개인정보 조회까지요청
// 프론트에서 설정된 포트로 오는 요청을 가로채서 서버쪽으로 전달