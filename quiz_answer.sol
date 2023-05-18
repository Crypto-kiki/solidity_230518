//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

 // 숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
 // 예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
 // 문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
 // 예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
 // 숫자, 문자 둘 다 적용됨

contract Q5 {
    /*
        함수 내에서 무언가 선언을 하면 push를 이용하지 못함. 동적/정적 상관없음.
        따라서 push하려면 자리까지 정해줘야 함.
    */

    function divideNumber(uint _n) public pure returns(uint, uint[] memory) {
        uint[] memory b = new uint[](getLength(_n));
        
        uint i=getLength(_n);
        while(_n != 0) {
            b[--i] = _n%10;
            _n = _n/10;
        }
        return (b.length, b);
    }

    function getLength(uint _n) public pure returns(uint) {
        uint a;
        while(_n >= 10**a) {
            a++;
        }
        return a;
    }

    /* for에 조건문 삭제가능.
    function getLength(uint _n) public pure returns(uint) {
        for(uint i=0; ; i++) {
            if(_n < 10 ** i){
                return i;
            }
        }
    }
    */

}


contract WHILE {
    // while문은 그 안의 조건이 만족하면 계속 함.
    function while_1(uint _n) public pure returns(uint) {
        uint a;
        /* 아래 함수는 0임. a = 0이기 때문.
            while(_n < a) {
                a++;
            }
            return a;
        */
        while(_n > a) {
            a++;
        }
        return a;
        // 위 함수에서 _n = 10을 넣으면 a = 10으로 리턴됨.
    }

    uint[] public a;
    function while_2(uint _n) public returns(uint[] memory) {
        while(a.length < _n) {
            a.push(a.length);
        }
        return a;
    }

    // 자리수 알아보기 : 10의 제곱승으로.
    function while_3(uint _n) public pure returns(uint) {
        uint _a;
        while(_n > 10 ** _a) {
            _a++;
        }
        return _a;
    }

}

contract REVERSEARRAY {

    

}