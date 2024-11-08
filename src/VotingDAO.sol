// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingDAO {
    struct Proposal {
        string description;
        uint256 voteCount;
        bool executed;
    }

    address public owner;
    Proposal[] public proposals;
    mapping(uint256 => mapping(address => bool)) public votes;

    constructor() {
        owner = msg.sender;
    }

    // Function to create a proposal
    function createProposal(string memory description) external {
        proposals.push(Proposal({
            description: description,
            voteCount: 0,
            executed: false
        }));
    }

    // Function to vote on a proposal
    function vote(uint256 proposalId) external {
        require(proposalId < proposals.length, "Invalid proposal ID");
        require(!votes[proposalId][msg.sender], "Already voted");

        proposals[proposalId].voteCount += 1;
        votes[proposalId][msg.sender] = true;
    }

    // Function to execute a proposal (simulated action)
    function executeProposal(uint256 proposalId) external {
        require(msg.sender == owner, "Only owner can execute");
        require(proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.executed, "Already executed");
        require(proposal.voteCount > 0, "Not enough votes");

        proposal.executed = true;
    }

    // Get the count of proposals
    function getProposalCount() public view returns (uint256) {
        return proposals.length;
    }
}
