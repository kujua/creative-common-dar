defmodule DarDblib.Repo do
    use Ecto.Repo,
    otp_app: :dar_dblib,
    adapter: Mongo.Ecto
end

defmodule DarDblib.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    tree = [worker(DarDblib.Repo, [])]

    opts = [name: DarDblib.Sup, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end
end

defmodule Dar do
  use Ecto.Model

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "dar" do
    field :city, :string
    # field :temp_lo, :integer
    # field :temp_hi, :integer
    # field :prcp, :float, default: 0.01q
    # timestamps
  end
end

defmodule DarDblib do
  import Ecto.Query

  def sample_query do
    query = from w in Dar,
        #   where: w.prcp > 0.0 or is_nil(w.prcp),
         select: w
    DarDblib.Repo.all(query)
  end
end
