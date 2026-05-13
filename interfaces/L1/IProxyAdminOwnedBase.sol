// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IProxyAdmin } from "interfaces/universal/IProxyAdmin.sol";

interface IProxyAdminOwnedUnstable {
    error ProxyAdminOwnedUnstable_NotSharedProxyAdminOwner();
    error ProxyAdminOwnedUnstable_NotProxyAdminOwner();
    error ProxyAdminOwnedUnstable_NotProxyAdmin();
    error ProxyAdminOwnedUnstable_NotProxyAdminOrProxyAdminOwner();
    error ProxyAdminOwnedUnstable_ProxyAdminNotFound();
    error ProxyAdminOwnedUnstable_NotResolvedDelegateProxy();

    function proxyAdmin() external view returns (IProxyAdmin);
    function proxyAdminOwner() external view returns (address);
}
