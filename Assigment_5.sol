pragma solidity 0.8.4;

contract HashingFunction{
    
    
    
    // Your contract is supposed to contain a very CRUCIAL function . Your first function accepts 3 different 
    // addresses and performs the keccak256 hash of the first 2....it then hashes 
    // the result with the third address and 
    // returns the final hash...The second CRUCIAL function 
    // gets the final hash from the first function above and accepts 
    // two arguments(a number and a bytes32 value)...it hashes the 
    // number separately, performs a typecasting(on the bytes32[second argument]) so as 
    // to convert it to a number, hashes the number too, then hashes both of the resulting hashes with 
    // the hash gotten from the previous function and finally returns the final hash
    
    function Hashing(address add1, address add2, address add3 ) public view returns(bytes32 J){
        
        bytes32 I = keccak256(abi.encodePacked(add1, add2));
         J = keccak256(abi.encodePacked(add3, I));
        return J;
    }
    
    function Hashing2( uint Num, bytes32 num, address add1, address add2, address add3) public view returns(bytes32)
    {

       bytes32 Y = Hashing(add1, add2, add3);
       bytes32 K = keccak256(abi.encodePacked(Num));
 
 uint S = uint (keccak256(abi.encodePacked(num)));
  bytes32 R = keccak256(abi.encodePacked(K,S,Y));
   return R;
  
    }
    
    
    
    
    
    
}
