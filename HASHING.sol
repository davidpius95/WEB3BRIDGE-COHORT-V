pragma solidity 0.8.0;

 contract hashing{
    
    
    bytes32 add1;
    bytes32 add2;
   
    function input1 (address _add1, uint _nonce1) public  returns (bytes32){
        return add1 = keccak256(abi.encodePacked(_add1 , _nonce1));
    }
    function input2 (address _add2, uint _nonce2) public  returns (bytes32){
        return add2 = keccak256(abi.encodePacked(_add2 , _nonce2));
    }
     
   
    function viewhash () public view returns(bytes32,bytes32){
  return (add1,add2);
    }
    
    
                            //       OR
//  function viewhash () public view returns(bytes32){
//   return (add2);
//     }
    
 
//     function input2 (address _add1,uint _nonce1, address _add2, uint _nonce2) public   returns (bytes32){
//         return add2 = keccak256(abi.encodePacked(_add1, _nonce1, _add2 , _nonce2));
//     }
 }