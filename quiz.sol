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


contract NumberAnalyzer {
    function analyzeNumber(uint256 number) public pure returns (uint256, uint256[] memory) {
        uint256 num = number;
        uint256 digitCount = 0;

        // Count the number of digits
        while (num != 0) {
            num /= 10;
            digitCount++;
        }

        num = number;
        uint256[] memory digits = new uint256[](digitCount);

        // Extract each digit
        for (uint256 i = digitCount; i > 0; i--) {
            digits[i - 1] = num % 10;
            num /= 10;
        }

        return (digitCount, digits);
    }
}