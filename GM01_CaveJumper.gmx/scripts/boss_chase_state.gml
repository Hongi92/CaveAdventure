///boss_chase_state()
var dis = point_distance(x, y, obj_player.x, y);
if(dis < sprite_width/2-16 || place_meeting(x-1, y, obj_solid) || place_meeting(x+1, y, obj_solid)){
    state = boss_smash_state;
    audio_play_sound(snd_jump, 6, false);
    hspd = 0;
}else{
    hspd = (obj_player.x - x) * .05;
}

move(obj_solid);
