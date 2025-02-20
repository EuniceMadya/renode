*** Settings ***
Suite Setup                   Setup
Suite Teardown                Teardown
Test Setup                    Reset Emulation
Test Teardown                 Test Teardown
Resource                      ${RENODEKEYWORDS}


*** Keywords ***
Create Machine
    Execute Command          mach create
    Execute Command          machine LoadPlatformDescription @platforms/cpus/miv.repl


*** Test Cases ***
Should Open Host UART Terminal
    [Tags]                   skip_windows
    ${pty_link}=             Allocate Temporary File
    Create Machine
    # We need forceCreate because Allocate Temporary File creates a file which our
    # symlink needs to overwrite.
    Execute Command          emulation CreateUartPtyTerminal "tmp" "${pty_link}" true

