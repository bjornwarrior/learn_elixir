defmodule PosSystem do

  alias Product
  alias Transaction


  def total_belanja(list_product) do
    list_product
    |> Enum.map(fn p -> p.price end)
    |> Enum.sum()
  end

  def total_lunas(list_transaksi) do
    Enum.reduce(list_transaksi, 0, fn
      # Pattern Match: Hanya ambil yang statusnya :lunas
      %{status: :lunas, total: t}, acc -> acc + t

      # Jika statusnya bukan :lunas, abaikan (tambah 0)
      _, acc -> acc + 0
    end)
  end

  def stok_kritis(list_product) do
    Enum.filter(list_product, fn p -> p.stock < 5 end)
  end

  def cetak_daftar_nama(list_produk) do
    Enum.map(list_produk, &String.upcase(&1.name))
  end

  def cek_stok(%Product{name: n, stock: s}) do
    "Barang #{n} sisanya tinggal #{s} bos!"
  end


  def summary_tansaction(%Transaction{
    id: id,
    amount: amount,
    status: status
  }) do
    "Transaksi #{id} sebesar Rp#{amount} dengan status #{status}"
  end




  def cek_status_bayar(:lunas) do
    "Pembayaran Lunas"
  end

  def cek_status_bayar(:piutang) do
    "Pembayaran kamu akan dikenakan bunga sekitar 4%"
  end

  def cek_status_bayar(:dibatalkan) do
    "Pembayaran kamu telah dibatalkan"
  end

  def hitung_diskon(%{status: "VIP", harga: harga}) do
    harga * 0.20
  end

  def hitung_diskon(%{status: "REGULER", harga: harga}) do
    harga * 0.05
  end

  def hitung_diskon(_) do
    0
  end

  @ppn 0.11
  @diskon 0.10

  def hitung_ppn(harga) do
    harga * @ppn
  end

  def harga_akhir(harga_asli) do
    harga = harga_asli - (harga_asli * @diskon) + hitung_ppn(harga_asli)
    harga
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

  def topup_alfa(harga) when harga > 0 do
    harga
    |> tambah_pajak()
    |> tambah_biaya_admin()
    |> tambah_biaya_parkir()
    |> diskon_topup()
    |> format_rupiah()
  end

  def topup_alfa(_harga), do: "Harga harus lebih besar dari 0"

  defp tambah_pajak(harga) do
    harga + (harga * 0.11)
  end

  defp tambah_biaya_admin(harga) do
    harga + 2000
  end

  defp tambah_biaya_parkir(harga) do
    harga + 2000
  end

  defp diskon_topup(harga), do: harga - 1000

  defp format_rupiah(harga) do
    harga_string = :erlang.float_to_binary(harga / 1, [decimals: 0])

    "Total: Rp#{harga_string}"
  end



end
