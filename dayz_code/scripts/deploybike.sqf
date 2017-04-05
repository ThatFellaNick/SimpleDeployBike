//SimpleDeployBike
//By Relentless

if (false) then {
  cutText [format["You can't place your bike while you're in combat."], "PLAIN DOWN"];
} else {
  // Close the muther fucking dialog
  closeDialog 106;
  DZE_ActionInProgress = true;
  player removeAction s_player_deploybike2;
  player playActionNow "Medic";
  r_interrupt = false;
  player removeWeapon "ItemToolbox";
  
  _dis = 10;
  _sfx = "repair";
  
  [player, _sfx, 0, false, _dis] call dayz_zombieSpeak;
  [player, _dis, true, (getPosATL player)] spawn player_alertZombies;
  
  sleep 6;
  
  _object = "Old_bike_TK_INS_EP1" createVehicle (position player);
  _object setVariable ["ObjectID", "1", true];
  _object setVariable ["ObjectUID", "1", true];
  
  player reveal _object;
  cutText [format["You constructed a bike out of your toolbox."], "PLAIN DOWN"];
  
  r_interrupt = false;
  player switchMove "";
  player playActionNow "stop";
  DZE_ActionInProgress = false;
  sleep 10;
  
  cutText [format["WARNING: This bike won't be saved during server restart!"], "PLAIN DOWN"];
};
