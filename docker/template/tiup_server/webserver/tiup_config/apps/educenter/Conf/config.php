<?php

return array(

    'SEND_INFO' => 'no_send',
    'REST_DEFAULT_TYPE' => 'json',
//    'URL' => 'http://10.21.1.41:8000/',  //底层api的地址
    'URL' => 'http://edu-data:8000/',  //底层api的地址
//    'FILE_STORAGE_URL' => 'http://10.21.1.41:80/', //前端上传文件的地址
//    'FILE_STORAGE_URL' => 'http://edu-storage.demo.tiup.ren:80/', //前端上传文件的地址
    'FILE_STORAGE_URL' => 'https://edu-storage.demo.tiup.ren/', //前端上传文件的地址
//    'VIDEO_STORAGE_URL' => 'https://222.29.240.237/',  //前端上传视频的地址
    'VIDEO_STORAGE_URL' => 'https://edu-mp4.demo.tiup.ren/',  //前端上传视频的地址
    'ADMIN' => '管理员',
    'SEND_WECHATMSG_URL' => 'http://222.29.240.19/getmsg.php', //微信服务器地址
    'URL_HTML_SUFFIX' => '.html',
    'LAYOUT_ON' => true,
    'LAYOUT_NAME' => '../../home/Tpl/bootstrap-responsive-layout',
    'PORT' => 80,
    'URL_ROUTER_ON'   => true, //开启路由
    'URL_ROUTE_RULES' => array( //定义路由规则
        
        array('api/centersfuncs', 'Centersfuncs/postCentersFuncs', '', 'post'),
        array('api/centersfuncs', 'Centersfuncs/getCentersFuncs', '', 'get'),
        array('api/centersfuncs', 'Centersfuncs/updateCentersFuncs', '', 'patch'),

        array('api/classes/:cid/topics', 'Topic/getTopics', '', 'get'),
        array('api/classes/:cid/topics', 'Topic/addTopics', '', 'post'),

        array('api/classes/:cid/videos', 'Video/getVideos', '', 'get'),
        array('api/classes/:cid/videos', 'Video/updateVideos', '', 'patch'),
        array('api/classes/:cid/videos', 'Video/addVideos', '', 'post'),
      
        array('api/classes/:cid/entries', 'Entry/withClasses', '', 'post'),
        array('api/classes/:cid/entries', 'Entry/withClasses', '', 'get'),
        array('api/classes/:cid/entries', 'Entry/withClasses', '', 'delete'),
        array('api/classes/:cid/entries', 'Entry/withClasses', '', 'patch'),
        array('api/classes/:cid/entries', 'Entry/withClasses', '', 'put'),

        array('api/chapters/:cid/entries', 'Entry/withChapters', '', 'get'),
        array('api/chapters/:cid/entries', 'Entry/withChapters', '', 'post'),
        array('api/chapters/:cid/entries', 'Entry/withChapters', '', 'delete'),
        array('api/chapters/:cid/entries', 'Entry/withChapters', '', 'patch'),
        array('api/chapters/:cid/entries', 'Entry/withChapters', '', 'put'),

        array('api/comments/:cid/entries', 'Entry/withComments', '', 'get'),
        array('api/comments/:cid/entries', 'Entry/withComments', '', 'post'),
        array('api/comments/:cid/entries', 'Entry/withComments', '', 'patch'),
        array('api/comments/:cid/entries', 'Entry/withComments', '', 'delete'),
        array('api/comments/:cid/entries', 'Entry/withComments', '', 'put'),

        array('api/topics/:tid/entries', 'Entry/withTopics', '', 'get'),
        array('api/topics/:tid/entries', 'Entry/withTopics', '', 'post'),
        array('api/topics/:tid/entries', 'Entry/withTopics', '', 'patch'),
        array('api/topics/:tid/entries', 'Entry/withTopics', '', 'delete'),
        array('api/topics/:tid/entries', 'Entry/withTopics', '', 'put'),

        array('api/timepoints/:tid/entries', 'Entry/withTimepoints', '', 'get'),  
        array('api/timepoints/:tid/entries', 'Entry/withTimepoints', '', 'post'),  
        array('api/timepoints/:tid/entries', 'Entry/withTimepoints', '', 'patch'),  
        array('api/timepoints/:tid/entries', 'Entry/withTimepoints', '', 'delete'),  
        array('api/timepoints/:tid/entries', 'Entry/withTimepoints', '', 'put'),  

        array('api/homeworks/:hid/entries', 'Entry/withHomeworks', '', 'get'),
        array('api/homeworks/:hid/entries', 'Entry/withHomeworks', '', 'post'),
        array('api/homeworks/:hid/entries', 'Entry/withHomeworks', '', 'patch'),
        array('api/homeworks/:hid/entries', 'Entry/withHomeworks', '', 'delete'),
        array('api/homeworks/:hid/entries', 'Entry/withHomeworks', '', 'put'),

        array('api/courses/:cid/classes', 'Class/getClasses', '', 'get'),
        array('api/courses/:cid/classes', 'Class/addClasses', '', 'post'),

        array('api/classes/:cid/handouts', 'Handout/getHandouts', '', 'get'),
        array('api/classes/:cid/handouts', 'Handout/updateHandouts', '', 'patch'),
        array('api/videos/:vid/handouts', 'Handout/getHandouts', '', 'get'),
        array('api/videos/:vid/handouts', 'Handout/updateHandouts', '', 'patch'),
        array('api/videos/:vid/handouts', 'Handout/addHandouts', '', 'post'),
        array('api/videos/:vid/handouts', 'Handout/deleteHandouts', '', 'delete'),
        array('api/handouts/:hid', 'Handout/getHandouts', '', 'get'),
        array('api/handouts/:hid', 'Handout/updateHandouts', '', 'update'),
        array('api/handouts/:hid', 'Handout/deleteHandouts', '', 'delete'),

        array('api/users/:uid/classes/:cid', 'Class/updateClassUsers', '', 'put'),
        array('api/users/:uid/classes/:cid', 'Class/deleteClassUsers', '', 'delete'),

        array('api/classes/:cid/videos', 'Video/getVideos', '', 'get'),
        array('api/classes/:cid/videos', 'Video/updateVideos', '', 'patch'),
        array('api/classes/:cid/videos', 'Video/addVideos', '', 'post'),

        array('api/videos/:vid/topics', 'Topic/addTopicsByVideo', '', 'post'),
        array('api/videos/:vid/topics', 'Topic/getTopicsByVideo', '', 'get'),
        
        array('api/homeworks/:hid/timepoints', 'Timepoint/addTimepoints', '', 'post'),
        array('api/homeworks/:hid/timepoints', 'Timepoint/getTimepoints', '', 'get'),
        array('api/timepoints/:tid', 'Timepoint/getTimepoints', '', 'get'),
        array('api/timepoints/:tid', 'Timepoint/updateTimepoints', '', 'patch'),
        array('api/timepoints/:tid', 'Timepoint/deleteTimepoints', '', 'delete'),

        array('api/users/:uid/courses','Course/getManagedCourses','','get'),

        array('api/mappers/:mid', 'Mapper/updateMappers', '', 'patch'),
        array('api/mappers/:mid', 'Mapper/deleteMappers', '', 'delete'),
		array('api/mappers/:mid', 'Mapper/getMappersById', '', 'get'),
		array('api/mappers', 'Mapper/getMappers', '', 'get'),
		array('api/mappers', 'Mapper/addMappers', '', 'post'),

        array('api/configs', 'Config/getConfigs', '', 'get'),
        array('api/configs', 'Config/updateConfigs', '', 'patch'),
        array('api/configs', 'Config/addConfigs', '', 'post'),

        array('api/classes/:cid/chapters', 'Chapter/getChaptersByClass', '', 'get'),
        array('api/classes/:cid/chapters', 'Chapter/addChapters', '', 'post'),   
        array('api/chapters/:id', 'Chapter/getChapters', '', 'get'),
        array('api/chapters/:id', 'Chapter/updateChapters', '', 'patch'),
        array('api/chapters/:id', 'Chapter/deleteChapters', '', 'delete'),

        array('api/classes/:cid/choices', 'Choice/getChoicesByClass', '', 'get'),
        array('api/classes/:cid/choices', 'Choice/addChoicesByClass', '', 'post'),
        array('api/videos/:vid/choices', 'Choice/getChoicesByVideo', '', 'get'),
        array('api/videos/:vid/choices', 'Choice/addChoicesByVideo', '', 'post'),
        array('api/choices/:cid', 'Choice/getChoices', '', 'get'),
        array('api/choices/:cid', 'Choice/updateChoices', '', 'patch'),
        array('api/choices/:cid', 'Choice/deleteChoices', '', 'delete'),

        array('api/topics/:tid/comments', 'Comment/getCommentsByTopic', '', 'get'),
        array('api/topics/:tid/comments', 'Comment/addCommentsByTopic', '', 'post'),
        array('api/comments/:cid', 'Comment/getComments', '', 'get'),
        array('api/comments/:cid', 'Comment/updateComments', '', 'patch'),
        array('api/comments/:cid', 'Comment/deleteComments', '', 'delete'),

        array('api/homeworks/:hid', 'Homework/getHomeworks', '', 'get'),
        array('api/homeworks/:hid', 'Homework/updateHomeworks', '', 'patch'),
        array('api/homeworks/:hid', 'Homework/deleteHomeworks', '', 'delete'),  
        array('api/classes/:cid/homeworks', 'Homework/getHomeworksByClass', '', 'get'),
        array('api/classes/:cid/homeworks', 'Homework/addHomeworksByClass', '', 'post'),  

        array('api/courses/:cid/roles/:rid', 'Role/deleteRolesByCourses', '', 'delete'),
        array('api/courses/:cid/roles/:rid', 'Role/updateRolesByCourses', '', 'put'),
        array('api/users/:uid/roles/:rid', 'Role/deleteRolesByUsers', '', 'delete'),
        array('api/users/:uid/roles/:rid', 'Role/updateRolesByUsers', '', 'put'),
        array('api/users/:uid/roles', 'Role/getRoles', '', 'get'),

        array('api/suggestions/:sid', 'Suggestion/getSuggestions', '', 'get'),
        array('api/suggestions/:sid', 'Suggestion/updateSuggestions', '', 'patch'),
        array('api/suggestions/:sid', 'Suggestion/deleteSuggestions', '', 'delete'),
        array('api/suggestions', 'Suggestion/getSuggestions', '', 'get'),
        array('api/suggestions', 'Suggestion/addSuggestions', '', 'post'),

        array('api/users/:uid/traces', 'Trace/getTraces', '', 'get'),
        array('api/users/:uid/traces', 'Trace/addTraces', '', 'post'),
        array('api/videos/:vid/traces', 'Trace/getTraces', '', 'get'),
        array('api/videos/:vid/traces', 'Trace/addTraces', '', 'post'),
        array('api/traces/:tid', 'Trace/getTraces', '', 'get'),
        array('api/traces/:tid', 'Trace/updateTraces', '', 'patch'),
        array('api/traces/:tid', 'Trace/deleteTraces', '', 'delete'),          

        array('api/usercustomizeds/:uid','UserCustomized/getUserCustomized', '', 'get'),
        array('api/usercustomizeds/:uid','UserCustomized/updateUserCustomized', '', 'patch'),
        array('api/usercustomizeds/:uid','UserCustomized/deleteUserCustomized', '', 'delete'),
        array('api/usercustomizeds','UserCustomized/getUserCustomized', '', 'get'),
        array('api/usercustomizeds','UserCustomized/addUserCustomized', '', 'post'),

        array('api/userecords/:uid', 'UseRecord/getUseRecords', '', 'get'),
        array('api/userecords/:uid', 'UseRecord/updateUseRecords', '', 'patch'),
        array('api/userecords/:uid', 'UseRecord/deleteUseRecords', '', 'delete'),
        array('api/userecords', 'UseRecord/getUseRecords', '', 'get'),
        array('api/userecords', 'UseRecord/addUseRecords', '', 'post'),     

        array('api/entries/:id', 'Entry/withId', '', 'get'),   
        array('api/entries/:id', 'Entry/withId', '', 'post'),   
        array('api/entries/:id', 'Entry/withId', '', 'delete'),   
        array('api/entries/:id', 'Entry/withId', '', 'get'),   
        array('api/entries/:id', 'Entry/withId', '', 'post'),   

        array('api/classes/:cid/users', 'User/getUsers', '', 'get'),
        array('api/users/:uid/classes', 'Class/getClasses', '', 'get'),

        array('api/videos/:vid', 'Video/getVideos', '', 'get'),
        array('api/videos/:vid', 'Video/updateVideos', '', 'patch'),
        array('api/videos/:vid', 'Video/deleteVideos', '', 'delete'),
        array('api/videos', 'Video/getVideos', '', 'get'),
        array('api/videos', 'Video/updateVideos', '', 'patch'),

        array('api/users/:uid', 'User/getUsers', '', 'get'),
        array('api/users/:uid', 'User/updateUsers', '', 'patch'), 

        array('api/classes/:cid', 'Class/getClasses', '', 'get'),
        array('api/classes/:cid', 'Class/updateClasses', '', 'patch'),
        array('api/classes/:cid', 'Class/deleteClasses', '', 'delete'),             
        
        array('api/topics/:tid', 'Topic/getTopics', '', 'get'),
        array('api/topics/:tid', 'Topic/updateTopics', '', 'patch'),
        array('api/topics/:tid', 'Topic/deleteTopics', '', 'delete'),   

        array('api/courses/:cid','Course/getCourses','','get'),
        array('api/courses/:cid','Course/updateCourses','','patch'),
        array('api/courses/:cid','Course/deleteCourses','','delete'),
        array('api/courses','Course/getCourses','','get'),
        array('api/courses','Course/addCourses','','post'),             

        array('api/roles/:rid', 'Role/deleteRolesById', '', 'delete'),
        array('api/roles/:rid', 'Role/updateRolesById', '', 'patch'),
        array('api/roles/:rid', 'Role/getRoles', '', 'get'),
        array('api/roles', 'Role/addRoles', '', 'post'),
        array('api/roles', 'Role/getRoles', '', 'get'),

        array('api/users', 'User/getUsers', '', 'get'),
        array('api/classes', 'Class/getClasses', '', 'get'),
        array('api/handouts', 'Handout/getHandouts', '', 'get'),
        array('api/handouts', 'Handout/updateHandouts', '', 'patch'),
    )
);

?>
