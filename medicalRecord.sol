pragma solidity ^0.5.0;

contract Medical{
    address patientId;
    struct Patient{
        string name;
        string patientAddress;
        uint256 dob;
        string diseaseName;
        uint256 diseaseDuration;
        bool curable;
        
    }
    
    mapping(address=>Patient) public patients;
    
    constructor() public{
        
    }
    
    function addParticipantRecord(address patientId, string memory _name, string memory _patientAddress, uint256 _dob, string memory _diseaseName, uint256 _diseaseDuration, bool _curable) 
    public {
        patients[patientId].name = _name;
        patients[patientId].patientAddress = _patientAddress;
        patients[patientId].dob = _dob;
        patients[patientId].diseaseName = _diseaseName;
        patients[patientId].diseaseDuration = _diseaseDuration;
        patients[patientId].curable = _curable;
        
        }
    function getParticipantRecord(address patientId) public view returns(string memory, string memory, uint256, string memory, uint256, bool){
        return(patients[patientId].name, patients[patientId].patientAddress,  patients[patientId].dob,  patients[patientId].diseaseName,  patients[patientId].diseaseDuration,  patients[patientId].curable);
        
    }
    
}
