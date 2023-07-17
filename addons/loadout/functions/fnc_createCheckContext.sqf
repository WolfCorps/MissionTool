params ["_unit"];


private _declaration = [
	["AddWarning", {
		params ["_contextStr", "_warningText"];

		private _warningContent = createHashMap;
		_warningContent set ["ctx", _contextStr];
		_warningContent set ["text", _warningText];

		(_self get "_warnings") pushBack _warningContent;

	 }],
	["_warnings", []],

	["unit", objNull], // The unit being checked
	["isMedic", false], // Is the unit medic?
	["isEOD", false], // Is the unit EOD/Explosives person
	["unitItems", nil], // Stores uniqueUnitItems _unit



	["GetItemCount", {
		// Returns item count of either one item or a list of items 
		private _unitItems = (_self get "unitItems");
		if (_this isEqualType []) then {
				private _itemCount = 0;
				{
					_itemCount = _itemCount + (_unitItems getOrDefault [_x, 0]);
				} forEach _this;

				_itemCount;
		} else {
			_unitItems getOrDefault [_this, 0]
		}
	}]

];


private _checkContext = createHashMapObject [_declaration];
_checkContext set ["unit", _unit];

_checkContext