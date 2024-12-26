//SPDX-License-Identifier:Apache License 2.0 

pragma solidity ^0.8.0;

contract CodeIn {
    // event log
    event CodeSent(
        address indexed user,
        string code,
        string beforeTx,
        uint8 method,
        uint8 decodeBreak
    );
    // data update
    struct DBStruct {
        uint8 bump;
        string handle;
        string dataTailTx;
        string nowDbTx;
        string beforeDbTx;
        string typeField;
        string offset;
    }
    mapping(address => DBStruct) public dbStructs;

    // user_initialize 
    function userInitialize(address user) public {
        DBStruct storage dbStruct = dbStructs[user];
        dbStruct.handle = "";
        dbStruct.dataTailTx = "";
        dbStruct.nowDbTx = "Genesis";
        dbStruct.beforeDbTx = "null";
        dbStruct.typeField = "";
        dbStruct.offset = "";
    }

    // send_code function uses log 
    function sendCode(
        address user,
        string memory code,
        string memory beforeTx,
        uint8 method,
        uint8 decodeBreak
    ) public {
        emit CodeSent(user, code, beforeTx, method, decodeBreak);
    }

    // db_code_in function uses state update 
    function dbCodeIn(
        address user,
        string memory handle,
        string memory dataTailTx,
        string memory typeField,
        string memory offset
    ) public {
        DBStruct storage dbStruct = dbStructs[user];
        dbStruct.handle = handle;
        dbStruct.dataTailTx = dataTailTx;
        dbStruct.typeField = typeField;
        dbStruct.offset = offset;
    }
    function dbConnect(
        address user,
        string memory newDbTx
    ) public {
        DBStruct storage dbStruct = dbStructs[user];
        dbStruct.beforeDbTx = dbStruct.nowDbTx;        
        dbStruct.nowDbTx = newDbTx;
    }
}
