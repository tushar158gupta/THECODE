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

// payable make the function to take money fromm the person and send it to the contract
// user -> contract
function SendToContract() external payable{

}


function sendback()public {


require(address(this).balance >= 2.5 ether , "not having enough ice bitch ass");

    for(uint i = 1 ; i<=5 ; i++){
payable(msg.sender).transfer(.5 ether);
    }
}


    function sendback1() public {
        // Make sure contract has enough ETH
        require(address(this).balance >= 2.5 ether, "Not enough ETH");

        for (uint i = 1; i <= 5; i++) {
            payable(msg.sender).transfer(0.5 ether);
        }
    }


   
}