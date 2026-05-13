// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

// Testing
import { Test } from "lib/forge-std/src/Test.sol";

// Contracts
import { ReinitializableUnstable } from "src/universal/ReinitializableUnstable.sol";

/// @title ReinitializableUnstable_Harness
/// @notice Harness contract to allow direct instantiation and testing of `ReinitializableUnstable`
///         logic.
contract ReinitializableUnstable_Harness is ReinitializableUnstable {
    constructor(uint8 _initVersion) ReinitializableUnstable(_initVersion) { }
}

/// @title ReinitializableUnstable_Constructor_Test
/// @notice Tests the constructor of the `ReinitializableUnstable` contract.
contract ReinitializableUnstable_Constructor_Test is Test {
    /// @notice Tests that the contract creation reverts when init version is zero.
    function test_constructor_zeroVersion_reverts() public {
        vm.expectRevert(ReinitializableUnstable.ReinitializableUnstable_ZeroInitVersion.selector);
        new ReinitializableUnstable_Harness(0);
    }

    /// @notice Tests that constructor succeeds with valid non-zero init versions.
    /// @param _initVersion Init version to use when creating the contract.
    function testFuzz_constructor_validVersion_succeeds(uint8 _initVersion) public {
        _initVersion = uint8(bound(_initVersion, 1, type(uint8).max));
        ReinitializableUnstable_Harness harness = new ReinitializableUnstable_Harness(_initVersion);
        assertEq(harness.initVersion(), _initVersion);
    }
}
