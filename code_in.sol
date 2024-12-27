//SPDX-License-Identifier: Apache License 2.0 
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
    event DBCodeSent(
        address indexed user,
        string handle,
        string tailTx,
        string typeField,
        string offset
    );
      
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
    function sendDbCode(
        address user,
        string memory handle,
        string memory tailTx,
        string memory typeField,
        string memory offset
    ) public {
        emit DBCodeSent(user, handle, tailTx, typeField, offset);
    
    }

    function userDataConnect(
        address user,
        string memory newDbTx,
        string memory recentDataListTx
    ) public {
        UserDataList storage userDataList = userDataLists[user];
        userDataList.nowDbTx = newDbTx;
        userDataList.beforeDataListTx = recentDataListTx;
    }
}
