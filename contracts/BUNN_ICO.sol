// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BUNN_ICO {
    uint public constant ICO_DURATION = 86400;
    address public admin; // the address of my tokens holder
    IERC20 BUNN; // my deployed BUNN token 

    // State variables to store registered users and claim status
    mapping (address => bool) public registered_addresses;
    mapping (address => bool) public claimed_addresses;

    // Start amd end time
    uint public ico_start_time;
    uint public ico_end_time;

    event registered(address indexed _address, bool status);
    event claimed(address indexed _address, bool status);

    constructor(address _token_address) {
        ico_start_time = block.timestamp;
        ico_end_time = ico_start_time + ICO_DURATION;

        admin = msg.sender;
        BUNN = IERC20(_token_address);
    }

    function register() external  payable {
        require(msg.value >= 0.01 ether, "You need to pay 0.01 ether to register");
        require(block.timestamp < ico_end_time, "Time for registration is over");
        require(!registered_addresses[msg.sender], "You can only register Once");

        // Store and set registered user to true and emit registered event.
        registered_addresses[msg.sender] = true;
        emit registered(msg.sender, true);

        // Return any excess eth.
        if (msg.value > 0.01 ether) {
            payable(msg.sender).transfer(msg.value - 0.01 ether);
        }
    }

    function claim(address _address) external returns (bool) {
        require(_address != address(0), "Address cannot be zero address.");
        require(block.timestamp > ico_end_time, "ICO registration still ongoing.");
        require(!claimed_addresses[msg.sender], "You have claimed Your tokens.");
        require(registered_addresses[msg.sender], "You must have registered to claim tokens");

        // Transaction must be successful before user is stored as claimed
        require(BUNN.transferFrom(admin, _address, 50 ether), "Transfer failed");
        claimed_addresses[msg.sender] = true;

        // Emit claimed event
        emit claimed(msg.sender, true);
        return true;
    }
}