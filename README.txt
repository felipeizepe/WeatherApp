#README

This project was made using the Swift Package Manager and divided into multiple modules to improve reuse and scalability 
The modules are

Request Commons - Module that uses Alamofire for que HTTP request with a basic Response structure that can be reused in other services. The modularization enables us to replace alamofire with another network core requester (like firebase or something else) 
without impacting the other modules, services or using

Weather Services - Layer responsible for the specific weather request, it defines the endpoint and paths, the Data Transfer Object that it will read from the API and adds an abstraction to model the back-end entities into objects that make sense and that the front-end uses
this is good because in case there is a change in value of the API or a complete API change we can perform the necessary modifications in this layer and it wont impact the UI layer 

Design System - Responsible for defining the common generic UI components across multiple apps (say for instance an specific button layout or specific view structure that a company or brand will always be using across its apps), in this case I only added a Color Pallet structure for
custom light and dark modes to show a usage example

FaireWeather - Main App that has the views and view models, given more time and a bigger project I would probably split it in two other modules, one for common UI usage (elements of UI that can appear in multiple apps but are not a common structure) and a ViewModel Module that would
be responsible for dealing with data elements and nothing of UI (so that we may be able to use something like KMP if we want)
There is a Localization support in some elements the search view but due to time constraints not all elements have that, since the idea was t give an example and show knowledge I didn't feel the need to put localization in every single elements
There are custom error Entities the can help with error handling like NetworkError and UIError (naming things is hard), given more time I would create a generic error protocol that both Error classes extend and probably give it custom error messages with Localizations

Give more time I would also change the weathers images from local resources to API requests to download the image data 

#HOW TO RUN

The project can be run at the FaireWeather folder in the pbx normally, I did setup switlint in the build phase so it might be required to run

brew install swiftlint

or remove the linting step from the project build phase 

other than that the project can be run on the simulator or live view on Xcode

#Third party libraries

Alamofire - For the HTTP requests
Quick/Nimble - For organizing and making the Unit Testing process easier

#Other info
