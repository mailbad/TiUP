<?php
//$ret = exec("/tiup/topdf/wkhtmltox/bin/wkhtmltopdf http://bjtiup.tiup.cn/servcenter/Info/Print/doc/param/nI6EF4jwxy9%2Bbtks7U16aPKGTVbHVcwCmd5EFbCmGI%2B%252Fx_15pZsOFgcUs_b%252FMXJBwbeMb7R%2BGyv%252FBXx%252FTZM-FRx0TD9tX /tiup/topdf/topdf/downloads/pdf/何一波_员工入职流程表_10.pdf");

$ret = exec("echo -en 'http://bjtiup.tiup.cn/servcenter/Info/Print/doc/param/sMu9U4hXTmQ0MQo2%3DQ90sX4C68FCU93xFr_9Ubl29iD5ndyHBk1wJamIRIF1roOw7p0Zr7_%252F9mZ5Uqnf7kofJ%2BnE6Wxhp /tiup/topdf/topdf/downloads/pdf/何一波_员工入职流程表_10.pdf'|sh /tiup/topdf/wkhtmltox/bin/htmltopdf");
