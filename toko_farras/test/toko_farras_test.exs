defmodule TokoFarrasTest do
  use ExUnit.Case

  # test "menghitung total belanja dengan benar" do
  #   keranjang = [
  #     %Product{name: "Kopi", price: 5000},
  #     %Product{name: "Susu", price: 15000}
  #   ]

  #   assert PosSystem.total_belanja(keranjang) == 20000
  # end

  # test "menghitung total belanja kasir" do
  #   keranjang = [
  #     %{nama: "Roti", price: 10000, promo: true, kategori: :makanan},
  #     %{nama: "Besi", price: 20000, kategori: :elektronik},
  #     %{nama: "Bola", price: 5000, promo: true}
  #   ]

  #   assert Kasir.total_belanja(keranjang) == 25000
  #   # Hasil: (10000-5000) + 20000 + (5000-5000) = 25000
  # end

  test "test_hitung_barang_promo" do
    keranjang = [
      %{nama: "Roti", price: 10000, promo: true, kategori: :makanan},
      %{nama: "Besi", price: 20000, kategori: :elektronik},
      %{nama: "Bola", price: 5000, promo: true}
    ]

    assert Kasir.hitung_barang_promo(keranjang) == 2
  end
end
