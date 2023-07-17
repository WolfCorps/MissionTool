#include "script_component.hpp"

params ["_unit"];

// https://github.com/acemod/ACE3/blob/aead9a8eb4949714ddcb5d7b07b57f0c798a4ea0/addons/medical_treatment/Cfg3DEN.hpp#L45

if (ATTRIB(_unit, "ace_isMedic") > 0) exitWith {true};
if (parseNumber (_unit getUnitTrait "medic") > 0) exitWith {true};

false