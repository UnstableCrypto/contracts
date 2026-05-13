// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

// Contracts
import { FeeVault } from "src/L2/FeeVault.sol";

// Interfaces
import { ISemver } from "interfaces/universal/ISemver.sol";

/// @custom:proxied true
/// @custom:predeploy 0x4200000000000000000000000000000000000019
/// @title UnstableFeeVault
/// @notice The UnstableFeeVault accumulates the base fee that is paid by transactions.
contract UnstableFeeVault is FeeVault, ISemver {
    /// @notice Semantic version.
    /// @custom:semver 1.6.0
    string public constant version = "1.6.0";
}
