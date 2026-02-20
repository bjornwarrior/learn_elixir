defmodule Kasir do
  def cek_kategori(%{price: price, kategori: :elektronik}) do
    price - price * 0.1
  end

  def cek_kategori(%{price: price, kategori: :makanan}) do
    price - price * 0.05
  end

  def cek_kategori(%{price: price}) do
    price
  end

  def proses_item(%{price: price, promo: true}) do
    price - 5000
  end

  def proses_item(%{price: price}) do
    price
  end


  def total_belanja(keranjang) do
    keranjang
    |> Enum.map(fn p -> %{p | price: proses_item(p)}  end)
    |> Enum.map(&cek_kategori/1)
    |> Enum.sum()
  end

  def total_manual([head | tail]) do
    head + total_manual(tail)
  end

  def total_manual([]) do
    0
  end


  def hitung_barang_promo([%{promo: true} | tail]) do
    1 + hitung_barang_promo(tail)
  end

  def hitung_barang_promo([_head | tail]) do
    hitung_barang_promo(tail)
  end


  def hitung_barang_promo([]) do
    0
  end


end
