// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReinitializableUnstable {
    error ReinitializableUnstable_ZeroInitVersion();

    function initVersion() external view returns (uint8);

    // ReinitializerUnstable is abstract, so it has no constructor in its interface.
    function __constructor__() external;
}
