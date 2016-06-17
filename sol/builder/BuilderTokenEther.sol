import 'creator/CreatorTokenEther.sol';
import './Builder.sol';

/**
 * @title BuilderTokenEther contract
 */
contract BuilderTokenEther is Builder {
    function BuilderTokenEther(uint _buildingCost, address _cashflow, address _proposal)
             Builder(_buildingCost, _cashflow, _proposal)
    {}
    
    /**
     * @dev Run script creation contract
     * @param _name is name token
     * @param _symbol is symbol token
     * @return address new contract
     */
    function create(string _name, string _symbol) returns (address) {
        var inst = CreatorTokenEther.create(_name, _symbol);
        Owned(inst).delegate(msg.sender);
        
        deal(inst);
        return inst;
    }
}
