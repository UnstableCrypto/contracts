// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import { ERC20 } from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import { Initializable } from "lib/openzeppelin-contracts-v5/contracts/proxy/utils/Initializable.sol";

/// @title UnstableFaucet
/// @notice A predeploy contract that allows anyone to mint free test tokens.
/// @custom:predeploy 0x4200000000000000000000000000000000000005
contract UnstableFaucet is ERC20, Initializable {
    /// @notice Amount of tokens minted per claim.
    uint256 public constant MINT_AMOUNT = 1000 ether;

    /// @notice Mapping to track if an address has claimed.
    mapping(address => bool) public hasClaimed;

    /// @notice Event emitted when a user claims tokens.
    event Claimed(address indexed account, uint256 amount);

    /// @notice Error thrown when address has already claimed.
    error AlreadyClaimed();

    /// @notice Constructor to disable initialization.
    constructor() {
        _disableInitializers();
    }

    /// @notice Initializes the UnstableFaucet contract.
    /// @param _name        Token name.
    /// @param _symbol      Token symbol.
    function initialize(string memory _name, string memory _symbol) external initializer {
        _setName(_name);
        _setSymbol(_symbol);
    }

    /// @notice Allows any address to claim free tokens once.
    function claim() external {
        if (hasClaimed[msg.sender]) {
            revert AlreadyClaimed();
        }

        hasClaimed[msg.sender] = true;
        _mint(msg.sender, MINT_AMOUNT);

        emit Claimed(msg.sender, MINT_AMOUNT);
    }
}