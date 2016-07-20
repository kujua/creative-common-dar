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

defmodule DarMeta do
  use Ecto.Schema
  # import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "darmeta" do
    field :name,       :string
    field :origin,     :string
    field :timestamp,  :integer
    field :gfsid,      :string
  end

  def changeset(meta,params \\ :empty) do
      meta
  end
end

defmodule DarDblib do
  import Ecto.Query
  require Lager

    def lager_messages do
      Lager.debug "Hi debug"
      Lager.info "Hi error"
      Lager.notice "Hi notice"
      Lager.warning "Hi warning"
      Lager.error "Hi error"
      Lager.critical "Hi critical"
      Lager.alert "Hi alert"
      Lager.emergency "Hi emergency"
    end

    def write_meta_to_collection(meta) do
        metax = %DarMeta{gfsid: meta.gfsid, name: meta.name, origin: meta.origin, timestamp: meta.timestamp}
        cs = DarMeta.changeset metax
        case DarDblib.Repo.insert!(cs) do
            meta ->
                {:ok, meta}
        end
    end

  def sample_query do
    query = from w in DarMeta,
        #   where: w.prcp > 0.0 or is_nil(w.prcp),
         select: w
    DarDblib.Repo.all(query)
  end
end
