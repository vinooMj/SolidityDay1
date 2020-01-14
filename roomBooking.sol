pragma solidity 0.5.11;

contract oya{
    
    struct Property{
        string property_name;
        bool isActive;
        uint256 property_cost;
        string description;
        address owner;
        bool[] isBooked;
        
    }
    
    uint256 propertyId;
    mapping(uint256=>Property)public properties;
    
    struct Booking{
        uint256 propertyId;
        uint256 IncheckDate;
        uint256 outCheckDate;
        address user;
    }
    
    uint256 bookingid;
    mapping(uint256=>Booking)public bookings;
    
    event NewProperty(propertyId);
    event NewBooking(propertyId,bookingid);
    
    function rentOutProperty(string memory property_name, string memory description, uint256 property_cost ) public {
        
        Property memory property = Property(property_name,description,true,property_cost, msg.sender, bool[] (365));
        properties[propertyId] = property;
        emit NewProperty(property++);
    }
    
    function rentProperty(uint256 _propertyId, uint256 IncheckDate, uint256 outCheckDate) public payable{
        
        Property storage property = properties[_propertyId];
        require(property.isActive == true, "property not active");
        
        for(uint256 i = IncheckDate; i<outCheckDate; i++ ){
            if(property.isBooked[i]== true){
                revert('property is not available date');
            }
            
            _sendFunds(property.owner, msg.value);
            _createBooking (_propertyId,IncheckDate,outCheckDate);
        }
        
        
        function _sendFunds(address beneficiary, uint256 value) internal{
            address(uint160(beneficiary)).transfer(value);
        }
        
        function _createBooking(_propertyId,IncheckDate,outCheckDate) internal{
            bookings[bookingid] = Booking(_propertyId, IncheckDate,outCheckDate, msg.sender);
            property storage property = properties[propertyId];
            
            for(uint256 i = IncheckDate; i<outCheckDate; i++){
                property.isBooked[i] = true;
                
            }
            
            emit NewBooking(_propertyId,bookingid++);
        }
        
    }
    
    function markProperty(uint256 _propertyId)public{
        require(properties[_propertyId]==msg.sender,'it is not your property');
        properties[_propertyId].isActive = false;
    }
}
