
pragma solidity ^0.8.1;

contract Item2 {

    mapping(address => uint256) userLoginCounts;

    function check_in () public {

        address senderAddress = msg.sender;

        userLoginCounts[senderAddress] += 1;
    }

    function get_user_login_time () public view returns (uint256) {
        address senderAddress = msg.sender;

        return userLoginCounts[senderAddress];
    }
}