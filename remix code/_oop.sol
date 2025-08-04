// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;



// Parent class 

 contract car{
  uint public wheel =4;
  uint public airbags = 4 ;
  string public engine = "V5";

  function hehe (string memory val) public pure returns (string memory) {

return val;
  }
 
 
 }

// Child class that inherit the parent class 
contract supercar is car{
    
    bool public turbobooster = true;

    function chnageairbag() public {
        airbags = 10;
    }


 }

// abstract class : it can contain a function whoes complete implementation is not done
abstract contract parentclass  {
string public  str ;
bool public  boolvar = true;
constructor(){
    str = "jai shree ram";
    boolvar=false;
}

function getter() public virtual ;

function setter  (uint val ) public virtual ;

function setterwithmemory  (string memory val ) public virtual ;

}

contract childclass is parentclass {
    
    // while using an abstract class as a parent class to inherit we have to complete all the virtual functions by overriding them 
    
    function getter() public override  {

    }

    function setter(uint val ) public override {

    }

    function setterwithmemory(string memory val ) public override {

    }


    
}
