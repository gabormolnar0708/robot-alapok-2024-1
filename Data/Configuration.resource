*** Variables ***
${ENVIRONMENT}=    TEST
&{URLs} =    TEST=https://petstore.octoperf.com/actions/Catalog.action    DEV=localhost
${URL}=    ${URLs}[${ENVIRONMENT}]
${BROWSER}=    firefox