///move_state()

if(!place_meeting(x, y+1, obj_solid)){
    vspd += grav;
    
    //player in the air
    sprite_index = spr_player_jump;
    image_speed = 0;
    image_index = (vspd>0);
    
    //jump height control
    if(up_release && vspd < -6){
        vspd = -6;
    }
}else{
    vspd = 0;
    if(up){
        vspd = -16;  
        audio_play_sound(snd_jump, 5, false);
    }
    
    //player on the ground
    if(hspd == 0){
        sprite_index = spr_player_idle;
    } else {
        sprite_index = spr_player_walk;
        image_speed = .6;
    }
    
}

if (right || left){
    hspd += (right-left)*acc;
    hspd_dir = right - left;
    
    if(hspd > spd){
        hspd = spd;
    }
    if(hspd < -spd){
        hspd = -spd;
    }
}else{
    apply_friction(acc);
}

if(hspd != 0){
    image_xscale = sign(hspd);
}

//play landing sound
if(place_meeting(x, y+vspd+1, obj_solid) && vspd > 0){
    audio_emitter_pitch(audio_em, random_range(.8, 1.2));
    audio_emitter_gain(audio_em, .2);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}

move(obj_solid);


//check for ledge grab state
var falling = y-yprevious > 0
var wasnt_wall = !position_meeting(x+17*image_xscale, yprevious, obj_solid);
var is_wall = position_meeting(x+17*image_xscale, y, obj_solid);

if(falling && wasnt_wall && is_wall){
    hspd = 0;
    vspd = 0;
    sprite_index = spr_player_ledge;
    state = ledgegrab_state;
    
    //move to the ledge
    while(!place_meeting(x+image_xscale, y, obj_solid)){
        x += image_xscale;
    }
    
    //height
    while(position_meeting(x+17*image_xscale, y-1, obj_solid)){
        y -=1;
    }
    
    //ledge grab sound
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, .1);
    audio_play_sound_on(audio_em, snd_step, false, 6);
    
    
}

