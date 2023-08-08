# Generic Incident Form

A simple proof of concept app to showcase using forms in elixir/Pheonix liveview while I sit on a vendor call...

## Steps from scratch

Install `asdf`. the `.tool-versions` file and asdf will 

run `mix archive.install hex phx_new`

run `mix phx.new forms --database sqlite3`. Install dependencies.

Do a git commit here. Give yourself a clean slate in the repo after the project is created.

`cd forms`

`mix ecto.create`

Generate the web things... `mix phx.gen.html Ops Incident incidents name:string description:string isemployeeinvolved:boolean isvehicleinvolved:boolean location:string`

This will create the controllers, views, 

Add the resource to your browser scope in lib/forms_web/router.ex:

    resources "/incidents", IncidentController

`mix ecto.migrate`

run your app `mix phx.server` and view it at: <http://localhost:4000/incidents>

## To deploy

install flyctl and docker

run `flyctl auth login` and login to your fly.io account

from the `forms` subfolder in this repo, run:

`flyctl deploy` to deploy with the settings in [fly.toml](fly.toml). At a minimum, you will want to change `red-dust-2299` to match whatever app name you want.

Check it out at: https://red-dust-2299.fly.dev/
