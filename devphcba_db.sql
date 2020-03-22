-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 22, 2020 at 10:43 AM
-- Server version: 10.3.22-MariaDB-log-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devphcba_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/lorem.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'VueJs', 'images/vuejs.png', '2019-04-30 17:53:44', '2019-05-01 18:56:11'),
(2, 'MySQL', 'images/mysql.png', '2019-04-30 17:53:45', '2019-05-01 18:56:30'),
(3, 'Mathematics', 'images/math.png', '2019-04-30 17:53:45', '2019-05-01 20:32:48'),
(4, 'Laravel', 'images/laravel.png', '2019-04-30 17:53:45', '2019-05-02 17:09:25'),
(5, 'Design Patterns', 'images/dp.png', '2019-04-30 17:53:46', '2019-05-05 21:28:31'),
(6, 'Algorithms', 'images/algorithm.png', '2019-05-04 10:06:32', '2019-05-04 10:08:30'),
(7, 'php', 'images/php.png', '2019-05-04 21:56:37', '2019-05-05 21:27:49'),
(8, 'js', 'images/javascript.png', '2019-11-16 16:37:06', '2019-11-20 03:34:30'),
(9, 'Sass', 'images/sass.png', '2019-11-19 17:39:18', '2019-11-20 03:28:31'),
(10, 'FrontEnd', 'images/lorem.jpg', '2019-11-20 15:28:36', '2019-11-20 15:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `code_languages`
--

CREATE TABLE `code_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `code_languages`
--

INSERT INTO `code_languages` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'language-html', '2019-04-30 17:53:43', '2019-04-30 17:53:43'),
(2, 'language-css', '2019-04-30 17:53:43', '2019-04-30 17:53:43'),
(3, 'language-js', '2019-04-30 17:53:43', '2019-04-30 17:53:43'),
(4, 'language-php', '2019-04-30 17:53:43', '2019-04-30 17:53:43'),
(5, 'language-sql', '2019-04-30 17:53:43', '2019-04-30 17:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `code_language_id` bigint(20) UNSIGNED NOT NULL,
  `panel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `content`, `order`, `code_language_id`, `panel_id`, `created_at`, `updated_at`) VALUES
(4, 'event listeners starts with \n v-on:eventName=\"function_here\"\n\nnotice it can be function_here() or \nfunction_here both are right\n\nnotice event object is passed by default \nwith all functions and you can reach \nthe element trigged the event from it, \nevent.target\n\nits good practice to call function \nwithout () , to allow default parameters \nif you are using plugins to be sent\n\n<div id=\"app\">\n<div id=\"window\" v-on:mousemove=\"updateXY()\">\n<!-- <div @mousemove=\"updateXY()\"> -->\n</div>\n   <p>Your mouse position is at {{x}} , {{y}}</p>\n</div>\n\n<script>\nvar app = new Vue({\n        el: \'#app\',\ndata: {\n	    x : \'\',\n     	y : \'\'\n      },\nmethods: {\n    updateXY:function(){\n	  console.log(event.target);\n      this.x = event.offsetX;\n	  this.y = event.offsetY;\n    }\n}\n})\n</script>\n\n<style>\n#window{\nposition:fixed;\nwidth:100%;\nheight:100%;\n}\n</style>', 5, 1, 2, '2019-04-30 17:53:44', '2019-04-30 22:13:03'),
(23, 'CASE    \nWHEN condition1 THEN result1    \nWHEN condition2 THEN result2    \nWHEN conditionN THEN resultN    \nELSE resultEND;\n\n//countLegs query with Creatures.type column\nSELECT SUM(CASE WHEN type=\'human\' THEN 2 WHEN type=\'cat\' THEN 4 when type=\'dog\' then 4 ELSE 0 END)\n    FROM creatures', 6, 5, 8, '2019-04-30 17:53:45', '2019-05-05 23:41:02'),
(26, 'CREATE DATABASE db; \n\n/*  * on creating table you must create columns also otherwise it won\'t allow creating table\n    * there should be at least one primary key according to 1NF:in Database design section \n    * try to choose the best fit DataType for your columns\n    * make sure that no column depend on another column in the table Revisit 3NF:in Database design section\n    *unsigned is put after the datatype not before\n    *if you don\'t want duplications in any column make it UNIQUE\n*/\n\nCREATE TABLE users (\nid int unsigned auto_increment primary key,\nfirstname VARCHAR(200),\nlast_name VARCHAR(200),\nage TINYINT\n);', 6, 5, 9, '2019-04-30 17:53:45', '2019-05-05 23:40:33'),
(33, 'BY THE PERMUTATIONS of the letters abc  \nwe mean all of their\npossible arrangements without duplications\nAnd Order is important :\nabc\nacb\nbac\nbca\ncab\ncba\n\nPermutation of 3 letters taking 3 at a time\n3P3 = 3! / 0! = 3! = 3*2 =6\n\nExample:\nThere are 6! permutations of the 6 letters\nof the word \"square\"\na)In how many of them is r the second letter?\n  _ r _ _ _ _\nAns:\nwe already take r letter so we can\'t use it\nunits s , q , u , a ,e \n5p5=120\n\nb)  In how many of them are q and e next to\n    each other?\nAns:\nsuppose qe \nunits qe, s, u a, r ... 5P5 = 120 \nsuppose eq\nunits eq, s, u a, r ... 5P5 = 120\nTotal Possibility = 120 + 120 =240\n\nExample2:\nHow many 2 digit numbers can you make \nusing the digits 1, 2, 3 and 4 without \nrepeating the digits?\n4P2 = 4! / (4-2)! = 4*3 =12', 10, 2, 11, '2019-04-30 17:53:45', '2019-05-01 21:20:25'),
(36, 'BY THE Combination of the letters abc  \nwe mean its permuation but without respecting\norder of arrangment meaning\nabc is cab is cba is acb they all same\n\nall possibilities give same combination\nabc\n\nnot   abc,acb,bac,bca,cab,cba\n \nCombination of 3 letters taking 3 at a time\n3C3 = 1\n\nExample:\nin a class having 12 students\nWe need to form a 5 students team \nHow many different teams can be formed?\n \nSolution: \nThere is nothing that indicates that \nthe order in which the team members \nare selected is important and therefore \nit is a combination problem. \nHence the number of teams is given by \n\n12C5 = 12! / (12-5)! * 5! = 792', 6, 2, 12, '2019-04-30 17:53:45', '2019-05-01 21:22:37'),
(40, 'A sequence which has a constant difference \nbetween terms.\nsuch 1, 5, 9, 13, 17\n\nFormula of any term\n\nA(n) = a1 + (n – 1)d\n//d is the constant difference\n//n is position of what element you want\n//a1 is the first number\n\nSn = n(a1 + A(n) ) / 2\n   = n(a1 + a1 + (n-1)d ) /2\n   = n(2a1 + nd - d) /2', 9, 2, 14, '2019-04-30 17:53:45', '2019-11-30 19:05:47'),
(48, 'its classes that being imported \nautomatically at any file in laravel \nproject, so you can use any alias \nautomatically in anyfile without having to\nimport it\n\nyou many think in doing so,we cause \nover-use in importing classes without a\nnecessary need but, these classes in aliases\nare very light because they are fascades\nso they don\'t have many methods \n\nin config/app.php\nyou can find all aliases, and these are \nsome of them\n\n\'aliases\' => [       \n\'App\' => Illuminate\\Support\\Facades\\App::class,     \n\'Arr\' => Illuminate\\Support\\Arr::class,\n\'Artisan\' => Illuminate\\Support\\Facades\\Artisan::class,        \n\'Auth\' => Illuminate\\Support\\Facades\\Auth::class,        \n\'Blade\' => Illuminate\\Support\\Facades\\Blade::class,        \n\'Broadcast\' => Illuminate\\Support\\Facades\\Broadcast::class,\n]    \n\nyou can create any class and add it, to \naliase in config/app.php so you can use \nthe class automatically without importing', 10, 4, 16, '2019-04-30 17:53:45', '2019-05-05 21:57:32'),
(50, 'Service providers are the central place of\nregistering things, including \nservice container bindings,event listeners,\nmiddleware, and even routes.\n\nIf you open the config/app.php file \n\n\'providers\' => [    \nIlluminate\\Auth\\AuthServiceProvider::class,\nIlluminate\\Broadcasting\\BroadcastServiceProvider::class,        \nIlluminate\\Bus\\BusServiceProvider::class,        \nIlluminate\\Cache\\CacheServiceProvider::class,    \n]\n\nNote that many of these are \"deferred\" \n providers, meaning they will not be loaded \n on every request, but only when the services\n they provide are actually needed.', 10, 4, 17, '2019-04-30 17:53:45', '2019-05-05 23:47:17'),
(54, 'Laravel\'s Contracts are a set of interfaces\nthat define the core services provided \nby the framework.\n\nEach contract has a corresponding \nimplementation provided by the framework.\nFor example,\nGuard is contract interface which \nhave many implementaions such\nTokenGuard class\nSessionGuard class\nFrameGuard class\nStatefulGuard class\n\nif you aren\'t sure about what type of \nguard you will use,so you should use\nguard interface instead and it will\ncast the class automatically\n\nthis helps for your projects to be \nloosely coupled since you will change the \nused Guard class\n\ncontracts are best used when building\npackages', 2, 4, 18, '2019-04-30 17:53:45', '2019-05-05 23:47:15'),
(55, 'Laravel ships with many facades which \nprovide access to almost all of Laravel\'s \nfeatures\n\nmany of fascades are registered in aliases\nin config/app.php\n\nfascades have service providers also to bind\nthem in service container\n\nwhenever you call a fascade,you will \nfetch object from service container', 7, 4, 19, '2019-04-30 17:53:46', '2019-05-05 23:47:12'),
(58, 'Next, the incoming request is sent to\neither the HTTP kernel or the console\nkernel, depending on the type of request \nthat is entering the application. \nFor now, let\'s just focus on the HTTP \nkernel, which is located in \napp/Http/Kernel.php.\n\nHttp kernel have some bootstrapers to \nload environment,configurations , errors\nregister fasades to service container\nand then service providers \n@register then @boot methods\n\nin\nvendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php\n\nprotected $bootstrappers = [        \n\\Illuminate\\Foundation\\Bootstrap\\LoadEnvironmentVariables::class,        \n\\Illuminate\\Foundation\\Bootstrap\\LoadConfiguration::class,        \n\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions::class,        \n\\Illuminate\\Foundation\\Bootstrap\\RegisterFacades::class, //get aliases from config/app then load them by requiring       \n\\Illuminate\\Foundation\\Bootstrap\\RegisterProviders::class,//get providers from config/app then call register on them        \n\\Illuminate\\Foundation\\Bootstrap\\BootProviders::class,    ];//call boot methods in providers', 7, 4, 20, '2019-04-30 17:53:46', '2019-11-17 15:04:26'),
(59, 'The HTTP kernel then pass request to\n a list of HTTP middleware using pipeline desgin patterns\nthat all requests must pass through before being \nhandled by the application. \n\nsome web global middlewares like\nEncrypting cookies,start session ,verify csrf token\n\nand some other custom middlewares', 9, 4, 20, '2019-04-30 17:53:46', '2019-11-17 15:33:22'),
(60, 'The index.php file loads the Composer \ngenerated autoloader definition \nautload all php files classes in \napp namespaces,\nthen \nretrieves an instance of the Laravel \napplication from bootstrap/app.php script.\n \nThe first action taken by Laravel itself \nis to create an instance of the \napplication / service container.', 5, 4, 20, '2019-04-30 17:53:46', '2019-11-17 14:38:07'),
(63, 'Adapter pattern works as a bridge between two \nincompatible interfaces.\n\nConvert the interface of a class into another interface \nclients expect. so that classes now can work together and \ncouldn\'t otherwise because of incompatible interfaces.\n\nAdapters Can Be Used In Anti corruption Layers to allow\na micro service {assume that we have new implementation\nof customer class}  to consume a legacy micro service\nwhich have another implementation for customer class\n\nACL[Anti Corruption Layer] make sure that our new \nimplementation for classes doesn\'t conflict with other\nlegacy implementations. and it uses adapter and facade \ndesign patterns to assure that', 10, 3, 21, '2019-04-30 17:53:46', '2019-12-17 04:01:09'),
(64, 'when you want to output some operations\ndone on your class variable and you tends \nto this output many times in many places\nits good to have this output wrapped inside\na decorator class', 10, 3, 22, '2019-04-30 17:53:46', '2019-05-03 17:08:29'),
(68, 'Factory pattern is one of the most used design patterns \nThis type of design pattern comes under creational \npattern as this pattern provides one of the best ways \nto create an object.\n\nIn Factory pattern, we create object without exposing \nthe creation logic to the client and refer to newly \ncreated object using a common interface.\n\ninterface Vehicle{\n   public start();\n}\n\nclass Car implements Vehicle{\n    public start(){echo \'run\';}\n}\n\nclass Truck implements Vehicle{\n    public start(){echo \'run\';}\n}\n\nsuppose there will be countless vehicles\nand creation of Vehicle is a complex task \nas it depends on some computations for example\ndepends on number of wheels', 8, 4, 23, '2019-04-30 17:53:46', '2019-12-16 21:04:06'),
(71, 'A class should have one and only one reason to change, \nmeaning that a class should have only one job.\n\nand it is not about classes only also methods,\ndont try to put all your logic in one place as this is going\nto decrease maintainability and readability so separate\nlogic in methods and classes and the rule is that entity\nshould have one reason to change\n\nanother thing is that dont overuse SRP in your code by \nover separating logic as this will cause more complex \ncode as decreases readability and maintainability\njust take a moment before implement this technique and think\nof the best way to implement it and if its necessary', 5, 4, 24, '2019-04-30 17:53:46', '2019-11-08 09:10:57'),
(79, 'You can set any attribute of html element \nwith vuejs variable by data binding\n\n<div id=\"app\">\n	<a v-bind:href=\"url\">Click Me please</a> \n	<a :href=\"url\">Click Me please</a>\n    <div v-html=\"message\">Click Me please</div>    \n</div>\n\n<script>\nvar app = new Vue({\n     el: \'#app\',\n     data: {\n       url : \"http://google.com\",\n       message: \'<p>Main message</p>\',\n           }\n      });\n</script>\n\n<!-- there is no other way to set attribute\n     href=\"{{message}}\" won\'t work -->\n\n<!-- be careful from v-html binding because \nit can easily lead to xss exploit,so \nalways make sure from the source of \nv-html element -->', 2, 1, 29, '2019-04-30 18:55:59', '2019-04-30 21:32:02'),
(81, '<body>\n//its best pracice to put vuejs cdn at top of body tag\n   <script src=\"https://cdn.jsdelivr.net/npm/vue/dist/vue.js\"></script>\n\n<div id=\"app\">\n        {{ message }}\n</div>\n\n<script>\nvar app = new Vue({\n     el: \'#app\',\n     data: {\n       message: \'Hello Vue!\',\n           }\n      });\n</script>\n\n</body>\n//this is telling link the div with id\napp with instance of vue which have \ndata(variables),methods and other stuff\n\n//now tags inside app are wrapped inside\nthe vue instance and the instance can \nhandle linking tags with each other and \nwith its variables and methods', 2, 1, 31, '2019-04-30 19:54:52', '2019-04-30 22:11:38'),
(82, 'VueJs is perfect :\n\nwhen you build your website on api\n\nwhen you want to minimize http requests\nas there are many operations will be done \nin webpage and you don\'t want to refresh\nthe page after each operation\n\nthere is high potential we will use  \nmany ajax, so instead we use vuejs\n\ndon\'t over use vuejs, refreshing page may \nbe good for user experience', 2, 1, 32, '2019-04-30 19:56:07', '2019-04-30 22:11:03'),
(84, 'a shortcut to link between input and \na variable while writing ,in example \nbelow any text written in input will \nchange age variable instantly so, \nthe p tag text will change also in real time\n\n<input type=\"text\" v-model=\"age\">\n\n<div class=\"person\">\n<p>{{age}}</p>\n</div>\n\n<script>\nvar app = new Vue({\n        el: \'#app\',\ndata: {\n	    age : \'\',\n  	  }\n});\n</script>', 2, 1, 34, '2019-04-30 21:45:25', '2019-04-30 21:50:30'),
(85, 'age variable will change also in real \ntime but when you finish the input\n\n<input type=\"text\" v-model.lazy=\"age\">\n\n<div class=\"person\">\n  <p>{{age}}</p>\n</div>', 4, 1, 34, '2019-04-30 21:47:10', '2019-04-30 22:14:56'),
(86, 'giving extra feature to the event\n<!-- this will preventDefault behavior for \nthe a tag automatically -->\n<a v-on:click.prevent=\"doThis\"></a>\n \n<!-- this will fire event  only once, \nany more clicks will do nothing -->\n<a v-on:click.once=\"doThis\"></a>\n\n<!-- modifiers can be chained-->\n<a v-on:click.once.prevent=\"doThis\"></a>\n\n<!-- this will trigger the event \n only on pressing enter -->\n<input v-on:keyup.enter=\"submit\" type=\"text\">\n\n<!-- 13 is the keyCode,same as pressing enter -->\n<input v-on:keyup.13=\"submit\">\n\n\nyou can get more modifiers on \nhttps://vuejs.org/v2/guide/events.html', 2, 1, 35, '2019-04-30 21:51:28', '2019-04-30 21:59:21'),
(87, 'Examples of Usage:\n\nCREATE TABLE person(\n    name VARCHAR(255),\n    gender ENUM(\'Male\', \'Female\')\n);\n\nINSERT INTO person(name, gender) VALUES(\'Eugene\', \'Male\');\nINSERT INTO person(name, gender) VALUES(\'Anne\', 2); //gives Female\nINSERT INTO person(name, gender) VALUES(\'Eugene\', \'male\');//error because enum is case-sensitive\nINSERT INTO person(name, gender) VALUES(\'John\', \'N/A\'); //error\nINSERT INTO person(name, gender) VALUES(\'John\', 4); //error\nINSERT INTO person(name, gender) VALUES(\'John\', \'\'); //error\n\nCREATE TABLE opening_hours(\n    week_day ENUM (\'Sunday\', \'Monday\', \'Tuesday\', \'Wednesday\', \'Thursday\', \'Friday\', \'Saturday\'),\n    opening_time TIME,\n    closing_time TIME\n);', 1, 5, 6, '2019-05-01 19:00:48', '2019-05-05 23:42:00'),
(88, 'When ENUM type is not fixed\n\nWhen ENUM type has a long list of values\n\nWhen your application does not know the \nlist of ENUM values\n\nIf you have several tables which require \nthe ENUM values such names of week days', 3, 5, 6, '2019-05-01 19:04:33', '2019-05-05 23:42:06'),
(89, 'There are three important reasons for which \nyou should consider using the ENUM type\n\nReduce storage space.\n\nReduce join complexity,by not using much \nrelations tables\n\nyou don\'t need constrains such \non update and on delete', 5, 5, 6, '2019-05-01 19:11:44', '2019-05-05 23:41:09'),
(93, 'SELECT avg(price) FROM products\n\nSELECT count(*) AS Total FROM products\n\nSELECT sum(price * quantityOrdered) total FROM orders\n\nSELECT max(price) 5FROM Products\n\nSELECT min(price) FROM Products', 11, 5, 7, '2019-05-01 21:32:39', '2019-05-05 23:40:41'),
(94, 'SELECT ROUND( 1.4 ); /* = 1 */\nSELECT ROUND( 1.5 ); /* = 2 */\nSELECT ROUND( 24,2); /* = 24.00*/\nSELECT ROUND( -1.4 ); /* = -1 */\nSELECT ROUND( -1.5 ); /* = -2 */\n\nSELECT LOG(20); /* ln(20)*/\nSELECT EXP(20); /* e^20*/', 13, 5, 7, '2019-05-01 21:33:56', '2019-05-05 23:40:50'),
(95, '/* adding column */\nALTER TABLE users \nADD COLUMN email VARCHAR(200) UNIQUE;\n\n/*Changing Column*/\nALTER TABLE users \nCHANGE email e_mail VARCHAR(250);\n\n/* Removing column */\nALTER TABLE users \nDROP email;', 8, 5, 9, '2019-05-02 11:10:39', '2019-05-05 23:40:58'),
(96, 'INSERT INTO users \nVALUES(7,\'mostafa\',\'ramadan\',24);\n\n\n/*you can specifiy the columns to insert to*/\nINSERT INTO users (first_name,last_name,age)\nVALUES (\'ahmed\',\'zaki\',25);', 2, 5, 36, '2019-05-02 11:12:00', '2019-05-05 23:40:39'),
(97, 'UPDATE users \nSET first_name=\'mahmoud\', second_name=\'zaki\'\nWHERE id = 8;', 4, 5, 36, '2019-05-02 11:13:15', '2019-05-05 23:40:43'),
(98, 'DELETE FROM users \nWHERE id = 7 OR id = 8 ;', 6, 5, 36, '2019-05-02 11:13:57', '2019-05-05 23:40:45'),
(99, 'SELECT * FROM users;', 8, 5, 36, '2019-05-02 11:14:23', '2019-05-05 23:40:48'),
(100, '| id  | first_name | last_name | age |\n| --- | ---------- | --------- | --- |\n| 1   | ahmed      | ibrahim   | 24  |\n| 2   | mohamed    | reda      | 20  |\n| 3   | alaa       | mohamed   | 20  |\n| 4   | john       | michael   | 40  |\n| 5   | ahmed      | ali       | 31  |\n| 6   | mohamed    | ismail    | 35  |\n\n\n/*          --- LIMIT  ---\n \nLIMIT n\nn : how many records should be got\n\nLIMIT n1, n2\nn1 : starting index\nn2 : number of record/data you want to show\nID\n1 \n2\n3\n4\n5\n6\n\nLIMIT 0, 3\n-- the result will be ID: 1,2,3\n*/\n\nSELECT age,first_name FROM users \nWHERE age>30\nORDER BY age DESC\nLIMIT 2; \n```\n**Output**\n\n| age | first_name |\n| --- | ---------- |\n| 40  | john       |\n| 35  | mohamed    |', 2, 5, 37, '2019-05-02 11:18:20', '2019-05-05 23:42:13'),
(101, '| id  | first_name | last_name | age |\n| --- | ---------- | --------- | --- |\n| 1   | ahmed      | ibrahim   | 24  |\n| 2   | mohamed    | reda      | 20  |\n| 3   | alaa       | mohamed   | 20  |\n| 4   | john       | michael   | 40  |\n| 5   | ahmed      | ali       | 31  |\n| 6   | mohamed    | ismail    | 35  |\n\n/*  ---  LIKE KEYWORD  ---\nWHERE column LIKE \n\'a%\' .. start with a\n\'%a\'...end with a\n\'%or%\'.....have or in any position\n\'_r%\'  .... r in second position\n\'a%o\' ... start with a ends with 0\n*/\n\nSELECT id,first_name AS name FROM users \nWHERE age>=30 AND last_name LIKE \'m%\';\n```\n**Output**\n \n| id  | name |\n| --- | ---- |\n| 4   | john |', 2, 5, 38, '2019-05-02 11:27:04', '2019-05-05 23:41:15'),
(102, '| id  | first_name | last_name | age |\n| --- | ---------- | --------- | --- |\n| 1   | ahmed      | ibrahim   | 24  |\n| 2   | mohamed    | reda      | 20  |\n| 3   | alaa       | mohamed   | 20  |\n| 4   | john       | michael   | 40  |\n| 5   | ahmed      | ali       | 31  |\n| 6   | mohamed    | ismail    | 35  |\n\n/*   --- UNION ---\ndisplaying two results in one column \nUNION don\'t allow duplicated results\nif you want duplications use UNION ALL,\nresult column name is same as the first column \n*/\n\nSELECT first_name FROM users\nUNION\nSELECT last_name FROM users;\n```\n**Output**\n\n| first_name |\n|------------|\n| ahmed      |\n| mohamed    |\n| alaa       |\n| john       |\n| ibrahim    |\n| reda       |\n| michael    |\n| ali        |\n| ismail     |', 2, 5, 39, '2019-05-02 11:30:30', '2019-05-05 23:43:29'),
(103, '/*   --- default GROUP_CONCAT()  ---\ndisplaying one signal value having all first_name\n separated from each other by default with ;\n since we used DISTINCT keyword so no duplication  \n*/\n\nSELECT \nGROUP_CONCAT(DISTINCT first_name ORDER BY id) AS first_name\nFROM users;\n```\n**Output** \n\n| first_name              |\n|-------------------------|\n| ahmed;mohamed;alaa;john |', 2, 5, 40, '2019-05-02 11:34:55', '2019-05-05 23:41:29'),
(105, '/*     --- GROUP_CONCAT()  ---\n displaying one signal value having all selcted records\n separated from each other by ,  \n*/\n\nSELECT GROUP_CONCAT(\nCONCAT(first_name, \" \", last_name, \" #\", age)\nwhere age>30\nORDER BY id \nSEPARATOR \",\" ) AS full_info \nFROM users;\n\n```\n**Output** \n\n| full_info                                           |\n|-----------------------------------------------------|\n| john michael #40,ahmed ali #31,mohamed ismail #35 |', 4, 5, 40, '2019-05-02 11:38:59', '2019-05-05 23:41:33'),
(106, '| id  | first_name | last_name | age |\n| --- | ---------- | --------- | --- |\n| 1   | ahmed      | ibrahim   | 24  |\n| 2   | mohamed    | reda      | 20  |\n| 3   | alaa       | mohamed   | 20  |\n| 4   | john       | michael   | 40  |\n| 5   | ahmed      | ali       | 31  |\n| 6   | mohamed    | ismail    | 35  |\n\n/*   --- CONCAT()  ---\ndisplaying a column each row in it\nhaving concatenated columns \n */\n\nSELECT \nCONCAT(first_name,\" ,age = \" age) AS Clients\nFROM users;\n```\n**Output** \n\n| Clients                 |\n|-------------------------|\n| ahmed ,age = 24         |\n| mohamed ,age = 20       |\n| alaa ,age = 20          |\n| john ,age = 40          |\n| ahmed ,age = 31         |\n| mohamed ,age = 35       |', 2, 5, 41, '2019-05-02 11:40:14', '2019-05-05 23:41:13'),
(107, '| id  | name | email      |\n| --- | ---- | ---------- |\n| 1   | john | john-email |\n| 2   | john | john-email |\n| 3   | fred | john-email |\n| 4   | fred | fred-email |\n| 5   | sam  | sam-email  |\n| 6   | sam  | sam-email  |\n\n\n/*    --- GROUP BY  ---\n   get how many duplications happens by \n   both name and email at same time\n   with condition that duplications>1\n*/\n/* functions after select work on \n   duplications occurrences */\n\nSELECT name,email,COUNT(*) AS count_of\nFROM customers\nGROUP BY name email\nHAVING COUNT(*)>1;\n\n\n**Output**\n\n| name | email      | count_of |\n| ---- | ---------- | -------- |\n| john | john-email | 2        |\n| sam  | sam-email  | 2        |', 2, 5, 42, '2019-05-02 11:47:05', '2019-05-05 23:41:36'),
(108, 'php artisan make:provider NewServiceProvider', 12, 4, 17, '2019-05-02 16:33:06', '2019-05-05 23:47:21'),
(109, 'within the register method, you should \nonly bind things into the service container.\nYou should never attempt to register any \nevent listeners, routes, or any other piece \nOtherwise, you may accidentally use a \nservice that is provided by a service \nprovider which has not loaded yet.', 14, 4, 17, '2019-05-02 16:33:38', '2019-05-05 23:47:29'),
(110, 'This method is called after all other \nservice providers have been registered, \nmeaning you have access to all other \nservices that have been registered by the \nframework', 16, 4, 17, '2019-05-02 16:38:10', '2019-05-05 23:47:31'),
(111, 'If your service provider registers many\nsimple bindings, you may wish to use the \nbindings and singletons properties \ninstead of manually registering each \ncontainer binding.\n\nclass AppServiceProvider extends ServiceProvider{\n    public $bindings = [\n        \'classToBind\' => DigitalOceanServerProvider::class,\n    ];\n    public $singletons = [\n        \'classToBind\' => PingdomDowntimeNotifier::class,\n    ];}', 18, 4, 17, '2019-05-02 16:45:02', '2019-05-05 23:47:38'),
(112, 'If your provider is only registering \nbindings in the service container, \nyou may choose to defer its registration \nas it will improve the performance\nof your application, since it is not \nloaded on every request.\n\nclass RiakServiceProvider extends ServiceProvider implements DeferrableProvider{\n    public function register(){\n        $this->app->singleton(Connection::class, function ($app) {\n            return new Connection($app[\'config\'][\'riak\']);\n        });}\n\n/*method to tell initailize this Service\nprovider when Connection::class tried to\nbe resolved from container */\n    public function provides(){\n        return [Connection::class];\n    }}', 20, 4, 17, '2019-05-02 16:48:48', '2019-05-05 23:47:46'),
(113, 'Laravel will auto inject Publisher instance\nfrom service container if its there\nby instantiating new instance\n\n<?php\nnamespace App;\nuse Illuminate\\Database\\Eloquent\\Model;\nclass Podcast extends Model{\n    public function publish(Publisher $publisher)\n    {\n        $this->update([\'publishing\' => now()]);\n        $publisher->publish($this);\n    }\n}\n?>', 9, 4, 19, '2019-05-02 18:10:01', '2019-05-02 18:13:25'),
(114, 'you can use any class as a fascade \nby putting Facades\\ before namespace\n \n<?php\n\nnamespace App;\n\nuse Facades\\App\\Contracts\\Publisher;\nuse Illuminate\\Database\\Eloquent\\Model;\n\nclass Podcast extends Model{\n    public function publish()\n    {\n        $this->update([\'publishing\' => now()]);\n        Publisher::publish($this);\n    }\n}', 11, 4, 19, '2019-05-02 18:14:58', '2019-05-05 23:40:07'),
(115, 'The Request will be handed off to the \nRouter for dispatching. \nThe router will dispatch the request to \na route or controller, as well as \nrun any route specific middleware.', 11, 4, 20, '2019-05-02 18:51:51', '2019-05-05 23:48:22'),
(118, 'app()->bind(\'example\',function(){\nreturn new \\App\\Example; }\n\napp()->singleton(\'example\',function(){\nreturn new \\App\\Example:}\n\n\n$api = new HelpSpot\\API(new HttpClient);\n$this->app->instance(\'HelpSpot\\API\', $api);', 3, 4, 43, '2019-05-02 19:11:12', '2019-11-17 14:48:07'),
(119, 'any time we try to get Example, we will\ncreate new instance as defined in service\ncontainer\napp(\'example\');\n\nif we putted in container with singleton\nthen it will give same instance anytime\nwe try to call app(\'example\')', 5, 4, 43, '2019-05-02 19:12:29', '2019-05-05 23:46:44'),
(120, 'if app(\'example\') can\'t find a key called\nexample binded in service container,\n\nit will try to find it in aliases,\n\nor instaintiate it automatically \nif we called it \nsuch app(App\\Example::class);', 7, 4, 43, '2019-05-02 19:22:02', '2019-05-05 23:46:54'),
(121, 'Auto Resolving is done in app(\'something\')\n\'something\' is getting auto resolving\nfrom service container or instantiated\n\nAuto Resolving is done also in parameters \nwhen we type hint it,\nin below example he will try to get \nExample from service container where \nkey == App\\Example::class,otherwise \nlook in aliases or instantiate it\n<?php \nnamespace App;\nuse App\\Example;\n\nclass Repo{\npublic function run(Example $example){\n$example->doSomething();\n}', 9, 4, 43, '2019-05-02 19:30:45', '2019-05-05 23:34:50'),
(125, 'laravel will auto resolve model by id by \ndefault  If it can\'t find instance is \nin the database,it will throw a 404 HTTP response\nRoute::get(\'api/users/{id}\', function ($id) {\n    $user = App\\User::findorFail($id);\n    return $user->email;\n});\n\n//instead we may do ,\nRoute::get(\'api/users/{id}\', function (App\\User $user) {\n    return $user->email;\n});', 2, 4, 53, '2019-05-03 12:44:41', '2019-05-05 21:53:29'),
(126, 'If you would like model binding to use a \ndatabase column other than id\n\nyou may override the getRouteKeyName method \non the Eloquent model:\n\npublic function getRouteKeyName(){\n /*it will search whatever varaible defined in \n route with slug column */\n    return \'slug\';\n}\n\nRoute::get(\'api/users/{user_slug}\', function (App\\User $user_slug) {\n    return $user_slug->email;\n});\n\n//notice ,variable defined in route, \nmust be same as  App\\User $user_slug   \notherwise it won\'t work', 4, 4, 53, '2019-05-03 12:51:05', '2019-05-05 23:46:51'),
(127, 'in RouteServiceProvider.php\n\npublic function boot(){\n    parent::boot();\n    Route::model(\'user\', App\\User::class);\n}\n\nRoute::get(\'profile/{user}\', function (App\\User $user) {\n    //\n});\nnow anytime we try to pass {user} from route\nit will inject App\\User::class found by id\nto the function', 6, 4, 53, '2019-05-03 12:54:06', '2019-05-05 23:46:56'),
(128, 'in your model class\nyou can override \n\npublic function resolveRouteBinding($value){\n  return App\\User::where(\'name\', $value)->first() ?? abort(404);    \n}\nThis method will receive the value of the URI\nsegment and should return the instance of \nthe class should be injected into the route', 8, 4, 53, '2019-05-03 12:57:03', '2019-05-05 23:47:07'),
(131, 'class Book(){\n protected key1 = \'list1\';\n protected key2 = \'list2\';\n public function createList(){\n   $properities = get_object_vars($this);\n   $output = \'<ul>\\n\';\n   foreach ($properities as $property){\n     $output .= \'<li>$property</li>\\n\';\n   }\n   $output .= \'</ul>\';\n   return $output;\n }\n}\n\nclass MusicCd(){\n protected key1 = \'list1\';\n protected key2 = \'list2\';\n public function createList(){\n   $properities = get_object_vars($this);\n   $output = \'<ul>\\n\';\n   foreach ($properities as $property){\n     $output .= \'<li>$property</li>\\n\';\n   }\n   $output .= \'</ul>\';\n   return $output;\n }\n}\n\n$book = new Book();\n$book->createList();\n\n$cd = new MusicCd();\n$cd->createList();', 12, 1, 22, '2019-05-03 17:08:52', '2019-05-03 17:23:12'),
(132, 'class Book(){\n  protected key1 = \'list1\';\n  protected key2 = \'list2\';\n}\n\nclass MusicCd(){\n  protected key1 = \'list1\';\n  protected key2 = \'list2\';\n}\n\nclass HtmlDecorator{\n protected $object;\n public function __construct($object){\n  $this->object = $object;\n }\n public static function createList(){\n   $properities = get_object_vars($this->object);\n   $output = \'<ul>\\n\';\n   foreach ($properities as $property){\n     $output .= \'<li>$property</li>\\n\';\n   }\n   $output .= \'</ul>\';\n   return $output;\n }\n}\n\n$book = new Book();\nHtmlDecorator::createList($book);\n\n$cd = new MusicCd();\nHtmlDecorator::createList($cd);', 14, 4, 22, '2019-05-03 17:23:25', '2019-11-08 15:48:29'),
(133, 'Builder is a class in laravel, which allow\nyou to build your desired mysql query you\nwant to use and after building it \nyou can use get() method to query the builder\nand retrieve a collection\n\ninstead of DB::table(\'users\') we can use\neloquent Model User\n\n//this is adding (From users) to builder\n $users = DB::table(\'users\');\n\n//this is adding (From users Where \'name\' = \'john\') \nDB::table(\'users\')->where(\'name\', \'John\')\n\n//(select title,email from roles) then query\nDB::table(\'roles\')->pluck(\'title\',\'email\');', 2, 4, 54, '2019-05-03 17:57:54', '2019-05-05 23:06:03'),
(134, '//this is doing operations on each 100 records\n  to enhance performance instead of getting\n  thousands of records then do operation\n\nDB::table(\'users\')->orderBy(\'id\')->chunk(100, function ($users) {\n foreach ($users as $user) {\n   //do operations on records\n\n   //whenever you don\'t want to proceed more records\n        return false;\n    }\n});\nIf you are updating database records while chunking results, \nyour chunk results could change in unexpected ways. \nDB::table(\'users\')->where(\'active\', false)\n    ->chunkById(100, function ($users) {\n        foreach ($users as $user) {\n            DB::table(\'users\')\n                ->where(\'id\', $user->id)\n                ->update([\'active\' => true]);\n        }\n    });', 4, 4, 54, '2019-05-03 18:12:54', '2019-05-05 23:48:10'),
(135, '$users = DB::table(\'users\')->count();\n\n$price = DB::table(\'orders\')->max(\'price\');\n\n$price = DB::table(\'orders\')->avg(\'price\');', 6, 1, 54, '2019-05-03 18:15:25', '2019-05-03 18:15:58'),
(136, 'return DB::table(\'orders\')->where(\'id\', 1)->exists();\n\nreturn DB::table(\'orders\')->where(\'id\', 1)->doesntExist();', 8, 4, 54, '2019-05-03 18:16:33', '2019-05-05 23:48:20'),
(137, 'DB::table(\'users\')->select(\'name\', \'email as user_email\')->get();', 2, 4, 55, '2019-05-03 18:19:00', '2019-05-05 23:47:54'),
(138, '//force query to return distinct records\n$users = DB::table(\'users\')->distinct()->get();', 4, 4, 55, '2019-05-03 18:20:45', '2019-05-05 23:47:56'),
(139, 'Sometimes you may need to use a raw \nexpression in a query\n\nDB::table(\'users\')\n ->select(DB::raw(\'count(*) as user_count, status\'))\n ->where(\'status\', \'<>\', 1)\n ->groupBy(\'status\')\n ->get();\n\n DB::table(\'orders\')\n   ->whereRaw(\'price > IF(state = \"TX\", ?, 100)\', [200])\n   ->get();', 6, 4, 55, '2019-05-03 18:23:29', '2019-05-05 23:48:02'),
(140, '$first = DB::table(\'users\')\n            ->whereNull(\'first_name\');\n\n$second = DB::table(\'users\')\n            ->whereNull(\'last_name\');\n$second->union($first)->get();', 8, 4, 55, '2019-05-03 18:27:15', '2019-05-05 23:48:07'),
(141, 'DB::table(\'users\')\n   ->where(\'name\', \'John\')\n   ->where([    \n      [\'status\', \'=\', \'1\'],\n      [\'subscribed\', \'<>\', \'1\'],\n   ])\n   ->where(\'votes\', \'>=\', 100)\n   ->where(\'name\', \'like\', \'T%\');\n   ->whereIn(\'id\', [1, 2, 3])\n   ->orWhere(\'name\', \'John\')\n   ->whereBetween(\'votes\', [1, 100])\n   ->get(); ^_^', 10, 4, 55, '2019-05-03 18:29:26', '2019-05-05 23:39:50'),
(142, 'DB::table(\'users\')\n     ->orderBy(\'name\', \'desc\')\n\nordered by the created_at,it will query also\nDB::table(\'users\')\n     ->latest();\n\nDB::table(\'users\')\n     ->oldest();', 2, 4, 56, '2019-05-03 18:37:42', '2019-05-05 23:48:28'),
(143, 'DB::table(\'users\')->where(\'id\',1)\n->increment(\'order\')\n->decrement(\'votes\',5);', 4, 4, 56, '2019-05-03 18:42:45', '2019-05-05 23:39:38'),
(144, 'class VehicleFactory{\n public function create($wheels)\n {\n  if($wheels == 4) return new Car();\n  if($wheels == 8) return new truck();\n }\n}', 10, 4, 23, '2019-05-03 19:38:20', '2019-12-16 21:04:22'),
(145, 'The process in which a function calls \nitself directly or indirectly is called \nrecursion and the corresponding function \nis called as recursive function.', 2, 1, 57, '2019-05-04 10:08:43', '2019-05-04 10:15:51'),
(146, '/*base case is where recursive will end\n\nConstruct a recursive logic\nLaw -> factorial(5) = 5 * factorial(4)\nkeep doing so, till base case\nfactorial(1) = 1\n*/\n\nfactorial($n){\n    if ($n < = 1) // base case\n        return 1;\n    else    \n        return $n*fact($n-1);    \n}', 4, 1, 57, '2019-05-04 10:19:29', '2019-05-04 10:27:57'),
(147, 'factorial($n){\n    // wrong base case (it may cause\n    // stack overflow).\n    if ($n == 100) return 1;\n    else\n        return $n*fact($n-1);\n}', 6, 1, 57, '2019-05-04 10:21:07', '2019-05-04 10:28:09'),
(148, 'Fibonachi series\n1 1 2 3 5 8 13 21 ....\n\nConstruct a recursive logic\nLaw -> f(n) = f(n-1) + f(n-2)\nkeep doing so, till base case\nf(0) = 1\nf(1) = 1\n\nfunction f($n){\n//base case\n if($n==0) return 1;\n if($n==1) return 1;\n return f($n-1) + f($n-2);\n}', 8, 1, 57, '2019-05-04 10:28:54', '2019-05-05 09:11:07'),
(149, 'to check convergence we get the limitation\nof series:\n\nSigma n->infinity (-1)^(n+1)* 1/n\n\nLim n->infinity (-1)^(n+1)* 1/n = 0\n\nif lim gave value , then this series converges\nif lim gave infinity, then this series diverge \n\nsince lim gave a specific value \n,then it converges to a value but we don\'t \nknow what this value yet,to get this value\nwe should find limitation of partial sum \nformula', 2, 2, 13, '2019-05-04 10:54:09', '2019-05-05 23:45:56'),
(150, 'partial sum is the summation of first\nn items\n\nS = Sigma x=1->infinity (x) =\n1 + 2 + 3 + 4 + 5 + ... +infinity\n\nS6 = a1 + a2 + a3 + a4 + a5 +a6\n   = 1+2+3+4+5+6 = 21\n\nSn = n*(n+1) / 2', 4, 1, 13, '2019-05-04 11:04:02', '2019-05-08 14:09:51'),
(151, 'Given,\nSn = Sigma .5 * n*(n+1) where x=1->infinity\nGet a(n)?\n\nSn = a1 + a2 + a3  + ... + a(n-1) + a(n) = .5n(n+1)\nSn-1=a1 + a2 + a3  + ... + a(n-1)        = .5(n-1)n\n\nthen a(n) = Sn - Sn-1 =\n          .5n(n+1) - .5n(n-1) = \n          .5*n(n+1 - n+1) = .5*n*2 = n', 6, 2, 13, '2019-05-04 11:17:07', '2019-05-05 23:45:37'),
(152, 'A sequence which has a constant ratio\nbetween terms.\nsuch 1, 3, 9, 27, 81\n\n\nSn = a1 * (1-r^n) / (1-r)\n//r is the ratio', 11, 1, 14, '2019-05-04 21:08:16', '2019-05-04 21:10:58'),
(153, 'php is very productive with casting elements\nit can auto detect if you want to cast dataType\nto another and it will do it for you\nfor example\n$x = \"9\" + 5; //it will give 14\n\nphp can treat string as array , in accessing\nelements such \'92334\'[0] it will give 9\nbut you can\'t use count method as in arrays\n\nfunction sum($n){\n//summing n digits    \n $sum = 0;    \n for($i=0;$i<strlen($n);$i++){        \n   $sum += $n[$i];        \n }    \n return $sum;\n}', 2, 4, 58, '2019-05-04 21:56:52', '2019-05-05 23:44:21'),
(154, 'its a technique used with recursion to \nenhance effiency of algorithm.\n\nSuppose Following function \n//Time Complexity  O(2^n)\n//Space Complexity O(n)\nfunction f($n){\n//base case\n if($n==0) return 1;\n if($n==1) return 1;\n return f($n-1) + f($n-2);\n}\n\n/*\nsome f($n) will be calculated many times\nand to avoid this we store what we calculated\nso we don\'t calculate it again\nspace Complexity is O(n)..stack+O(n)..memo table = O(n)\nTime Complexity is O(n)\n*/\n\n$f = new Fib();\necho $f->callFib(500);\n\nclass Fib{    \n private $memo = [];        \n private function initializeMemo($n){\n  return array_fill(0,$n+1,0);    \n }        \n public function callFib($n){         \n  $this->memo = $this->initializeMemo($n);\n  return $this->f($n);    \n }    \n protected function f($n){    \n  if($this->memo[$n]!=0) return $this->memo[$n];    \n  if($n==0) return 1;    \n  if($n==1) return 1;    \n  $this->memo[$n] = $this->f($n-1) + $this->f($n-2);        \n  return $this->memo[$n];    \n}}', 2, 1, 59, '2019-05-05 09:04:32', '2019-05-05 10:57:20'),
(155, '//Space complexity O(n)\n//Time complexity O(n)\nfunction f($n){\n//make sure of valid input \n if($n<0)  return 0; \n if($n<2)  return 1;  \n $memo[0] = 1; $memo[1] = 1; \n for($i=2;$i<$n+1;$i++){     \n  $memo[$i] = $memo[$i-1] + $memo[$i-2]; \n } \n return $memo[$n];\n}', 4, 1, 59, '2019-05-05 10:18:49', '2019-05-05 10:31:39'),
(164, '<?php\nclass A{\n    function __construct(){\n        //same as public function __construct \n        // because default access modifier is public\n        echo \'parent constructed\'; \n    }\n\n    // it will give error because\n    //constructor name same as class name is deprecated\n    public function A(){ \n        echo \'parent constructed\';\n    }\n   \n    //its called when object is destructed or script is \n    //stopped or exited\n    public function __destruct(){\n        echo \'parent destructed\';    \n    }\n}\n\nclass B extends A{\n}\n\nclass C extends A{\n    function __construct(){\n      echo \'child Constructed\'   \n    }\n}\n\nclass D extends A{\n    function __construct(){\n        echo \'child Constructed\';\n        Parent::__construct();\n    }\n}\n\n$instanceB = new B; //parent constructed parent Deconstructed\n$instanceC = new C; //child Constructed parent Deconstructed\n$instanceD = new D; //child Constructed parent Constructed parent destructed', 4, 4, 64, '2019-11-06 18:31:56', '2019-11-06 19:10:30'),
(165, '<?php\n\nclass A{\n $x = 1; //error as variables must have access modifiers\n public $x;\n public $var = 1;\n public $Var = 2;\n\n public function test_case_sensitivity(){\n    //properties are case sensitive but methods not\n    echo $this->var; //1\n    echo $this->Var; //2\n }\n\n public function TEST_case_sensitivity(){\n    //error to declare method as its already declared\n }\n\n protected function show(){\n    $xx=3;\n    protected $xx = 3;  //error, no access modifiers here\n }\n}', 2, 4, 65, '2019-11-06 19:26:43', '2019-11-06 19:55:22'),
(166, 'class A{\n    public $x=1;\n    public static $var = \'from A\';\n    \n    protected static function show(){\n        echo static::$x;\n    }\n\n    public static function sh(){\n        echo static::$x;\n    }\n   \n    public static function showVar(){\n       echo $this->x ; //error trying to call this from static method\n    }\n\n    public static function showVariable(){\n       echo static::$var;\n    }\n    \n    public static function meth(){\n       echo self::$var; \n    }\n}\nclass B{\n    public static $var = \'From B\';\n}\n\nA::show() //error to call protected method\nA::sh()   //error trying to call non static variable x\nA::showVariable(); //\'from A\'\n$a = new A;\n$a->showVariable(); //\'from A\' , but its bad practice to call static function from contenxt\n\nB::showVariable(); // \'From B\'\nB::meth();         // \'From A\'', 4, 4, 65, '2019-11-06 19:55:41', '2019-11-06 20:12:15'),
(171, 'class Bird{\n    protected $username = \'ahmed\';\n\n    public function __construct(){\n        echo \"<br>bird is being created <br>\";\n    }\n\n    public function __destruct(){\n        echo \'<br>bird is being deconstructed <br>\';\n    }\n\n    public function __get($field){\n        if($field==\'name\') return $this->username;\n    }\n    public function __set($field, $value){\n        if($field==\'name\') $this->username = $value;\n    }\n    public function __call($methodName, $arguments){\n        echo \'<br> undefined method \' . $methodName . \' with arguments \' . print_r($arguments).\'<br>\' ;\n    }\n    \n    public static function __callStatic($methodName, $arguments){\n        echo \'<br> undefined static method \' . $methodName . \' with arguments \' . print_r($arguments) .\'<br>\' ;        \n    }\n\n    public function __toString(){\n        return \'<br> Bird instance <br>\';\n    }\n\n    public function __invoke(){\n        echo \'<br> object is invoked like a function <br>\';\n    }\n    public function __clone(){\n        //on cloning .. constructor is not called again\n        echo \'cloned\';\n    }\n}\n\n$b = new Bird; // created\necho $b->name; //ahmed .. __get magic function\n\n$b->name = \'mohamed\'; // __set magic function\necho $b->name; //mohamed .. __get magic function\n\n$b->methodMe(\'var1\',\'var2\'); //__call magic function\n$b::meth(\'varx\',\'vary\'); //__callStatic magic function\necho $b; // __toString magic function\n\n$b(); // __invoke magic function\n\n$c = clone $b; // __clone magic function', 6, 4, 64, '2019-11-07 09:30:35', '2019-11-07 09:34:31'),
(172, 'traits acts like we copied its property and methods and paste\nit inside class itself\n\ntraits are very good practice for achieving Single Responsibility\nprinciple and reusing code so that we achieve DRY code\n\nclass A{\n    use Tr;\n    public function seeX(){\n        echo $this->x;\n    }\n}\n\ntrait Tr{\n    protected $x = 5;\n    public function __construct(){\n        echo \'construct\';\n    }\n    public static function showStatic(){\n        echo \'<br> show static <br>\';\n    }\n    public function show(){\n        echo \'<br> show <br>\';\n    }\n}\n\n$a = new A; //constructed\n$a::showStatic(); //show static\n$a->show(); show\necho $a->seeX(); 5', 6, 4, 65, '2019-11-07 09:59:46', '2019-11-07 10:02:59'),
(173, 'There’s no special methodology of keeping your emails \nfrom being known as spam. But we will contemplate some \npoints that cause this downside.\n\n1) Sending mail using the `mail` function with minimum parameters\nwe tend to should use all potential mail headers like `MIME-version`,\nContent-type, reply address,from address etc. so as to avoid this case\n\n2) Not employing a correct SMTP mail script like PHPmailer\nor SwiftMailer with Associate in Nursing actual e-mail credentials\nas well as the username, watchword etc.\n\n3) If you’re on a shared web server,\nconsider buying a unique IP address for yourself, as a \nresult, others using your IP may have gotten \nyour IP blacklisted for spam. Do not send more than 250 \nemails to every supplier per hour.\n\n4)Give your users unsubscribe link \nand if they can’t see the e-mail properly they’ll \nmark you as spam.', 2, 1, 68, '2019-11-07 10:05:48', '2019-11-07 10:56:54'),
(174, 'Notices: By default, these errors don’t seem to be flaunted \nto the user the least bit – though you’ll be able to modify\nthis default behavior.\nFor example, accessing a variable that has not yet been initialized\nor accessing array element that doesnt exist\n\nWarnings: By default, these errors are visible to the user, however, \nthey are doing not lead to script termination.\nThese include a lot of serious errors.\nFor example, making an attempt to include () a file that does not exist\n\nFatal Errors: These errors cause the termination of the script immediately, \nand PHP’s default behavior is to show them to the user. These include critical errors\nFor example, instantiating an object of a non-existent class.', 4, 1, 58, '2019-11-07 10:06:03', '2019-11-07 10:49:05'),
(175, '<?php\n\necho __DIR__; //C:\\xampp\\htdocs\\devPath\\routes\necho __FILE__; //C:\\xampp\\htdocs\\devPath\\routes\\web.php\necho __NAMESPACE__;\necho __LINE__;\necho __CLASS__;', 8, 4, 64, '2019-11-07 12:32:38', '2019-11-07 12:40:42'),
(176, 'whenever a visitor go to site, a new session will be \ncreated at server side which is by default a file\nand a cookie key by default \'PHPSEED\' will be set \nat the visitor to connect visitor with session at server side\n\non any request to site, session in cookie will refresh\n\nsession will end when no requests made to site from visitor\nfor session life time which is by default 24 minute\n\nsession_start(); //to start session\n\n$_SESSION[\'key\'] = \'value\'; //to add key=>value in session', 6, 1, 58, '2019-11-07 13:25:18', '2019-11-07 13:31:02'),
(182, 'Software entities (classes, modules, functions, etc.) \nshould be open for extension, but closed for modification.\n\non writing a class and you anticipate that this class \nmay have children classes and extra features in the future\nso you should write this class that it can be\ninherited (open for extenstion) and in same time closed for\nmodification without having much dependencies on other codes\n\nimagine you write a class such \"User\" Class but you created it \nthat it have much dependencies (not closed) and it is not inherited\neasily (not open) and with time you needed to create Admin,SuperAdmin\nCustomer class which will have many similarities with \"User\" class\nyou are going to have terrible time refactoring User Class to be \ninheritable and closed, so this principle is helpful when \nyou put it on your mind, if you anticipate it may be inherited\nthen write it for the first time inheritable', 7, 1, 24, '2019-11-08 09:14:42', '2019-11-08 09:51:46'),
(183, 'Sub class should implements all parent class methods \nwithout any extra method that break the abstraction\n\nIf it looks like a duck, quacks like a duck, \nbut needs batteries – you probably have \nthe wrong abstraction\n\nThat means objects of the derived class must behave in \na manner consistent with the promises made in the base \nclass contract.\n\nimaging class \"Animal\" a parent class have methods\neat(),drink(),play(). so all classes extends animal \nshould behave like we promised the parent would be an animal\nfor example a class \"Snake\" extends Animal and have\nsetBattery() method will make no sense', 9, 1, 24, '2019-11-08 09:55:48', '2019-11-08 10:02:39'),
(184, 'A client should never be forced to implement an interface\nthat it doesn\'t use or clients shouldn\'t be forced to \ndepend on methods they do not use.\n\na child class shouldn\'t extend or implement class and \noverride its methods and make it empty, this is very \nbad practice and it violates ISP', 11, 1, 24, '2019-11-08 10:15:59', '2019-11-08 10:18:46'),
(185, 'Entities must depend on abstractions not on concretions. \nIt states that the high level module must not depend on \nthe low level module, but they should depend on \nabstractions.', 13, 1, 24, '2019-11-08 10:20:20', '2019-11-08 10:20:54'),
(188, '<?php\n\nclass MediaPlayer(){\n  public function play(){\n    //some code to play avi videos\n  }\n}\n\n$player = new MediaPlayer();\n$player->playAvi();\n\nand now we are trying to introduct new features \nto MediaPlayer but we cant change MediaPlayer directly\nas we dont have access to it directly and\nthere are many Dependency on it. \n\nclass AdvancedMediaPlayer(){\n  public function playMp4(){\n    //some code to play mp4 videos\n  }\n  public function playVlc(){\n    //some code to play vlc videos\n  }\n}', 16, 4, 21, '2019-11-08 15:14:25', '2019-12-17 04:15:11'),
(189, '<?php\n\n$player = new MediaAdapter(\'avi\');\n$player->play();\n\nclass MediaAdapter extends MediaPlayer{\n private AdvancedMediaPlayer $advancedMediaPlayer;\n private String $videoType;\n\n public function __construct($videoType){\n     $this->videoType = $videoType;\n     $this->advancedMediaPlayer = new AdvancedMediaPlayer;\n }\n\n public function play(){\n   if ($this->videoType ==\'vlc\'){\n     $this->advancedMediaPlayer->playVlc();\n     return;\n   }\n\n   if ($this->videoType ==\'mp4\'){\n     $this->advancedMediaPlayer->playMp4();\n     return;\n   }\n   if($this->videoType == \'avi\'){\n      $this->play();\n   }\n   return false;\n }\n}', 18, 4, 21, '2019-11-08 15:46:33', '2019-12-17 04:17:22'),
(190, '<?php\n\n$x = [];\n$x[] = \'value is here\';\n\n//operations at the end of array\narray_push($x,\'value\'); O(1)\narray_pop($x); O(1)\narray_last($x); //get last element without poping it\n\n//operations at the beginning of array\narray_unshift($x,\'another value\'); O(n)\narray_shift($x); O(n)\narray_first($x); //return first element without removing it\n\n//get value of array and remove it where key = 1\narray_pull($x,1);\n\n//get all keys and values of array\narray_keys($x);\narray_values($x);\n\n//get a random entry of array\narray_rand($x);\n\n//check if array is empty\nempty($x);', 2, 4, 69, '2019-11-09 12:59:46', '2019-11-09 15:53:42');
INSERT INTO `contents` (`id`, `content`, `order`, `code_language_id`, `panel_id`, `created_at`, `updated_at`) VALUES
(191, 'all browsers implements ES5, and ES6 is an update for js\nbut its not supported in all browsers.\nso we use a compiler such as babel to transform ES6 to ES5\nto make sure your code is supported in all browsers\nand bundler such webpack to make sure \ncode like require(\'scripts\'); works', 2, 1, 70, '2019-11-16 16:37:20', '2019-11-23 16:58:30'),
(192, 'Const keyword is used to represent\na one assignment variable that can not be changed\n\nconst pi = 3.14;\nfunction calcArea(r){\n  pi = 50; //error cant assign const variable\n  const pi = 10;\n  console.log(pi); //10\n}\nconsole.log(pi); //3.14', 4, 3, 70, '2019-11-16 16:49:03', '2019-11-23 17:00:25'),
(193, 'let is like const represent a local scope variable\n\nvar x = 10; //this variable is attached to window object\n\nfunction func(){\n  let xx = 5 ; //this variable is identified inside func method\n  if(true){\n     let yy = 10; //this variable identified inside if statement\n     var zz = 20; //this variable identified inside func method  \n     ww = 30; //this variable is attached to window object\n  }\n  \n}', 6, 3, 70, '2019-11-16 16:56:02', '2019-11-23 17:01:23'),
(194, 'function func(x=5){\n   console.log(x);\n}\nfunc(); //5\nfunc(10); //10', 8, 3, 70, '2019-11-16 17:03:27', '2019-11-16 17:04:19'),
(195, 'three dots operator used to spread array into individual items\nvar num1 = [1,2,3];\nvar num2 = [num1,4,5,6];\nvar num3 = [...num1,4,5,6];\n\nconsole.log(num2); // [[1,2,3],4,5,6]\nconsole.log(num3); // [1,2,3,4,5,6]', 10, 3, 70, '2019-11-16 17:05:31', '2019-11-16 17:07:25'),
(196, 'function foo(name,age){\n  console.log(`your name is ${name} and \n          age is \n               ${age}`);\n}\nfoo(\"ahmed\",25)', 12, 3, 70, '2019-11-16 17:08:51', '2019-11-16 17:10:48'),
(197, 'var Obj = {\n   name,age, //this equal to name:name,age:age\n   speak(){ //this equal to speak : function()\n     console.log(`${this.name} and age ${this.age}`); \n   }\n}', 14, 3, 70, '2019-11-16 17:12:24', '2019-11-16 17:14:22'),
(198, 'var func = function(name){\n   console.log(\"hi\");\n}\n\nvar func = (name) => {\n   console.log(\"hi\");\n}\n\nvar func = (name) => console.log(\"hi\"); //since its one line code\n\nvar func = name => console.log(\"hi\"); //since its only one parameter\n\nvar Obj = {\n  name:\"ahmed\",\n  speak(){\n    console.log(this.name); //ahmed.. this refer to Obj\n    window.setInterval(()=>{\n       this.name; // ahmed\n    },1000);\n  },\n  eat : () => {\n    console.log(this.name); //this refer to window object\n    window.setInterval(function(){\n       this.name; // this refer to function itself\n    },1000);\n    }\n}', 16, 3, 70, '2019-11-16 17:28:33', '2019-11-16 17:37:00'),
(199, 'Set is like array but contains only unique values\n\nvar xarray = [1,2,3];\nvar yset= new Set(xarray);\nyset.add(3).add(2); // set of 1,2,3\nyset.size; //3\nyset.has(1); //true\nyset.delete(1); // true;\n\nvar arrayAgain = [...yset];\nyset.clear();', 18, 3, 70, '2019-11-16 17:39:26', '2019-11-16 17:43:36'),
(200, 'Sass is a stylesheet language that’s compiled to CSS. \nIt allows you to use variables, nested rules, mixins, \nfunctions, and more, all with a fully CSS-compatible \nsyntax. Sass helps keep large stylesheets well-organized \nand makes it easy to share design within and across \nprojects.\n\nthe compiler used to transform sass code into css. is called\ndart-sass as its the primary implementation for sass \nand any new feature will be here before any other implementation\nand its moved from ruby-sass to dart-sass as \n*)It\'s fast. The Dart VM is highly optimized,\n  and getting faster all the time\n*)It\'s portable. The Dart VM has no external dependencies\n and can compile applications into standalone files\n*)It\'s easy to write. Dart is a higher-level language \n  than C++\n*)It\'s friendlier to contributors. \n  Dart is substantially easier to learn than Ruby\n*)Dart can also be compiled to JavaScript, \n which makes it easy to distribute Sass through npm, \n which the majority of our users use already.\n\nnode-sass is another compiler that based on sasslib\nwhich is developed in C++ language and its fast in compile\nthan dart-sass but it has alot of issues with dependencies\nalso it is not easy to add new features on sasslib so \nnode-sass is not developing fast-enough \n\nso js users tend to use dart-sass for reliability and\nup-to-date features of sass language', 2, 1, 71, '2019-11-19 17:39:37', '2019-11-20 01:17:53'),
(201, 'Sass variables are imperative, which means if you set a \nvariable and then change its value, the earlier \nuse will stay the same.\n\nscss=>\n$variable: value 1;\n.rule-1 {\n  value: $variable;\n}\n\n$variable: value 2;\n.rule-2 {\n  value: $variable;\n}\n\ncss=>\n.rule-1 {\n  value: value 1;\n}\n\n.rule-2 {\n  value: value 2;\n}\n\n\nSass variables, like all Sass identifiers, treat hyphens \nand underscores as identical. This means that \n$font-size and $font_size both refer to the same variable', 4, 1, 71, '2019-11-19 17:51:32', '2019-11-19 17:56:27'),
(202, 'SCSS => \n$global-variable: global value;\n\n.content{\n  $local-variable: local value;\n  global: $global-variable; //global value\n  local: $local-variable; //local value\n}\n\n.sidebar{\n  global: $global-variable; //global value\n  local : $local-variable; //error as itsnt initalized\n}\n\n.content{\n $global-variable : alternative !global;\n global : $global-variable; //alternative\n}\n.sidebar{\n  global: $global-variable; //alternative\n}', 6, 2, 71, '2019-11-19 18:04:16', '2019-11-19 18:27:02'),
(203, '$theme-colors: (\n  \"success\": #28a745,\n  \"info\": #17a2b8,\n  \"warning\": #ffc107,\n);\n\n$theme-colors : map-merge(\n(\n \"danger\" : red,\n \"primary : blue,\n)\n,$theme-colors);\n\n.alert {\n  // Instead of $theme-color-#{warning}\n  background-color: map-get($theme-colors, \"warning\");\n}', 8, 1, 71, '2019-11-19 18:32:23', '2019-11-19 18:40:12'),
(204, 'Interpolation can be used almost anywhere in a Sass \nstylesheet to embed the result of a SassScript expression\ninto a chunk of CSS. Just wrap an expression in #{}\n\nSCSS =>\n@mixin corner-icon($name, $top-or-bottom, $left-or-right) {\n  .icon-#{$name} {\n    background-image: url(\"/icons/#{$name}.svg\");\n    position: absolute;\n    #{$top-or-bottom}: 0;\n    #{$left-or-right}: 0;\n  }\n}\n\n@include corner-icon(\"mail\", top, left);\n\ncss=>\n.icon-mail {\n  background-image: url(\"/icons/mail.svg\");\n  position: absolute;\n  top: 0;\n  left: 0;\n}', 2, 1, 72, '2019-11-19 18:53:58', '2019-11-19 18:56:42'),
(205, 'You definitely don’t need it to just use a variable in a\nproperty value. Instead of writing \ncolor: #{$accent}, \nyou can just write \ncolor: $accent!', 4, 1, 72, '2019-11-19 18:57:20', '2019-11-19 18:57:57'),
(206, 'Much of Sass’s extra functionality comes in the form of \nnew at-rules it adds on top of CSS', 2, 1, 73, '2019-11-19 19:11:29', '2019-11-19 19:12:03'),
(207, 'The @use rule loads mixins, functions, and variables \nfrom other Sass stylesheets, and combines CSS from \nmultiple stylesheets together\n\nOnly Dart Sass currently supports loading built-in \nmodules with @use. laravel uses dart-sass instead of node-sass\n\nStylesheets loaded by @use are called \"modules\". and\nwill load these modules into the main stylesheet but\nset its functions , variables and mixins to a namespace\nby default take the filename\n\nstylesheets @use rules must come before any rules\n\n// foundation/_code.scss\n$raduis : 5px;\n$-width : 10px; //width variable is private\n.code {\n  padding: .25em;\n  width : $-width;\n  line-height: 0;\n}\n\n// foundation/_lists.scss\n@mixin rounded{\n border-radius: 10px;\n} \n\n// style.scss\n@use \'foundation/code\';\n@use \'foundation/lists\' as l;\n\n.class-name{\n  width:$radius; //error\n  width:code.$radius; // width:5px; \n  width:code.$-width; //error as its private variable\n  @include rounded; //error\n  @include l.rounded; // it will work\n}', 4, 3, 73, '2019-11-19 19:14:06', '2019-11-20 01:25:10'),
(208, '// src/_list.scss\n@mixin list-reset {\n  margin: 0;\n  padding: 0;\n  list-style: none;\n}\n\n// bootstrap.scss\n@forward \"src/list\";\n\n// styles.scss\n@use \"bootstrap\";\n\nli {\n  @include bootstrap.list-reset;\n}', 2, 1, 74, '2019-11-20 00:07:19', '2019-11-20 02:01:18'),
(209, 'css =>\n.code {\n  padding: .25em;\n  width: 10px;\n  line-height: 0;\n}\n\n.class-name{\n  width:5px;\n  border-radius:10px;\n}', 6, 1, 73, '2019-11-20 01:23:51', '2019-11-20 01:25:31'),
(210, 'As a convention, Sass files that are only meant to be \nloaded as modules, not compiled on their own, \nbegin with _ (as in _code.scss)', 8, 1, 73, '2019-11-20 01:30:25', '2019-11-20 01:30:35'),
(211, 'If you write an _index.scss or _index.sass in a folder, \nthe index file will be loaded automatically. \nwhen you load the URL for the folder itself.\n\n// foundation/_index.scss\n@use \'code\';\n@use \'lists\';\n\n\n// style.scss\n@use \'foundation\';', 10, 3, 73, '2019-11-20 01:31:40', '2019-11-20 01:34:22'),
(212, 'CSS files loaded as modules don’t allow any special \nSass features and so can’t expose any Sass variables,\nfunctions, or mixins.\n\n// code.css\ncode {\n  padding: .25em;\n  line-height: 0;\n}\n\n\n// style.sass\n@use \'code\'', 12, 3, 73, '2019-11-20 01:33:37', '2019-11-20 01:34:16'),
(213, 'on trying to load a package from node-modules\n\nfirst on your app.scss you will type\n\n@import \"package-name\";\n@use \"package-name\";\n\nfirst it will try to reach package-name in the same\ndirectory.\n\nif it can\'t find it,it will try to locate in node-modules\nthen read package.json for package-name\n\n\"style\": \"dist/style.css\" // same as \"node-moduels/package-name/dist/style.css\"\n\"sass\": \"scss/bootstrap.scss\" // same as \"node-modules/package-name/dist/style.css\"\n\nif there is no guidance in package.json \nit will try to get \"node-modules/package-name/index\"\n\n\n//if we are trying to load js\n\"main\" : \"dist/app.js\" // same as \"node-modules/package-name/dist/app.js\"', 6, 1, 72, '2019-11-20 01:50:07', '2019-11-20 03:15:38'),
(214, 'The Sass team discourages the continued use of the \n@import rule. Sass will gradually phase it out over the\nnext few years, and eventually remove it from the \nlanguage entirely. Prefer the @use rule instead.\n\nWhat’s Wrong With @import?\nThe @import rule has a number of serious issues:\n\n@import makes all variables, mixins, and functions \nglobally accessible. This makes it very difficult for \npeople (or tools) to tell where anything is defined.\n\nBecause everything’s global, libraries must prefix to \nall their members to avoid naming collisions.\n\n@extend rules are also global, which makes it difficult \nto predict which style rules will be extended.\n\nEach stylesheet is executed and its CSS emitted every \ntime it’s @imported, which increases compilation time \nand produces bloated output.\n\nThere was no way to define private members or \nplaceholder selectors that were inaccessible to\ndownstream stylesheets.', 2, 1, 75, '2019-11-20 02:13:40', '2019-11-20 02:15:26'),
(215, 'you don’t have to explicitly write out the extension \nof the file you want to import; @import \"variables\" \nwill automatically load variables.scss, variables.sass, \nor variables.css.', 4, 1, 75, '2019-11-20 02:21:38', '2019-11-20 02:21:46'),
(216, 'In addition to importing .sass and .scss files, \nSass can import plain old .css files. The only rule is \nthat the import must not explicitly include the .css \nextension, because that’s used to indicate a plain CSS \n@import.\n\n// code.css\ncode {\n  padding: .25em;\n  line-height: 0;\n}\n\n// style.scss\n@import \'code\';', 6, 1, 75, '2019-11-20 02:24:32', '2019-11-20 02:25:56'),
(217, '@mixin reset-list {\n  margin: 0;\n  padding: 0;\n  list-style: none;\n}\n\n@mixin horizontal-list {\n  @include reset-list;\n\n  li {\n    display: inline-block;\n    margin: {\n      left: -2px;\n      right: 2em;\n    }\n  }\n}\n\nnav ul {\n  @include horizontal-list;\n}', 2, 1, 76, '2019-11-20 02:32:39', '2019-11-20 02:33:36'),
(218, '@mixin replace-text($image, $x: 50%, $y: 50%) {\n  text-indent: -99999em;\n  overflow: hidden;\n  text-align: left;\n\n  background: {\n    image: $image;\n    repeat: no-repeat;\n    position: $x $y;\n  }\n}\n\n.mail-icon {\n  @include replace-text(url(\"/images/mail.svg\"), 0);\n}', 4, 1, 76, '2019-11-20 02:34:29', '2019-11-20 02:35:07'),
(219, 'Functions allow you to define complex operations on \nSassScript values that you can re-use throughout your \nstylesheet. They make it easy to abstract out common \nformulas and behaviors in a readable way.', 2, 1, 77, '2019-11-20 02:42:23', '2019-11-20 02:43:29'),
(220, '@function pow($base, $exponent) {\n  $result: 1;\n  @for $_ from 1 through $exponent {\n    $result: $result * $base;\n  }\n  @return $result;\n}\n\n.sidebar {\n  float: left;\n  margin-left: pow(4, 3) * 1px;\n}\n\n\n\n@function sum($numbers...) {\n  $sum: 0;\n  @each $number in $numbers {\n    $sum: $sum + $number;\n  }\n  @return $sum;\n}\n\n.micro {\n  width: sum(50px, 30px, 100px);\n}', 4, 1, 77, '2019-11-20 02:43:49', '2019-11-20 02:44:45'),
(221, 'they are usually tags that are used to display content\nor give command such img,hr,meta,input,link\n<img src=\"img.jpg\" />\n\nin the other hand double tags are more like containers\nwhich will have content inside it such div,ul,a\n<ul>...</ul>', 2, 1, 78, '2019-11-20 15:29:00', '2019-11-20 16:30:06'),
(222, '<!DOCTYPE html> <!-- DOCTYPE is used to guide browser what version it should render-->\n\n<head>\n\n    <meta charset=\"UTF-8\"> <!--tell the browser to render other languages than english too-->\n    <meta http-equiv=\"refresh\" content=\"5\"> <!--tell browser to refresh page every 5 second-->\n    \n    <!-- it mainly used for browsers and search-engines -->\n    <title>Document</title> <!-- title of page in browser-->\n    \n    <!-- used to define the icon image beside title in browser -->\n    <link rel=\"shortcut icon\" href=\"favicon.ico\" type=\"image/x-icon\">\n\n    <meta name=\"description\" content=\"Description of your site is here\"/>\n    <meta name=\"keywords\" content=\"keyword1,keyword2,keyword3\">\n\n    <!-- robots is used for all search engines and google bot is specific for google search engine-->\n    <!-- there are six settings all=={index,follow} index follow noindex nofollow none=={noindex,nofollow} -->\n    <meta name=\"robots\" content=\"index,follow\" />\n    <meta name=\"googlebot\" content=\"index,follow\" />\n</head>\n\n<body>\n    <!-- it mainly used for placing content for users -->\n</body>\n\n</html>', 4, 1, 78, '2019-11-20 15:44:13', '2019-11-20 16:41:19'),
(223, 'Inline Css > #ID selector > .class selector > Tag selector\n\n\nlast defined css property override predefined css property', 2, 1, 79, '2019-11-20 17:38:00', '2019-11-20 18:55:14'),
(224, '.class{}\n#id-name{}\n.class1.class2{} //element which have two classes class1 and class2\n\ndiv p   .. select all p which live inside a div element\ndiv go inside and find all p\n\ndiv > p .. select all p which are direct children to div\ndiv direct children called p tags\n\ndiv + p .. select one p where it comes immediate after div\ndiv get first sibling called p\n\ndiv ~ p .. select all p where are come immediate after div\ndiv all siblings called p\n\np:first-child .. Selects every <p> element that is the first child of its parent\np first child of its parent\n\np:nth-child(2) .. select every p that is second element of its parent\np second element of its parent\n\nli:nth-child(odd) .. select every li element that is odd 1,3,5,7\nli:nth-child(even) .. select every li element that is even 2,4,6\n\np:first-of-type .. Selects every <p> element that is the first <p> element of its parent\np first match of its parent\n\np:nth-of-type(2) .. select every p that is second match of its parent\np second match of its parent\n\n:not(p) .. select every tag which is not p\nall tags are not p\n\na[href] .. select all a tags with attribute href\n\n\nyou can practice using this html code\n\n<!DOCTYPE html>\n<html>\n<head>\n<style>\n p:nth-child(2) {\n  background-color: yellow;\n}\n</style>\n</head>\n<body>\n   <h1>Welcome to My Homepage</h1>\n   <div>\n      <h2>My name is Donald</h2>\n      <p>I live in Duckburg.</p>\n      <p>Another tag</p>\n      <ul>\n          <p>Another</p>\n      </ul>\n   </div>\n   <p>My best friend is Mickey.</p>\n   <p>I will not be styled.</p>\n</body>\n</html>', 4, 1, 79, '2019-11-20 17:46:17', '2019-11-20 18:45:47'),
(225, 'Default height of block,inline-block and inline tags\nare taken from the wrapped content inside them\n\nDefault width of block tags are 100% of its parent while\ninline-block and inline default width is taken from their\ncontent\n\nWe can set width and height for block,inline-block tags\nbut inline-tags doesnt accept that', 2, 1, 80, '2019-11-20 18:57:56', '2019-11-20 19:01:49'),
(226, 'EMs are relative to their parent\'s font size\n\nREMs are relative to a base font-size\n\nThis is important when intermediate containers change \nfont sizes. Child elements with EMs will be affected, \nthose using REMs will not.', 4, 1, 80, '2019-11-20 19:05:03', '2019-11-20 19:05:41'),
(227, 'by default body tag has margin:8px;', 6, 1, 80, '2019-11-20 19:10:58', '2019-11-20 19:11:30'),
(228, 'img tag is inline-block\n\nto display images in your server make sure you have \nthe same size as it will appear in your site not to waste\nresources\n\ntry to lower (dpi or quality) of the image to reduce \nits size and quality shouldnt be reduced more than 72dpi\n\ntry to set width and height attributes to maintain website\nstyle if the image didnt load for any reason\n\ntry to write some description for image in alt attribute\nas thats help Search engine to index your site\n\nset width:100%; height:auto; \nto make image responsive relative to its container\nbut image can blurry if container is much bigger than image itself\n\nset max-width:100%; height:auto; \nto make image responsive relative to its container\nbut image wont get blurry if container is much bigger \nthan image itself as image will take only its size and \nleave the rest space white', 8, 1, 80, '2019-11-20 19:33:06', '2019-11-20 19:46:11'),
(229, 'background-image:url(\'image.jpg\'); //notice background:red; is more important\nbackground-image:url(\'image.jpg\') no-repeat; //error\nbackground:url(\'image.jpg\') no-repeat; //working \nbackground-repeat:no-repeat;\nbackground-size:cover; // take all width and height of its container\nbackground-size:contain; //take what it can from its container to aspect-ratio of\n                           image itself and leave the rest of container white\nbackground-attachment:fixed; //make background image fixed and its content can be scrolled', 2, 1, 81, '2019-11-20 20:05:24', '2019-11-20 20:39:58'),
(230, 'You can create large svg file which has all the required\nicons refered by their id and when you need to display\nthis icon\n\n<svg viewBox=\"0 0 24 24\" class=\"class-name\" \nwidth=\"24\" height=\"24\">\n   <use xlink:href=\"file.svg#icon-name\"></use>\n</svg>\n\nnotice, link to file must be from same domain not to\nviolate same origin policy', 2, 1, 82, '2019-11-20 20:40:27', '2019-11-20 20:55:20'),
(231, 'when text-align:center is used in html tag,its effective\nrange is set. so it will check inside its effective range\nif it could find text or images,it will center it\nrelative to its nearest block or inline-block parent\n\nText-align dont work with inline elements such span\nText-align dont work with flex or inline-flex display parent', 4, 1, 81, '2019-11-20 23:11:33', '2019-11-20 23:23:36'),
(232, 'when text is bigger than its container,it will still be\nvisible out of its container giving bad style\n\nto fix this \nword-break:break-all;', 6, 1, 81, '2019-11-20 23:23:30', '2019-11-20 23:29:33'),
(233, 'vertical align is developed to situation when text and \nimages are aligned together so by setting vertical-align\nproperty inside IMG you can align text around it\n\n<div>\n<span>Hello World</span>\n<img style=\"vertical-align:middle\" src=\"asd.jpg\" width=\"100px\" height=\"100px\">\n<span>Hello World</span>\n</div>\n\nanother usage is like this\n<div style=\"background:red;display:table-cell;vertical-align:middle;height:200px;\">\n  <p>Hello Ahmed</p>\n</div>', 8, 1, 81, '2019-11-20 23:29:54', '2019-11-20 23:44:45'),
(234, 'Inline elements doesnt work with vertical margin unless\nwe are under flex container\n\nauto horizontal margin only works when its set on block\nand flex elements\n\nmargin bug\nif you have a block parent and a block child and you\nset margin-top to child. the parent will be affected also\n\n<div style=\"background:red;width:200px;height:200px;\">\n  <div style=\"margin-top:1rem;background:green;width:50px;height:50px;\">\n  </div>\n</div>', 10, 1, 81, '2019-11-20 23:50:06', '2019-11-21 14:35:08'),
(235, 'display:flex;\nflex:1 1 200px; //flex-grow:1\n                //flex-shrink:1\n                //flex-basis:200px;\n\nflex:0 0 33%; //grow:0 , shrink:0 , basis:33% \nflex:1; //grow:1 , shrink:1 , basis:0\n\nflex-basis is like min-width property\n\nflex-wrap:wrap // it says make items go to the second\nline if they exceeded their available space\n\nflex-direction:[row or column or row-reverse or column-reverse] [wrap or no-wrap];\n\njustify-content //its used to align items in same axis\nof flex direction such center,flex-start,space-between;\n\nalign-items //its used to align items in cross axis to\nflex direction such center,flex-start,flex-end\n\norder:[0 or 1 or 2 ...] //is used to control the order\nof the elements inside flex container', 2, 1, 83, '2019-11-21 02:11:14', '2019-11-21 02:31:33'),
(236, 'Float will move element relative to its parent div\n\nfloated elements dont contribute to their parent div\n\nfloated elements width and height are decided by its \ncontent\n\nadding clear:both property at the last floated element\nwill encourage parent tag to take its height from its\nfloated elements\n\nclear:both only works for block tags but not for inline \nand inline-block elements\n\nwhen setting clear:both to a div, it will look to its\nleft side and right side and get out of the float\nsequence and start its new line\n<div style=\"float:left;></div>\n<div style=\"float:left;></div>\n<div style=\"float:left;></div>\n<div style=\"clear:both;></div>\n<div style=\"float:left;></div>\n<div style=\"float:left;></div>\n<div style=\"float:left;></div>\n<div style=\"float:left;></div>\n\nfloated elements are aligned to their top-border\n\nif there is a sequence of floated elements 1,2,3\nand browser viewport is reduced so the 3 element goes\nto the next row. it will go to the second row and go\nleft to browser border or till it blocked with 1 or 2 element', 4, 1, 83, '2019-11-21 14:37:04', '2019-11-21 15:14:33'),
(237, 'Nodejs is environment to execute js files,\nit can be considered as the virtual machine for js\n\nJava has VM which java-runtime environment and without it\njava files cant be run.\n\nJavascript is the same it needs environment to run its \ncode and nodejs is designed take this role', 2, 1, 84, '2019-11-21 23:02:45', '2019-11-21 23:05:21'),
(238, 'node package manager is the tool used to manage javascript\npackages dependencies inside a project and it writes these\ndependencies in package.json file and generate package.json.lock\nwhich represent all information about packages for project\n\nnpm can also be used to manage js packages globally so \nit can run from terminal such \nnpm install vue-cli -g\nvue-cli //this will work', 4, 1, 84, '2019-11-21 23:06:45', '2019-11-21 23:09:43'),
(239, 'node -v  .. to know version of nodejs\nnpm -v   .. to know version of npm itself\n\nnpm view package-name versions\nnpm install --save-dev package_name .. to install package in dev dependencies', 6, 1, 84, '2019-11-21 23:11:08', '2019-11-22 00:05:42'),
(240, 'Dependencies vs DevDependencies ..\ndependencies are the packages that are required to be\ninstalled for your package to work \ndevDependencies are the packages that are only\nrequired for developer and project can live without them', 8, 1, 84, '2019-11-21 23:15:37', '2019-11-21 23:17:48'),
(241, 'box-sizing:\n\ncontent-box\nDefault. The width and height properties \n(and min/max properties) descripe only the content. \nBorder and padding are not included\n\nborder-box\nThe width and height properties (and min/max properties)\n includes content, padding and border\n\ninitial\nSets this property to its default value. \n\ninherit\nInherits this property from its parent element.', 6, 1, 83, '2019-11-23 16:42:18', '2019-11-23 16:44:56'),
(242, 'background-image:linear-gradient(to right,red 10%,yellow 30%);\nbackground-image:linear-gradient(to right bottom,red 10%,yellow 30%);\n\nred 10% means that .. red will end at 10% of the gradient\nyellow 30% means   .. yellow will start at 30% of the gradient\n\nit can have many colors\nlinear-gradient(to right bottom,red 10%,yellow 30%,green 60%)\n\nit can use transparency\nlinear-gradient(to right bottom,rgba(20,45,200) 10%,rgba(50,32,54) 30%,rgba(15,56,60,.7) 60%)', 12, 1, 81, '2019-11-23 16:47:38', '2019-11-23 16:56:13'),
(243, 'Following are the JavaScript Data types:\nNumber\nString\nBoolean\nObject\nUndefined', 2, 1, 85, '2019-11-23 16:58:59', '2019-11-23 17:05:08'),
(244, 'JavaScript is faster. JavaScript is a client-side language \nand thus it does not need the assistance of the web server\nto execute. On the other hand, ASP is a server-side language\nand hence is always slower than JavaScript. \nJavascript now is also a server side language (nodejs).', 4, 1, 85, '2019-11-23 17:05:55', '2019-11-23 17:06:14'),
(245, 'Negative Infinity is a number in JavaScript which \ncan be derived by dividing negative number by zero.\n\n500/0  =>  Infinity\n-500/0 => -Infinity', 6, 1, 85, '2019-11-23 17:07:08', '2019-11-23 17:07:50'),
(246, 'Undeclared variables are those that do not exist in a \nprogram and are not declared. If the program tries to\nread the value of an undeclared variable, then a runtime\nerror is encountered.\n\nUndefined variables are those that \nare declared in the program but have not been given any \nvalue. If the program tries to read the value of an \nundefined variable, an undefined value is returned.', 8, 1, 85, '2019-11-23 17:09:04', '2019-11-23 17:09:38'),
(247, 'Global variables are those that are available throughout \nthe length of the code, that is, these have no scope. \nThe var keyword is used to declare a local variable or \nobject. If the var keyword is omitted, a global variable is declared.\n\nExample:\nglobalVariable = \"Test\";\n\nThe problems that are faced by using global variables \nare the clash of variable names of local and global \nscope. Also, it is difficult to debug and test the code \nthat relies on global variables.', 10, 1, 85, '2019-11-23 17:12:20', '2019-11-23 17:13:03'),
(248, '\'This\' keyword refers to the object from where it was called.', 12, 1, 85, '2019-11-23 17:13:44', '2019-11-23 17:13:52'),
(249, 'Timers are used to execute a piece of code at a set time \nor also to repeat the code in a given interval of time. \nThis is done by using the functions \nsetTimeout, setInterval and clearInterval.', 14, 1, 85, '2019-11-23 17:14:40', '2019-11-23 17:14:56'),
(251, 'document.forms //give html collection of all forms;\ndocument.forms[0].submit();', 16, 1, 85, '2019-11-23 17:23:36', '2019-11-23 17:24:34'),
(252, 'parseInt(\"41\"); //41', 18, 1, 85, '2019-11-23 17:27:06', '2019-11-23 17:29:23'),
(253, 'Since 3 and 2 are integers, they will be added numerically\nAnd since 7 is a string, its concatenation will be done. \nSo the result would be 57.', 20, 1, 85, '2019-11-23 17:29:50', '2019-11-23 17:30:13'),
(254, 'window.navigator object gives and manage alot of information\nabout the browser and virtual machine running\nsuch version of virtual machine, is CookieEnabled . who \nis the vendor,languages of the browser and many others\n\nnavigator.platform //Win32', 22, 1, 85, '2019-11-23 17:34:59', '2019-11-23 17:39:36'),
(255, 'The NULL value is used to represent no value or no object\nIt implies no object or null string, no valid boolean \nvalue, no number and no array object.', 24, 1, 85, '2019-11-23 17:42:21', '2019-11-23 17:42:31'),
(256, 'The delete keyword is used to delete the property as well as its value.\n\nExample\nvar student= {age:20, batch:\"ABC\"};\ndelete student.age;', 26, 1, 85, '2019-11-23 17:43:43', '2019-11-23 17:43:50'),
(257, 'works by recursively breaking down a problem into two \nor more sub-problems of the same or related type, \nuntil these become simple enough to be solved directly', 2, 1, 86, '2019-11-24 23:30:04', '2019-11-24 23:30:57'),
(258, '8 length array           //Level 0\n\n    4 length array                4 length array  //Level 1\n\n2 length []   2 length []     2 length []   2 length []  //Level 2\n\n1[]  1[]      1[]   1[]       1[]   1[]     1[]   1[]    //level 3\n\n\nDepth of Recursion Tree = log(n) = log2(8) = 3\nTotal Number of levels = log2(n) + 1 = 4\n\nIn Any Level j\n* Number of elements = 2^j\n* Each element size = n/2^j', 4, 1, 86, '2019-11-24 23:32:06', '2019-11-24 23:41:35'),
(259, 'BigO(n) => it says that algorithm is better or equal of n iterations\nsmallo(n) => algorithm is strictly better than n iteration\n\nBigOmega(n) => algorithm is slower or equal to n iteration\nsmallOmega(n) => algorithm is strictly slower than n iteration\n\nTheta(n) => algorithm is exactly equal to n iteration', 2, 1, 87, '2019-11-25 00:07:10', '2019-11-25 00:17:18'),
(260, 'Merge Sort is a sorting algorithm its considered \na classical application for \nDivide and Conquer Paradigm and \n\nhave TimeComplexity O(nlog(n)) = \n2^j       | number of elements in any level \n6 * n/2^j | time complexity done for each element in any level\nlog(n)+1  | total number of levels  \n\n= 2^j * n/2^j * (log(n)+1) * 6 = 6n(logn + 1) = O(nlogn)\n \n# base case should be present in the Divide function\n#conquer function shouldnt implement results directly \n to the origin array\n# conquer function should implements its result into \n  temporary array\n# before ending conquer function, temporary array result\n  should be implemented to the origin array', 2, 1, 88, '2019-11-25 02:50:54', '2019-11-30 18:06:38'),
(261, '<?php\n$unSortedArray = [1,5,2,84,21,32,41,341,10,20,45];\n$merge = new MergeSort;\n$merge->sort($unSortedArray);\n\nclass MergeSort{\n    protected $array;\n    protected $tmp;\n    \n    public function sort($array){\n        $this->array = $array;\n        $this->tmp = array_fill(0,count($array),null);\n        $this->split(0,count($array)-1);\n        print_r($this->array);\n    }\n\n    private function split($start,$end){\n        //base Case\n        if($start >= $end) return;\n\n        $middle = floor(($start+$end)/2);\n\n        /** Divide Function */ \n        $this->split($start,$middle);\n        $this->split($middle+1,$end);\n\n        /** Conquer Function */\n        $this->merge($start,$middle,$end);\n    }\n\n    private function merge($start,$middle,$end){\n        $leftPointer = $start;\n        $rightPointer = $middle+1;\n        $index=$start;\n        \n        while($leftPointer<=$middle && $rightPointer<=$end){ \n            if($this->array[$leftPointer]<$this->array[$rightPointer]){\n                $this->tmp[$index++] = $this->array[$leftPointer++];\n            }else{\n                $this->tmp[$index++] = $this->array[$rightPointer++];\n            }\n        }\n        while($leftPointer<=$middle){$this->tmp[$index++]=$this->array[$leftPointer++];}\n        while($rightPointer<=$end){$this->tmp[$index++]=$this->array[$rightPointer++];}\n        print_r($start .\"#\". $middle .\"#\". $end . \"\\n\");\n        \n        for($i=$start;$i<=$end;$i++){\n            $this->array[$i] = $this->tmp[$i];\n        }\n    }\n}', 4, 4, 88, '2019-11-25 02:52:32', '2019-11-25 03:07:34'),
(262, 'its an indication of how far (close) is array of being\nsorted', 2, 1, 89, '2019-11-25 06:03:01', '2019-11-25 06:03:43'),
(263, '<?php\n$array = [1, 5, 2, 84, 21, 32, 41, 341, 10, 20, 45];\n\necho howMuchCloseOFBeingSorted($array); //0.29\n\nfunction countInversions($array){\n    $counter = 0;\n    for ($i = 0; $i < count($array); $i++) {\n        for ($j = $i + 1; $j < count($array); $j++) {\n            if ($array[$j] > $array[$i]) $counter++;\n        }\n    }\n    return $counter;\n}\n\nfunction howMuchCloseOfBeingSorted($array){\n    return 1 - (countInversions($array) / getMaxInversions($array));\n}\n\nfunction getMaxInversions($array){\n    // O(n) + O(n-1) + O(n-2) + ... O(1) Worst Case Scenario for inversions\n    // O(0.5*(n)*(n-1)) \n    $n = count($array);\n    return 0.5*$n*($n-1);\n}', 4, 4, 89, '2019-11-25 06:03:48', '2019-11-25 06:04:35'),
(264, 'if n = O(n^2) prove that log(n) = O(n)\nAnswer:\nn <= n^2\nlog(n) <= n\nlog(n) = O(n)\n\nif f(n) = O(g(n)) is 2^f(n) = O(2^g(n)) ?\nAnswer:\nf(n) <= g(n)\n2^f(n) <= 2^g(n)\n2^f(n) = O(2^g(n))', 4, 1, 87, '2019-11-30 18:39:13', '2019-11-30 18:46:47'),
(265, 'Exception is a class in php which is thrown when failed\noperation is done in php, and it terminates the \nscript if not handled by try catch block\n\nException has many properties and methods which gives\nyou the ability to see what was exception about and \nto trace it also\n\n<?php\nclass A{\n  public static function test(){\n     static::test2();\n  }\n  public static function test2(){\n    var_dump(new Exception(\"Test is Failed\",504));\n  }\n}\nA::test();\n\n/** Result **/\nobject(Exception)[1]\n  protected \'message\' => string \'Test is Failed\' (length=14)\n  private \'string\' => string \'\' (length=0)\n  protected \'code\' => int 504\n  protected \'file\' => string \'C:\\xampp\\htdocs\\test\\A.php\' (length=35)\n  protected \'line\' => int 8\n  private \'trace\' => \n    array (size=2)\n      0 => \n        array (size=6)\n          \'file\' => string \'C:\\xampp\\htdocs\\test\\A.php\' (length=35)\n          \'line\' => int 5\n          \'function\' => string \'test2\' (length=5)\n          \'class\' => string \'A\' (length=1)\n          \'type\' => string \'::\' (length=2)\n          \'args\' => \n            array (size=0)\n              ...\n      1 => \n        array (size=6)\n          \'file\' => string \'C:\\xampp\\htdocs\\test\\A.php\' (length=35)\n          \'line\' => int 11\n          \'function\' => string \'test\' (length=4)\n          \'class\' => string \'A\' (length=1)\n          \'type\' => string \'::\' (length=2)\n          \'args\' => \n            array (size=0)\n              ...\n  private \'previous\' => null', 2, 4, 90, '2019-12-07 04:09:35', '2019-12-07 04:47:21'),
(266, '<?php\n namespace a;\n //since we are under a specific namespace\n //it worth mention that  \n //we should add \\ to Exception to be \\Exception\n try {\n    throw new \\Exception(\'foo!\');\n } catch (\\Exception $e) {\n    // rethrow it\n    throw $e;\n } finally{\n    echo \"this is called after try catch finish their\n          work regardless Exception happened or not \"\n}', 4, 4, 90, '2019-12-07 04:24:36', '2019-12-07 04:29:26'),
(268, 'Standard PHP Library has many built in exceptions which \nextends the Exception class and you can create your\nown Exception class if you need \n\nBuiltIn Exceptions such:\nLogicException //when there is error in code itself\nOutOfBoundsException //when key doesnt exist in array\nOutOfRangeException  //when index doesnt exist in array\nRuntimeException //when error occurs on runtime', 6, 1, 90, '2019-12-07 04:32:58', '2019-12-07 04:37:45'),
(269, 'There are many other errors type instead of exceptions\nsuch E_USER_WARNING , E_USER_NOTICE which give the error \nand the script continue its work without being terminated\nand this is good practice if error is not fatal\n\nnotice, if error type is E_USER_ERROR then this error\nis fatal and script will stop its work\n\ntrigger_error(\"Cannot divide by zero\",E_USER_WARNING);        \ntrigger_error(\"Cannot divide by zero\",E_USER_NOTICE);\ntrigger_error(\"Cannot divide by zero\",E_USER_ERROR);', 8, 1, 90, '2019-12-07 04:55:02', '2019-12-07 05:00:30'),
(270, 'this is a callback function called whenever error is \nbeing triggered and its used to handle the error\n\n<?php\nset_error_handler(function ($errno, $errmsg, $errfile, $errline){\n    var_dump($errmsg);\n});\n\nclass A{\n  public static function test(){\n      //notice E_USER_ERROR doesnt stop the script anymore\n      //as its being handled\n        trigger_error(\"Cannot divide by zero\",E_USER_ERROR);\n        trigger_error(\"Cannot divide by zero\",E_USER_NOTICE);\n        echo \"Called\";\n  }\n}\nA::test();', 10, 4, 90, '2019-12-07 05:05:29', '2019-12-07 05:10:37'),
(271, 'error_reporting — Sets which PHP errors are reported\n\n<?php\n// Turn off all error reporting\nerror_reporting(0);\n\n// Report simple running errors\nerror_reporting(E_ERROR | E_WARNING | E_PARSE);\n\n// Report all errors\nerror_reporting(E_ALL);', 12, 1, 90, '2019-12-07 05:12:52', '2019-12-07 05:19:10'),
(272, 'error_log — Send an error message to the defined error handling routines\n\n<?php\n// Send notification through the server log if we can not\n// connect to the database.\nif (!Ora_Logon($username, $password)) {\n    error_log(\"Oracle database not available!\", 0);\n}\n\n// Notify administrator by email if we run out of FOO\nif (!($foo = allocate_new_foo())) {\n    error_log(\"Big trouble, we\'re all out of FOOs!\", 1,\n               \"operator@example.com\");\n}\n\n// another way to call error_log():\nerror_log(\"You messed up!\", 3, \"/var/tmp/my-errors.log\");\n?>', 14, 4, 90, '2019-12-07 05:19:15', '2019-12-07 05:20:09'),
(273, 'Facade pattern hides the complexities of the system \nand provides an interface to the client using which \nthe client can access the system.\n\nThis pattern involves a single class which provides \nsimplified methods required by client and delegates \ncalls to methods of existing system classes.', 2, 1, 91, '2019-12-17 03:43:34', '2019-12-17 03:44:52'),
(274, 'public interface Shape {\n   void draw();\n}\n\npublic class Rectangle implements Shape {\n\n   @Override\n   public void draw() {\n      System.out.println(\"Rectangle::draw()\");\n   }\n}\n\npublic class Square implements Shape {\n\n   @Override\n   public void draw() {\n      System.out.println(\"Square::draw()\");\n   }\n}\n\npublic class Circle implements Shape {\n\n   @Override\n   public void draw() {\n      System.out.println(\"Circle::draw()\");\n   }\n}\n\nif the client is going to draw alot of shapes its\npainful to act directly with the sub system as there \nare many and they might have complex relations also\n\nits necessary to introduce a facade to hide the\ncomplexity of subsystem and make the client interact\nwith only one class\n\npublic class ShapeMakerFacade {\n   private Shape circle;\n   private Shape rectangle;\n   private Shape square;\n\n   public ShapeMaker() {\n      circle = new Circle();\n      rectangle = new Rectangle();\n      square = new Square();\n   }\n\n   public void drawCircle(){\n      circle.draw();\n   }\n   public void drawRectangle(){\n      rectangle.draw();\n   }\n   public void drawSquare(){\n      square.draw();\n   }\n}', 4, 3, 91, '2019-12-17 03:48:26', '2019-12-17 03:55:21'),
(275, 'A \nstream is a transfer of data between an origin and destination. That’s it. The origin\nand destination can be a file, a command-line process, a network connection, a ZIP\nor TAR archive, temporary memory, standard input or output, or any other resource\navailable via PHP’s stream wrappers\n\nEvery stream has a scheme and a target. We specify the scheme and target in the\nstream’s identifier using this familiar format:\n<scheme>://<target>', 2, 1, 92, '2019-12-20 19:21:07', '2019-12-20 19:24:50'),
(276, '<?php\n/**\n/* file_get_contents() .. get stream data as a string\n/* fopen() .. open a stream and return a stream resource object\n/* fread() .. get stream data as a string with a specific length\n/* feof() .. checks if the pointer of the stream is at then end of file return true\n/* but if not then pointer go to the next line\n*/\n$json = file_get_contents(\n   \'http://api.flickr.com/services/feeds/photos_public.gne?format=json\'\n);\n\n$handler = fopen(\n    \'http://api.flickr.com/services/feeds/photos_public.gne?format=json\',\n    \'rb\'\n);\n\nwhile(feof($handler)!==true){    \n   $line = fgets($handler); //echo stream line by line through pointer iterations\n}\n\nfread($handler,400);', 4, 4, 92, '2019-12-20 19:24:46', '2019-12-20 20:06:51'),
(277, 'r  .. only read the file\nr+ .. read and write the file\nw  .. write to the file but before writing empty file first\nw+ .. write and read the file but before writting empty file first', 6, 1, 92, '2019-12-20 20:16:50', '2019-12-20 20:20:57'),
(278, 'The Null object pattern is a design pattern that \nsimplifies the use of dependencies that can be \nundefined. This is achieved by using instances of \na concrete class that implements a known interface, \ninstead of null references.\n\nit defines class hierarchies consisting of real \nobjects and null objects. Null objects can be used \nin place of real objects when the object is expected \nto do nothing. Whenever client code expects a real \nobject, it can also take a null object.', 2, 1, 93, '2019-12-30 18:34:45', '2019-12-30 18:38:10'),
(279, '<?php\ninterface Animal\n{\n    public function makeSound();\n}\n\nclass Dog implements Animal\n{\n    public function makeSound()\n    { \n        echo \"Woof..\"; \n    }\n}\n\nclass Cat implements Animal\n{\n    public function makeSound()\n    { \n        echo \"Meowww..\"; \n    }\n}\n\nclass NullAnimal implements Animal\n{\n    public function makeSound()\n    { \n        // silence...\n    }\n}\n\n$animalType = \'elephant\';\nswitch($animalType) {\n    case \'dog\':\n        $animal = new Dog();\n        break;\n    case \'cat\':\n        $animal = new Cat();\n        break;\n    default:\n        $animal = new NullAnimal();\n        break;\n}\n$animal->makeSound(); // ..the null animal makes no sound', 4, 4, 93, '2019-12-30 18:38:59', '2019-12-30 18:39:19'),
(280, '<?php\n\nclass TestClass\n{\n    protected $protected_property = \"hello\";\n}\n\n/** inside closures , {this} ref is not identified by\n * default but you need to set it manually \n * by binding closure to existing object and dont \n * forget to set class scope also\n * binding closure will make as if the object itself \n * contains the closure method\n * and the power of it that you can bind it in runtime\n*/\n\n# this will return a Closure object and when you write\n# $closure() , it will call __invoke magic method which\n# have the function instruction  \n$closure = function(){\n    return $this->protected_property;\n};\n\n$t = new TestClass;\n\n$newClosure = $closure->bindTo($t , TestClass::class); //closure now have binded this object which hold the t object\n$nc = Closure::bind($closure , new TestClass,TestClass::class); //same as above\n\nvar_dump($newClosure()); // \"hello\"\nvar_dump($nc()); // \"hello\"\nsleep(5);', 2, 4, 94, '2020-01-04 20:25:32', '2020-01-04 20:30:02'),
(281, '<?php\n\nclass BlackBox\n{\n    protected $protected_property = \"hello\";\n    private $private_property = \"world\";\n    public $public_property = \"!\";\n    protected function func()\n    {\n    }\n    public function __construct(string $x)\n    {\n    }\n}\n\n/**\n * Reflection Api gives you the ability to analyse the structure \n * of your code in run time\n * \n * it will break your code to small structures, get info\n * about these micro structure[property,method,...] and may even manipulate \n * its accessiblity or any other instructions\n * \n * Reflection Api don\'t hold information about values, values can be \n * gotten or set when we call that micro structure with a \n * context of object\n *  \n * and you can invoke methods or set values of properties with\n * an object that you are explicitly determine \n *\n *\n * ReflectionClass: reports information about a class.\n * ReflectionObject: reports information about object\n * ReflectionProperty : reports information about a property in class\n * ReflectionMethod: reports information about a function.\n * ReflectionParameter: retrieves information about function’s or method’s parameters.\n * ReflectionClassConstant: reports information about a class constant.\n */\n$instance = new BlackBox(\"hi\");\n\n\n$ref = new ReflectionClass(BlackBox::class);\n\n# BreakDown To Properities\n$p = $ref->getProperties(); //[0=>ReflectionProperty{protected_property} , 1=>ReflectionProperty{private_property} , 2=ReflectionProperty{public_property}]\n$p[0]->setAccessible(true); //null\n$p[0]->setValue($instance, \"new val\"); //now $instance have $protected_property = \"new val\"\n\n# Getting Information of its constructor\n$c = $ref->getConstructor(); // ReflectionMethod{_construct}\n$cp = $c->getParameters(); // [0=>ReflectionParameter{x}]\n\n# BreakDown To Methods\n$m = $ref->getMethods(); // [0=>ReflectionMethod{func}]\n\n$func_method = $m[0];\n// $func_method->invoke(new BlackBox); //error to trying to invoke protected method\n\n$func_method->isProtected(); //true\n$func_method->setAccessible(true);\n$func_method->invoke(new BlackBox(\"hi\")); //working without any error\n\n\n# Breaking Down Objects\n$instance->public_property = \"bla\";\n$objRef = new ReflectionObject($instance);\n$objProps = $objRef->getProperties(); //Array of ReflectionProperities\n$v = $objProps[0]->getValue($instance); //\"bla\"\nsleep(5);', 2, 4, 95, '2020-01-04 21:38:30', '2020-01-04 22:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `headers`
--

CREATE TABLE `headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `panel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `headers`
--

INSERT INTO `headers` (`id`, `name`, `order`, `panel_id`, `created_at`, `updated_at`) VALUES
(22, '  Case condition', 4, 8, '2019-04-30 17:53:45', '2019-05-01 19:52:39'),
(25, 'Create', 6, 9, '2019-04-30 17:53:45', '2019-05-02 11:08:35'),
(41, 'Arithmetic Series', 8, 14, '2019-04-30 17:53:45', '2019-05-04 20:59:15'),
(58, 'First Things', 2, 20, '2019-04-30 17:53:46', '2019-05-02 18:27:55'),
(59, 'HTTP / Console Kernels', 7, 20, '2019-04-30 17:53:46', '2019-05-02 18:38:25'),
(60, '  Default Middlewares', 8, 20, '2019-04-30 17:53:46', '2019-05-02 18:51:28'),
(71, 'SRP => Single Responsibility Principle', 5, 24, '2019-04-30 17:53:46', '2019-11-08 09:03:13'),
(85, 'Lazy binding', 3, 34, '2019-04-30 21:46:29', '2019-04-30 21:46:57'),
(87, 'When you shouldn\'t use Enum', 2, 6, '2019-05-01 19:04:20', '2019-05-01 19:08:18'),
(88, 'When you should use Enum', 4, 6, '2019-05-01 19:10:33', '2019-05-01 19:11:26'),
(99, 'Aggregate Functions', 10, 7, '2019-05-01 21:32:15', '2019-05-01 21:32:33'),
(101, 'Mathematical functions', 12, 7, '2019-05-01 21:33:01', '2019-05-01 21:33:11'),
(102, 'Update', 7, 9, '2019-05-02 11:10:30', '2019-05-02 11:10:37'),
(103, 'Insert', 1, 36, '2019-05-02 11:12:00', '2019-05-02 11:12:38'),
(104, 'Update', 3, 36, '2019-05-02 11:13:04', '2019-05-02 11:13:09'),
(105, 'Delete', 5, 36, '2019-05-02 11:13:50', '2019-05-02 11:13:55'),
(106, 'Select', 7, 36, '2019-05-02 11:14:14', '2019-05-02 11:14:21'),
(112, 'Custom group_concat', 3, 40, '2019-05-02 11:38:32', '2019-05-02 11:38:45'),
(113, 'Write service provider', 11, 17, '2019-05-02 16:32:56', '2019-05-02 16:33:04'),
(114, 'Register Method', 13, 17, '2019-05-02 16:33:28', '2019-05-02 16:33:36'),
(115, 'Boot Method', 15, 17, '2019-05-02 16:38:03', '2019-05-02 16:38:09'),
(116, 'bindings and singeltons', 17, 17, '2019-05-02 16:44:15', '2019-05-02 16:44:32'),
(117, 'Deferred Providers', 19, 17, '2019-05-02 16:48:06', '2019-05-02 16:48:10'),
(118, 'Auto dependency injection', 8, 19, '2019-05-02 18:09:51', '2019-05-02 18:10:00'),
(119, '  real time facade', 10, 19, '2019-05-02 18:14:24', '2019-05-02 18:46:20'),
(120, 'Dispatch Request', 10, 20, '2019-05-02 18:51:31', '2019-05-02 18:51:50'),
(123, 'putting a class into ServiceContainer', 2, 43, '2019-05-02 19:10:56', '2019-05-02 19:11:10'),
(124, 'getting a class out of container', 4, 43, '2019-05-02 19:12:17', '2019-05-02 19:12:27'),
(125, 'if class is not in container', 6, 43, '2019-05-02 19:21:50', '2019-05-02 19:21:58'),
(126, 'Auto Resolve', 8, 43, '2019-05-02 19:30:36', '2019-05-02 19:30:44'),
(131, 'Implicit Binding ', 1, 53, '2019-05-03 12:44:41', '2019-05-03 12:45:01'),
(132, 'Custom column ', 3, 53, '2019-05-03 12:50:57', '2019-05-03 12:51:04'),
(133, 'Explicit Binding', 5, 53, '2019-05-03 12:53:57', '2019-05-03 12:54:05'),
(134, 'Custom Resolution Logic', 7, 53, '2019-05-03 12:56:54', '2019-05-03 12:57:10'),
(137, 'Problem', 11, 22, '2019-05-03 17:08:44', '2019-05-03 17:08:51'),
(138, 'Solution', 13, 22, '2019-05-03 17:23:16', '2019-05-03 17:23:23'),
(140, 'Chucks', 3, 54, '2019-05-03 18:12:48', '2019-05-03 18:12:53'),
(141, 'Aggregate', 5, 54, '2019-05-03 18:15:15', '2019-05-03 18:15:23'),
(142, 'check if record exist', 7, 54, '2019-05-03 18:16:23', '2019-05-03 18:16:31'),
(143, 'Select', 1, 55, '2019-05-03 18:19:00', '2019-05-03 18:19:31'),
(144, 'distinct', 3, 55, '2019-05-03 18:20:21', '2019-05-03 18:20:26'),
(145, 'raw', 5, 55, '2019-05-03 18:23:16', '2019-05-03 18:23:20'),
(146, 'Union', 7, 55, '2019-05-03 18:26:53', '2019-05-03 18:26:58'),
(147, 'Where ', 9, 55, '2019-05-03 18:29:13', '2019-05-03 18:29:24'),
(148, 'order By', 1, 56, '2019-05-03 18:37:42', '2019-05-03 18:38:37'),
(149, ' increment and decrement', 3, 56, '2019-05-03 18:42:22', '2019-05-03 18:42:44'),
(150, 'Solution', 9, 23, '2019-05-03 19:38:13', '2019-05-03 19:38:19'),
(152, 'base condition in recursion', 3, 57, '2019-05-04 10:19:02', '2019-05-04 10:19:06'),
(153, 'Stack Overflow', 5, 57, '2019-05-04 10:20:48', '2019-05-04 10:20:51'),
(154, 'Example of Fibonachi number ', 7, 57, '2019-05-04 10:28:27', '2019-05-04 10:28:51'),
(155, 'Convergence test', 1, 13, '2019-05-04 10:53:41', '2019-05-04 10:57:43'),
(157, 'Partial sum', 3, 13, '2019-05-04 11:03:53', '2019-05-04 11:03:59'),
(158, 'Find any item in series', 5, 13, '2019-05-04 11:16:55', '2019-05-04 11:17:05'),
(159, 'Geometric Series', 10, 14, '2019-05-04 21:08:07', '2019-05-04 21:08:15'),
(160, 'Auto Casting', 1, 58, '2019-05-04 21:56:51', '2019-05-04 22:01:11'),
(161, 'Memoization', 1, 59, '2019-05-05 09:04:32', '2019-05-05 09:12:46'),
(162, 'Bottom Up Technique', 3, 59, '2019-05-05 10:18:32', '2019-05-05 10:18:47'),
(169, 'Constructors And Destructors', 3, 64, '2019-11-06 18:10:37', '2019-11-06 18:13:50'),
(172, 'Static Methods', 3, 65, '2019-11-06 19:55:24', '2019-11-06 19:55:39'),
(177, 'Magic Functions', 5, 64, '2019-11-07 09:30:25', '2019-11-07 09:30:33'),
(178, 'Traits', 5, 65, '2019-11-07 09:59:37', '2019-11-07 09:59:44'),
(179, 'Avoid To Send Mail In Spam Folder', 1, 68, '2019-11-07 10:05:48', '2019-11-07 10:52:59'),
(180, 'Errors', 3, 58, '2019-11-07 10:05:55', '2019-11-07 10:06:01'),
(181, 'Magic Constants', 7, 64, '2019-11-07 12:32:27', '2019-11-07 12:32:37'),
(182, 'Session', 5, 58, '2019-11-07 13:25:09', '2019-11-07 13:25:17'),
(183, 'OCP => Open-Closed Principle', 6, 24, '2019-11-08 08:56:29', '2019-11-08 09:11:45'),
(184, 'LSP => Liskov Substitution Principle', 8, 24, '2019-11-08 09:53:15', '2019-11-08 09:53:37'),
(185, 'ISP => Interface Segregation Principle', 10, 24, '2019-11-08 10:15:35', '2019-11-08 10:17:18'),
(186, 'DIP => Dependency Inversion Principle', 12, 24, '2019-11-08 10:18:53', '2019-11-08 10:20:19'),
(187, 'Example', 15, 21, '2019-11-08 15:13:38', '2019-12-17 04:01:44'),
(189, 'Solution', 17, 21, '2019-11-08 15:46:02', '2019-11-08 15:46:29'),
(191, 'Const', 3, 70, '2019-11-16 16:48:58', '2019-11-16 16:49:02'),
(192, 'Let', 5, 70, '2019-11-16 16:52:08', '2019-11-16 16:55:57'),
(193, 'Default Parameters', 7, 70, '2019-11-16 17:03:18', '2019-11-16 17:03:25'),
(194, 'Spread Operator', 9, 70, '2019-11-16 17:04:21', '2019-11-16 17:05:17'),
(195, 'Template Strings', 11, 70, '2019-11-16 17:08:34', '2019-11-16 17:08:50'),
(196, 'Literal Enhancement', 13, 70, '2019-11-16 17:12:15', '2019-11-16 17:12:24'),
(197, 'Arrow Functions', 15, 70, '2019-11-16 17:28:23', '2019-11-16 17:28:32'),
(198, 'Set', 17, 70, '2019-11-16 17:39:21', '2019-11-16 17:39:25'),
(199, 'Intro', 1, 71, '2019-11-19 17:39:37', '2019-11-19 17:41:26'),
(200, 'Variables', 3, 71, '2019-11-19 17:51:26', '2019-11-19 17:51:31'),
(201, 'Variables Scope', 5, 71, '2019-11-19 18:03:48', '2019-11-19 18:08:59'),
(202, 'Variables As Array ', 7, 71, '2019-11-19 18:31:10', '2019-11-19 18:32:21'),
(203, 'Interpolation', 1, 72, '2019-11-19 18:53:58', '2019-11-19 18:54:10'),
(204, 'More On Interpolation', 3, 72, '2019-11-19 18:57:08', '2019-11-19 18:57:19'),
(205, 'At-Rule', 1, 73, '2019-11-19 19:11:29', '2019-11-19 19:11:40'),
(206, '@Use', 3, 73, '2019-11-19 19:12:08', '2019-11-19 19:12:12'),
(207, 'Css=>', 5, 73, '2019-11-19 19:30:37', '2019-11-20 01:23:49'),
(209, 'Partials', 7, 73, '2019-11-20 01:30:04', '2019-11-20 01:30:09'),
(210, 'Index Files', 9, 73, '2019-11-20 01:31:32', '2019-11-20 01:31:39'),
(211, 'Loading Css', 11, 73, '2019-11-20 01:33:10', '2019-11-20 01:33:15'),
(212, 'Loading Path', 5, 72, '2019-11-20 01:50:00', '2019-11-20 01:50:06'),
(213, 'Legacy Import Problems', 1, 75, '2019-11-20 02:13:40', '2019-11-20 02:13:57'),
(214, 'Finding Files', 3, 75, '2019-11-20 02:21:15', '2019-11-20 02:21:22'),
(215, 'Import Css', 5, 75, '2019-11-20 02:24:07', '2019-11-20 02:24:32'),
(216, 'Intro', 1, 76, '2019-11-20 02:32:39', '2019-11-20 02:33:26'),
(217, 'Mixin Arguments', 3, 76, '2019-11-20 02:34:16', '2019-11-20 02:34:26'),
(218, 'Intro', 1, 77, '2019-11-20 02:42:23', '2019-11-20 02:43:20'),
(219, 'Code', 3, 77, '2019-11-20 02:43:45', '2019-11-20 02:43:49'),
(220, 'Singleton Tags', 1, 78, '2019-11-20 15:29:00', '2019-11-20 15:40:37'),
(221, 'Structure', 3, 78, '2019-11-20 15:44:07', '2019-11-20 15:44:12'),
(222, 'Order Of Priorities', 1, 79, '2019-11-20 17:38:00', '2019-11-20 17:39:53'),
(223, 'Css Selectors', 3, 79, '2019-11-20 17:46:09', '2019-11-20 17:46:16'),
(224, 'Display', 1, 80, '2019-11-20 18:57:56', '2019-11-20 18:58:13'),
(225, 'Em And Rem', 3, 80, '2019-11-20 19:04:57', '2019-11-20 19:05:02'),
(226, 'Default Styles', 5, 80, '2019-11-20 19:10:43', '2019-11-20 19:10:56'),
(227, 'Img Tag', 7, 80, '2019-11-20 19:33:01', '2019-11-20 19:33:06'),
(228, 'Background', 1, 81, '2019-11-20 20:05:24', '2019-11-20 20:05:45'),
(229, 'SVG', 1, 82, '2019-11-20 20:40:27', '2019-11-20 20:40:50'),
(230, 'Text-Align', 3, 81, '2019-11-20 23:11:26', '2019-11-20 23:11:32'),
(231, 'Word-Break', 5, 81, '2019-11-20 23:23:09', '2019-11-20 23:23:30'),
(232, 'Vertical-Align', 7, 81, '2019-11-20 23:29:38', '2019-11-20 23:29:54'),
(233, 'Margin', 9, 81, '2019-11-20 23:50:01', '2019-11-20 23:50:06'),
(234, 'Flex', 1, 83, '2019-11-21 02:11:14', '2019-11-21 02:12:16'),
(235, 'Float', 3, 83, '2019-11-21 14:36:58', '2019-11-21 14:37:02'),
(236, 'Intro', 1, 84, '2019-11-21 23:02:45', '2019-11-21 23:03:03'),
(237, 'NPM', 3, 84, '2019-11-21 23:06:40', '2019-11-21 23:06:45'),
(238, 'Commands', 5, 84, '2019-11-21 23:11:02', '2019-11-21 23:11:06'),
(239, 'Notes', 7, 84, '2019-11-21 23:15:33', '2019-11-21 23:15:37'),
(240, 'Box-Sizing', 5, 83, '2019-11-23 16:42:04', '2019-11-23 16:42:16'),
(241, 'Linear Gradient', 11, 81, '2019-11-23 16:47:30', '2019-11-23 16:47:37'),
(242, 'What Are Js DataTypes', 1, 85, '2019-11-23 16:58:59', '2019-11-23 17:04:49'),
(243, 'Between JavaScript and an ASP script, which is faster?', 3, 85, '2019-11-23 17:05:46', '2019-11-23 17:05:54'),
(244, 'What is negative infinity?', 5, 85, '2019-11-23 17:07:02', '2019-11-23 17:07:06'),
(245, 'What are undeclared and undefined variables?', 7, 85, '2019-11-23 17:08:46', '2019-11-23 17:08:49'),
(246, 'What are global variables? How are these variable declared and what are the problems associated with using them?', 9, 85, '2019-11-23 17:11:57', '2019-11-23 17:11:59'),
(247, 'What is \'this\' keyword in JavaScript?', 11, 85, '2019-11-23 17:13:31', '2019-11-23 17:13:40'),
(248, 'Explain the working of timers in JavaScript?', 13, 85, '2019-11-23 17:14:29', '2019-11-23 17:14:31'),
(250, 'Explain how can you submit a form using JavaScript?', 15, 85, '2019-11-23 17:23:32', '2019-11-23 17:23:35'),
(251, 'How can you convert the string of any base to integer in JavaScript?', 17, 85, '2019-11-23 17:27:01', '2019-11-23 17:27:04'),
(252, 'What would be the result of 3+2+\"7\"What would be the result of 3+2+\"7\"', 19, 85, '2019-11-23 17:29:43', '2019-11-23 17:29:49'),
(253, 'Explain how to detect the operating system on the client machine?', 21, 85, '2019-11-23 17:34:52', '2019-11-23 17:34:56'),
(254, 'What do mean by NULL in Javascript?', 23, 85, '2019-11-23 17:42:11', '2019-11-23 17:42:14'),
(255, 'What is the function of delete operator?', 25, 85, '2019-11-23 17:43:32', '2019-11-23 17:43:35'),
(256, 'Intro', 1, 86, '2019-11-24 23:30:04', '2019-11-24 23:30:55'),
(257, 'Analysis', 3, 86, '2019-11-24 23:31:57', '2019-11-24 23:32:04'),
(258, 'Notations', 1, 87, '2019-11-25 00:07:10', '2019-11-25 00:13:58'),
(259, 'Intro', 1, 88, '2019-11-25 02:50:54', '2019-11-25 02:51:07'),
(260, 'Code', 3, 88, '2019-11-25 02:52:28', '2019-11-25 02:54:07'),
(261, 'Intro', 1, 89, '2019-11-25 06:03:01', '2019-11-25 06:03:15'),
(262, 'Code', 3, 89, '2019-11-25 06:03:43', '2019-11-25 06:03:47'),
(263, 'Analysis', 3, 87, '2019-11-30 18:39:06', '2019-11-30 18:39:12'),
(264, 'Intro', 1, 90, '2019-12-07 04:09:35', '2019-12-07 04:09:54'),
(265, 'Handle Exceptions', 3, 90, '2019-12-07 04:23:48', '2019-12-07 04:23:56'),
(266, 'PHP Built In Exceptions ', 5, 90, '2019-12-07 04:32:07', '2019-12-07 04:32:17'),
(267, 'Other Erros', 7, 90, '2019-12-07 04:54:45', '2019-12-07 04:55:01'),
(268, 'Set_error_handler', 9, 90, '2019-12-07 05:05:04', '2019-12-07 05:05:27'),
(269, 'Error_Reporting', 11, 90, '2019-12-07 05:12:42', '2019-12-07 05:12:49'),
(270, 'Error_log', 13, 90, '2019-12-07 05:18:58', '2019-12-07 05:19:14'),
(272, 'Example', 3, 91, '2019-12-17 03:48:11', '2019-12-17 03:48:25'),
(273, 'Intro', 1, 92, '2019-12-20 19:21:07', '2019-12-20 19:21:37'),
(274, 'Example', 3, 92, '2019-12-20 19:24:40', '2019-12-20 19:24:45'),
(275, 'Fopen Options', 5, 92, '2019-12-20 20:16:38', '2019-12-20 20:16:49'),
(277, 'Example', 3, 93, '2019-12-30 18:38:53', '2019-12-30 18:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_08_100000_create_telescope_entries_table', 1),
(4, '2019_04_19_120056_create_categories_table', 1),
(5, '2019_04_19_124537_create_panels_table', 1),
(6, '2019_04_19_124539_create_code_languages_table', 1),
(7, '2019_04_19_130007_create_headers_table', 1),
(8, '2019_04_19_130030_create_contents_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `panels`
--

CREATE TABLE `panels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `panels`
--

INSERT INTO `panels` (`id`, `name`, `order`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 'Events', 4, 1, '2019-04-30 17:53:44', '2019-04-30 22:13:20'),
(6, 'Enum columns', 3, 2, '2019-04-30 17:53:45', '2019-05-02 11:15:21'),
(7, 'Funcions', 2, 2, '2019-04-30 17:53:45', '2019-05-02 11:15:45'),
(8, 'Conditions', 4, 2, '2019-04-30 17:53:45', '2019-05-02 11:14:55'),
(9, 'Queries on structure', 0, 2, '2019-04-30 17:53:45', '2019-05-02 11:39:38'),
(11, 'Permutations', 0, 3, '2019-04-30 17:53:45', '2019-05-01 21:09:22'),
(12, 'Combinations', 1, 3, '2019-04-30 17:53:45', '2019-05-01 21:09:28'),
(13, 'Series', 2, 3, '2019-04-30 17:53:45', '2019-05-04 10:53:11'),
(14, 'Series 2', 3, 3, '2019-04-30 17:53:45', '2019-05-04 20:58:42'),
(16, 'Aliases', 3, 4, '2019-04-30 17:53:45', '2019-05-06 19:33:19'),
(17, 'Service Providers', 2, 4, '2019-04-30 17:53:45', '2019-05-06 19:33:19'),
(18, 'Contracts', 4, 4, '2019-04-30 17:53:45', '2019-05-03 13:08:20'),
(19, 'Facades', 5, 4, '2019-04-30 17:53:45', '2019-05-03 13:08:20'),
(20, 'Requests LifeCycle', 6, 4, '2019-04-30 17:53:46', '2019-05-03 13:08:20'),
(21, 'Adapter <Structural pattern>', 0, 5, '2019-04-30 17:53:46', '2019-12-17 03:23:23'),
(22, 'Decorator', 1, 5, '2019-04-30 17:53:46', '2019-05-03 17:52:33'),
(23, 'Factory <Creational Pattern>', 2, 5, '2019-04-30 17:53:46', '2019-12-16 20:57:34'),
(24, 'Solid Principles', 3, 5, '2019-04-30 17:53:46', '2019-11-08 08:55:55'),
(29, 'Data Binding', 2, 1, '2019-04-30 18:55:59', '2019-04-30 21:21:35'),
(31, 'Initializing Vue', 1, 1, '2019-04-30 19:54:51', '2019-05-05 12:42:32'),
(32, 'Summary', 0, 1, '2019-04-30 19:56:07', '2019-05-06 19:32:41'),
(34, 'Two ways DataBinding', 3, 1, '2019-04-30 21:45:25', '2019-04-30 22:13:20'),
(35, 'Event Modifier', 5, 1, '2019-04-30 21:51:27', '2019-04-30 22:13:20'),
(36, 'Crud on rows', 1, 2, '2019-05-02 11:12:00', '2019-05-02 11:15:51'),
(37, 'Limits', 5, 2, '2019-05-02 11:18:19', '2019-05-02 11:18:28'),
(38, 'Like keyword', 7, 2, '2019-05-02 11:27:04', '2019-05-02 11:39:39'),
(39, 'Union', 6, 2, '2019-05-02 11:30:30', '2019-05-02 11:39:39'),
(40, 'Group_Concat', 9, 2, '2019-05-02 11:34:55', '2019-05-02 11:45:41'),
(41, 'Concat', 8, 2, '2019-05-02 11:40:14', '2019-05-02 11:45:41'),
(42, 'Group_by', 10, 2, '2019-05-02 11:47:05', '2019-05-02 11:47:15'),
(43, 'Service Container', 0, 4, '2019-05-02 19:08:11', '2019-05-03 13:07:37'),
(53, 'Auto Resolving models', 1, 4, '2019-05-03 12:44:41', '2019-05-03 13:08:27'),
(54, 'Builders', 7, 4, '2019-05-03 17:57:54', '2019-05-11 19:02:12'),
(55, 'Builders 2', 8, 4, '2019-05-03 18:18:59', '2019-05-11 19:02:12'),
(56, 'Builders 3', 9, 4, '2019-05-03 18:37:42', '2019-05-03 18:38:05'),
(57, 'Recursion', 0, 6, '2019-05-04 10:08:43', '2019-05-04 10:14:18'),
(58, 'Notes', 0, 7, '2019-05-04 21:56:51', '2019-05-04 21:56:58'),
(59, 'Recursion 2', 1, 6, '2019-05-05 09:04:32', '2019-05-05 09:12:40'),
(64, 'Class', 1, 7, '2019-11-06 18:06:33', '2019-11-06 18:06:41'),
(65, 'class 2', 2, 7, '2019-11-06 19:26:43', '2019-11-06 19:26:59'),
(68, 'Sending Emails', 3, 7, '2019-11-07 10:05:48', '2019-11-07 10:52:49'),
(69, 'working with arrays', 4, 7, '2019-11-09 12:59:46', '2019-11-09 12:59:55'),
(70, 'EcmaScript 6', 0, 8, '2019-11-16 16:37:20', '2019-11-16 16:39:09'),
(71, 'Sass Variables', 0, 9, '2019-11-19 17:39:37', '2019-11-19 19:29:50'),
(72, 'Interpolation and loading', 1, 9, '2019-11-19 18:53:58', '2019-11-20 01:49:56'),
(73, '@use', 2, 9, '2019-11-19 19:11:29', '2019-11-19 19:29:29'),
(74, '@forward', 3, 9, '2019-11-20 00:07:19', '2019-11-20 02:00:35'),
(75, '@import', 4, 9, '2019-11-20 02:13:40', '2019-11-20 02:13:45'),
(76, '@mixin and @include', 5, 9, '2019-11-20 02:32:39', '2019-11-20 02:32:51'),
(77, '@function', 6, 9, '2019-11-20 02:42:23', '2019-11-20 02:42:36'),
(78, 'HTML', 0, 10, '2019-11-20 15:29:00', '2019-11-23 16:45:50'),
(79, 'Css', 1, 10, '2019-11-20 17:38:00', '2019-11-20 17:38:06'),
(80, 'css notes', 2, 10, '2019-11-20 18:57:56', '2019-11-20 18:58:07'),
(81, 'Important Properties', 3, 10, '2019-11-20 20:05:24', '2019-11-20 20:05:39'),
(82, 'techniques to load icons', 4, 10, '2019-11-20 20:40:27', '2019-11-20 20:40:45'),
(83, 'Important properties 2', 5, 10, '2019-11-21 02:11:14', '2019-11-21 02:12:12'),
(84, 'NodeJs', 6, 10, '2019-11-21 23:02:45', '2019-11-21 23:02:52'),
(85, 'Interview Questions', 1, 8, '2019-11-23 16:58:59', '2019-11-23 16:59:32'),
(86, 'Divide and conquer paradim', 2, 6, '2019-11-24 23:30:04', '2019-11-24 23:30:15'),
(87, 'ASYMPTOTIC ANALYSIS ', 3, 6, '2019-11-25 00:07:10', '2019-11-25 00:09:44'),
(88, 'Merge Sort', 4, 6, '2019-11-25 02:50:54', '2019-11-25 02:51:03'),
(89, 'Inversions', 5, 6, '2019-11-25 06:03:01', '2019-11-25 06:03:10'),
(90, 'Exceptions', 5, 7, '2019-12-07 04:09:35', '2019-12-07 04:09:44'),
(91, 'Facade <Structural Pattern>', 4, 5, '2019-12-17 03:43:34', '2019-12-17 03:43:54'),
(92, 'Streams', 6, 7, '2019-12-20 19:21:07', '2019-12-20 19:21:13'),
(93, 'Null object Design Pattern', 5, 5, '2019-12-30 18:34:45', '2019-12-30 18:35:05'),
(94, 'Closures', 7, 7, '2020-01-04 20:25:32', '2020-01-04 20:25:37'),
(95, 'Reflection Api', 8, 7, '2020-01-04 21:38:30', '2020-01-04 21:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '2019-04-30 17:53:43', '$2y$10$ba1QlhcFOeT/MbUjxKk1WuvdDnFQzMp/ekY6NiZuTkrgqhiBPkZRu', '531d618f4464fec3e22b4409b679a758d11b656c714eeda7aa8a1e9fbf5a494f', 'cpJ2UlaGbONCRlNKrzTonpDrsWjJVlmvhyOpWaWY6AeiWoYTODfoudhBdrSZ', '2019-04-30 17:53:43', '2020-01-05 18:29:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code_languages`
--
ALTER TABLE `code_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_panel_id_foreign` (`panel_id`),
  ADD KEY `contents_code_language_id_foreign` (`code_language_id`);

--
-- Indexes for table `headers`
--
ALTER TABLE `headers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `headers_panel_id_foreign` (`panel_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panels`
--
ALTER TABLE `panels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `panels_category_id_foreign` (`category_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `code_languages`
--
ALTER TABLE `code_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `headers`
--
ALTER TABLE `headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `panels`
--
ALTER TABLE `panels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_code_language_id_foreign` FOREIGN KEY (`code_language_id`) REFERENCES `code_languages` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `contents_panel_id_foreign` FOREIGN KEY (`panel_id`) REFERENCES `panels` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `headers`
--
ALTER TABLE `headers`
  ADD CONSTRAINT `headers_panel_id_foreign` FOREIGN KEY (`panel_id`) REFERENCES `panels` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `panels`
--
ALTER TABLE `panels`
  ADD CONSTRAINT `panels_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
