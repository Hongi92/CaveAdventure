///boss_smash_state()
if(!place_meeting(x, y+1, obj_solid)){
    if(vspd < 16){
        vspd += 2;
    }
    move(obj_solid);
}else{
    state = boss_stall_state;
    alarm[0] = room_speed;
    audio_play_sound(snd_step, 8, false);
    if(position_meeting(x, y, obj_lava)){
        hp -=1;
        audio_play_sound(snd_snake, 9, false);
    }
}
