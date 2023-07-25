pragma solidity ^0.8.19;

// contract with fallback function
contract fall {
  uint n;
  function set(uint value) external {
    n = value;
  }

  function() external payable {
    n = 0;
  }
}

// contract to interact with contract fall
contract Sendeth {
  function callfall(fall a) public returns (bool) {
     // sending ether to contract fall
     address payable payableA = address(uint160(address(a)));
     return(payableA.send(2 ether));
   }
}