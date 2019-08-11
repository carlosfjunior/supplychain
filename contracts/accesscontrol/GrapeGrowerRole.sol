pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'GrapeGrowerRole' to manage this role - add, remove, check
contract GrapeGrowerRole {
    using Roles for Roles.Role;

    // Define 2 events, one for Adding, and other for Removing
    event GrapeGrowerAdded(address indexed account);
    event GrapeGrowerRemoved(address indexed account);

    // Define a struct 'grapeGrowers' by inheriting from 'Roles' library, struct Role
    Roles.Role private grapeGrowers;

    // In the constructor make the address that deploys this contract the 1st grapeGrower
    constructor() public {
        _addGrapeGrower(msg.sender);
    }

     // Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyGrapeGrower() {
        require(isGrapeGrower(msg.sender));
        _;
    }

    // Define a function 'isGrapeGrower' to check this role
    function isGrapeGrower(address account) public view returns (bool) {
        return grapeGrowers.has(account);
    }

    // Define a function 'addGrapeGrower' that adds this role
    function addGrapeGrower(address account) public onlyGrapeGrower {
        _addGrapeGrower(account);
    }

    // Define a function 'renounceGrapeGrower' to renounce this role
    function renounceGrapeGrower() public {
        _removeGrapeGrower(msg.sender);
    }

    // Define an internal function '_addGrapeGrower' to add this role, called by 'addGrapeGrower'
    function _addGrapeGrower(address account) internal {
        grapeGrowers.add(account);
        emit GrapeGrowerAdded(account);
    }

    // Define an internal function '_removeGrapeGrower' to remove this role, called by 'removeGrapeGrower'
    function _removeGrapeGrower(address account) internal {
        grapeGrowers.remove(account);
        emit GrapeGrowerRemoved(account);
    }

}
