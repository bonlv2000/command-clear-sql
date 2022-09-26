WMIC PRODUCT Where "Caption like '%SQL%'" GET Caption, IdentifyingNumber


msiexec /x {SOME_GUID}

---------------------------------------------------------------------------
SQL Server Components Clean Up script
With high probability removal of some of the components with the command shown above may fail and it that case you will need to remove them directly from registry looking for GUID value under the following keys:

HKEY_CLASSES_ROOT\Installer\Products\
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products
P.S. There is a blog post on sqlauthority.com which describes dealing with the same issue and helped me to resolve mine.
