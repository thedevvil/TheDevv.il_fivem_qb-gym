# TheDevv.il_fivem_qb-gym

---
Fivem GYM. 
Config.lua dosyasında düzenlemelerini yapın. 
Sonrasında /Resources klasörü altında [qb] dosyasına atınız.
---
Fivem GYM.
Make your edits in the Config.lua file.
Then put it in the [qb] file under the /Resources folder.
---

# The Devv.il Web

- [thedevvil.site](http://www.thedevvil.site)

<p align="center">
  <img  width="200" height="200" src="https://i.hizliresim.com/cau0xef.png">
</p>

- [thedevvil.com.tr](http:/www.thedevvil.com.tr) 

<p align="center">
  <img  width="200" height="200" src="https://i.hizliresim.com/mir3xf2.png">
</p>


# qb-gym
 gym and skill system to for qbcore

## Resmon
idle 0.00-0.01 // max 0.04 with 3drawtxt


## ADD TO SHARED.LUA
```
['gym_membership'] 					 = {['name'] = 'gym_membership', 			 	  	  	['label'] = 'Gym membership', 						['weight'] = 0, 		['type'] = 'item', 		['image'] = 'gym_membership.png', 				['unique'] = true, 		['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Carnet del gym fachero'},
```
## Screenshots
![Check Status](https://imgur.com/mWb93QG.png)


Works with latest update of QBCORE

## Config
```

Config = {}

Config.UpdateFrequency = 3600 
Config.DeleteStats = true 

Config.MmbershipCardPrice = 200

Config.Skills = {
    ["resistance"] = { 
        ["Current"] = 20, 
        ["RemoveAmount"] = -0.3, 
        ["Stat"] = "MP0_STAMINA" 
    },

    ["strength"] = {
        ["Current"] = 10, ["RemoveAmount"] = -0.3, ["Stat"] = "MP0_STRENGTH"
    },

    ["diving"] = {
        ["Current"] = 0, ["RemoveAmount"] = -0.3, ["Stat"] = "MP0_LUNG_CAPACITY"
    },

    ["shooting"] = {
        ["Current"] = 0, ["RemoveAmount"] = -0.1,["Stat"] = "MP0_SHOOTING_ABILITY"
    },

    ["driving"] = {
        ["Current"] = 0, ["RemoveAmount"] = -0.5, ["Stat"] = "MP0_DRIVING_ABILITY"
    },

    ["Raise front wheel"] = {
        ["Current"] = 0, ["RemoveAmount"] = -0.2, ["Stat"] = "MP0_WHEELIE_ABILITY"
    }
}

Config.Locations = {
    [1] = {--pull-ups
        coords = vector3(-1200.02, -1571.18, 4.61), heading = 215.53, type = "pull-ups",
        animation = "prop_human_muscle_chin_ups", skill = "resistance", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do Pull-ups]", viewDistance = 2.5,
    },
    [2] = {--arms
        coords = vector3(-1202.9837, -1565.1718, 4.63115), heading = 212.78, type = "arms",
        animation = "world_human_muscle_free_weights", skill = "strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Use weights]", viewDistance = 2.5,
    },
    [3] = {--pushup
        coords = vector3(-1203.3242, -1570.6184, 4.631155), heading = 212.78, type = "pushup",
        animation = "world_human_push_ups", skill = "strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do push-ups]", viewDistance = 2.5,
    },
    [4] = {--yoga
        coords = vector3(-1204.7958, -1560.1906, 4.63115), heading = 212.78, type = "yoga",
        animation = "world_human_yoga", skill = "resistance", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do yoga]", viewDistance = 2.5,
    },
    [5] = {--yoga
        coords = vector3(-1221.04, -1545.01, 4.69), heading = 212.78, type = "yoga",
        animation = "world_human_yoga", skill = "resistance", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do yoga]", viewDistance = 3.5,
    },
    [6] = {--yoga
        coords = vector3(-1217.09, -1543.43, 4.72), heading = 212.78, type = "yoga",
        animation = "world_human_yoga", skill = "resistance", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do yoga]", viewDistance = 3.5,
    },
}
```
# The Devv.il
<p align="center">
  <img  width="1000" height="250" src="https://i.hizliresim.com/lh5i19a.png">
</p>


# License

MIT License

Copyright (c) 2021 thedevvil

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

