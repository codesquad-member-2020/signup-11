export const CHECK_PATTERN = {
  userID: /^[a-z0-9-_]{5,20}$/,
  password: {
    limit: /.{8,16}$/,
    case: /^(?=.*[A-Z])/,
    number: /^(?=.*[0-9])/,
    symbol: /^(?=.*[!@#$%^*+=-])/
  },
  birthYear: /^(19|20)[0-9]{2}/,
  birthMonth: /^(0[1-9]|1[1-2])/,
  birthDay: /(0[1-9]|[1-2][0-9]|3[0-1])/,
  email: /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i,
  mobile: /^010\d{4}\d{4}$/g
};

export const CHECK_MESSAGE = {
  userID: {
    default: '아이디를 입력하세요',
    errorMsg: '5~20자의 영문 소문자, 숫자, 특수기호(_)(-)만 사용가능합니다.',
    successMsg: '사용 가능한 아이디입니다.',
    existMsg: '이미 사용중인 아이디입니다.'
  },
  password: {
    errorMsg: {
      lengthLimit: '8자 이상 16자 이하로 입력해주세요.',
      upperCase: '영문 대문자를 최소 1자 이상 포함해주세요.',
      number: '숫자를 최소 1자 이상 포함해주세요.',
      symbol: '특수문자를 최소 1자 이상 포함해주세요.'
    },
    successMsg: '안전한 비밀번호 입니다.'
  },
  password_check: {
    errorMsg: '패스워드가 다릅니다.',
    successMsg: '패스워드가 일치합니다.'
  },
  birthYY: {
    suceesMsg: '태어난 월을 선택하세요',
    errorMsg: '19~85세만 가입가능합니다.'
  },
  birthDD: {
    errorMsg: '태어난 일(날짜) 2자리를 정확하게 입력하세요.'
  },
  email: {
    errorMsg: '이메일 주소를 다시 확인해주세요.',
    successMsg: '멋진 이메일이네요!',
  },
  mobile: {
    errorMsg: '형식에 맞지 않는 번호입니다.',
    successMsg: '사용가능한 휴대폰 번호입니다.'
  },
  interests: {
    errorMsg: '3개 이상의 관심사를 입력하세요.',
    successMsg: '',
  }
};