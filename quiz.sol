//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract QUIZ {
    uint[] numbers;
        // 숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.

    function getNumber(uint _n) public returns(uint, uint[] memory) {
        uint count = 0;  // 자리수
        for(uint i = 1; i >= 1; i++) {
            if(_n < 10**i) {
                count = 1;
                numbers.push(_n);
            }else {
                count = i+1;
                numbers[i] = _n / count;
            }
        }
        return (count, numbers);
    }
}