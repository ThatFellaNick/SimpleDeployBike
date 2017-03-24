//SimpleDeployBike
//By Relentless

if (false) then {
  cutText [format["You can't pack your bike while in combat."], "PLAIN DOWN"];
} else {
  player removeAction s_player_deploybike2;
  player playActionNow "Medic";
  r_interrupt = false;
  player addWeapon "ItemToolbox";
  deletevehicle cursortarget;
  
  _dis = 10;
  _sfx = "repair";
  
  [player, _sfx, 0, false, _dis] call dayz_zombieSpeak;
  [player, _dis, true, (getPosATL player)] spawn player_alertZombies;
  
  sleep 6;
  
  cutText [format["You packed your bike and got your toolbox back."], "PLAIN DOWN"];
  r_interrupt = false;
  player switchMove "";
  player playActionNow "stop";
};
