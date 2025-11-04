🚗 Vehicle Title Registry (Blockchain-based Ownership System)
Smart Contract: VehicleTitleRegistry.sol
License: MIT
Solidity Version: ^0.8.19
Framework: OpenZeppelin AccessControl
🧭 Overview

VehicleTitleRegistry is a blockchain-based system for secure registration and ownership transfer of vehicles.
It ensures transparency, immutability, and eliminates the risk of duplicate or forged vehicle records by recording every registration and ownership transfer on-chain.

The contract is built with OpenZeppelin’s AccessControl module to provide role-based access for administrative actions.

⚙️ Features
Feature	Description
🧑‍⚖️ Role-Based Access Control	Only addresses with the ADMIN_ROLE can register new vehicles.
🔒 Immutable Vehicle Records	Each vehicle is identified by a unique VIN (Vehicle Identification Number) that cannot be reused.
🔁 Ownership Transfer	Current owners can securely transfer vehicle ownership on-chain.
🚫 Duplicate Prevention	VINs are validated to prevent multiple registrations of the same vehicle.
📜 Event Logging	Each registration and transfer emits blockchain events for auditability.
🔍 Owner Query	Anyone can view all vehicles owned by a specific address.
🧱 Smart Contract Architecture
Roles

ADMIN_ROLE: Can register new vehicles.

DEFAULT_ADMIN_ROLE: Can grant or revoke roles (initially assigned to the deployer).

Structs

Vehicle

id: Unique internal numeric ID

vin: Vehicle Identification Number (unique per vehicle)

make: Manufacturer name

model: Model name

year: Manufacturing year

owner: Current owner’s wallet address

registered: Boolean flag indicating if the vehicle is registered

🔑 Key Functions
registerVehicle(string vin, string make, string model, uint16 year)

Registers a new vehicle.

Access: onlyAdmin

Validations:

VIN must be unique and non-empty

Year must be later than 1885 (first automobile era)

Emits: VehicleRegistered

transferOwnership(uint256 id, address newOwner)

Transfers ownership of a vehicle from the current owner to a new one.

Access: Current owner only

Validations:

Vehicle must be registered

newOwner cannot be the zero address

Emits: OwnershipTransferred

getVehiclesByOwner(address owner)

Returns all registered vehicle IDs owned by the given address.

Access: Public view function

🧰 Deployment (via Remix)

Open Remix IDE: https://remix.ethereum.org

Create File: VehicleTitleRegistry.sol

Paste the Contract Code

Compile: Use Solidity version 0.8.19 or higher

Deploy:

Environment: Injected Provider - MetaMask

No constructor parameters needed

Test Actions:

Call registerVehicle() with VIN, make, model, and year.

Call transferOwnership() to transfer the vehicle to another address.

🧾 Example Usage
1️⃣ Register a Vehicle
registerVehicle("1HGCM82633A004352", "Honda", "Civic", 2022)

2️⃣ Transfer Ownership
transferOwnership(1, 0xAbC1234567890dEF1234567890ABCdEf12345678)

3️⃣ Get Owner’s Vehicles
getVehiclesByOwner(0x128F80B2abcd1234abcd5678abcd9012abcd3456)

🧠 Design Considerations

The contract uses OpenZeppelin’s AccessControl for robust role-based security.

The unique VIN mapping prevents double registration.

Events make it easy to build a front-end explorer or dashboard that listens to blockchain logs.

Easy integration with IPFS or external APIs for adding metadata in future versions.

🚀 Future Enhancements

 Integrate IPFS for vehicle document storage.

 Add audit trail of all ownership transfers.

 Support multi-admin structure with restricted write access.

 Create a React/Next.js frontend for users to search and verify vehicles easily.

 ## Contract Deployment
0xA007E8C53E142Cd42cCC7Bd76Cc3E87745994C0E
<img width="1402" height="689" alt="image" src="https://github.com/user-attachments/assets/c1cfdf95-08ac-4d62-9271-410d8b83d612" />
