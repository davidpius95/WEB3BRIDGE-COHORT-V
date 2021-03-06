pragma solidity 0.8.4;

contract map{
    
    // A contract contains two very important mappings
    // which are used to track some very *private* info...The first mapping allows you to
    // know how many times an address has called a function, the second one allows you 
    // to know  the function hash that the address called last...Write three different functions
    // that don't *really do anything but returns a bool value* and update the mappings accordingly
    
    
    mapping (address => uint) CallerCount;
  mapping (address => bytes32) HashChecker;
  
  function Count_Hash(address addr) public returns(bool){
     uint count = CallerCount[addr]++;
      bytes32 J = keccak256(abi.encodePacked(addr,count));
     HashChecker[addr] = J;
      return true;
  }
  function bool_value1() public returns(bool){
   
      return (true);
  }
     function bool_value2() public returns(bool N){

      return N;
     }
    
}
