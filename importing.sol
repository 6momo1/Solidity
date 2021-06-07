pragma solidity 0.8.4;

// import file
// import "./Math.sol"

library Math {
    function divide(uint256 a, uint256 b) internal pure returns (uint256) {
        //
        require(b > 0);
        uint256 c = a / b;
        return c;
    }
}

contract myContract {
    // using Math for uint256;
    uint256 public value;

    function calculate(uint256 _value1, uint256 _value2) public {
        value = Math.divide(_value1, _value2);
    }
}
