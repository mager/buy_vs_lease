# Buy Vs Lease

_Carma's microsite where you can lookup information about vehicles._

## Development

### Backend Setup

Get dependencies and setup the DB. Make sure [Phoenix](https://hexdocs.pm/phoenix/installation.html) is installed.

```sh
cd api
mix deps.get
mix ecto.create && mix ecto.migrate
```

#### Start the server

```sh
mix phx.server
```

#### Debug

```sh
iex -S mix
```

### Frontend Setup

Download assets and start the dev server:

```sh
cd web
yarn
yarn start
```


## Data Model & Migrations

#### Vehicle

```
mix phoenix.gen.json Vehicle vehicles make:string model:string year:integer two_yr_lease:float three_yr_lease:float msrp:float
```
