# Lightning Talks!

This is a project I use to demo different concepts/technologies. Each day, I'll push up everything I showed you live during the demo so you can use it as a reference.

### Demos

1. [**Heroku**][heroku] (w8d1, Mon 2/17)
  * config/application.rb - `config.assets.initialize_on_precompile = false`
2. [**Figaro**][figaro] and [**Paperclip**][paperclip] (w8d2, Tue 2/18)
  * Look at config/application.rb
  * Look at app/models/user.rb (`has_attached_file :avatar`)
3. [**Omniauth**][omniauth] / [**Omniauth Facebook**][omniauth-fb] (w8d3, Wed 2/19)
  * Look at config/initializers/omniauth.rb
  * Link users to '/auth/facebook' (relative path)
  * config/routes.rb - `get 'auth/facebook/callback'`
  * In your callback action (`SessionsController#create` here), you have access to the data the omniauth provider (Facebook) sent back in the controller through `request.env['omniauth.auth']`.
    * Do something with the **`:provider`** and the **`:uid`**. You should try to find a user based on that info, or create a new one, and log them in.
4. [**Kaminari**][kaminari] & [**`pg_search`**][pg_search] (w8d4, Thu 2/20)
  * For Kaminari, check out:
    * `UsersController#index` & users/index.html.erb (`<%= paginate @users %>`)
    * Kaminari's `#page()` is chainable with ActiveRelation methods.
    * Build your own pagination links:
      * Kaminari gives you `#current_page`, `#total_pages`, `#total_results`, and a few more. Just call `#methods` on the ActiveRelation and see the ones Kaminari gives you (they'll be the first ones).
  * `pg_search`, check out:
    * User.rb and Post.rb #=> `include PgSearch`
    * Single-model search: `pg_search_scope`
    * Multi-model: `multisearch`
      * Create polymorphic table that holds on to everything you need to seach against: `rails generate pg_search:migration:multisearch`
      * `multisearchable against: [:column1, :and_another_column]` in models
      * `PgSearch.multisearch('Tommy')` #=> Returns an AR::Relation of PgSearch::Documents (the polymorphic table),
        * To get the actual model (User or Post) the PgSearch::Document references, call `#searchable` on it, ie: `@results.map(&:searchable)`.
        * Be careful if you're paginating search results. You'll need to call the Kaminari methods (`#paginate`, `#current_page`, &c) on the AR::Relation, but if you map the search results to `#searchable`, you get an Array. Maybe do the `.map(&:searchable)` call after you paginate?
      * routes.rb (`get '/search'`), `PagesController#search`, views/pages/search.

[heroku]:https://www.heroku.com/

[figaro]:https://github.com/laserlemon/figaro
[paperclip]:https://github.com/thoughtbot/paperclip

[omniauth]:https://github.com/intridea/omniauth
[omniauth-fb]:https://github.com/mkdynamic/omniauth-facebook)

[kaminari]:https://github.com/amatsuda/kaminari
[pg_search]:https://github.com/Casecommons/pg_search
