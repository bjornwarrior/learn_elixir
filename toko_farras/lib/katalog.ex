defmodule Katalog do
  def list_product do
    [
      %{name: "Kopi", price: 5000},
      %{name: "Susu", price: 15000}
    ]
  end

  def create_product(products, product) do
    products ++ [product]
  end

  def read_product(products, id) do
    Enum.find(products, fn p -> p.id == id end)
  end

  def update_product(products, id, updated_data) do
    Enum.map(products, fn p ->
      if p.id == id do
        Map.merge(p, updated_data)
      else
        p
      end
    end)
  end

  def delete_product(products, id) do
    Enum.reject(products, fn p -> p.id == id  end)
  end
end
