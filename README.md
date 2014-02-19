# Lightning Talks!

This is a project I use to demo different concepts/technologies. Each day, I'll push up everything I showed you live during the demo so you can use it as a reference.

### Demos

1. Heroku (w8d1, Mon 2/17)
  * config/application.rb - `config.assets.initialize_on_precompile`
2. [Figaro][figaro] and [Paperclip][paperclip] (w8d2, Tue 2/18)
  * Look at config/application.rb
  * Look at app/models/user.rb (`has_attached_file :avatar`)
3. [Omniauth][omniauth] / [Omniauth Facebook][omniauth-fb] (w8d3, Wed 2/19)
  * Look at config/initializers/omniauth.rb
  * Link users to '/auth/facebook' (relative path)
  * config/routes.rb - `get 'auth/facebook/callback'`
  * In your callback action (`SessionsController#create` here), you have access to the data the omniauth provider (Facebook) sent back in the controller through `request.env['omniauth.auth']`.
    * Do something with the `:provider` and the `:uid`. You should try to find a user based on that info, or create a new one, and log them in.


[figaro]:https://github.com/laserlemon/figaro
[paperclip]:https://github.com/thoughtbot/paperclip

[omniauth]:https://github.com/intridea/omniauth
[omniauth-fb]:https://github.com/mkdynamic/omniauth-facebook)
