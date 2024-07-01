
const tanggalPinjam = new Date('2024-05-11');
const tanggalKembali = new Date('2024-05-29');
const daftarBuku = ['Harry Potter', 'Percy Jackson', 'The Girl on the Train'];
const batasMaxPinjam = 14;
const dendaHarian = 1000;

function totalDenda(tanggalPinjam, tanggalKembali, daftarBuku = [], batasMaxPinjam, dendaHarian) {
    const tanggalMaxPinjam = new Date(tanggalPinjam);
    tanggalMaxPinjam.setDate(tanggalPinjam.getDate() + batasMaxPinjam);

    if (tanggalKembali > tanggalMaxPinjam) {
        let selisihWaktu = tanggalKembali.getTime() - tanggalMaxPinjam;
        let selisihHari = selisihWaktu/(1000 * 60 * 60 * 24);
        let banyakBuku = daftarBuku.length

        // hitung total denda (selisihHari * dendaHarian * banyakBuku)
        let totalDenda = selisihHari * dendaHarian * banyakBuku

        return "Denda yang perlu dibayarkan sebanyak Rp " + totalDenda;
    }

}

console.log(totalDenda(tanggalPinjam, tanggalKembali, daftarBuku, batasMaxPinjam, dendaHarian));