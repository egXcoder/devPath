<?php

use Illuminate\Database\Seeder;

class AllTablesSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        factory('App\CodeLanguage')->create(['name' => 'language-html']);
        factory('App\CodeLanguage')->create(['name' => 'language-css']);
        factory('App\CodeLanguage')->create(['name' => 'language-js']);
        factory('App\CodeLanguage')->create(['name' => 'language-php']);
        factory('App\User')->create();

        for ($i = 1;$i < 6;$i++) {
            $category_id = factory('App\Category')->create()->id;
            for ($j = 0;$j < 5;$j++) {
                $panel_id = factory('App\Panel')->create(['category_id' => $category_id, 'order' => $j])->id;
                factory('App\Header', 3)->create(['panel_id' => $panel_id]);
                factory('App\Content', 3)->create(['panel_id' => $panel_id, 'code_language_id' => rand(1, 3)]);
            }
        }
    }
}
