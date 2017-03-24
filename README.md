# [EPOCH 1.0.6+] SimpleDeployBike
A simple script that lets you deploy a bike out of your toolbox, you can also pack it up and get your toolbox back.

* Tested as working on a blank Epoch 1.0.6+ and OverWatch 0.25 server
* Supports any map
* You can build up the bike by right clicking your toolbox (the toolbox will be used for it)
* If you don't need the bike anymore you can scroll on it and hit "Pack bike", you will also get your toolbox back


**[>> Download <<] (https://github.com/DAmNRelentless/SimpleDeployBike/archive/master.zip)**

- All files that were edited are provided in the downloaded file so if you have a non edited server you can just replace your files with the provided ones.
- If you have already modified fn_selfActions.sqf, compiles.sqf, variables.sqf and so on, just follow the instructions and merge the changes in.

# Mission folder install (when you don't have modified files):

1. Drop the folder "dayz_code" into your mission.

2. If you didn't edit the init.sqf and the descripton.ext yet, just replace your ones with the provided ones.

3. In case you already made some changes to them, follow the next instructions. If you replaced them, you are done.

4. In your mission\init.sqf find this line:

	```sqf
  call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
	```
  and directly below it add:
	```sqf
  call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";
	```
  Now search for:
	```sqf
  call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
	```
  and again directly below it add:
	```sqf
  call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";
	```
  
5. Now in your mission\description.ext go all the way to the bottom and add:
	```sqf
  #include "dayz_code\scripts\extra_rc.hpp"
	```

6. This should be all, you are done!

# Mission folder install (when you already have modified files):

1. In your mission\description.ext go all the way to the bottom and add:
	```sqf
  #include "dayz_code\scripts\extra_rc.hpp"
	```
2. Now drop the files that are provided in the dayz_code\scripts into your scripts folder. If you don't have one, create one or edit the paths of the scripts.

3. If you don't have a modified compiles.sqf then follow the other instruction above this one. But in case you have one, open it and search for:
	```sqf
  player_selectSlot = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\ui_selectSlot.sqf";
	```
  and change it to:
  ```sqf
  player_selectSlot = compile preprocessFileLineNumbers "dayz_code\compile\ui_selectSlot.sqf";
	```
  After that make sure that you have a custom fn_selfActions.sqf path!

4. If you don't have a modified fn_selfactions.sqf then follow the other instructions above this one. But in case you have one, open it and search for:
	```sqf
  //Grab Flare
  if (_canPickLight && !dayz_hasLight && !_isPZombie) then {
	```
  Directly above it add:
	```sqf
  //SimpleDeployBike
  _weapons = [currentWeapon player] + (weapons player) + (magazines player);
  _isBike = typeOf cursorTarget in ["Old_bike_TK_INS_EP1","Old_bike_TK_CIV_EP1"];
  if ((_isBike) and _canDo) then {
    if (s_player_deploybike2 < 0) then {
      s_player_deploybike2 = player addaction[("<t color=""#00FFBF"">" + ("Pack bike") +"</t>"),"dayz_code\scripts\packbike.sqf","",5,false,true,"", ""];
    };
  } else {
    player removeAction s_player_deploybike2;
    s_player_deploybike2 = -1;
  };
	```

5. If you don't have a modified variables.sqf then follow the other instructions above this one. But in case you have one, open it and search for:
	```sqf
  DZE_safeVehicle = ["ParachuteWest","ParachuteC"];
	```
  and add:
  ```sqf
  "Old_bike_TK_INS_EP1"
	```
  so it looks like:
  ```sqf
  DZE_safeVehicle = ["ParachuteWest","ParachuteC","Old_bike_TK_INS_EP1"];
	```
  
6. If you don't have a modified ui_selectSlot.sqf then drop in mine that is provided in mission\dayz_code\compile. Otherwise open yours and search for:
	```sqf
  _pos set [3,_height];
	```
  directly above that add:
	```sqf
	// Add extra context menus
	_erc_cfgActions = (missionConfigFile >> "ExtraRc" >> _item);
	_erc_numActions = (count _erc_cfgActions);
	if (isClass _erc_cfgActions) then {
		for "_j" from 0 to (_erc_numActions - 1) do {
			_menu =  _parent displayCtrl (1600 + _j + _numActions);
			_menu ctrlShow true;
			_config =  (_erc_cfgActions select _j);
			_text =  getText (_config >> "text");
			_script =  getText (_config >> "script");
			_height = _height + (0.025 * safezoneH);
			uiNamespace setVariable ['uiControl', _control];
			_menu ctrlSetText _text;
			_menu ctrlSetEventHandler ["ButtonClick",_script];
		};
	};
	```
  
  
# You are done now! Make sure to leave feedback and if you found any bug make sure to report it. Thank you!
