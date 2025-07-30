// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Storage {

address public owner;

constructor(){
    owner = msg.sender;
}

modifier onlyowner(){
    require (msg.sender == owner , "You are not the owner");
    _;
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

// oneuser -> anotheruser
function SendMoneyToAddressViaAddress(address payable recipient) public payable{
    require(msg.sender.balance>msg.value , "not have enough balance");
    recipient.transfer(msg.value);
}


   
}