# code-in-for-eth
This smart contract enables state-change-based storage and transaction log linking, optimizing data storage and retrieval on Ethereum.

Introduction

CodeIn is a blockchain-based system for managing data storage and retrieval through transaction linking and state updates. Originally designed for Solana, 
it has been adapted to Ethereum, leveraging key differences in architecture and capabilities.

Key Features of CodeIn
	1.	State-Change-Based Storage
	•	Uses state changes to track and store data, avoiding explicit variable storage for efficiency.
	2.	Transaction Linking
	•	Creates a linked list-like structure of transactions, enabling traceable and sequential data tracking.
	3.	On-Chain Logging for Cost Reduction
	•	Ethereum’s logs are fully on-chain, making them an efficient way to store data while maintaining traceability.
	4.	Wallet-Specific Data Tracking
	•	Each wallet has its own data structure, enabling quick retrieval and updates for individual users.

Differences Between Solana and Ethereum Implementations

Solana Implementation
	•	Storage Method: State updates only (logs are not fully on-chain in Solana).
	•	Data Retrieval: Fast access using Program Derived Addresses (PDAs).
	•	Gas Costs: Low, due to Solana’s network characteristics.

Ethereum Implementation
	•	Storage Method: Combines logs for cost-effective data storage and state updates for structured tracking.
	•	Data Retrieval: Logs store transaction details, while user-specific state provides current data.
	•	Gas Costs: Optimized by minimizing state changes and leveraging logs.

Key Functionalities
	1.	Event Logging (sendCode and sendDbCode)
Emits transaction-related data to the Ethereum logs for cost-efficient storage and traceability.
	2.	State Updates (userDataConnect)
Updates user-specific data structures to maintain current linked transactions.
	3.	User Initialization (userInitialize)
Prepares the user’s state structure with default values for tracking and storing transaction-linked data.
	4.	Transaction Linking
Tracks transaction IDs in a linked-list-like fashion using nowDbTx (current transaction) and beforeDbTx also beforeTx


Advantages of CodeIn on Ethereum
	1.	Cost Efficiency: Combines state updates and logs to balance gas costs and functionality.
	2.	Traceability: Links transactions sequentially, enabling easy tracking of data changes.
	3.	Scalability: Optimized for Ethereum’s higher gas costs while maintaining on-chain integrity.
	4.	Flexibility: Supports wallet-specific data structures for personalized data retrieval.

Usage
	1.	Initialize a user with userInitialize.
	2.	Log data efficiently with sendCode and sendDbCode for traceability.
  3.  update data with userDataConnect 
	4.	Use the UserDataList mapping to retrieve the current state for a specific wallet.
