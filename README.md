# 🚗 Vehicle Title Registry dApp

A decentralized application for registering, transferring, and verifying vehicle ownership using blockchain technology.  
This project aims to eliminate fraud, improve transparency, and streamline the process of managing vehicle titles.

---

## 📌 Overview

The **Vehicle Title Registry dApp** enables:
- Vehicle owners to register and verify their vehicles on the blockchain.  
- Authorities to approve or reject title applications.  
- Secure and transparent title transfers between buyers and sellers.  
- Immutable ownership history records accessible to all stakeholders.



--- boom

## 🧠 Key Features

- ✅ Secure vehicle registration  
- 🔒 Immutable proof of ownership  
- 🔁 Ownership transfer via smart contract  
- 🧾 Permanent history of title transfers  
- 🕵️ Fraud prevention and public verification  
- 🧩 Modular design for easy extension (e.g., insurance integration)

---

## ⚙️ Technologies Used

| Component | Description |
|-----------|-------------|
| **Solidity** | Smart contracts for vehicle registration and title management |
| **Hardhat / Remix** | Development environment for compiling and deploying contracts |
| **Ethereum / EVM-compatible network** | Blockchain environment for contract execution |
| **Web3.js / Ethers.js** | Interaction between frontend and blockchain |
| **React / Next.js** | Frontend interface for users and authorities |

---

## 📂 Project Structure
vehicle-title-registry-dapp/
│
├── contracts/ # Solidity smart contracts
│ └── VehicleRegistry.sol # Core contract for vehicle registration and transfer
│
├── scripts/ # Deployment and automation scripts
│ └── deploy.js # Script to deploy contract on blockchain
│
├── test/ # Unit and integration tests
│ └── VehicleRegistry.test.js # Tests for contract functionalities
│
├── frontend/ # Frontend application (React/Next.js)
│ ├── components/ # Reusable UI components (forms, tables, modals, etc.)
│ ├── pages/ # Application pages (Home, Register, Verify, Transfer)
│ ├── utils/ # Blockchain helper functions (contract calls, Web3 setup)
│ └── styles/ # Styling (Tailwind / CSS)
│
├── hardhat.config.js # Hardhat configuration file
├── package.json # Project dependencies and scripts
└── README.md # Project documentation


---

## 🚀 Getting Started

### 1️⃣ Clone the Repository
bash
git clone https://github.com/your-username/vehicle-title-registry-dapp.git
cd vehicle-title-registry-dapp

2️⃣ Install Dependencies
npm install

3️⃣ Compile Smart Contracts
npx hardhat compile

4️⃣ Deploy the Contract
npx hardhat run scripts/deploy.js --network <network_name>

5️⃣ Launch the Frontend
cd frontend
npm run dev

🧪 Testing

Run unit tests to verify contract behavior:

npx hardhat test


You can also run the project on a local blockchain (e.g., Hardhat Network or Ganache) to simulate real interactions before deploying live.

🔐 Security and Access Control

Only authorized authorities can approve new vehicle registrations.

All ownership records are immutable once stored on-chain.

Smart contracts ensure secure and traceable transfers between verified parties.

On-chain data provides public transparency and prevents duplicate or fake registrations.

🧩 Future Enhancements

Integration with Insurance dApp for linked vehicle insurance records

QR code-based on-chain verification of vehicle ownership

Multi-chain deployment (Polygon, Avalanche, BSC, etc.)

AI-assisted fraud detection for suspicious ownership patterns

Support for NFT-based vehicle representation

## Contract Deployment 
contract address : 0x6a2F829f8fCc5fFC2659258A2492907f0d1915c7
<img width="1919" height="943" alt="image" src="https://github.com/user-attachments/assets/18f2d8f3-938a-463e-85d3-1e6839813e11" />


