pragma solidity >=0.7.0 <0.9.0;

contract DealTShirt
{

    bool deal = false;
    address public Beach;
    uint public QuantityofTShirts;
    string public PaymentStatus = "Pending";
    address public ThreadsInc;
    string public OrderStatus = "Pending";
    uint public Cost;

    constructor(uint quantity) public
    {
        Beach = msg.sender;
        QuantityofTShirts = quantity;
    }

    function AcceptOffer() public
    {
        if ( msg.sender == Beach )
        {
            revert("Threads Inc will accept the offers!");
        }

        deal = true;
        OrderStatus = "Order Complete!";
        Cost = QuantityofTShirts*800;
    }
    
    function MakePayment() public
    {
        
        if ( deal == false )
        {
            if (msg.sender == Beach)
            {
                revert("Let the offer be first accepted !");
            }
            else
            {
                revert("Threads Inc are not able to make payment for themselves!");
            }
        }
        
        else
        {
            if ( msg.sender != Beach )
            {
                revert("Threads Inc are not able to make payment for themselves!");
            }
            
            PaymentStatus = "Done!";
        }
        
    }