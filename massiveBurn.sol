//Owner burns the token exclusive reserveSupply
    function burn(uint tokens) public  returns(bool success){
        require(owner == msg.sender,'This is not owner');
        require(isMassiveBurnDone == true);
        _totalSupply = safeSub(_totalSupply,tokens);
        balances[msg.sender] = safeSub(_totalSupply,tokens);
        emit Burn(msg.sender,address(0), tokens);
        return true;
    }
    
    //Owner burns the token
    function massiveBurn() public returns(bool success){
        require(owner == msg.sender,'This is not owner');
	require(isMassiveBurnDone == false,'Massive burning is already done');
	require(reservedTokens < _totalSupply, 'Insuffient token to burn');
        _totalSupply = reservedTokens;
        balances[msg.sender] = reservedTokens;
	isMassiveBurnDone = true;
        emit Burn(msg.sender,address(0), reservedTokens);
        return true;
    }
