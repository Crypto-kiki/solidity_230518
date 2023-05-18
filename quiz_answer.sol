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

    /* for에 조건문 삭제가능
    function getLength(uint _n) public pure returns(uint) {
        for(uint i=0; ; i++) {
            if(_n < 10 ** i){
                return i;
            }
        }
    }
    */

    //abcd -> 0x 61 62 63 64 임. 따라서 길이를 먼저 구해야됨.
    function bytesToBytesArray2(bytes memory _bytes) public pure returns(bytes1[] memory) {
        bytes1[] memory _bytes1 = new bytes1[](_bytes.length);
        for(uint i = 0; i < _bytes1.length; i++) {
            _bytes1[i] = _bytes[i];
        }
        return _bytes1;
    }

    function stringToBytes1Array(string memory _string) public pure returns(uint, string[] memory) {
        bytes1[] memory b_array = new bytes1[](bytes(_string).length);
        b_array = bytesToBytesArray2(bytes(_string));
        
        string[] memory s_array = new string[](b_array.length);
        for(uint i = 0; i < s_array.length; i++) {
            s_array[i] = string(abi.encodePacked(b_array[i]));
        }
        return (s_array.length, s_array);
    }

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
    
    function reverse1(uint[] calldata numbers) public pure returns(uint[] memory) {
        uint[] memory _reverse = new uint[](numbers.length);
        for(uint i = 0; i < numbers.length; i++) {
            _reverse[i] = numbers[numbers.length - i - 1];
        }
        return _reverse;
    }
    /*
    calldata는 원본을 갖고와서 쓰는거고 memory는 카피해서 사용. 더 힘든게 memory임.
    copy해서 사용하기 때문.
    memory는 값이 변할 수 있음. 카피기 때문. calldata는 안변함. 원본이기 때문.
    하지만 위 코드에서 보면 numbers memory는 값이 안변함. 값을 주기는 해도!
    따라서 calldata로 써도 됨. calldata가 가스비 덜 듬.
    */

    // 아래 코드는 앞뒤 1:1로 reverse 시키는 코드임.
    function reverse2(uint[] memory numbers) public pure returns(uint[] memory) {
        for(uint i = 0; i < numbers.length / 2; i++) {
            (numbers[i], numbers[numbers.length - 1 - i]) = (numbers[numbers.length - 1 - i], numbers[i]);
        }
        return numbers;
    }

}


contract BYTES_LENGTH {
// bytes는 special한 array 타입임. = 길이를 구할 수 있다. bytes <-> string 가능.
    function getLength1(bytes1 a) public pure returns(uint) {
        return a.length;
    }  // 0x11 -> 1
    function getLength2(bytes2 a) public pure returns(uint) {
        return a.length;
    }  // 0x1111 -> 2
    function getLength3(bytes3 a) public pure returns(uint) {
        return a.length;
    }  // 0x111111 -> 3

    function getLength(bytes memory a) public pure returns(uint) {
        return a.length;
    }  // 동적으로 들어간 만큼 길이가 나옴.

    /*
    abc에서 첫 글자를 뽑아내려면?
    abc를 bytes로 바꾸고 bytes1을 꺼내서 다시 string으로.
    그런데 쉽게 하는법이 있었음.
    */

    function bytes1ToString(bytes1 a) public pure returns(string memory) {
        string memory _a = string(abi.encodePacked(a));
        return _a;
    }

    // 정적 -> 동적
    function bytesToBytesArray1(bytes memory _a) public pure returns(bytes1, bytes1) {
        return (_a[0], _a[1]);
    }


    //abcd -> 0x 61 62 63 64 임. 따라서 길이를 먼저 구해야됨.
    function bytesToBytesArray2(bytes memory _bytes) public pure returns(bytes1[] memory) {
        bytes1[] memory _bytes1 = new bytes1[](_bytes.length);
        for(uint i = 0; i < _bytes1.length; i++) {
            _bytes1[i] = _bytes[i];
        }
        return _bytes1;
    }

    function stringToBytes1Array(string memory _string) public pure returns(uint, string[] memory) {
        bytes1[] memory b_array = new bytes1[](bytes(_string).length);
        b_array = bytesToBytesArray2(bytes(_string));
        
        string[] memory s_array = new string[](b_array.length);
        for(uint i = 0; i < s_array.length; i++) {
            s_array[i] = string(abi.encodePacked(b_array[i]));
        }
        return (s_array.length, s_array);
    }

    // 아래 코드는 abcde를 a, b, c, d, e로 나눠주고 나눠진 a, b, c, d, e를 합쳐서 abcde로 다시 나오게도 가능함.
    function stringToBytes1Array2(string memory _string) public pure returns(uint, string[] memory, string memory) {
        bytes1[] memory b_array = new bytes1[](bytes(_string).length);
        b_array = bytesToBytesArray2(bytes(_string));
        
        string[] memory s_array = new string[](b_array.length);
        for(uint i = 0; i < s_array.length; i++) {
            s_array[i] = string(abi.encodePacked(b_array[i]));
        }
        return (s_array.length, s_array, string(abi.encodePacked(b_array)));
    }

}