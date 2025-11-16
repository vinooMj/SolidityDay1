// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarbonCreditRegistry {
    // Struct to represent a carbon credit
    struct CarbonCredit {
        uint256 amount;       // Amount of CO2 offset in kg
        uint256 issuanceDate; // When the credit was issued
        string projectId;     // Identifier for the project generating the credit
        bool isRetired;       // Whether the credit has been used/retired
    }

    // Mapping of credit IDs to CarbonCredit structs
    mapping(uint256 => CarbonCredit) public carbonCredits;

    // Total credits issued (not retired)
    uint256 public totalActiveCredits;

    // Events
    event CreditIssued(uint256 indexed creditId, uint256 amount, string projectId);
    event CreditRetired(uint256 indexed creditId, address retiree);

    // Modifiers
    modifier onlyUnretiredCredit(uint256 _creditId) {
        require(!carbonCredits[_creditId].isRetired, "Credit already retired");
        _;
    }

    // Issue a new carbon credit
    function issueCredit(
        uint256 _amount,
        string memory _projectId
    ) external returns (uint256) {
        uint256 creditId = uint256(keccak256(abi.encodePacked(
            block.timestamp,
            block.prevrandao,
            msg.sender,
            _amount,
            _projectId
        )));

        require(_amount > 0, "Amount must be positive");

        carbonCredits[creditId] = CarbonCredit({
            amount: _amount,
            issuanceDate: block.timestamp,
            projectId: _projectId,
            isRetired: false
        });

        totalActiveCredits += _amount;
        emit CreditIssued(creditId, _amount, _projectId);

        return creditId;
    }

    // Retire a carbon credit (mark as used)
    function retireCredit(uint256 _creditId) external onlyUnretiredCredit(_creditId) {
        CarbonCredit storage credit = carbonCredits[_creditId];
        require(credit.amount > 0, "Invalid credit");

        credit.isRetired = true;
        totalActiveCredits -= credit.amount;

        emit CreditRetired(_creditId, msg.sender);
    }

    // Get credit details
    function getCreditDetails(uint256 _creditId)
        external
        view
        returns (CarbonCredit memory)
    {
        return carbonCredits[_creditId];
    }
}
