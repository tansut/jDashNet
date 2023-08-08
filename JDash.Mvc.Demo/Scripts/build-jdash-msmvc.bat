rmdir release-msmvc\jdash /s /q
call lessc .\jdash\resources\themes\flat\main.less > .\jdash\resources\themes\flat\main.css
call lessc .\jdash\resources\themes\default\main.less > .\jdash\resources\themes\default\main.css
copy ..\..\JDash.MvcDemo\jdash\mvc\ms.js jdash\mvc /y
cd util\buildscripts
echo "BUILD START"
call build.bat --profile ..\..\profiles\jdash.profile.msmvc.js
echo "BUILD FINISH"
copy ..\..\release-msmvc\jdash\jdash.js ..\..\..\..\JDash.Mvc\resources\jdash.js /y
xcopy ..\..\release-msmvc\jdash\resources ..\..\..\..\JDash.Mvc\resources\ /y /e
xcopy ..\..\release-msmvc\jdash\nls ..\..\..\..\JDash.Mvc\resources\nls\ /y /e

pause