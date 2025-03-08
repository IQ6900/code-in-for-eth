//SPDX-License-Identifier: Apache License 2.0
pragma solidity ^0.8.0;

contract CodeIn {
    struct CodeInfo {
        address user;
        string code;
        string beforeTx;
        uint8 method;
        uint8 decodeBreak;
    }

    struct DbCodeInfo {
        address user;
        string handle;
        string tailTx;
        string typeField;
        string offset;
    }

    // event log
    event CodeSent(bytes indexed codeInfo);

    // data update
    event DBCodeSent(bytes indexed dbCodeInfo);

    // data update
    struct UserDataList {
        string nowDbTx;
        string beforeDataListTx;
    }

    mapping(address => UserDataList) public userDataLists;

    // user_initialize
    function userInitialize(address user) public {
        UserDataList storage userDataList = userDataLists[user];
        userDataList.nowDbTx = "";
        userDataList.beforeDataListTx = "Genesis";
    }

    function encodeCodeInfo(CodeInfo memory codeInfo) public pure returns (bytes memory) {
        return abi.encode(codeInfo);
    }

    function decodeCodeInfo(bytes memory codeInfoBytes) public pure returns (CodeInfo memory) {
        return abi.decode(codeInfoBytes, (CodeInfo));
    }

    function encodeDbCodeInfo(DbCodeInfo memory dbCodeInfo) public pure returns (bytes memory) {
        return abi.encode(dbCodeInfo);
    }

    function decodeDbCodeInfo(bytes memory dbCodeInfoBytes) public pure returns (DbCodeInfo memory) {
        return abi.decode(dbCodeInfoBytes, (DbCodeInfo));
    }

    // send_code function uses log
    function sendCode(address user, string calldata code, string calldata beforeTx, uint8 method, uint8 decodeBreak)
        public
    {
        CodeInfo memory codeInfo = CodeInfo(user, code, beforeTx, method, decodeBreak);
        bytes memory codeInfoBytes = encodeCodeInfo(codeInfo);
        emit CodeSent(codeInfoBytes);
    }

    // db_code_in function uses state update
    function sendDbCode(
        address user,
        string calldata handle,
        string calldata tailTx,
        string calldata typeField,
        string calldata offset
    ) public {
        DbCodeInfo memory dbCodeInfo = DbCodeInfo(user, handle, tailTx, typeField, offset);
        bytes memory dbCodeInfoBytes = encodeDbCodeInfo(dbCodeInfo);
        emit DBCodeSent(dbCodeInfoBytes);
    }

    function userDataConnect(address user, string calldata newDbTx, string calldata recentDataListTx) public {
        UserDataList storage userDataList = userDataLists[user];
        userDataList.nowDbTx = newDbTx;
        userDataList.beforeDataListTx = recentDataListTx;
    }
}
