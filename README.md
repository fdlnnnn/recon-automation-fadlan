<img width="433" height="431" alt="Cuplikan layar 2026-05-17 001716" src="https://github.com/user-attachments/assets/d72db5bd-c960-4b00-9f2f-c68fa1d775d8" />
<img width="409" height="434" alt="Cuplikan layar 2026-05-17 000646" src="https://github.com/user-attachments/assets/b6d7c20d-f564-4929-9fa0-148ba84fb10a" />
<img width="370" height="415" alt="Cuplikan layar 2026-05-16 235945" src="https://github.com/user-attachments/assets/adb4d432-6b23-472c-bde3-5f50141a1ed3" />
<img width="425" height="409" alt="Cuplikan layar 2026-05-16 234734" src="https://github.com/user-attachments/assets/3a9e24f2-422f-40ee-990c-f5055be9be2b" />
<img width="502" height="411" alt="Cuplikan layar 2026-05-16 233524" src="https://github.com/user-attachments/assets/ca7ddc37-0c74-4f88-8ed4-2ef9ed0a7ed1" />

# recon-automation-fadlan

Project ini merupakan script otomatisasi reconnaissance

# setup tools
pastikan untuk menginstal bebrapa tools dari projectdiscovery sebelum menggunakan script ini.

sudo apt install golang
go install [github.com/projectdiscovery/pdtm/cmd/pdtm@latest](https://github.com/projectdiscovery/pdtm/cmd/pdtm@latest)
pdtm -install subfinder
pdtm -install httpx
go install [github.com/tomnomnom/anew@latest](https://github.com/tomnomnom/anew@latest)

# cara menjalankan script

bash recon-auto.sh (target)
atau bisa juga dengan mengubah permission: chmod +x recon-auto.sh
setelah diubah gunakan command: ./recon-auto.sh (target)

# penjelasan kode

subfinder -d $TARGET 2>>error.log   #subfinder mencari seluruh subdomain dari domain utama target dan jika terjadi error akan dibawah kedalam file error.log
anew all-subdomain.txt   #memfilter hasil dari subfinder agar tidak ada domain yang terduplikat dan digabungkan kedalam file all-subdomain.txt
httpx -sc 2>>error.log   #melihat status code dari subdomainnya dan jika terjadi error akan dikirim ke file error.log
tee ${TARGET}_livehost.txt   #menyimpan subdomain yang aktif 
while read line; do echo "[$(date)] $line"; done  #melihat setiap output dengan tahun-bulan-tanggal-jam-menit-detik
tee -a progress.log  #menampilkan hasil timestamp ke terminal secara real time dan menyimpannya di file progress.log
