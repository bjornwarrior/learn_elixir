defmodule PosSystem do

  @ppn 0.11

  def hitung_ppn(harga) do
    harga * @ppn
  end

  def cetak_struk() do
    # 1. Deklarasi Variabel (Binding)
    nama_barang = "Kopi Hitam"
    harga = 15000
    pajak = 0.11

    # 2. Operasi Matematika
    total_pajak = harga * pajak
    total_bayar = harga + total_pajak

    # 3. String Interpolation (Mirip PHP double quote atau JS template literal)
    "Item: #{nama_barang} | Total: Rp#{total_bayar}"
  end

  def cek_stok() do
    # Contoh Map dan Atom
    produk = %{nama: "Susu", stok: 10, status: :ready}

    "Barang #{produk.nama} statusnya #{produk.status}, sisa #{produk.stok} pcs"
  end

  def calculate_total(items) do
    do_sum(items, 0)
  end

  defp do_sum([], total), do: total

  defp do_sum([head | tail], total) do
    do_sum(tail, total + head)
  end


end
