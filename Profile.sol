// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract Profile {
    struct UserProfile {
        string username;
        string email;
        string bio;
    }

    mapping(address => UserProfile) public profiles;

    function createProfile(string memory username, string memory email,string memory bio) public {
        profiles[msg.sender] = UserProfile(username, email,bio);
    }

    function updateProfile(string memory bio) public {
        UserProfile storage profile = profiles[msg.sender];
        profile.bio = bio;
    }

    function getProfile(address userAddress) public view returns (UserProfile memory) {
        return profiles[userAddress];
    }
}
