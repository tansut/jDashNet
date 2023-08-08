rmdir release\jdash /s /q
call lessc .\jdash\resources\themes\flat\main.less > .\jdash\resources\themes\flat\main.css
call lessc .\jdash\resources\themes\default\main.less > .\jdash\resources\themes\default\main.css
cd util\buildscripts
echo "BUILD START"
call build.bat --profile ..\..\profiles\jdash.profile.js
echo "BUILD FINISH"
copy ..\..\release\jdash\jdash.js ..\..\..\..\JDash.WebForms\resources\jdash_debug.js /y
xcopy ..\..\release\jdash\resources ..\..\..\..\JDash.WebForms\resources\ /y /e
xcopy ..\..\release\jdash\nls ..\..\..\..\JDash.WebForms\resources\nls /y /e
cd..
cd..
pause