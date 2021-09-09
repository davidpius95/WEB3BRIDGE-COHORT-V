
pragma solidity 0.8.1;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract HMS{
    
    
      address owner = msg.sender;
      address NewHospital;
      uint public counter ;
    struct PatientRecord{
        string name;
        uint age;
        string occupation;
        address home;
    }
    
    PatientRecord[] Patientrecords;
   
    mapping(address => PatientRecord) PatientDetails;
    mapping (address => mapping(address => PatientRecord )) hospital;
    
    PatientRecord patientRecords;
    
    function SetRecord(string memory _name, uint _age, string memory _occupation, address _home, address _hospital) public {
    //  require (msg.sender == owner || msg.sender == NewHospital,"you are not approve");
       patientRecords.home = _home;
        patientRecords.name = _name;
        patientRecords.age = _age;
        patientRecords.occupation = _occupation;
        PatientDetails[_home]=patientRecords;
        Patientrecords.push(PatientDetails[_home]);
        hospital[_hospital][_home] = patientRecords;
        counter++;
    }
  
    function approveHospital(address addr) public {
        require(msg.sender == owner, "not owner");
        NewHospital = addr;
    }
    
    function readRecord(address _home) public view returns(PatientRecord memory){
        // require (msg.sender == owner || msg.sender == NewHospital,"not approve");
       return PatientDetails[_home];
    }
    function hospitalCheck(address addr) public view returns(PatientRecord memory){
      return  hospital[addr][patientRecords.home];
    }
    function del(address _home) public {
        delete(PatientDetails[_home]);
    }
    
    
}