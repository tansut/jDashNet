rmdir release\jdash /s /q
cd util\buildscripts
echo "BUILD START"
call build.bat --profile ..\..\profiles\jdash.profile.js
echo "BUILD FINISH"
rem copy ..\..\release\jdash\jdash.js ..\..\..\..\JDash.Mvc\resources\ /y
rem xcopy ..\..\release\jdash\nls ..\..\..\..\JDash.Mvc\resources\nls\ /y /e
rem xcopy ..\..\release\jdash\resources ..\..\..\..\JDash.Mvc\resources\ /y /e

pause