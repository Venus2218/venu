
// SPDX-License-Identifier: MIT 

pragma solidity 0.8.19;
contract multisender{
    address owner;
    string public name="doller";
    string public symbol="$";
    uint public decimal=18;
    uint public totalsupply;

    struct emp {
        address addr;
        uint grade;
        uint balance;
    }
    address[] emps;
    mapping(address=>emp) public employees;

    constructor()
    {
        totalsupply=(10**decimal);
        employees[msg.sender].balance=totalsupply;
        owner=msg.sender;
    }

    function addEmployee(address e,uint grade) public {
        require(msg.sender==owner);
        employees[e] =  emp(e,grade,0);
        emps.push(e);
    }

    function sendgrade1(address r) private 
    {
        uint grade1salary=10000;
        require(employees[owner].balance>=grade1salary);
        employees[owner].balance-=grade1salary;
        employees[r].balance+=grade1salary;

    }   
    function sendgrade2(address r) private 
    {
        uint grade2salary=5000;
        require(employees[owner].balance>=grade2salary);
        employees[owner].balance-=grade2salary;
        employees[r].balance+=grade2salary;

    }  
    function sendgrade3(address r) private 
    {
        uint grade3salary=2500;
        require(employees[owner].balance>=grade3salary);
        employees[owner].balance-=grade3salary;
        employees[r].balance+=grade3salary;

    }   
    function sendgrade4(address r)private 
    {
        uint grade4salary=1250;
        require(employees[owner].balance>=grade4salary);
        employees[owner].balance-=grade4salary;
        employees[r].balance+=grade4salary;

    }  
    function sendgrade5(address r) private 
    {
       uint grade5salary =700;
        require(employees[owner].balance>=grade5salary);
        employees[owner].balance-=grade5salary;
        employees[r].balance+=grade5salary;

    }   

    function paySalaries() public {
        uint i=0;
        for(i;i<emps.length;i++){
            emp memory acc = employees[emps[i]];
            if(acc.grade==1){
                sendgrade1(acc.addr);
            }else if(acc.grade==2){
                sendgrade2(acc.addr);
            }else if(acc.grade==3){
                sendgrade3(acc.addr);
            }else if(acc.grade==4){
                sendgrade4(acc.addr);
            }else if(acc.grade==5){
                sendgrade5(acc.addr);
            }
        }
    }
    function balacnce(address account)public view returns(uint)
    {
        return employees[account].balance;
    }
}