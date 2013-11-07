# How to use

+ `$ bundle install`
+ `$ EDITOR config/application.yml`
+ `$ rake db:migrate`
+ `$ rake db:seed` # this take a long time
+ `$ rails s`
+ `open http://localhost:3000/ in your browser.`

# config/application.yml

Write your MySQL settings in config/application.yml

```
development:
  DB_NAME: dbname
  DB_USER: dbuser
  DB_PASSWORD: dbpassword
```

