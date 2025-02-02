pragma solidity ^0.8.1;

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