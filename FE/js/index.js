import { $ ,$$ } from "./util"

//regexObj.test(str)


let checkCondition =/^[a-zA-Z0-9]{4,12}$/.match();
let checkId=/[]/;


const checkId = ()=>{
    let checkIdCondition=/^[a-z0-9]{4,20}$/;
}


var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 이메일이 적합한지 검사할 정규식

if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
    return false;
}
if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
    return false;
}
  
  