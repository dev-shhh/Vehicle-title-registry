// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/*
  VehicleTitleRegistry.sol
  - Registers vehicles on blockchain
  - Assigns and transfers ownership securely
  - Prevents double registration
*/

import "@openzeppelin/contracts/access/AccessControl.sol";

contract VehicleTitleRegistry is AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    struct Vehicle {
        uint256 id;
        string vin;            // unique Vehicle Identification Number
        string make;
        string model;
        uint16 year;
        address owner;
        bool registered;
    }

    uint256 private _vehicleIds;
    mapping(uint256 => Vehicle) public vehicles;
    mapping(string => bool) public vinExists; // prevent duplicate VINs
    mapping(address => uint256[]) public vehiclesByOwner;

    event VehicleRegistered(uint256 indexed id, address indexed owner, string vin);
    event OwnershipTransferred(uint256 indexed id, address indexed from, address indexed to);

    constructor(address admin) {
        _setupRole(DEFAULT_ADMIN_ROLE, admin);
        _setupRole(ADMIN_ROLE, admin);
    }

    modifier onlyAdmin() {
        require(hasRole(ADMIN_ROLE, msg.sender), "not-admin");
        _;
    }

    // Register a vehicle
    function registerVehicle(
        string calldata vin,
        string calldata make,
        string calldata model,
        uint16 year
    ) external onlyAdmin returns (uint256) {
        require(!vinExists[vin], "vin-exists");
        _vehicleIds += 1;
        uint256 id = _vehicleIds;

        vehicles[id] = Vehicle({
            id: id,
            vin: vin,
            make: make,
            model: model,
            year: year,
            owner: msg.sender,
            registered: true
        });

        vinExists[vin] = true;
        vehiclesByOwner[msg.sender].push(id);

        emit VehicleRegistered(id, msg.sender, vin);
        return id;
    }

    // Transfer ownership
    function transferOwnership(uint256 id, address newOwner) external {
        Vehicle storage v = vehicles[id];
        require(v.registered, "not-registered");
        require(v.owner == msg.sender, "not-owner");
        require(newOwner != address(0), "zero-address");

        v.owner = newOwner;
        vehiclesByOwner[newOwner].push(id);

        emit OwnershipTransferred(id, msg.sender, newOwner);
    }
}
