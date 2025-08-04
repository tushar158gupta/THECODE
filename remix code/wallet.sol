// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Storage {
<<<<<<< HEAD
    address public owner;
    string public fallstring;

    constructor() {
        owner = msg.sender;
    }
=======
// primitive data types
address public owner;
string public fallstring;
uint timestampnow = 1754123429;
uint public delaytime = 2 hours;

// Struct 
struct TransactionHistory{
address sender;
address reciever;
uint amountsent;
uint Timesatamp;
}

//Array
TransactionHistory  [] public transactionarray;

// Map
mapping(address=>uint) public susmap;

>>>>>>> c51acaa87fa6938f97e578343d92e8e38fb45a29

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
<<<<<<< HEAD
=======

//  a modifier
modifier onlyowner(){
    require (msg.sender == owner , "You are not the owner");
    _;
}

modifier checksussy(){
    require(susmap[msg.sender]<=10 , "You are sus");
    _;
}

// Events rae used to maintain the logs
event tusharevent(address personwhoranfucntion , uint etheramt);


event questionevent(address senderaddress , address recieveraddress , uint etheramt);


// changing the owner
function changeowner( address newowneraddress) public onlyowner{
owner = newowneraddress;
}


// ONLY CHECKING THE BALANCE==================================
// the contracts
function getcontractbalance()public view returns (uint){

// return this.address.balance
return address(this).balance;
}

// the address which is provided 
function getaddressbalance(address useraddress)public view returns (uint){
 return useraddress.balance;
}

// the owners
function getownerbalance()public view returns(uint){
return owner.balance;
}

// SENDING THE ETHER ====================================

// user -> contract
function SendToContract() external payable{
}

// contract -> owner
function SendMoneyToOwner(uint amtofether)public {
payable(msg.sender).transfer(amtofether*1 ether);
}

// contract -> address
function  SendMoneyToAddressFromContract  (address payable  recipient , uint amtinwwi ) public{
require(address(this).balance > amtinwwi  , "Contract do not have enough ether to send" );
recipient.transfer(amtinwwi);
}

// oneuser -> anotheruser ( caputuring the value from the owner(sender) )
function SendMoneyToAddressViaAddress(address payable recipient) public payable{
    require(msg.sender.balance>msg.value , "not have enough balance");
    recipient.transfer(msg.value);
    emit questionevent(msg.sender , recipient , msg.value);
}

// user -> owner 
function SendMoneyToOwnerViaUser() public payable {
    require (msg.value>0 , "not enough wie");
    payable (owner).transfer(msg.value);

}
// saving the traction history of the sender , reciever , amt and the timpastamp

function sendetherandlogthetransaction(address payable reciever) public payable checksussy {
    require(reciever!= address(0) , "the address is in correct ");
    require (block.timestamp < timestampnow+delaytime , "you can not do the transaction");
reciever.transfer(msg.value);


TransactionHistory memory txn =  TransactionHistory(msg.sender , reciever , msg.value , block.timestamp);

transactionarray.push(txn);

}

function GetAllTheTransactions () public view returns (TransactionHistory [] memory ) {
return transactionarray;
}


// this was necessary fotr a fallback to work and used to send the mether to the contract without any function is called using empty calldata
receive() external payable {

// emitting the Event can be used in any fucntion to capture the logs
emit tusharevent(msg.sender, msg.value);


 }

 function incsussylist(address sender) public {
    susmap[sender] +=1;
 }

// when a wrong fucntion that does not even exist is called but the user has tried to send some money then the money will be sent to the contract.
fallback() external payable   { 
    fallstring = "the function has been fallen back";
    incsussylist(msg.sender);

}
   
}
>>>>>>> c51acaa87fa6938f97e578343d92e8e38fb45a29
