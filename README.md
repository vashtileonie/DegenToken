# DegenToken Smart Contract for Degen Gaming

This is the `DegenToken` smart contract for Degen Gaming on the Avalanche blockchain. The token is an ERC-20 compliant token that supports minting, transferring, redeeming for in-game store items, checking balances, and burning tokens. The contract owner has exclusive minting rights, while any user can transfer and burn tokens.

## Features

- **Minting tokens** (only owner)
- **Transferring tokens**
- **Burning tokens**
- **Redeeming tokens for in-game store items**
- **Viewing store items**
- **Checking token balance**

## Store Items

- Magic Wand = 80 tokens
- Health Boost = 120 tokens
- Mana Potion = 60 tokens
- Dragon Slayer Sword = 200 tokens
- Phoenix Feather = 250 tokens

## Prerequisites

- **MetaMask**: You should have an existing wallet already within the Fuji C-Chain Network. This extension should be enabled in your browser.
- **Request 2 AVAX** from the Avalanche faucet. You will need this to deploy your contract later.
- **Save your wallet's private key** in a secure location.
- **Remix IDE**: Ensure it is open.
- **Snowtrace**: Open for contract verification.

## Setup Instructions

1. **Create Project Directory**
    - Create an empty folder in your desired directory. You may use VSCode.
    - Clone the repository:
      ```bash
      git clone <repository-url>
      cd <repository-folder>
      ```

2. **Configure Hardhat**
    - In the `hardhat.config.js` file, paste your wallet's private key inside `accounts: [""]`. Alternatively, you can use a `.env` file.

3. **Install Dependencies**
    - Run these commands in your terminal:
      ```bash
      npm install --save-dev hardhat
      npx hardhat run scripts/deploy.js --network fuji
      ```

4. **Deployment Output**
    - You should get an output similar to this:
      ```
      Compiled n Solidity files successfully (evm target: paris).
      Degen token deployed to <0x... contract address>
      ```
    - Copy the contract address and paste it in the Snowtrace testnet search bar to verify your contract deployment.

5. **Connect to Remix IDE**
    - Open an additional terminal and run:
      ```bash
      remixd
      ```
    - In Remix IDE, under the file explorer, choose **connect to localhost** under the workspaces menu.
    - Click **Connect** when prompted.
    - Under the `contracts` folder, open the `DegenToken.sol` file.

## Deploying and Running

1. **Compile Contract**
    - Go to the **Solidity Compiler** tab in Remix IDE.
    - Select the appropriate compiler version and click **Compile**.

2. **Deploy and Run Transactions**
    - Go to the **Deploy and Run Transactions** tab.
    - Paste the contract address in the **At Address** field.
    - Click the **At Address** button to load the deployed contract.
    - Expand the deployed contract interface to interact with it.

## Interacting with the Contract

1. **Checking Token Balance**
    - Click the `getBalance` button. This will show your current token balance.

2. **Minting Tokens (only owner)**
    - Expand the `mint` field and input the address and value.
    - Ensure you are using the owner account to mint tokens.

3. **Transferring Tokens**
    - Expand the `transferTokens` field and input the recipient address and value to transfer tokens.

4. **Burning Tokens**
    - Input the amount you would like to burn in the `burnTokens` field.

5. **Viewing Store Items**
    - Click the `listStoreItems` button to view available in-game store items.

6. **Redeeming Tokens for In-Game Store Items**
    - Choose an index from the list of items you would like to redeem.
    - Input the index value in the `redeemTokens` field. Ensure your balance is sufficient to redeem the item.

## Credits

This project was made with the help of the starter template from Metacrafters.

## Author
Vashti Bauson
