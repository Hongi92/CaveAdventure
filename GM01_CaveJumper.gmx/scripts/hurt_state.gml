///hurt_state()
//set the sprite
sprite_index = spr_player_hurt;

if(hspd != 0) image_xscale = sign(hspd);

//gravity
if(!place_meeting(x, y+1, obj_solid)){
    vspd += grav;
}else{
    vspd = 0;
    
    //friction
    apply_friction(acc);
}

direction_move_bounce(obj_solid);

//change back to move_state
if(hspd ==0 && vspd == 0){
    image_blend = c_white;
    if(obj_playerStats.hp <= 0){
        obj_playerStats.hp = obj_playerStats.maxhp;
        obj_playerStats.sapphires = 0;
        if(audio_is_playing(snd_boss_music)){
            audio_stop_sound(snd_boss_music);
        }
        room_restart();
    }
    state = move_state;
}





