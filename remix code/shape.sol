// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


// 2 contracts in a single file using one contract function in to another


contract shape{

uint lenght ;
uint breadth ;

function setdimenssions(uint val1 , uint val2) public{
lenght = val1;
breadth =val2;

}


function getdimenssions() public view returns (uint , uint){

return ( lenght , breadth);

}

}

contract square{
    shape s1 = new shape();
   // s1.setdimenssions(10, 10); // This i snot wokring like this

   function setvaalues( uint val1 , uint val2) public{
    s1.setdimenssions(val1, val2);
   }
   function getvalues() public view returns (uint , uint){

return    s1.getdimenssions();

}


}