pragma solidity 0.5.15;

library SafeMath{
    
    function add(uint256 a, uint256 b)internal constant returns(uint256){
        uint256 c= a+b;
        assert(c>=a);
        return c;
    }
    
    function sub(uint256 a, uint256 b)internal constant returns(uint256){
        assert(b<=a);
        return a-b;
    }
    
    function mul(uint256 a, uint256 b)internal constant returns(uint256){
        uint256 c=a*b;
        assert(a==0 || c/a==b);
        return c;
    }
    
    function div(uint256 a, uint256 b)internal constant(uint256){
        require(b > 0, errorMessage);
        c = a/b;
    }
    
}
