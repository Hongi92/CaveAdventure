///boss_lift_state()
image_index = 1;
if(vspd >= -16) vspd -= .5;
move(solid);

if(place_meeting(x, y-32, obj_solid)){
    vspd = 0;
    state = boss_chase_state;
}

