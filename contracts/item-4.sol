//SPDX-License-identifier: MIT

pragma solidity ^0.8.1;

contract Item1 {

    function add(int a, int b) public  pure returns (int) {
        return a + b;
    }

    function minus(int a, int b) public  pure returns (int) {
        return a - b;
    }

    function multiply(int a, int b) public  pure returns (int) {
        return a * b;
    }

    function divide(int a, int b) public  pure returns (int) {
        return a / b;
    }
    
}



contract Item2 {

    mapping(address => uint256) userLoginCounts;
    address[] users;

    function check_in () public {

        address senderAddress = msg.sender;

        if ( userLoginCounts[senderAddress] == 0 ) {
            users.push(senderAddress);
        }

        userLoginCounts[senderAddress] += 1;
    }

    function get_user_login_time () public view returns (uint256) {
        address senderAddress = msg.sender;

        return userLoginCounts[senderAddress];
    }

    function report() public view returns ( address[] memory, uint256[] memory ) {
        address[] memory addresses = new address[](users.length);
        uint[] memory counts = new uint256[](users.length);

        for ( uint256 i = 0; i < users.length; i++ ) {
            addresses[i] = users[i];
            counts[i] = userLoginCounts[users[i]];
        }

        return (addresses, counts);

    }
}


contract Item3 {
    
    function count_word(string memory sentence) 
            public 
            pure 
            returns (uint256) {
        uint256 countEmpty = 0;
        uint256 i = 0;
        uint256 bytelength = bytes(sentence).length;

        for (countEmpty = 0; i < bytelength; i++ ) {
            bytes1 b = bytes(sentence)[i];

            if ( b == 0x20 ) {
                countEmpty++;
            }

        }

        return ++countEmpty;
    }
}

contract Item4 {

    function count_word(string memory sentence) 
            public 
            pure 
            returns (uint256) {
        uint256 countEmpty = 0;
        uint256 i = 0;
        uint256 bytelength = bytes(sentence).length;

        for (countEmpty = 0; i < bytelength; i++ ) {
            bytes1 b = bytes(sentence)[i];

            if ( b == 0x20 ) {
                countEmpty++;
            }

        }

        return ++countEmpty;
    }

    function split(string memory sentence) 
        public 
        pure 
        returns ( string[] memory ) {

            uint wordLength = count_word(sentence);

            string[] memory sentencesArray = new string[](wordLength);
            uint currentSentencesArrayIndex = 0;

            uint sentenceLength = bytes(sentence).length;

            bytes memory tempSentence = new bytes(32);
            uint j = 0;

            for ( uint i = 0; i < sentenceLength; i++ ) {

                bytes1 b = bytes(sentence)[i];

                if ( b == 0x20 ) {
                    string memory word = string(tempSentence);
                    sentencesArray[currentSentencesArrayIndex++] = word;

                    tempSentence = new bytes(32);
                    j = 0;

                    continue;
                }

                tempSentence[j++] = b;
            }

            string memory word = string(tempSentence);
            sentencesArray[currentSentencesArrayIndex++] = word;

            return sentencesArray;
        }
}