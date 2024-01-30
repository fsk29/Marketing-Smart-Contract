# Teknopark Marketing Smart Contract

## Overview

This smart contract is designed for the Teknopark Marketing system. It manages the debt information of users based on their wallet addresses and provides functionalities for authorized users to query and update this information.

## Features

- **Debt Management:**
  - Store information about users' names, ages, and debt amounts based on their wallet addresses.
  - Authorized users can query and update debt information.

- **Authorization System:**
  - Different levels of access for users: Owner, Authorized Users, and All Users.
  - Only the Owner can perform certain administrative functions.

## Smart Contract Functions

### Owner Functions

- `closeVoting()`: Close the voting process.
- `getCurrentLeader()`: Get the current leader in the voting process.
- `getVoterInfo(address)`: Get information about a specific voter.

### Authorized User Functions

- `registerCandidate(name)`: Register a candidate for the election.
- `getCandidateVoteCount(name)`: Get the vote count for a specific candidate.
- `getVoterInfo(address)`: Get information about a specific voter.

### All User Functions

- `voteForCandidate(candidateName)`: Vote for a specific candidate.
- `voteForSecondChoice(candidateName)`: Vote for a second-choice candidate.


