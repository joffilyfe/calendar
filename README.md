# Calendar

This is your next calendar, forget google agenda or similar.
This is a part of test about how create tests and APIs.

## How to Install
Before install this project, please, look if you have installed Ruby 2.3+ and bundle gem mananger.

Firstly you need to clone this project
```bash
git clone https://github.com/joffilyfe/calendar
```

After cloning, enter in folder and install all dependencies:
```bash
cd calendar
bundle install
```

In development mode we are using sqlite3 but you can change it if you prefer. Now you need to run our migrations.
```bash
rake db:migrate
```

Now you can run this project in development mode, just run rails:
```bash
rails server
```

Access http://localhost:3000

###Note
If you deploy this project in production environment you will need setup some variables:
```bash
export DEVISE_KEY=somethingsecret
export DEVISE_KEY=SECRET_KEY_BASE
```

that it, thank you!
