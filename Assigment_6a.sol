pragma solidity 0.8.1;

contract records {
    // A particular financial institution is looking to have their records stored onchain
    // and looking to have an *external *`identifier` tied to each customers Details....the identifier 
    // should be the keccak256 hash of the customer's name and time of registration , each customer 
    // can also approve another customer to view their details[meaning that only admins and approved customers 
    // have the right to view another customer's data]....For simplicity purposes, the 
    // Bank is looking to have a separate contract that has all *setter* functions
    // and another contract that has all the *getter * functions(Interacting 
    // with each other of course)..Finally, they want an interface for all the contracts they have......NOTE: USE 
    // THE APPROPRIATE FUNCTION AND VARIABLE VISIBILITY SPECIFIERS

    
    struct customer{
        string name;
        uint RegTime;
        address addr;
        bytes4 identity;
    }
    
    address public admin;
    
    mapping(bytes4 => customer) public identifier;
    
    customer  customers;
    function set(string memory _name, address _addr) public {
        customers.name = _name;
        customers.RegTime = block.timestamp;
        customers.addr = _addr;
         customers.identity = bytes4(keccak256(abi.encodePacked(customers.name, customers.RegTime)));
        identifier[customers.identity]=customers;
    }
           function approve(address newAddr) public {
     require(customers.addr == msg.sender, "not admin");
   admin = newAddr;
     }
   
 
    function hash2() public view returns(bytes32){
        return (keccak256(abi.encodePacked(customers.name, customers.RegTime)));
    }
}

    interface Irecords {
        
    struct customer{
        string name;
        uint RegTime;
        address addr;
        bytes4 identity;
    }
         function set(string memory _name, uint _RegTime, address _addr) external;
        // function checkCustomer() external view  returns  (customer memory);
         function approve(address newAddr) external;
         function checkCustomer() external   returns  (customer memory);
         
    }
    
    contract setter is Irecords{

      // Irecords recordss;
       
      address public admin;
  customer  customers;
    function checkCustomer() public view  returns  (customer memory) {
      require(customers.addr == msg.sender || admin == msg.sender, "not an admin");
      return identifier[customers.identity];
    }
    
    }
     contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}


// THE COMPLETE CONTRACT
// pragma solidity 0.8.1;

// contract records{
//      //A particular financial institution is looking to have their records stored onchain
//     // and looking to have an *external *`identifier` tied to each customers Details....the identifier 
//     // should be the keccak256 hash of the customer's name and time of registration , each customer 
//     // can also approve another customer to view their details[meaning that only admins and approved customers 
//     // have the right to view another customer's data]....For simplicity purposes, the 
//     // Bank is looking to have a separate contract that has all *setter* functions
//     // and another contract that has all the *getter * functions(Interacting 
//     // with each other of course)..Finally, they want an interface for all the contracts they have......NOTE: USE 
//     // THE APPROPRIATE FUNCTION AND VARIABLE VISIBILITY SPECIFIERS

    
//     struct customer{
//         string name;
//         uint RegTime;
//         address addr;
//         bytes4 identity;
//     }
    
//     address public admin;
    
//     mapping(bytes4 => customer) identifier;
    
//     customer customers;
//     function set(string memory _name, address _addr) public {
//         customers.name = _name;
//         customers.RegTime = block.timestamp;
//         customers.addr = _addr;
//          customers.identity = bytes4(keccak256(abi.encodePacked(customers.name, customers.RegTime)));
//         identifier[customers.identity]=customers;
//     }
    
//     modifier onlyowner(){
//          require(customers.addr == msg.sender, "not admin");
//          _;
//     }
//     function approve(address newAddr) public onlyowner {
//     admin = newAddr;
//      }
    
//     function checkCustomer() public view  returns  (customer memory) {
//       require(customers.addr == msg.sender || admin == msg.sender, "not an admin");
//        return identifier[customers.identity];
//     }
//     function hash2() public view returns(bytes32){
//         return (keccak256(abi.encodePacked(customers.name, customers.RegTime)));
//     }
// }