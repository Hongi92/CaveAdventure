///spider_idle_state

//look for player
if(instance_exists(obj_player)){
    var dis = distance_to_object(obj_player);
    
    if(dis < sight && alarm[0] <= 0){
        image_speed = .5;
        
        //face the player
        if(obj_player.x != x){
            image_xscale = sign(obj_player.x-x);
        }
    }
}
