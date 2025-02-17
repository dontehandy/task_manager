# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 

* System dependencies - 

* Configuration - 

* Database creation - 

* Database initialization - 

* How to run the test suite - 

* Services (job queues, cache servers, search engines, etc.) - 

* Deployment instructions -

* ...


CRUD Operations and RESTful Rails

CRUD stands for Create, Read, Update, and Delete. These are the four basic operations performed on persistent data.  A RESTful Rails application maps these operations to specific HTTP verbs and URLs, following conventions to create a consistent and predictable API. In your example:

Create: Handled by the new (displays the form) and create (saves the data) actions. A POST request to /tasks typically triggers the create action.
Read: Handled by the index (displays a list) and show (displays a specific item) actions. A GET request to /tasks triggers the index action, and a GET request to /tasks/1 (where 1 is the task's ID) triggers the show action.
Update: Handled by the edit (displays the form for editing) and update (saves the changes) actions. A GET request to /tasks/1/edit triggers the edit action, and a PATCH or PUT request to /tasks/1 triggers the update action.
Delete: Handled by the destroy action. A DELETE request to /tasks/1 triggers the destroy action.
MVC Architecture

Rails follows the Model-View-Controller (MVC) architectural pattern:

Model: Represents your data and business logic. It interacts with the database. In your case, the Task model.
View: Responsible for displaying the user interface. These are typically HTML templates.
Controller: Acts as an intermediary between the Model and the View. It receives requests, interacts with the Model to fetch or manipulate data, and then selects the appropriate View to render.
Creating a /tasks Route

To handle a GET request to /tasks in a Rails application with a Task model, you'd need to modify (or create if they don't exist) these files:

app/controllers/tasks_controller.rb: This is where you define the index action (and any other actions for tasks).  This action will likely fetch all tasks from the database using the Task model and make them available to the view.

app/views/tasks/index.html.erb (or other template format): This view file will use the data provided by the controller to display a list of tasks.

config/routes.rb: You'll need to define a route that maps the /tasks URL to the index action of your TasksController.  A common way to do this is with resources :tasks.

params Explained

params is a hash (like a dictionary) that contains the data sent to your Rails application in a request.  They typically come from:

Forms: When a user submits a form, the data entered is sent as parameters.
URLs: Parameters can be included in the URL itself (e.g., /tasks?search=keyword).
AJAX requests: AJAX calls can also send data as parameters.
Two Routes for Create/Edit

You need two routes for creating and editing because they serve different purposes:

new (GET /tasks/new): This route is for displaying the form where the user can enter the data for a new task. It doesn't actually create anything yet.
create (POST /tasks): This route is for processing the data submitted from the new form and creating the new task in the database.
Similarly:

edit (GET /tasks/1/edit): This route displays the form pre-filled with the data of an existing task (identified by its ID, e.g., 1) so the user can edit it.
update (PATCH/PUT /tasks/1): This route processes the edited data submitted from the edit form and updates the existing task in the database. The PATCH or PUT HTTP method is used to indicate an update.