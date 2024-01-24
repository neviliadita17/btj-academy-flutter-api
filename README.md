# Description
Flutter Project GetX Architecture (GetCLI) integration with API.

In this project, we will embark on an exciting challenge of integrating GET and POST API functionalities using the GetX Architecture with GetCLI. The primary focus of the project revolves around developing two key pages – the home page, responsible for displaying data from the endpoint, and the detail page, dedicated to presenting detailed information about the selected data from the home page.

# Get CLI
  The package has the following executables:
  
    $get
    $getx

1. How to make a project

       getx create project

2. Create detail page

       getx create page:detail

3. Generate model using API endpoint
   
   Note: the URL must return a json format: https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json
   
       getx generate model from "[https://api.github.com/users/CpdnCristiano](https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json)https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json"


# Add Internet Permission
Add this internet permission in your **AndroidManifest.xml**

    <uses-permission android:name="android.permission.INTERNET" />




