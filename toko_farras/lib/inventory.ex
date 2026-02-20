defmodule Inventory do
  use GenServer

  def start_link(initial_state \\ []) do
    GenServer.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

  def add(product) do
    GenServer.call(__MODULE__, {:add_product, product})
  end

  def list do
    GenServer.call(__MODULE__, :list_products)
  end

  def update(id, updated_data) do
    GenServer.call(__MODULE__, {:update_product, id, updated_data})
  end

  def delete(id) do
    GenServer.call(__MODULE__, {:delete_product, id})
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call({:add_product, product}, _from, state) do
    new_state = state ++ [product]
    {:reply, :ok, new_state}
  end

  @impl true
  def handle_call(:list_products, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:update_product, id, updated_data}, _from, state) do
    updated_state = Enum.map(state, fn p ->
      if p.id == id do
        Map.merge(p, updated_data)
      else
        p
      end
    end)
    {:reply, :ok, updated_state}
  end

  @impl true
  def handle_call({ :delete_product, id }, _from, state) do
    deleted_state = Enum.reject(state, fn p -> p.id == id  end)
    {:reply, :ok, deleted_state}
  end

end
