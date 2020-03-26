import {CHECK_PATTERN,CHECK_MESSAGE} from '../util/constant.js';
import {getElement,getAllElements} from '../util/util.js';



const form = getElement('.form-wrap')
function handleChangeEvent () {
    //생년월일 창
}

function handleInputEvent ({target}) {
    const id  = target.id;
    switch (id) {
        case 'user-id':
            checkId(id);
        }
    }
    
    function init () {
        form.addEventListener('input',handleInputEvent);
        form.addEventListener('change',handleChangeEvent);
    }
function checkId (id) {
    const checkIdCondition = CHECK_PATTERN.userID.test(id);
    console.log(checkIdCondition)
    if (!checkIdCondition) {
        
    }
}

window.addEventListener('DOMContentLoaded',init)