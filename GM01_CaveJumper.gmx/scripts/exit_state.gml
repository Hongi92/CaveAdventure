//exit_state
if(image_alpha > 0){
    image_alpha -= .25;
}else{
    if (room != room_last){
        room_goto_next();    
    }else{
        //calculate score
        score = obj_playerStats.sapphires;
        
        //open the highscores
        ini_open("Settings.ini");
        obj_playerStats.highscore = ini_read_real("Score", "Highscore", 0);
        
        //a new highscore case
        if(score >  obj_playerStats.highscore){
             obj_playerStats.highscore = score;
             ini_write_real("Score", "Highscore", obj_playerStats.highscore);
        }
        
        //close ini
        ini_close();
        
        room_goto(rm_highscore);
    }
}
