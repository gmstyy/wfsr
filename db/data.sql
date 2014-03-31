--------------------------------------------------------
--  文件已创建 - 星期一-三月-31-2014   
--------------------------------------------------------
REM INSERTING into "menu"
SET DEFINE OFF;
Insert into "menu" ("id","parent_id","menu_level","name","url","sort_no","image_path") values (1,0,1,'首页','/index',1,null);
Insert into "menu" ("id","parent_id","menu_level","name","url","sort_no","image_path") values (2,0,1,'菜品','/foodlist',2,null);
Insert into "menu" ("id","parent_id","menu_level","name","url","sort_no","image_path") values (3,0,1,'关于我们','/aboutUs',3,null);
Insert into "menu" ("id","parent_id","menu_level","name","url","sort_no","image_path") values (4,0,1,'诚聘英才','/joinUs',4,null);
