# _Volunteer Tracker_

#### _An application for managing projects and volunteers, 05/22/2020_

#### By _**Zinfira Safargalieva**_

## Description

_This application tracks projects and volunteers working on them. Each volunteer will belong to only one project (one project, many volunteers)._

## Specification
| Specs | Example Input | Example Output |
|-------|---------------|----------------|
| As a volunteer, user is able to see list of available projects | On home page click 'I am a volunteer' | 'List of available projects: ' |
| As a manager, user is able to add a new project | Enter the title of new project to the input form 'Teaching Kids to Code' and click to 'Add a new project' button | "List of available projects: 'Teaching Kids to Code'"|
| As a manager, user is able to update the project | Enter "Helping in the hospital" and click 'Update Project' button | "List of available projects: 'Helping in the hospital'" |
| As a manager, user is able to delete the project | Click 'Delete Project' button | "List of available projects: ' _No projects yet._'" |
| As a manager, user is able to see a list of all volunteers | Click to the link in projects | "List of volunteers: Zinfira" |
| As a manager, user is able to add volunteers for the created project | Click 'Add a new Volunteer', enter the name of volunteer and submit | List of Volunteers for "Teaching Kids to Code" project: __Zinfira__ |
| As a manager, user is able to see volunteers for the project | Click to the project | List of Volunteers for "Teaching Kids to Code" project: __Zinfira__ |
| As a manager user is able to update volunteers | Enter "Nik" and click 'Update Volunteer' button | List of Volunteers for "Teaching Kids to Code" project: __Nik__ |
| As a manager user is able to delete volunteers | Click 'Delete Volunteer' button | List of Volunteers for "Teaching Kids to Code" project: _There are no volunteers yet._|


## Setup/Installation Requirements

Clone this repository via Terminal using the following commands:

* >$ cd Desktop
* >$ git clone https://github.com/Zinfira/volunteer_tracker.git
* >cd volunteer_tracker

Next, confirm that you navigated to the Anagrams_and_Antigrams project directory by entering ```pwd``` in Terminal.
Then, run at the project's root directory via Terminal the following commands:
* >$ gem install bundler
* >$ bundle install
* >$ ruby app.rb


## Known Bugs

_Not known bugs at this time._


## Support and contact details

_If you have any issues with the program or you have any suggestions, email me <zsafargalieva@gmail.com>_


## Technologies Used

_Ruby, Sinatra, Capybara, Postgres_


### License

*Licensed under [MIT](https://en.wikipedia.org/wiki/MIT_License) license*

Copyright (c) 2020 **_Zinfira Safargalieva_**