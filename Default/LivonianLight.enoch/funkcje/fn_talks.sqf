// Dialog 1 //
_talker = _this select 0;

switch (_talker) do
{
case "trap1":
{
  [trap1, 0 ,["ACE_MainActions", "rozmowaA"]] call ace_interact_menu_fnc_removeActionFromObject;
  if ((player distance trap1) < 10) then
  {
  titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Cywil:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>To była pułapka...Postrzelili mnie gdy szedłem do szpitala po zapasy.</t>", "PLAIN DOWN", -1, true, true];
  sleep 3;
  titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Cywil:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Proszę przenieście mnie chociaż do szpitala..</t>", "PLAIN DOWN", -1, true, true];
  sleep 3;
};};
case "civ_1":
{
  [civ_1, 0 ,["ACE_MainActions", "civA"]] call ace_interact_menu_fnc_removeActionFromObject;
  if ((player distance civ_1) < 10) then
  {
  titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Bojówkarz:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Nie ma wody, nie ma jedzenia. Chcecie to nas zabijcie.</t>", "PLAIN DOWN", -1, true, true];
  sleep 3;
};};
case "civ_2":
{
  [civ_2, 0 ,["ACE_MainActions", "civB"]] call ace_interact_menu_fnc_removeActionFromObject;
  if ((player distance civ_2) < 10) then
  {
  titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Bojówkarz:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>.....</t>", "PLAIN DOWN", -1, true, true];
  sleep 3;
};};
case "civ_3":
{
  [civ_3, 0 ,["ACE_MainActions", "civC"]] call ace_interact_menu_fnc_removeActionFromObject;
  if ((player distance civ_3) < 10) then
  {
  titleText ["<t color='#A52A2A' shadow = 1 size='1.4'>Bojówkarz:</t><t color ='#FFFFFF' shadow = 2 size ='1.3'>Sześciu naszych zabrały te pierdolone potwory. Nic więcej nam nie zostało poza tymi tunelami. Nie widać ich dopóki się ich nie oświetli flarami...</t>", "PLAIN DOWN", -1, true, true];
  sleep 3;
};};};
