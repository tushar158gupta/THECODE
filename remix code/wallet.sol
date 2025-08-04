// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Storage {
    address public owner;
    string public fallstring;

    constructor() {
        owner = msg.sender;
    }

    //  a modifier
    modifier onlyowner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Events rae used to maintain the logs
    event tusharevent(address personwhoranfucntion, uint etheramt);

    event questionevent(
        address senderaddress,
        address recieveraddress,
        uint etheramt
    );

    // ONLY CHECKING THE BALANCE==================================
    // the contracts
    function getcontractbalance() public view returns (uint) {
        // return this.address.balance
        return address(this).balance;
    }

    // the address which is provided
    function getaddressbalance(address useraddress) public view returns (uint) {
        return useraddress.balance;
    }

    // the owners
    function getownerbalance() public view returns (uint) {
        return owner.balance;
    }

    // SENDING THE ETHER ====================================

    // user -> contract
    function SendToContract() external payable {}

    // contract -> owner
    function SendMoneyToOwner(uint amtofether) public {
        payable(msg.sender).transfer(amtofether * 1 ether);
    }

    // contract -> address
    function SendMoneyToAddressFromContract(
        address payable recipient,
        uint amtinwwi
    ) public {
        require(
            address(this).balance > amtinwwi,
            "Contract do not have enough ether to send"
        );
        recipient.transfer(amtinwwi);
    }

    // oneuser -> anotheruser ( caputuring the value from the owner(sender) )
    function SendMoneyToAddressViaAddress(
        address payable recipient
    ) public payable {
        require(msg.sender.balance > msg.value, "not have enough balance");
        recipient.transfer(msg.value);
        emit questionevent(msg.sender, recipient, msg.value);
    }

    // user -> owner
    function SendMoneyToOwnerViaUser() public payable {
        require(msg.value > 0, "not enough wie");
        payable(owner).transfer(msg.value);
    }
    // this was necessary fotr a fallback to work and used to send the mether to the contract without any function is called using empty calldata
    receive() external payable {
        // emitting the Event can be used in any fucntion to capture the logs
        emit tusharevent(msg.sender, msg.value);
    }

    // when a wrong fucntion that does not even exist is called but the user has tried to send some money then the money will be sent to the contract.
    fallback() external payable {
        fallstring = "the function has been fallen back";
    }

    // managing a transaction history
    struct transactionhistory {
        address form;
        address to;
        uint amount;
    }
    // changing the owner of the contract

    // selfdestruct the contract ?

    //withdraw all the ether from the contract
}
