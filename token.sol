pragma solidity 0.8.4;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    function mint() public {
        balances[tx.origin]++;
    }
}

contract MyContract {
    address payable wallet;
    address public token;

    event Purchase(address indexed _buyer, uint256 _amount);

    constructor(address payable _wallet, address _token) {
        wallet = _wallet;
        token = _token;
    }

    // fallback function
    fallback() external payable {
        buyToken();
    }

    function buyToken() public payable {
        // buy a token
        ERC20Token(address(token)).mint();

        // send ether to the wallet
        wallet.transfer(msg.value);

        emit Purchase(msg.sender, 1);
    }
}
