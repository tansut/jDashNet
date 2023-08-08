rmdir release-wf\jdash /s /q
call lessc .\jdash\resources\themes\flat\main.less > .\jdash\resources\themes\flat\main.css
call lessc .\jdash\resources\themes\default\main.less > .\jdash\resources\themes\default\main.css
copy ..\..\JDash.WebForms.Demo\jdash\wf\wf-main.js jdash\wf /y
cd util\buildscripts
echo "BUILD START"
call build.bat --profile ..\..\profiles\jdash.profile.webforms.js
echo "BUILD FINISH"
copy ..\..\release-wf\jdash\jdash.js ..\..\..\..\JDash.WebForms\resources\jdash_debug.js /y
rem copy ..\..\release-wf\jdash\jdash.js ..\..\..\..\JDash.WebForms\resources\jdash_debug.js /y
xcopy ..\..\release-wf\jdash\resources ..\..\..\..\JDash.WebForms\resources\ /y /e
xcopy ..\..\release-wf\jdash\nls ..\..\..\..\JDash.WebForms\resources\nls /y /e

pause