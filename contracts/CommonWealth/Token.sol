pragma solidity >= 0.7.0 < 0.8.0;
// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;
import "../openzeppelin-contracts/contracts/token/ERC20/./ERC20.sol";
import "../openzeppelin-contracts/contracts/token/ERC20/../../math/SafeMath.sol";
import "../openzeppelin-contracts/contracts/token/ERC20/./SafeERC20.sol";

struct TokenInfo {
    address tokenAddress;
    uint8 decimals;
    uint256 conversionRatio; //token * 10*(18-decimals) * conversionRatio = tori out
}

contract CommonWealthT is ERC20 {
    using SafeMath for uint256;
    uint256 _creationDate;
    TokenInfo[] _tokenInfo;
    uint256 _tokenInfoLength;
    //mappings default to 0 so _tokenArrayEntry[address] - 1 is the location of the token in the array
    mapping(address => uint256) _tokenArrayEntry;

    constructor() ERC20("Commonwealth", "TORI") {
        _creationDate = block.timestamp;
    }

    function _getTokenInfo(address token) internal returns (TokenInfo memory) {
        require(_tokenArrayEntry[token] > 0, "Token is unsupported");
        return _tokenInfo[_tokenArrayEntry[token]-1];
    }
    
}
