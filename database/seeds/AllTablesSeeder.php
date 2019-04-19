<?php

use Illuminate\Database\Seeder;

class AllTablesSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        for($i=1;$i<6;$i++){
            $category_id = factory('App\Category')->create()->id;
            for($i=1;$i<6;$i++){
                $panel_id = factory('App\Panel')->create(['category_id'=>$category_id])->id;
                factory('App\Header',3)->create(['panel_id'=>$panel_id]);
                
            }
            
        }
    }
}
