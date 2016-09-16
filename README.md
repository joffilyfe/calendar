# Calendar

This is your next calendar, forget google agenda or similar.
This is a part of test about how create tests and APIs.

## Demo
You can see a demon in this link [http://gcalendar.herokuapp.com](http://gcalendar.herokuapp.com)

**Admin view:**
login: admin@admin.com, password: password

**User view:**
login: user@user.com, password: password

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

In development mode we are using sqlite3 but you can change it if you prefer. Now you need to run our migrations and seed your database with same data of demon (users).
```bash
rake db:migrate
rake db:seed
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
