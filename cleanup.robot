*** Settings ***
Library           SeleniumLibrary
Resource          helper.robot
Library           Collections

*** Variables ***
${server}         10.84.221.161





*** Test Cases ***
delete_systems
    Login To Page    systems/Overview.do
    @{href_elements}    Get Href List Of WebElements    //td[@class=' sortedCol']/a
    FOR    ${href}    IN    @{href_elements}
        go to    ${href}
        Delete System
    END

delete_activation_keys
    Login To Page    activationkeys/List.do
    @{href_elements}    Get Href List Of WebElements    //tr[contains(@class, 'list-row')]/td[2]/a
    FOR    ${href}    IN    @{href_elements}
        go to    ${href}
        Delete ActivationKey
    END

delete_content_cycles_projects
    Login To Page    manager/contentmanagement/projects
    @{href_elements}    Get Href List Of WebElements    //tr[contains(@class, 'list-row')]/td[1]/a
    FOR    ${href}    IN    @{href_elements}
        go to    ${href}
        Delete ContentLifeCyclesProjects
    END

delete_channels
    Login To Page    channels/manage/Manage.do
    @{href_elements}    Get Href List Of WebElements    //tr[contains(@class, 'list-row')]/td[1]/a
    FOR    ${href}    IN    @{href_elements}
        go to    ${href}
        Delete Channels
    END

delete_repositories
    Login To Page    channels/manage/repos/RepoList.do
    @{href_elements}    Get Href List Of WebElements    //tr[contains(@class, 'list-row')]/td[1]/a
    FOR    ${href}    IN    @{href_elements}
        go to    ${href}
        Delete Repositories
    END
