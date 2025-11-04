# 🚗 Vehicle Title Registry – Blockchain-based Vehicle Ownership System

![Solidity](https://img.shields.io/badge/Solidity-%5E0.8.19-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![OpenZeppelin](https://img.shields.io/badge/Built%20With-OpenZeppelin-orange)
![Status](https://img.shields.io/badge/Status-Active-success)

---

## 🧭 Overview

**VehicleTitleRegistry** is a smart contract designed to bring **transparency, trust, and immutability** to vehicle registration and ownership transfer processes.

Instead of relying on centralized government databases, this contract uses **Ethereum’s blockchain** to register vehicles, prevent double registrations, and record ownership transfers permanently and securely.

The registry ensures that:
- Each vehicle has a **unique VIN (Vehicle Identification Number)**.
- Every ownership change is **recorded immutably on-chain**.
- Only authorized administrators can register new vehicles.
- Vehicle ownership is **verifiable, transferable, and traceable** by anyone.

---

## ⚙️ Features

| Feature | Description |
|----------|-------------|
| 🧑‍⚖️ **Role-Based Access Control** | Uses OpenZeppelin’s `AccessControl` to assign administrative permissions. |
| 🚫 **Duplicate Prevention** | Prevents double registration of the same vehicle VIN. |
| 🔐 **Secure Ownership Transfers** | Transfers can only be initiated by the current owner. |
| 🔍 **Public Verification** | Anyone can verify ownership records via blockchain explorers. |
| 📜 **Event Logging** | All key actions emit events for transparency and traceability. |
| 🧱 **Extensible Design** | Built to integrate with off-chain systems or IPFS in future versions. |

---

## 🧱 Smart Contract Architecture

### Roles

- **`DEFAULT_ADMIN_ROLE`**  
  Assigned to the deployer. Can grant or revoke other roles.

- **`ADMIN_ROLE`**  
  Can register vehicles. Intended for authorized government or dealership personnel.

---

### Data Structures

#### `struct Vehicle`
| Field | Type | Description |
|--------|------|-------------|
| `id` | `uint256` | Unique internal identifier |
| `vin` | `string` | Vehicle Identification Number (unique per vehicle) |
| `make` | `string` | Manufacturer (e.g., Toyota, Tesla) |
| `model` | `string` | Model name |
| `year` | `uint16` | Manufacturing year |
| `owner` | `address` | Ethereum wallet of current owner |
| `registered` | `bool` | Flag indicating registration status |

---

### Mappings
| Mapping | Description |
|----------|-------------|
| `vehicles` | Maps vehicle IDs to their records |
| `vinExists` | Ensures VIN uniqueness |
| `_vehiclesByOwner` | Tracks all vehicle IDs owned by a specific address |

---

## 🧾 Key Functions

### `registerVehicle(string vin, string make, string model, uint16 year)`
Registers a new vehicle under the admin’s account.

**Modifiers:** `onlyAdmin`  
**Validations:**
- VIN must be unique and non-empty  
- Year must be > 1885 (first automobile invented)  

**Emits:** `VehicleRegistered(id, owner, vin)`  
**Returns:** Newly registered vehicle ID

---

### `transferOwnership(uint256 id, address newOwner)`
Transfers ownership of a registered vehicle.

**Access:** Current owner only  
**Validations:**
- Vehicle must be registered  
- Caller must be the current owner  
- `newOwner` must not be zero address  

**Emits:** `OwnershipTransferred(id, from, to)`

---

### `getVehiclesByOwner(address owner)`
Returns all vehicle IDs owned by a given address.  
This can be used to display all vehicles belonging to a person or organization.

---

## 📦 Installation & Deployment

### 🧰 Prerequisites
- [Node.js](https://nodejs.org/en/) (v18 or newer)
- [MetaMask](https://metamask.io/)
- [Remix IDE](https://remix.ethereum.org/)
- [Solidity Compiler](https://docs.soliditylang.org/)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)

---

### 🧱 Deployment via Remix

1. Open [Remix IDE](https://remix.ethereum.org)
2. Create a new file named `VehicleTitleRegistry.sol`
3. Paste the full contract code inside.
4. In the **Solidity Compiler** tab:
   - Select version **0.8.19**
   - Click **Compile VehicleTitleRegistry.sol**
5. In the **Deploy & Run Transactions** tab:
   - Select **Environment:** `Injected Provider - MetaMask`
   - No constructor arguments needed
   - Click **Deploy**
6. Confirm the transaction in MetaMask.

Once deployed, you will see your contract under “Deployed Contracts”.

---

## 💡 Example Usage

### 1️⃣ Register a Vehicle
```solidity
registerVehicle(
  "1HGCM82633A004352",
  "Honda",
  "Civic",
  2022
);
Result: Emits VehicleRegistered(1, 0xYourAddress, "1HGCM82633A004352")
```

2️⃣ Transfer Ownership
solidity
Copy code
transferOwnership(1, 0xAbC1234567890dEF1234567890ABCdEf12345678);
Result: Emits OwnershipTransferred(1, 0xYourAddress, 0xAbC123...)

3️⃣ View Vehicles by Owner
solidity
Copy code
getVehiclesByOwner(0xYourAddress);
Result: [1, 3, 5] (array of vehicle IDs)

🧠 Design Principles
Simplicity: Minimal yet powerful structure focusing on core functionality.

Security: Uses AccessControl to restrict administrative actions.

Transparency: Every action emits an event, easily viewable on block explorers.

Extensibility: Ready for integration with IPFS for storing documents, images, or inspection reports.

🔮 Future Enhancements
 Add IPFS-based document verification for vehicle papers.

 Build a React/Next.js frontend for end-user verification.

 Implement an audit trail of ownership transfers.

 Enable role management UI for multi-admin structures.

 Integrate Chainlink oracles for cross-chain verification.

 Extend to ERC-721 tokenization of vehicle titles (NFT titles).

🧑‍💻 Development Notes
Built using OpenZeppelin’s secure libraries.

Avoids use of Ownable for greater flexibility in role management.

Designed to be compatible with EVM-compatible chains (Ethereum, Polygon, Core, BSC).

Future versions can incorporate ERC-721 to make vehicle titles transferable NFTs.

🧪 Testing
You can test this contract easily using Remix, Hardhat, or Foundry.

Example (Hardhat)
bash
Copy code
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox @openzeppelin/contracts
Test Script Example (JavaScript):

javascript
Copy code
const { expect } = require("chai");

describe("VehicleTitleRegistry", function () {
  let registry, owner, admin, user;

  beforeEach(async function () {
    [owner, admin, user] = await ethers.getSigners();
    const Registry = await ethers.getContractFactory("VehicleTitleRegistry");
    registry = await Registry.deploy();
  });

  it("should register a new vehicle", async function () {
    await registry.registerVehicle("VIN123", "Tesla", "Model S", 2023);
    const vehicle = await registry.vehicles(1);
    expect(vehicle.make).to.equal("Tesla");
  });
});
Run tests:

bash
Copy code
npx hardhat test
🧩 Example Integration Idea
A simple web dashboard can:

Display registered vehicles.

Allow authorized users to register new ones.

Let owners transfer ownership.

Query blockchain events to build an immutable ownership timeline.

Tech stack suggestion:

Frontend: React.js + Ethers.js

Backend (optional): Node.js for data caching

Blockchain: Ethereum / Polygon / Core DAO Testnet

📜 Events
Event	Parameters	Description
VehicleRegistered(uint256 id, address owner, string vin)	Logs when a new vehicle is registered	
OwnershipTransferred(uint256 id, address from, address to)	Logs ownership transfers

 ## Contract Deployment
0xA007E8C53E142Cd42cCC7Bd76Cc3E87745994C0E
<img width="1402" height="689" alt="image" src="https://github.com/user-attachments/assets/c1cfdf95-08ac-4d62-9271-410d8b83d612" />
